package com.tjh.controller;

import com.tjh.base.annotation.Function;
import com.tjh.pojo.Teacher;
import com.tjh.service.TeacherService;
import com.tjh.util.DataGridView;
import com.tjh.util.ResultMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("teacher")
@Controller
public class TeacherController {
    @Autowired
    private TeacherService teacherService;

    @Function(functionName = "loadOneTeacherByClassId")
    @RequestMapping("loadOneTeacherByClassId")
    @ResponseBody
    public ResultMessage loadOneTeacherByClassId(Integer classId){
        Teacher teacher = this.teacherService.loadOneTeacherByClassId(classId);
        if(teacher != null){
            return new ResultMessage(ResultMessage.SUCCESSCODE,teacher,ResultMessage.SUCCESSFUL);
        }else{
            return new ResultMessage(ResultMessage.FAILCODE,"",ResultMessage.FAIL);
        }
    }

    @Function(functionName = "loadOneTeacherByTeacherId")
    @RequestMapping("loadOneTeacherByTeacherId")
    @ResponseBody
    public ResultMessage loadOneTeacherByTeacherId(@RequestParam("teacherId") Integer teacherId){
        Teacher teacher = this.teacherService.loadOneTeacherByTeacherId(teacherId);
        if(teacher != null){
            return  ResultMessage.success(teacher);
        }else{
            return  ResultMessage.erreo("查询错误");
        }
    }


    @Function(functionName = "loadAllTeacher")
    @RequestMapping("loadAllTeacher")
    @ResponseBody
    public DataGridView loadAllTeacher(Integer page, Integer limit){
        return this.teacherService.loadAllTeacher(page, limit);
    }
}
