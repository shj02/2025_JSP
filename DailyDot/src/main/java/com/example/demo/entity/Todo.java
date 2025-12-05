package com.example.demo.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Data
@Entity
public class Todo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long todoId;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private TodoCategory category;
	
	@Column(columnDefinition = "TEXT")
	private String content;
	
	private boolean isCompleted;
	
	@Column(length = 50)
	private String repeatRule;
	
	private LocalDateTime createdAtTodo;
	
	private LocalDateTime updatedAtTodo;
	
	private LocalDateTime todoDate;
	
	@Column(columnDefinition = "TEXT")
	private String skippedDates;
}
