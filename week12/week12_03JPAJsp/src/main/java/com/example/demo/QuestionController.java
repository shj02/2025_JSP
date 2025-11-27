package com.example.demo;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.QuestionRepository;
import com.example.demo.entity.Question;

@Controller
public class QuestionController {
	private QuestionRepository questionRepository;
	public QuestionController(QuestionRepository questionRepository) {
	this.questionRepository = questionRepository;	
	}
	
	@GetMapping("/")
	public String root() {
		return "index";
	}
	
	@GetMapping("/question/insert")
	public String insertForm() {
		return "insertForm";
	}
	
	@GetMapping("/question/insertResult")
	public String insertResult(Question question) {
		question.setCreateDate(LocalDateTime.now());
		questionRepository.save(question);

		//요청을 일으키는 방법
		return "redirect:/question/list";
	}
	
	@GetMapping("/question/list")
	public String list(Model model) {
		List<Question> questionList = questionRepository.findAll();
		model.addAttribute("questionList", questionList);
		return "question_list";
	}
	
	@GetMapping("/insert")
	public void insert() {
		Question question = new Question();
		question.setSubject("JPA가 무엇인가요?");
		question.setContent("스프링부트에서 데이터베이스를 관리하는 방법에 대해 알고 싶어요");
		question.setCreateDate(LocalDateTime.now());
		
		questionRepository.save(question);
		
		
		Question question2 = new Question();
		question2.setSubject("JPA가 무엇인가요?");
		question2.setContent("스프링부트에서 데이터베이스를 관리하는 방법에 대해 알고 싶어요");
		question2.setCreateDate(LocalDateTime.now());
		
		questionRepository.save(question2);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public List<Question> display() {
		//테이블의 데이터를 전체 읽어올 때 리턴 타입 : List
		List<Question> q = questionRepository.findAll();
		return q;
	}
}
