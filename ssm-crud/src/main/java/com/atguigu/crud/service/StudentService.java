package com.atguigu.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.StudentByClass;
import com.atguigu.crud.dao.StudentMapper;



@Service
public class StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	public List<StudentByClass> getStudentList(){
		
		return studentMapper.selectStudentByClasses();
		
		
	}

}
