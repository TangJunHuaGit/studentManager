package com.tjh.util;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import com.tjh.pojo.SysUserInfo;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.tjh.pojo.SysUser;

/**
 * 解耦的方式得到web作用域
 * @author LJH
 *
 */
public class SessionUtils {

	/**
	 * 得到request
	 */
	public static HttpServletRequest getCurrentServletRequest() {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes)
				RequestContextHolder.getRequestAttributes();
		return requestAttributes.getRequest();
	}
	/**
	 * 得到session
	 */
	public static HttpSession getCurrentSession() {
		return getCurrentServletRequest().getSession();
	}

	/**
	 * 得到sesison里面的用户
	 */
	public static SysUserInfo getCurrentSysUser() {
		return (SysUserInfo) getCurrentSession().getAttribute("user");
	}
	/**
	 * 得到sesison里面的用户名
	 */
	public static String getCurrentSysUserName() {
		SysUser SysUser=(SysUser) getCurrentSession().getAttribute("user");
		return SysUser.getUserName();
	}
}
