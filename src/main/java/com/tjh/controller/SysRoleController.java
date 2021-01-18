package com.tjh.controller;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
