package com.tjh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tjh.util.ResultMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.pojo.Student;
import com.tjh.service.StudentService;
import com.tjh.util.DataGridView;
import com.tjh.vo.StudentVo;

@Controller
@RequestMapping("student")
public class StudentController {
	@Autowired
	private StudentService studentService;


	@RequestMapping("loadAllStudent")

	@ResponseBody public DataGridView loadAllStudent(StudentVo studentVo){
		DataGridView allStudent = this.studentService.loadAllStudent(studentVo);
		return allStudent;
	}

	@RequestMapping("loadStudentByClassId")
	@ResponseBody
	public List<Student> loadStudentByClassId(Integer classId){
		List<Student> Student = this.studentService.loadStudentByClassId(classId);
		return Student;
	}

	@RequestMapping("addStudent")
	@ResponseBody
	public Map<String,String> addStudent(Student student){
		boolean flag = this.studentService.addStudent(student);
		Map<String,String> map = new HashMap<String, String>();
		if(flag) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}

	@RequestMapping("loadOneStudentByStudentId")
	@ResponseBody
	public Student loadOneStudentByStudentId(Integer studentId){
		return  this.studentService.loadOneStudentByStudentId(studentId);
	}

	@RequestMapping("updateStudentByStudentId")
	@ResponseBody
	public ResultMessage updateStudentByStudentId(Student student){
		  boolean flag = this.studentService.updateStudentByStudentId(student);
		  if(flag){
			  return ResultMessage.success(ResultMessage.SUCCESSCODE, ResultMessage.SUCCESSFUL);
		  }else{
			  return ResultMessage.success(ResultMessage.FAILCODE, ResultMessage.FAIL);
		  }
	}
}
