package com.tjh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tjh.mapper.TeacherMapper;
import com.tjh.pojo.Teacher;
import com.tjh.service.TeacherService;
import com.tjh.util.DataGridView;
import com.tjh.util.PageBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public Teacher loadOneTeacherByClassId(Integer classId) {
        return  teacherMapper.loadOneTeacherByClassId(classId);
    }

    @Override
    public DataGridView loadAllTeacher(Integer page,Integer limit) {
        PageHelper.startPage(page, limit);
        List<Teacher> teachers = teacherMapper.loadAllTeacher();
        PageInfo<Teacher> pageInfo = new PageInfo<>(teachers);
        return new DataGridView(pageInfo.getTotal(), pageInfo.getList());
    }

    @Override
    public Teacher loadOneTeacherByTeacherId(Integer teacherId) {
        return teacherMapper.loadOneTeacherByTeacherId(teacherId);
    }
}
