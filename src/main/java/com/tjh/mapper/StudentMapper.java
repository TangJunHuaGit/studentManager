package com.tjh.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tjh.pojo.Student;
import com.tjh.vo.StudentVo;


public interface StudentMapper {

	List<Student> loadStudentByClassId(Integer classId);

	//添加学生
	public boolean addStudent(Student student);

	//加载所有学生分页
	public List<Student> loadAllStudent(StudentVo studentVo);

	//加载分页查询总数
	public int loadTotalStudent(StudentVo studentVo);

	//加载单个学生
	public Student loadOneStudentByStudentId(Integer studentId);

	//更新学生
	public boolean updateStudentByStudentId(Student student);

	//更新单个学生状态
	public boolean updateStudentStateByStudentId(Integer studentId);

	//批量更新学生状态
	public boolean updateStudentStateByStudentIds(@Param("ids")Integer[] ids);
}