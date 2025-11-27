package com.example.demo.question;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class QuestionService {
	//테이블 처리 전담
	private final QuestionRepository qRepository;
	
	//테이블 처리는 메서드 이용
	//데이터 삽입
	public void insert(Question question) {
		qRepository.save(question);
	}
	
	//전체 데이터 조회
	public List<Question> selectAll() {
		List<Question> list = qRepository.findAll();
		return list;
	}
	
	//한 개 데이터 읽기
	public Question select(int id) {
		Optional<Question> question = qRepository.findById(id);
		if(question.isPresent()) {
			return question.get();
		} else {
			return null;
		}
	}
	
	//데이터 삭제
	public void delete(int id) {
		qRepository.deleteById(id);;
	}
}
