package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer>{ //primaryKey의 타입을 객체(object) 형태로! (int:기본 데이터 타입)
	//Question 테이블의 데이터를 처리할 때 관여
}
