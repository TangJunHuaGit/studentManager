package com.tjh.util;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import com.tjh.constant.Constant;
import com.tjh.pojo.SysRole;
import com.tjh.pojo.SysUserInfo;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.tjh.pojo.SysUser;

import java.util.List;

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

	public static boolean isAdmin(){
		boolean isAdmin = false;
		List<SysRole> userRole = getCurrentSysUser().getRoles();
		for (SysRole role : userRole) {
			String roleName = role.getRoleName();
			if (Constant.ADMIN_NAME.equals(roleName)) {
				isAdmin = true;
				break;
			}
		}
		return isAdmin;
	}
}
