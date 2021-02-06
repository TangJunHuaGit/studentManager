package com.tjh.controller;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.util.StringUtil;
import com.tjh.pojo.Student;
import com.tjh.service.StudentService;
import com.tjh.util.ResultMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tjh.util.RandomStrUtils;

@Controller
@RequestMapping("upload")
public class UploadController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("uploadFile")
    @ResponseBody
    public Map<String,Object> uploadFile(MultipartFile mf,HttpSession session,String studentId){
        //得到原来文件名 如果存在 删除文件
        Student sqlStudent = this.studentService.loadOneStudentByStudentId(Integer.valueOf(studentId));
        String oldFile= sqlStudent.getStudentSource();
        if (!StringUtil.isEmpty(oldFile)) {
            File oldFiles = new File(oldFile);
            if (oldFiles.exists()) {
                oldFiles.delete();
            }
        }
        Map<String,Object> map=new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        // 1,得到老名字
        String oldName = mf.getOriginalFilename();
        // 2,得到tomcat里面的upload目录
        String realPath = session.getServletContext().getRealPath(
                "/upload/");
        // 3,得到当前时间
        String currentDate = RandomStrUtils.getCurrentDateToStr();
        // 4,得到新的父目录的路径 并判断是否存在 如果不存在就创建
        String newRealPath = realPath + "\\" + currentDate;
        File parentFile = new File(newRealPath);
        if (!parentFile.exists()) {
            parentFile.mkdirs();// 创建文件夹
        }
        // 5,得到新名字
        String newName = RandomStrUtils.createFileNameUseTime(oldName);
        // 6,构造文件
        File file = new File(parentFile, newName);
        // 7，上传
        try {
            mf.transferTo(file);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        String  path = session.getServletContext().getRealPath("/");
        Map<String,Object> data=new HashMap<>();
        data.put("src", newRealPath+"/"+newName);
        map.put("data", data);
        Student student = new Student();
        student.setStudentId(Integer.valueOf(studentId));
        student.setStudentSource(newRealPath+"\\"+newName);
        this.studentService.updateStudentByStudentId(student);
        return map;
    }

    @RequestMapping("downLoadFile")
    @ResponseBody
    public ResultMessage downLoadFile(Integer studentId, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        //判断空 建立文件模板
        response.setContentType("application/force-download");
        response.setCharacterEncoding("utf-8");
        //查询当前学生
        Student student = studentService.loadOneStudentByStudentId(studentId);
        //获取存入的文件路径
        String studentSource = student.getStudentSource();
        response.setHeader("Content-Disposition", "attachment;fileName="
                +java.net.URLEncoder.encode(student.getStudentFileName(),"UTF-8"));


        //得到项目路径
        File tempFile = new File(studentSource);
        try {
            InputStream inputStream = new FileInputStream(tempFile);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
            os.flush();
            os.close();
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
            return ResultMessage.success(ResultMessage.FAILCODE, ResultMessage.FAIL);
        }
             return ResultMessage.success(ResultMessage.SUCCESSCODE, ResultMessage.SUCCESSFUL);
    }


    @RequestMapping("downLoadModel")
    @ResponseBody
    public ResultMessage downLoadModel(HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        //判断空 建立文件模板
        //= this.getClass().getResource("resources/model").getPath();
        response.setContentType("application/force-download");
        response.setCharacterEncoding("utf-8");
        String fileName = "report.xls";

        String modelPath = request.getServletContext().getRealPath("/")+"resources/model/"+fileName;
        response.setHeader("Content-Disposition", "attachment;fileName=" +java.net.URLEncoder.encode(fileName,"UTF-8"));
        File File = new File(modelPath);
        try {
            InputStream inputStream = new FileInputStream(File);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
            os.flush();
            os.close();
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
            return ResultMessage.success(ResultMessage.FAILCODE, ResultMessage.FAIL);
        }
        return ResultMessage.success(ResultMessage.SUCCESSCODE, ResultMessage.SUCCESSFUL);
    }
}



