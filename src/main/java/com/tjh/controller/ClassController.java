package com.tjh.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.pojo.Class;
import com.tjh.service.ClassService;
import com.tjh.util.DataGridView;
import com.tjh.vo.ClassVo;

@Controller
@RequestMapping("class")
public class ClassController {
	
	@Autowired
	private ClassService classService;
	
	@RequestMapping("loadAllClassComboBox")
	@ResponseBody
	public  List<Map<String, Object>> loadAllClass(){
		List<Map<String, Object>> allClass = this.classService.loadAllClassComboBox();
		return allClass;
	}
	
	@RequestMapping("loadAllClass")
	@ResponseBody
	public DataGridView loadAllClass(ClassVo classVo) {//分页查询所有
		return this.classService.loadAllClass(classVo);
	}
	
	@RequestMapping("updateClassByClassId")
	@ResponseBody
	public Map<String,String> updateClassByClassId(Class classes) {//修改
		boolean flag = this.classService.updateClassByClassId(classes);
		Map<String,String> map = new HashMap<String, String>();
		if(flag) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}
	//更新单个状态
	@RequestMapping("updateClassStateByClassId")
	@ResponseBody
	public Map<String,String> updateClassStateByClassId(Integer classId) {
		boolean flag = this.classService.updateClassStateByClassId(classId);
		Map<String,String> map = new HashMap<String, String>();
		if(flag) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}
	//更新多个状态
	@RequestMapping("updateClassStateByClassIds")
	@ResponseBody
	public Map<String,String> updateClassStateByClassIds(Integer[] ids) {
		boolean flag = this.classService.updateClassStateByClassIds(ids);
		Map<String,String> map = new HashMap<String, String>();
		if(flag) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}
	//查询单个
	@RequestMapping("loadOneClassByClassId")
	@ResponseBody
	public Class loadOneClassByClassId(Integer classId) {
		return this.classService.loadOneClassByClassId(classId);
	}
	
	//	添加
	@RequestMapping("addClass")
	@ResponseBody
	public Map<String,String> addClass(Class classes) {
		boolean flag = this.classService.addClass(classes);
		Map<String,String> map = new HashMap<String, String>();
		if(flag) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}
	
	
	
}
