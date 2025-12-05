package com.example.demo.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.Data;

@Data
@Entity
@Table(
		uniqueConstraints = {
				//user_id와 date 필드의 조합이 유일!
				@UniqueConstraint(columnNames = {"user_id", "date"})
			})
public class Achievement {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long achievement;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Member member;
	
	@Column(name = "date")
	private LocalDate date;
	
	private int percentage;
}
