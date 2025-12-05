package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.TodoCategory;

public interface TodoCategoryRepository extends JpaRepository<TodoCategory, Long>{
	TodoCategory findByCategoryName(String name); // 카테고리 이름으로 찾기
}
