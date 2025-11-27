package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "loginForm";
	}
	
	@GetMapping("/inputResult")
	public String inputResult(MemberInfo memberInfo) {
		return "inputResult";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "logoutForm";
	}
}
