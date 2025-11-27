package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller //클라이언트의 요청을 처리
public class HelloController {
	@Autowired
	private Hello hello;
	
	@RequestMapping("/") //요청이 들어오면
	@ResponseBody
	public String root() {
		return hello.sayHello();
	}
}
