package com.tjh.mapper;

import com.tjh.pojo.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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


	/**
	 *修改密码
	 */
	public boolean updateUserPassWord(SysUser user);

	public SysUser loadOneUser(Integer userId);

	public boolean updateUser(SysUser user);

	boolean updateUserPassword(SysUser user);

    List<SysUser> loadUsersByRoleId(@Param("roleId") Integer roleId);

	Integer verificationPassword(@Param("userId") Integer userId,@Param("userLogPwd") String userLogPwd);

	@Select("select * from sys_user where userLogName = #{userLogName}")
    List<SysUser> checkOutUserName(String userName);
}
