package com.tjh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tjh.base.annotation.Function;
import com.tjh.constant.Constant;
import com.tjh.pojo.SysRole;
import com.tjh.util.ResultMessage;
import com.tjh.util.SessionUtils;
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

	//加载所有学生
	@Function(functionName = "loadAllStudent")
	@RequestMapping("loadAllStudent")
	@ResponseBody
	public DataGridView loadAllStudent(StudentVo studentVo){
		return this.studentService.loadAllStudent(studentVo);
	}

	//通过班级加载学生
	@Function(functionName = "loadStudentByClassId")
	@RequestMapping("loadStudentByClassId")
	@ResponseBody
	public List<Student> loadStudentByClassId(Integer classId){
		List<Student> Student = this.studentService.loadStudentByClassId(classId);
		return Student;
	}

	//添加学生
	@Function(functionName = "addStudent")
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

	//加载单个学生信息
	@Function(functionName = "loadOneStudentByStudentId")
	@RequestMapping("loadOneStudentByStudentId")
	@ResponseBody
	public Student loadOneStudentByStudentId(Integer studentId){
		return  this.studentService.loadOneStudentByStudentId(studentId);
	}

	//修改学生
	@Function(functionName = "updateStudentByStudentId")
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

	//提交申请
	@Function(functionName = "updateStudentStateByStudentIdGoBack")
	@RequestMapping("updateStudentStateByStudentIdGoBack")
	@ResponseBody
	public ResultMessage updateStudentStateByStudentId(String studentId,String state){
		boolean flag = this.studentService.updateStudentStateByStudentId(Integer.valueOf(studentId),Integer.valueOf(state));
		if(flag){
			return ResultMessage.success(ResultMessage.SUCCESSCODE, ResultMessage.SUCCESSFUL);
		}else{
			return ResultMessage.success(ResultMessage.FAILCODE, ResultMessage.FAIL);
		}
	}
	//提交申请
	@Function(functionName = "updateStudentStateByStudentIdAgree")
	@RequestMapping("updateStudentStateByStudentIdAgree")
	@ResponseBody
	public ResultMessage updateStudentStateByStudentIdAgree(String studentId,String state){
		boolean flag = this.studentService.updateStudentStateByStudentId(Integer.valueOf(studentId),Integer.valueOf(state));
		if(flag){
			return ResultMessage.success(ResultMessage.SUCCESSCODE, ResultMessage.SUCCESSFUL);
		}else{
			return ResultMessage.success(ResultMessage.FAILCODE, ResultMessage.FAIL);
		}
	}
	//提交申请
	@Function(functionName = "updateStudentStateByStudentIdNotAgree")
	@RequestMapping("updateStudentStateByStudentIdNotAgree")
	@ResponseBody
	public ResultMessage updateStudentStateByStudentIdNotAgree(String studentId,String state){
		boolean flag = this.studentService.updateStudentStateByStudentId(Integer.valueOf(studentId),Integer.valueOf(state));
		if(flag){
			return ResultMessage.success(ResultMessage.SUCCESSCODE, ResultMessage.SUCCESSFUL);
		}else{
			return ResultMessage.success(ResultMessage.FAILCODE, ResultMessage.FAIL);
		}
	}
}
