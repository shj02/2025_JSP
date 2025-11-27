package com.example.demo.question;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor //필요한 객체를 생성자의 매개변수로 자동 처리
@Controller
@RequestMapping("/question")
public class QuestionController {
//	private final QuestionRepository qRepository;
	private final QuestionService qService;
	
	//Question 테이블과 관련된 모든 요청은 /question으로 시작됨
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/insertForm")
	public String insertForm() {
		return "question_insertForm";
	}
	
	@GetMapping("/insert")
	public String insert(Question question) {
		question.setCreateDate(new Date());
//		qRepository.save(question);
		qService.insert(question);
		return "redirect:/question/list";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		List<Question> list = qService.selectAll();
		model.addAttribute("list", list);
		return "question_list";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable("id") int id, Model model) {
		Question question = qService.select(id);
		model.addAttribute("question", question);
		return "question_detail";
	}
	
	@GetMapping("/updateForm/{id}")
	public String updateForm(@PathVariable("id") int id, Model model) {
		Question question = qService.select(id);
		model.addAttribute("question", question);
		return "question_updateForm";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable("id") int id, Question question) {
		//수정할 데이터는 id 값
		Question q = qService.select(id);
		
		//입력된 값을 수정할 데이터에 setting
		q.setSubject(question.getSubject());
		q.setContent(question.getContent());
		qService.insert(q);
		return "redirect:/question/list";
	}
	
	@GetMapping("/deleteForm/{id}")
	public String deleteForm(@PathVariable("id") int id, Model model) {
		model.addAttribute("id", id);
		return "question_deleteForm";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id) {
		qService.delete(id);
		return "redirect:/question/list";
	}
}
