package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	@RequestMapping("/")
	public String root() {
		return "index";
	}
	
	@RequestMapping("/lucario")
	public String lucario(Model model) {
		model.addAttribute("name", "루카리오");
		return "lucario";
	}
	
	@RequestMapping("/litwick")
	public String litwick(Model model) {
		model.addAttribute("name", "불켜미");
		return "litwick";
	}
	
	@RequestMapping("/mimikyu")
	public String mimikyu(Model model) {
		model.addAttribute("name", "따라큐");
		return "mimikyu";
	}
}
