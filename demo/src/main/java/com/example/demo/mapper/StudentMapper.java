package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Student;

@Mapper
public interface StudentMapper {
	
	// 학생 목록 조회
	List<Student> selectStudentList(HashMap<String, Object> map);
	
	// 학생 추가
	int insertStudent(HashMap<String, Object> map);

	
}







