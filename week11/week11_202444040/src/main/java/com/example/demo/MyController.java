package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	@RequestMapping("/")
	public String root() {
		return "contactIndex";
	}
	
	@GetMapping("/contactForm")
	public String contactForm() {
		return "contactForm";
	}
	
	@GetMapping("/contactResult")
	public String contactResult(Contact contact) {
		return "contactResult";
	}
}
