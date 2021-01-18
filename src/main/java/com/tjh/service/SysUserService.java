package com.tjh.service;

import com.tjh.pojo.SysUser;
import com.tjh.pojo.SysUserInfo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysUserService {
	/**
	 * 
	 * @param user
	 * @return boolean
	 * 新增用户的方法
	 */
	public boolean addUser(SysUser user);
	
	/**
	 * 
	 * @param user
	 * @return
	 * 查询单个用户的方法
	 */
	public SysUser queryUserByUserLoginName(@Param("userLoginName") String userLoginName);
	/**
	 * 
	 * @param user
	 * @return
	 * 查询单个用户的方法依据手机号
	 */
	public SysUser queryUserByUserMobilePhone(SysUser user);
	
	/**
	 * 获取用户角色功能信息
	 * @param userId userId
	 * @return SysUserInfo
	 */
	SysUserInfo  getUserInfo(String userId);
}