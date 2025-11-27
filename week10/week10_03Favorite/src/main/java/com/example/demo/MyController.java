package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	@RequestMapping("/")
	public String root() {
		return "index";
	}
	@RequestMapping("/movie")
	public String movie() {
		return "movie";
	}
	@RequestMapping("/sports")
	public String sports() {
		return "sports";
	}
	@RequestMapping("/music")
	public String music() {
		return "music";
	}
}
