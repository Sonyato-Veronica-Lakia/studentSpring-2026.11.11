package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.StudentMapper;
import com.example.demo.model.Student;

@Service
public class StudentService {
	@Autowired
	StudentMapper studentMapper;


	StudentService(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}
	
	// 학생 목록 조회
	public HashMap<String, Object> getStudentList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		try {
			List<Student> stuList = studentMapper.selectStudentList(map);
			resultMap.put("stuList", stuList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	
	// 학생 추가
	public HashMap<String, Object> addStudent(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		try {
			int cnt = studentMapper.insertStudent(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
			
			resultMap.put("message", e.getMessage());
			System.out.println("정밀 추적 로그: " + e.getMessage());
		}
		return resultMap;
	}
	
}




