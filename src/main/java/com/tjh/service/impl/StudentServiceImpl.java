package com.tjh.service.impl;

import java.util.List;



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
		List<Student> allStudent = this.studentMapper.loadAllStudent(studentVo);
		int total = this.studentMapper.loadTotalStudent(studentVo);
		// TODO Auto-generated method stub
		return new DataGridView((long)total,allStudent);
	}

	@Override
	public int loadTotalStudent(StudentVo studentVo) {
		// TODO Auto-generated method stub
		int total = this.studentMapper.loadTotalStudent(studentVo);
		return total;
	}

	@Override
	public Student loadOneStudentByStudentId(Integer studentId) {
		// TODO Auto-generated method stub
		return  this.studentMapper.loadOneStudentByStudentId(studentId);
	}

	@Override
	public boolean updateStudentByStudentId(Student student) {
		// TODO Auto-generated method stub
		return  this.studentMapper.updateStudentByStudentId(student);
	}

	@Override
	public boolean updateStudentStateByStudentId(Integer studentId) {
		// TODO Auto-generated method stub
		return this.studentMapper.updateStudentStateByStudentId(studentId);
	}

	@Override
	public boolean updateStudentStateByStudentIds(Integer[] ids) {
		// TODO Auto-generated method stub
		return this.studentMapper.updateStudentStateByStudentIds(ids);
	}

}
