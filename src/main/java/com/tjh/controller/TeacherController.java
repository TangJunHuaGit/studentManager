package com.tjh.controller;

import com.tjh.base.annotation.Function;
import com.tjh.pojo.Teacher;
import com.tjh.service.TeacherService;
import com.tjh.util.ResultMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
