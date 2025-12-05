package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Season {
	@Id
	private int seasonId;
	
	@Column(length = 50)
	private String seasonName;
	
	private int startMonth;
	
	private int endMonth;
	
	@Column(length = 512)
	private String seasonImageUrl;
}
