package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.dao.MemberRepository;
import com.example.demo.entity.Member;

@Controller
public class MemberController {
	//요청이 들어오면 처리
	//DB와 관련된 처리는 repository 를 이용
	//필요한 객체는 생성자 매개변수로 받아서 초기화
	private MemberRepository memberRepository;
	
	public MemberController(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	@GetMapping("/insert")
	public void insert() {
		//테이블에 1개 레코드 추가
		Member member = new Member();
		member.setId("admin");
		member.setName("홍길동");
		member.setAddress("인천시 미추홀구");
		
		memberRepository.save(member);
	}
}
