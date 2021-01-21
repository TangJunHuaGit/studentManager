package com.tjh.mapper;

import com.tjh.pojo.Teacher;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {
    public Teacher loadOneTeacherByClassId(Integer classId);

    List<Teacher> loadAllTeacher();

    Teacher loadOneTeacherByTeacherId(Integer teacherId);
}
