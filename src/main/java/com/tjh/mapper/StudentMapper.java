package com.tjh.mapper;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tjh.pojo.Student;
import com.tjh.vo.StudentVo;


public interface StudentMapper {

	//根据班级加载学生
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
	public boolean updateStudentStateByStudentId(@Param("studentId") Integer studentId,@Param("state")Integer state,@Param("remark")String remark);

	//批量更新学生状态
	public boolean deleteStudentByStudentIds(@Param("ids")Integer[] ids);

	public boolean deleteStudentByStudentId(Integer studentId);

	public List<Student> loadStudentByTeacher(Map<String,Object> parameter);

	public List<Student> loadStudentByParent(Map<String,Object> parameter);

	public boolean updateStudentStateByStudentIdGoBack(@Param("studentId") Integer studentId,@Param("state") Integer state);

	public boolean updateStudentStateByStudentIdLeave(@Param("studentId")Integer studentId,@Param("state")Integer state);
}
