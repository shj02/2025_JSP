package com.example.demo.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(unique = true)
	private String userId;
	
	@Column(length = 50)
	private String password;
	
	@Column(length = 100)
	private String name;
	
	@Column(length = 10)
	private String nickname;
	
	@Column(length = 20)
	private String major;

	private LocalDateTime createAt;
}
