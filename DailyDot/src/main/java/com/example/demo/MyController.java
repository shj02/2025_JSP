package com.example.demo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.MemberRepository;
import com.example.demo.dao.TodoCategoryRepository;
import com.example.demo.dao.TodoRepository;
import com.example.demo.entity.Member;
import com.example.demo.entity.Todo;
import com.example.demo.entity.TodoCategory;

import jakarta.servlet.http.HttpSession;


@Controller
public class MyController {
	private final MemberRepository memberRepository;
	private final TodoRepository todoRepository;
	private final TodoCategoryRepository todoCategoryRepository;
	
	public MyController(MemberRepository memberRepository, TodoRepository todoRepository, TodoCategoryRepository todoCategoryRepository) {
		this.memberRepository = memberRepository;
		this.todoRepository = todoRepository;
		this.todoCategoryRepository = todoCategoryRepository;
	}
	
	@GetMapping("/")
	public String root() {
		Member member = new Member();
		member.setUserId("hyeji");
		member.setPassword("1234");
		member.setMajor("컴퓨터정보공학과");
		member.setName("손혜지");
		member.setNickname("혜지");
		
		memberRepository.save(member);
		return "loginForm";
	}

	@GetMapping("/user/signup")
	public String signup() {
		return "signupForm";
	}
	
	@PostMapping("/user/join")
	public String join(@ModelAttribute Member member, Model model) {
		member.setCreateAt(LocalDateTime.now());
		memberRepository.save(member);
		return "redirect:/";
	}
	
	@PostMapping("/user/loginProcess")
	public String login(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpSession session, Model model) {
		Member member = memberRepository.findByUserIdAndPassword(userId, password);
		
		if(member == null) {
			model.addAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
			return "loginForm";
		}
		
		session.setAttribute("user", member);
		
		return "redirect:/main";
	}
	
	@PostMapping("/user/update")
	public String update(@ModelAttribute Member member, HttpSession session) {
		Member currentUser = (Member) session.getAttribute("user");
		
		if(currentUser == null) {
			return "redirect:/";
		}
		
		currentUser.setName(member.getName());
		currentUser.setNickname(member.getNickname());
		currentUser.setMajor(member.getMajor());
		
		memberRepository.save(currentUser);
		
		session.setAttribute("user", currentUser);
		
		return "redirect:/user/profileEdit";
	}
	
	@GetMapping("/user/profile")
	public String profile() {
		return "profile";
	}

	@GetMapping("/user/center")
	public String center() {
		return "centerPanel";
	}
	
	@PostMapping("/todo/add")
	@ResponseBody
	public String addTodo(@RequestParam("content") String content,
            @RequestParam("category") String categoryId,
            @RequestParam("type") String type,
            HttpSession session) {
		Member user = (Member) session.getAttribute("user");
	    if (user == null) {
	        return "fail"; // 로그인 안됨
	    }

	    // 2. 카테고리 매핑 (화면의 ID -> DB의 카테고리 이름)
	    // 주의: DB에 'Study', 'Task', 'Health', 'Etc'라는 이름의 카테고리가 미리 저장되어 있어야 합니다!
	    String categoryName = "Etc"; // 기본값
	    if (categoryId.equals("cat-study")) categoryName = "Study";
	    else if (categoryId.equals("cat-task")) categoryName = "Task";
	    else if (categoryId.equals("cat-health")) categoryName = "Health";
	    else if (categoryId.equals("cat-etc")) categoryName = "Etc";

	    TodoCategory category = todoCategoryRepository.findByCategoryName(categoryName);
	    
	    // 3. Todo 객체 생성 및 저장
	    Todo todo = new Todo();
	    todo.setMember(user);
	    todo.setContent(content);
	    todo.setCategory(category);
	    todo.setRepeatRule(type); // 'today', 'daily' 등
	    todo.setCompleted(false);
	    todo.setCreatedAtTodo(LocalDateTime.now());
	    todo.setTodoDate(LocalDateTime.now()); // 우선 오늘 날짜로 설정

	    todoRepository.save(todo);

	    return "success";
	}
	
	@PostMapping("/todo/updateStatus")
	@ResponseBody
	public String updateStatus(@RequestParam("todoId") Long todoId, 
	                           @RequestParam("isCompleted") boolean isCompleted) {
		
		Todo todo = todoRepository.findById(todoId).orElse(null);
		if (todo == null) {
			return "fail";
		}
		
		todo.setCompleted(isCompleted); // DB 상태 업데이트
		todoRepository.save(todo); // 저장
		
		return "success";
	}
	
	// [수정] 투두 삭제 기능 (날짜 파라미터 추가)
	@PostMapping("/todo/delete")
	@ResponseBody
	public String deleteTodo(@RequestParam("todoId") Long todoId,
	                         @RequestParam("date") String dateStr) { // date 추가됨
			
		Todo todo = todoRepository.findById(todoId).orElse(null);
		if (todo == null) return "fail";
		
		String rule = todo.getRepeatRule();
		
		// 1. 반복 규칙이 없는 'today'라면 -> 그냥 진짜 삭제
		if ("today".equals(rule)) {
			todoRepository.delete(todo);
		} 
		// 2. 반복 규칙이 있다면 -> 이 날짜만 '숨김 목록'에 추가
		else {
			String currentSkips = todo.getSkippedDates();
			if (currentSkips == null) currentSkips = "";
			
			// 콤마(,)로 구분해서 날짜 누적 (예: "2025-12-01,2025-12-05")
			if (!currentSkips.isEmpty()) currentSkips += ",";
			currentSkips += dateStr;
			
			todo.setSkippedDates(currentSkips);
			todoRepository.save(todo);
		}
		
		return "success";
	}
	
	@GetMapping("/todo/list")
	@ResponseBody
	public List<Map<String, Object>> getTodoList(HttpSession session,
				@RequestParam(value = "date", required = false) String dateStr) {
		
		Member user = (Member) session.getAttribute("user");
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		if(user == null) {
			return resultList;
		}
		 List<Todo> allTodos = todoRepository.findByMember(user);
		 
		 LocalDate targetDate;
			if (dateStr != null) {
				targetDate = LocalDate.parse(dateStr); // "2025-12-05" -> 날짜 객체 변환
			} else {
				targetDate = LocalDate.now();
			}
		 
		 for(Todo todo : allTodos) {
			 String skips = todo.getSkippedDates();
			if (skips != null && skips.contains(targetDate.toString())) {
				continue;
			}
			boolean isMatch = false;
	            LocalDate startDate = todo.getTodoDate().toLocalDate(); // 시작일
	            String rule = todo.getRepeatRule(); // today, daily, weekly, monthly
	            
	            // 시작일이 오늘보다 미래라면 아직 보여주면 안 됨
	            if (startDate.isAfter(targetDate)) continue;

	            // 규칙 체크
	            switch (rule) {
	                case "today":
	                    // 날짜가 정확히 일치해야 함
	                    if (startDate.isEqual(targetDate)) isMatch = true;
	                    break;
	                    
	                case "daily":
	                    // 시작일이 오늘보다 과거거나 같으면 무조건 보여줌 (매일이니까)
	                    isMatch = true; 
	                    break;
	                    
	                case "weekly":
	                    // 요일이 같아야 함 (예: 시작일이 월요일이면, 오늘도 월요일이어야 함)
	                    if (startDate.getDayOfWeek() == targetDate.getDayOfWeek()) isMatch = true;
	                    break;
	                    
	                case "monthly":
	                    // 일(Day)이 같아야 함 (예: 시작일이 5일이면, 오늘도 5일이어야 함)
	                    if (startDate.getDayOfMonth() == targetDate.getDayOfMonth()) isMatch = true;
	                    break;
	            }

	            // 조건에 맞으면 결과 리스트에 담기 (JSON 변환 문제 방지를 위해 Map 사용)
	            if (isMatch) {
	                Map<String, Object> map = new HashMap<>();
	                map.put("todoId", todo.getTodoId());
	                map.put("content", todo.getContent());
	                map.put("completed", todo.isCompleted());
	                map.put("category", todo.getCategory().getCategoryName());
	                
	                map.put("repeatRule", todo.getRepeatRule());
	                
	                resultList.add(map);
	            }
	        }
	        
	        return resultList;
	    }

	@ModelAttribute("season")
	public String season() {
		int month = LocalDate.now().getMonthValue();

		// 봄(3~5), 여름(6~8), 가을(9~11), 겨울(12~2)
		if (month == 3 || month == 4 || month == 5) {
			return "spring";
		} else if (month == 6 || month == 7 || month == 8) {
			return "summer";
		} else if (month == 9 || month == 10 || month == 11) {
			return "autumn";
		} else {
			return "winter";
		}
	}
	
	@GetMapping("/user/right")
	public String right(Model model) {
		return "rightPanel";
	}
	
	@GetMapping("/user/profileEdit")
	public String profileEdit(HttpSession session, Model model) {
		Member user = (Member)session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/";
		}
		
		model.addAttribute("user", user);
		
		return "profileEdit";
	}
	
	@GetMapping("/main")
	public String mainPage() {
		return "mainPage";
	}
}