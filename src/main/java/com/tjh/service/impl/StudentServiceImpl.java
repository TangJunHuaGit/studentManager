package com.tjh.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


import com.tjh.constant.Constant;
import com.tjh.pojo.SysRole;
import com.tjh.util.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjh.mapper.StudentMapper;
import com.tjh.pojo.Student;
import com.tjh.service.StudentService;
import com.tjh.util.DataGridView;
import com.tjh.util.PageBuilder;
import com.tjh.vo.StudentVo;
@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;

	@Override
	public List<Student> loadStudentByClassId(Integer classId) {
		// TODO Auto-generated method stub
		return this.studentMapper.loadStudentByClassId(classId);
	}

	@Override
	public boolean addStudent(Student student) {
		// TODO Auto-generated method stub
		return this.studentMapper.addStudent(student);
	}

	@Override
	public DataGridView loadAllStudent(StudentVo studentVo) {
		int page = PageBuilder.builderPage(studentVo.getPage(), studentVo.getLimit());
		int limit = PageBuilder.builderLimit(studentVo.getPage(), studentVo.getLimit());
		studentVo.setPage(page);
		studentVo.setLimit(limit);
		Map<String,Object> map = new HashMap<>();
		map.put("studentName",studentVo.getStudentName());
		map.put("startTime",studentVo.getStartTime());
		map.put("endTime",studentVo.getEndTime());
		map.put("userId",SessionUtils.getCurrentSysUser().getUser().getUserId());
		List<Student> students;

		List<SysRole> roleList = SessionUtils.getRoleList();
		if(isParent(roleList)){
			students = this.studentMapper.loadStudentByParent(map);
		}else{
			students = this.studentMapper.loadStudentByTeacher(map);
		}

		List<Student> collect = students.stream().skip(studentVo.getPage()).limit(studentVo.getLimit()).collect(Collectors.toList());
		return new DataGridView((long) students.size(),collect);
	}

	@Override
	public int loadTotalStudent(StudentVo studentVo) {
		return this.studentMapper.loadTotalStudent(studentVo);
	}

	@Override
	public Student loadOneStudentByStudentId(Integer studentId) {
		return  this.studentMapper.loadOneStudentByStudentId(studentId);
	}

	@Override
	public boolean updateStudentByStudentId(Student student) {
		return  this.studentMapper.updateStudentByStudentId(student);
	}


	@Override
	public boolean updateStudentStateByStudentId(Integer studentId, Integer state,String remark) {
		return this.studentMapper.updateStudentStateByStudentId(studentId,state,remark);
	}


	@Override
	public boolean updateStudentStateByStudentIdLeave(Integer studentId, Integer state) {
		return this.studentMapper.updateStudentStateByStudentIdLeave(studentId,state);
	}

	@Override
	public boolean deleteStudentByStudentIds(Integer[] ids) {
		return this.studentMapper.deleteStudentByStudentIds(ids);
	}

	@Override
	public boolean deleteStudentByStudentId(Integer studentId) {
		return  this.studentMapper.deleteStudentByStudentId(studentId);
	}

	@Override
	public boolean updateStudentStateByStudentIdGoBack(Integer studentId, Integer state) {
		return studentMapper.updateStudentStateByStudentIdGoBack(studentId,state);
	}

	protected boolean isParent(List<SysRole> roleList){
		boolean isParent = false;
		for (SysRole role : roleList) {
			if (role.getRoleId().equals(Constant.BASE_ROLE_ID)){
				isParent = true;
				break;
			}
		}
		return isParent;
	}

//	protected List<Student> loadStudentByRole(String roleAlias,StudentVo vo){
//		List<Student> retLis = new ArrayList<>();
//		List<Student> praentStudents = new ArrayList<>();
//		List<Student> teacherStudents = new ArrayList<>();
//		Map<String,Object> map = new HashMap<>();
//		map.put("studentName",vo.getStudentName());
//		map.put("startTime",vo.getStartTime());
//		map.put("endTime",vo.getEndTime());
//		if(Constant.ROLE_PARENT.equals(roleAlias)){
//			map.put("userId",SessionUtils.getCurrentSysUser().getUser().getUserId());
//			praentStudents = this.studentMapper.loadStudentByParent(map);
//		}else if(Constant.ROLE_TEACHER.equals(roleAlias)){
//			map.put("userId",SessionUtils.getCurrentSysUser().getUser().getUserId());
//			teacherStudents = this.studentMapper.loadStudentByTeacher(map);
//		}
//		if(praentStudents.size() > 0 ){
//			retLis.addAll(praentStudents);
//		}
//		if(teacherStudents.size() > 0 ){
//			retLis.addAll(teacherStudents);
//		}
//		return retLis;
//
//	}

}
