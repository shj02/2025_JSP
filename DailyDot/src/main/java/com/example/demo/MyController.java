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
		Member member = memberRepository.findByUserId("hyeji");
		
		// 샘플
		if (member == null) {
			member = new Member();
			member.setUserId("hyeji");
			member.setPassword("1234");
			member.setMajor("컴퓨터정보공학과");
			member.setName("손혜지");
			member.setNickname("혜지");
			member.setCreateAt(LocalDateTime.now());
			
			memberRepository.save(member);
		}
		
		// 샘플 투두리스트 저장
		if (todoRepository.findByMember(member).isEmpty()) {
           TodoCategory catTask = todoCategoryRepository.findByCategoryName("Task");
           TodoCategory catStudy = todoCategoryRepository.findByCategoryName("Study");
           TodoCategory catHealth = todoCategoryRepository.findByCategoryName("Health");
           TodoCategory catEtc = todoCategoryRepository.findByCategoryName("Etc");

           createSampleTodo(member, "오늘의 DailyDot 한 가지 쓰기", catTask, "today");
           createSampleTodo(member, "JSP 과제하기", catStudy, "today");
           createSampleTodo(member, "운동 30분", catHealth, "today");
           createSampleTodo(member, "다이어리 쓰기", catEtc, "today");
        }
		
		return "loginForm";
	}
	
	private void createSampleTodo(Member user, String content, TodoCategory cat, String rule) {
        Todo t = new Todo();
        t.setMember(user);
        t.setContent(content);
        t.setCategory(cat);
        t.setRepeatRule(rule);
        t.setCompleted(false);
        t.setCreatedAtTodo(LocalDateTime.now());
        t.setTodoDate(LocalDateTime.now());
        todoRepository.save(t);
    }

	@GetMapping("/user/signup")
	public String signup() {
		return "signupForm";
	}
	
	@PostMapping("/user/join")
	public String join(@ModelAttribute Member member, Model model) {
		member.setCreateAt(LocalDateTime.now());
		memberRepository.save(member);
		
		TodoCategory catTask = todoCategoryRepository.findByCategoryName("Task");
		TodoCategory catStudy = todoCategoryRepository.findByCategoryName("Study");
		TodoCategory catHealth = todoCategoryRepository.findByCategoryName("Health");
		TodoCategory catEtc = todoCategoryRepository.findByCategoryName("Etc");

		createSampleTodo(member, "오늘의 DailyDot 한 가지 쓰기", catTask, "today");
		createSampleTodo(member, "JSP 과제하기", catStudy, "today");
		createSampleTodo(member, "운동 30분", catHealth, "today"); 
		createSampleTodo(member, "다이어리 쓰기", catEtc, "today");

		return "redirect:/";
	}
	
	@PostMapping("/user/loginProcess")
	public String login(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpSession session, Model model) {
		
		// 아이디 조회
		Member member = memberRepository.findByUserId(userId);
		
		// 아이디 없는 경우
		if(member == null) {
			model.addAttribute("loginError", "존재하지 않는 아이디입니다!");
			return "loginForm";
		}
		
		// 비밀번호 틀린 경우
		if(!member.getPassword().equals(password)) {
			model.addAttribute("loginError", "비밀번호가 일치하지 않습니다!");
			return "loginForm";
		}
		
		session.setAttribute("user", member);
		return "redirect:/main";
	}
	
	@GetMapping("/user/logout")
    public String logout(HttpSession session) {
        session.invalidate(); 
        return "redirect:/"; 
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
	        return "fail"; 
	    }

	    String categoryName = "Etc";
	    if (categoryId.equals("cat-study")) categoryName = "Study";
	    else if (categoryId.equals("cat-task")) categoryName = "Task";
	    else if (categoryId.equals("cat-health")) categoryName = "Health";
	    else if (categoryId.equals("cat-etc")) categoryName = "Etc";

	    TodoCategory category = todoCategoryRepository.findByCategoryName(categoryName);
	    
	    Todo todo = new Todo();
	    todo.setMember(user);
	    todo.setContent(content);
	    todo.setCategory(category);
	    todo.setRepeatRule(type);
	    todo.setCompleted(false);
	    todo.setCreatedAtTodo(LocalDateTime.now());
	    todo.setTodoDate(LocalDateTime.now());

	    todoRepository.save(todo);

	    return "success";
	}
	
	@PostMapping("/todo/updateStatus")
	@ResponseBody
	public String updateStatus(@RequestParam("todoId") Long todoId, @RequestParam("isCompleted") boolean isCompleted) {
		Todo todo = todoRepository.findById(todoId).orElse(null);
		if (todo == null) {
			return "fail";
		}
	
		todo.setCompleted(isCompleted); 
		todoRepository.save(todo); 
		
		return "success";
	}
	
	@PostMapping("/todo/delete")
	@ResponseBody
	public String deleteTodo(@RequestParam("todoId") Long todoId, @RequestParam("date") String dateStr) { 
			
		Todo todo = todoRepository.findById(todoId).orElse(null);
		if (todo == null) return "fail";
		
		String rule = todo.getRepeatRule();
		
		if ("today".equals(rule)) {
			todoRepository.delete(todo);
		} 
		
		else {
			String currentSkips = todo.getSkippedDates();
			if (currentSkips == null) currentSkips = "";
			
			if (!currentSkips.isEmpty()) currentSkips += ",";
			currentSkips += dateStr;
			
			todo.setSkippedDates(currentSkips);
			todoRepository.save(todo);
		}
		return "success";
	}
	
	@GetMapping("/todo/list")
	@ResponseBody
	public List<Map<String, Object>> getTodoList(HttpSession session, @RequestParam(value = "date", required = false) String dateStr) {
		Member user = (Member) session.getAttribute("user");
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		if(user == null) {
			return resultList;
		}
		 List<Todo> allTodos = todoRepository.findByMember(user);
		 
		 LocalDate targetDate;
			if (dateStr != null) {
				targetDate = LocalDate.parse(dateStr);
			} else {
				targetDate = LocalDate.now();
			}
		 
		 for(Todo todo : allTodos) {
			 String skips = todo.getSkippedDates();
			if (skips != null && skips.contains(targetDate.toString())) {
				continue;
			}
			boolean isMatch = false;
	            LocalDate startDate = todo.getTodoDate().toLocalDate(); 
	            String rule = todo.getRepeatRule(); 
	            
	            if (startDate.isAfter(targetDate)) continue;

	            // 규칙 체크
	            switch (rule) {
	                case "today":
	                    if (startDate.isEqual(targetDate)) isMatch = true;
	                    break;
	                case "daily":
	                    isMatch = true; 
	                    break;
	                case "weekly":
	                    if (startDate.getDayOfWeek() == targetDate.getDayOfWeek()) isMatch = true;
	                    break;
	                case "monthly":
	                    if (startDate.getDayOfMonth() == targetDate.getDayOfMonth()) isMatch = true;
	                    break;
	            }

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