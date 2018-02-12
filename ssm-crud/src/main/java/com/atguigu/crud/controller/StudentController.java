package com.atguigu.crud.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Message;
import com.atguigu.crud.bean.StudentByClass;
import com.atguigu.crud.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller

public class StudentController {
	
	@Autowired
	 StudentService studentService;
	

	
	
	//@RequestMapping("/student")
	public String getStudent(@RequestParam(value="pn",defaultValue="1")Integer pn ,
			Model model ){
		PageHelper.startPage(pn, 10);
		List<StudentByClass> list=studentService.getStudentList();
		
		//System.out.println(list.size());
		PageInfo page= new PageInfo<>(list, 5);
		model.addAttribute("pageInfo", page);
		
		return "list1";
	}
	
	@RequestMapping("/student")
	@ResponseBody
	public Message getStudentList(@RequestParam(value="pn",defaultValue="1") Integer pn){
		
		PageHelper.startPage(pn, 10);
		List<StudentByClass> list=studentService.getStudentList();
		
		//System.out.println(list.size());
		PageInfo page= new PageInfo<>(list, 5);
		HashMap<String, Object> map=new HashMap<>();
		map.put("pageInfo", page);
		if (!map.isEmpty()) {
			return Message.success(0, "成功", map);
		}else {
			return Message.fail(-1, "失败");
		}
		
		
	}
}
