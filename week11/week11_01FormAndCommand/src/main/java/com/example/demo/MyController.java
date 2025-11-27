package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {
	@RequestMapping("/")
	@ResponseBody
	public String root() {
		return "Form 데이터를 전달받아 사용하기";
	}
	
	@GetMapping("/test3")
	//url > test3?id=admin&name=홍길동
	public String test3(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		//뷰 페이지로 데이터 전달하기 => Model 객체 이용
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		return "test3";
	}
	
	//파라미터 매개변수를 직접 변수에 저장
	@GetMapping("/test4")
	//url > test3?id=admin&name=홍길동
	public String test4(@RequestParam("id") String id, @RequestParam("name") String name, Model model) {
		//폼으로 입력되는 데이터가 많아지면 매개변수가 복잡해짐
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		
		return "test4";
	}
	
	//URL path에 변수를 넣어서 호출할 수도 있음(요청 형태가 달라짐)
	@GetMapping("/test5/{id}/{name}")
	//url > test5/admin/이순신
	public String test5(@PathVariable("id") String id, @PathVariable("name") String name, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		
		return "test5";
	}
	
	//커맨드 객체(Command)를 이용해서 데이터를 받고 전달하기
	@GetMapping("/test6")
	//url > test6?id=admin&name=홍길동
	public String test6(Member member) {
		//파라미터와 일치하는 빈 객체를 만들어서 사용
		//뷰 페이지에서 model을 사용하지 않고 커맨드 객체를 직접 사용
		//데이터를 받고 전달까지 가능
		//member 커맨드 객체도 뷰에 같이 전달
		return "test6";
	}
}
