package com.tjh.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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
    public ResultMessage loadOneTeacherByClassId(Integer classId) {
        Teacher teacher = this.teacherService.loadOneTeacherByClassId(classId);
        if (teacher != null) {
            return new ResultMessage(ResultMessage.SUCCESSCODE, teacher, ResultMessage.SUCCESSFUL);
        } else {
            return new ResultMessage(ResultMessage.FAILCODE, "", ResultMessage.FAIL);
        }
    }

    @Function(functionName = "loadOneTeacherByTeacherId")
    @RequestMapping("loadOneTeacherByTeacherId")
    @ResponseBody
    public ResultMessage loadOneTeacherByTeacherId(@RequestParam("teacherId") Integer teacherId) {
        Teacher teacher = this.teacherService.loadOneTeacherByTeacherId(teacherId);
        if (teacher != null) {
            return ResultMessage.success(teacher);
        } else {
            return ResultMessage.erreo("查询错误");
        }
    }

    @RequestMapping("updateTeacherByTeacherId")
    @ResponseBody
    public ResultMessage updateTeacherByTeacherId(Teacher teacher) {
        int i = this.teacherService.updateTeacherByTeacherId(teacher);
        return i > 0 ? ResultMessage.successDesc("修改成功") : ResultMessage.erreo("修改失败");
    }
    @RequestMapping("addTeacher")
    @ResponseBody
    public ResultMessage addTeacher(Teacher teacher) {
        int i = this.teacherService.addTeacher(teacher);
        return i > 0 ? ResultMessage.successDesc("添加成功") : ResultMessage.erreo("添加失败");
    }
    @RequestMapping("deleteTeacherStateByTeacherId")
    @ResponseBody
    public ResultMessage deleteTeacherStateByTeacherId(Integer teacherId) {
        int i = this.teacherService.deleteTeacherStateByTeacherId(teacherId);
        return i > 0 ? ResultMessage.successDesc("删除成功") : ResultMessage.erreo("删除失败");
    }
    @RequestMapping("deleteTeacherStateByTeacherIds")
    @ResponseBody
    public ResultMessage deleteTeacherStateByTeacherIds(@RequestParam("ids") String ids) {
        JSONArray teacherIds = JSONArray.parseArray(ids);
        int count = 0;
        for(Object id : teacherIds){
            this.teacherService.deleteTeacherStateByTeacherId(Integer.parseInt(id.toString()));
            count++;
        }
        if(count == teacherIds.size()){
            return ResultMessage.successDesc("删除成功");
        }else{
            String data = "成功删除"+count+"个，失败"+(teacherIds.size() - count)+"个";
            return ResultMessage.success(data,data);
        }
    }

    @Function(functionName = "loadAllTeacher")
    @RequestMapping("loadAllTeacher")
    @ResponseBody
    public DataGridView loadAllTeacher(Integer page, Integer limit) {
        return this.teacherService.loadAllTeacher(page, limit);
    }
}
