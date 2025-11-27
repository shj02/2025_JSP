package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	@RequestMapping("/")
	@ResponseBody
	public String root() {
		return "Hello World~!";
	}
	
	@RequestMapping("/hello")
	@ResponseBody
	public String hello() {
		String str = "<h2>학과 : 컴퓨터정보공학과</h2>";
		str += "<h2>학번 : 202444040</h2>";
		str += "<h2>이름 : 홍길동</h2>";
		
		return str;
		//return "학과 : 컴퓨터정보공학과<br>학번 : 202444040<br>이름 : 홍길동";
	}
}
