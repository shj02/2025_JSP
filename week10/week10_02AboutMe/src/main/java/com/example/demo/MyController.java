package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	@RequestMapping("/")
//	@ResponseBody
	public String root() {
		//최종 결과 리턴값 : /WEB-INF/views/index.jsp
		return "index";
	}
	
	@RequestMapping("/name")
	public String name() {
		//최종 리턴값 : /WEB-INF/views/name.jsp
		return "name";
	}
	
	@RequestMapping("/address")
	public String address() {
		return "address";
	}
	
	@RequestMapping("/major")
	public String major() {
		return "major";
	}
}
