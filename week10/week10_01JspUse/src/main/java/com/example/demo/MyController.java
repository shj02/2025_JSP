package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	@RequestMapping("/")
	@ResponseBody
	public String root() {
		return "Springboot에서 JSP 구현하기";
	}
	
	// /test1 요청이 들어오면 test1.jsp 페이지로 연결
	@RequestMapping("/test1")
	public String test1() {
		//응답할 뷰 페이지를 리턴!
		//JSP에서 루트 디렉터리 = webapp(/)
		//webapp > WEB-INF > views > test1.jsp (webapp이 맨 앞의 /)
		//return "/WEB-INF/views/test1.jsp";
		
		//prefix = /WEB-INF/views
		//suffix = .jsp
		return "test1";
	}
	
	// /test2 요청이 들어오면 test2.jsp 페이지로 연결
	@RequestMapping("/test2")
	public String test2() {
		//뷰 페이지 리턴
		return "test2";
	}
	
	// /test3 요청이 들어오면 test3.jsp 페이지로 연결
	@RequestMapping("/test3")
	public String test3() {
		return "sub/test3";
	}
}
