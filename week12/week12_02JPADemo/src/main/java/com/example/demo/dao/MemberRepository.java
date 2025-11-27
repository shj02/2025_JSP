package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
	//핸들링 할 테이블 당 하나씩 생성 => Member 테이블 데이터를 관리
}
