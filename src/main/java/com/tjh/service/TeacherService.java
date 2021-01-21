package com.tjh.service;

import com.tjh.pojo.Teacher;
import com.tjh.util.DataGridView;

import java.util.List;

public interface TeacherService {

    public Teacher loadOneTeacherByClassId(Integer classId);

    DataGridView loadAllTeacher(Integer page, Integer limit);

    Teacher loadOneTeacherByTeacherId(Integer classId);
}
