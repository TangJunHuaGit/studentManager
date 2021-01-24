package com.tjh.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.tjh.constant.Constant;
import com.tjh.service.SysRoleService;
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
			request.setAttribute("type", "repass");
			msg.put("msg", "成功");
			msg.put("code", "100");
		}else {
			request.setAttribute("type", "noRepass");
			msg.put("msg", "失败");
			msg.put("code", "101");
		}
		return msg;
	}


}
