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
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public int updateTeacherByTeacherId(Teacher teacher) {
        return this.teacherMapper.updateTeacherByTeacherId(teacher);
    }

    @Override
    public int addTeacher(Teacher teacher) {
        int i = this.teacherMapper.addTeacher(teacher);
//        int temp = 0;
//        if(i>0){
//            Map<String,Integer> map = new HashMap<>();
//            map.put("userId",userId);
//            map.put("teacherId",teacher.getTeacherId());
//            temp = this.teacherMapper.addTeacherUserInfo(map);
//        }
        return  i;
    }

    @Override
    public int deleteTeacherStateByTeacherId(Integer teacherId) {
        return this.teacherMapper.deleteTeacherStateByTeacherId(teacherId);
    }
}
