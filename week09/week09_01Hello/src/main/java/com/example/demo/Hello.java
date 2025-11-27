package com.example.demo;

import org.springframework.stereotype.Component;

@Component //스프링 컨테이너에 빈(bean)으로 등록
public class Hello {
	public String sayHello() {
		return "<h2>안녕 스트링부트~!</h2>";
	}
}
