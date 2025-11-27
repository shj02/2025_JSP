package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity	//데이터베이스 테이블로 생성
@Data
public class Member {
	@Id //primary key 설정(현재 primary key=id)
	private String id;
	
	@Column(length=20)
	private String name;
	
	@Column(length=200)
	private String address;
}
