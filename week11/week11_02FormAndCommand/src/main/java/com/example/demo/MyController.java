package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {
	@RequestMapping("/")
	public String root() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		//login 요청이 들어오면 로그인 페이지로 연결
		return "loginForm";
	}
	
	@GetMapping("/inputResult")
	public String inputResult(@RequestParam("id") String id,
							  @RequestParam("pw") String pw,
							  @RequestParam("name") String name,
							  Model model) {
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("name", name);
		
		return "inputResult"; //뷰 페이지
		
	}
}
