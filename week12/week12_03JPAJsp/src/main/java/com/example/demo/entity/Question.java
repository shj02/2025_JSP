package com.example.demo.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Question {
	@Id //primary key 설정
	@GeneratedValue(strategy = GenerationType.IDENTITY) //identity -> 저장할 때 값을 1씩 증가하여 자동 저장(중복 x) = 1,2,3,...
	private int id;
	
	@Column(length=200)
	private String subject;
	
	@Column(columnDefinition = "TEXT")
	private String content;
	
	private LocalDateTime createDate;
}
