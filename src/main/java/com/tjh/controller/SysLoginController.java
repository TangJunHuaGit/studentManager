package com.tjh.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.pojo.SysUser;
import com.tjh.pojo.SysUserInfo;
import com.tjh.service.SysUserService;
import com.tjh.util.ResultMessage;
import com.tjh.util.SessionUtils;
@Controller
@RequestMapping("login")
public class SysLoginController {

	@Autowired
	private SysUserService sysUserService;

	@RequestMapping("doLogin")
	@ResponseBody
	public ResultMessage doLogin(SysUser user, Model model, HttpServletRequest request){
		long begin = System.currentTimeMillis();
		//设置session，获取角色、菜单和权限，放到redis中（mysql和redis数据同步）
		SysUser dbUser = this.sysUserService.queryUserByUserLoginName(user.getUserLogName());
		if(dbUser == null){
			return ResultMessage.erreo(ResultMessage.FAILCODE,null,"用户不存在");
		}
		SysUserInfo userInfo = sysUserService.getUserInfo(String.valueOf(dbUser.getUserId()));
		userInfo.setUser(dbUser);
		if(user.getUserLogPwd().equals(dbUser.getUserLogPwd())) {
			request.getSession().setAttribute("user",userInfo);
			long end = System.currentTimeMillis();
			System.out.println("登录耗时："+ (end - begin ) + "ms");
			return ResultMessage.success(ResultMessage.SUCCESSCODE, ResultMessage.SUCCESSFUL);
		}else {
			long end = System.currentTimeMillis();
			System.out.println("登录耗时："+ (end - begin ) + "ms");
			return ResultMessage.erreo(ResultMessage.FAILCODE,null,"密码不正确");
		}
	}
	@RequestMapping("queryUserByUserMobilePhone")
	@ResponseBody
	public ResultMessage queryUserByUserMobilePhone(SysUser user,HttpServletRequest request){
		SysUser dbUser = this.sysUserService.queryUserByUserMobilePhone(user);

		if(user.getUserMobilePhone().equals(dbUser.getUserMobilePhone()) && user.getUserLogName().equals(dbUser.getUserLogName())) {
			return  ResultMessage.success(dbUser.getUserId(),ResultMessage.SUCCESSFUL);
		}else {
			return ResultMessage.success(ResultMessage.FAILCODE, ResultMessage.FAIL);
		}
	}

	@RequestMapping("updateUserPassWord")
	@ResponseBody
	public ResultMessage updateUserPassWord(SysUser user){
		boolean flag= this.sysUserService.updateUserPassWord(user);
		if(flag){
			return  ResultMessage.success(ResultMessage.SUCCESSCODE,ResultMessage.SUCCESSFUL);
		}else{
			return ResultMessage.success(ResultMessage.FAILCODE, ResultMessage.FAIL);
		}
	}

	@RequestMapping("loginOut")
	@ResponseBody
	public ResultMessage loginOut(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return ResultMessage.success(ResultMessage.SUCCESSCODE, ResultMessage.SUCCESSFUL);
	}



}
