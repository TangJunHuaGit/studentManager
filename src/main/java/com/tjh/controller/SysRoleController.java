package com.tjh.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.tjh.constant.Constant;
import com.tjh.pojo.SysUser;
import com.tjh.util.ResultMessage;
import com.tjh.vo.SysFuntionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.pojo.SysRole;
import com.tjh.service.SysRoleService;
import com.tjh.util.DataGridView;
import com.tjh.vo.SysRoleVo;

@Controller
@RequestMapping("sysRole")
public class SysRoleController {

	@Autowired
	private SysRoleService sysRoleService;

	@Autowired
	private TeacherController teacherController;

	@RequestMapping("loadAllRole")
	@ResponseBody
	public DataGridView loadAllRole(SysRoleVo roleVo) {//分页查询所有
		return this.sysRoleService.loadAllRole(roleVo);
	}

	@RequestMapping("updateRoleByRoleId")
	@ResponseBody
	public Map<String,String> updateRoleByRoleId(SysRole role) {//修改
		boolean flag = this.sysRoleService.updateRoleByRoleId(role);
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
	@RequestMapping("updateRoleStateByRoleId")
	@ResponseBody
	public Map<String,String> updateRoleStateByRoleId(Integer roleId) {
		boolean flag = this.sysRoleService.updateRoleStateByRoleId(roleId);
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
	@RequestMapping("updateRoleStateByRoleIds")
	@ResponseBody
	public Map<String,String> updateRoleStateByRoleIds(Integer[] ids) {
		boolean flag = this.sysRoleService.updateRoleStateByRoleIds(ids);
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
	@RequestMapping("loadOneRoleByRoleId")
	@ResponseBody
	public SysRole loadOneRoleByRoleId(Integer roleId) {
		return this.sysRoleService.loadOneRoleByRoleId(roleId);
	}

	//	添加
	@RequestMapping("addRole")
	@ResponseBody
	public Map<String,String> addRole(SysRole role) {
		boolean flag = this.sysRoleService.addRole(role);
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

	//资源分配
	@RequestMapping("sourceAllot")
	@ResponseBody
	public ResultMessage sourceAllot(@RequestParam("addIds") String addIds, @RequestParam("delIds")String delIds,@RequestParam("roleId")Integer roleId){
		JSONArray addIdArr = JSONArray.parseArray(addIds);
		JSONArray delIdArr = JSONArray.parseArray(delIds);
		for (Object o : addIdArr) {
			int functionId = Integer.parseInt(o.toString());
			this.sysRoleService.insertFunctionByRoleId(functionId,roleId);
		}
		for (Object o : delIdArr) {
			int functionId = Integer.parseInt(o.toString());
			this.sysRoleService.deleteFunctionByRoleId(functionId,roleId);
		}

		return  ResultMessage.success(ResultMessage.SUCCESSCODE,"更新成功");
	}
	@RequestMapping("loadUsersByRoleId")
	@ResponseBody
	public DataGridView loadUsersByRoleId(Integer roleId,Integer page,Integer limit) {
		return this.sysRoleService.loadUsersByRoleId(roleId,page,limit);
	}
	@RequestMapping("getUsersByRoleId")
	@ResponseBody
	public DataGridView getUsersByRoleId(Integer roleId,Integer page,Integer limit) {
		return this.sysRoleService.getUsersByRoleId(roleId,page,limit);
	}
	@RequestMapping("addRoleUser")
	@ResponseBody
	public ResultMessage addRoleUser(Integer roleId,SysUser user) {
		if(roleId.equals(Constant.TEACHER_ROLE_ID)){
			teacherController.addTeacher(user);
		}
		return this.sysRoleService.addRoleUser(roleId,user.getUserId());
	}
}
