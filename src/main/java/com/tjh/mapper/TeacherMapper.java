package com.tjh.mapper;

import com.tjh.pojo.Teacher;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {
    public Teacher loadOneTeacherByClassId(Integer classId);

    List<Teacher> loadAllTeacher();

    Teacher loadOneTeacherByTeacherId(Integer teacherId);

    int updateTeacherByTeacherId(Teacher teacher);

    int addTeacher(Teacher teacher);

    int deleteTeacherStateByTeacherId(Integer teacherId);

    int addTeacherUserInfo(Map<String,Integer> map);
}
