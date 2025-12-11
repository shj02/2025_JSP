package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
	Member findByUserIdAndPassword(String userId, String password);
	Member findByUserId(String userId);
}
