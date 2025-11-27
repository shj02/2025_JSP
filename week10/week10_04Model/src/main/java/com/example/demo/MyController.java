package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	@RequestMapping("/")
	@ResponseBody
	public String root() {
		return "Model & View";
	}
	
	@RequestMapping("/test1")
	public String test1(Model model) {
		model.addAttribute("name", "홍길동");
		model.addAttribute("age", "25");
		return "test1";
	}
	
	//ModelAndView 객체를 이용하기
	//데이터 전달을 위한 Model 기능과 뷰 페이지 정보를 같이 전달
	@GetMapping("/mv")
	public ModelAndView modelView() {
		//데이터와 뷰 페이지 정보를 동시에 설정 가능
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", "홍길동");
		mv.addObject("age", "25");
		
		List<String> list = new ArrayList<>();
		list.add("test1");
		list.add("test2");
		list.add("test3");
		
		mv.addObject("lists", list);
		
		//뷰 페이지 설정
		mv.setViewName("myView");
		return mv;
	}
}
