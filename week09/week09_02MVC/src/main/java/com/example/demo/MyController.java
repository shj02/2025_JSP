package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	@RequestMapping("/") //클라이언트로부터 root(/) 요청이 들어온 경우(프로젝트는 항상 root부터 시작함!)
	@ResponseBody
	public String root() {
		return "MVC 개념 익히기";
	}
	
	//클라이언트의 요청 형태에 따라 요청 처리를 하는 메서드
	//url 끝에 /test1 입력!
	@RequestMapping("/test1")
	@ResponseBody
	public String test1() {
		return "/test1 요청에 대한 응답입니다!";
	}
	
	@RequestMapping("/test2")
	@ResponseBody
	public String test2() {
		return "/test2 요청에 대한 응답입니다!";
	}
}
