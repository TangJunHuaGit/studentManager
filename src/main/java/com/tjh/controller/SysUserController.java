package com.tjh.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjh.constant.Constant;
import com.tjh.pojo.SysUserInfo;
import com.tjh.service.SysRoleService;
import com.tjh.util.ResultMessage;
import com.tjh.util.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.pojo.SysUser;
import com.tjh.service.SysUserService;

@Controller
@RequestMapping("user")
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysRoleService sysRoleService;


	@RequestMapping("addUser")
	@ResponseBody
	public Map<String, String> addUser(SysUser user,HttpServletRequest request){
		System.out.println(user);
		boolean flag = this.sysUserService.addUser(user);
		//注册后 给用户基础角色
		boolean TF =sysRoleService.addBaseRole(Constant.BASE_ROLE_ID,user.getUserId());
		Map<String, String> msg = new HashMap();
		if(flag && TF) {
			msg.put("msg", "成功");
			msg.put("code", "100");
		}else {
			request.setAttribute("type", "noRepass");
			msg.put("msg", "失败");
			msg.put("code", "101");
		}
		return msg;
	}


	@RequestMapping("loadOneUser")
	@ResponseBody
	public SysUser loadOneUser(){
		SysUserInfo userInfo = SessionUtils.getCurrentSysUser();
		SysUser user = this.sysUserService.loadOneUser(userInfo.getUser().getUserId());
		return user;
	}
	@RequestMapping("updateUser")
	@ResponseBody
	public Map<String,String> updateUser(SysUser user){
		SysUserInfo userInfo = SessionUtils.getCurrentSysUser();
		boolean flag = this.sysUserService.updateUser(user);
		Map<String,String> map = new HashMap<String,String>();
		if(flag){
			map.put("msg", "成功");
			map.put("code", "100");
		}else{
			map.put("msg", "失败");
			map.put("code", "101");
		}
		return map;
	}
	@RequestMapping("updateUserPassword")
	@ResponseBody
	public Map<String,String> updateUserPassword(SysUser user,HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException {
		SysUserInfo userInfo = SessionUtils.getCurrentSysUser();
		boolean flag = this.sysUserService.updateUserPassword(user);
		request.getSession().removeAttribute("user");
		Map<String,String> map = new HashMap<>();
		if(flag){
			map.put("msg", "成功");
			map.put("code", "100");
		}else{
			map.put("msg", "失败");
			map.put("code", "101");
		}
		return map;
	}

	@RequestMapping("verificationPassword")
	@ResponseBody
	public ResultMessage verificationPassword(Integer userId, String userLogPwd){
		Integer num = this.sysUserService.verificationPassword(userId, userLogPwd);
		if(num > 0)
			return new ResultMessage(num,ResultMessage.SUCCESSFUL);
		else
			return new ResultMessage(0,ResultMessage.FAIL);
	}
}
