package com.tjh.mapper;

import com.tjh.pojo.SysUser;

public interface SysUserMapper {
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
	 * 查询单个用户的方法依据用户名
	 */
	public SysUser queryUserByUserLoginName(String userLoginName);
	
	/**
	 * 
	 * @param user
	 * @return
	 * 查询单个用户的方法依据手机号
	 */
	public SysUser queryUserByUserMobilePhone(SysUser user);

}
