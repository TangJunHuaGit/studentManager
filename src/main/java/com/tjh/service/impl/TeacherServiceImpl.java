package com.tjh.service.impl;

import com.tjh.mapper.TeacherMapper;
import com.tjh.pojo.Teacher;
import com.tjh.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public Teacher loadOneTeacherByClassId(Integer classId) {
        return  teacherMapper.loadOneTeacherByClassId(classId);
    }
}
