package com.tjh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.tjh.dao.SysUserDao;
import com.tjh.mapper.SysUserMapper;
import com.tjh.pojo.SysUser;
import com.tjh.pojo.SysUserInfo;
import com.tjh.service.SysUserService;
@Service
@ComponentScan("com.tjh.dao")
public class SysUserServiceImpl implements SysUserService{

	@Autowired
	private SysUserMapper sysUserMapper;

	@Autowired
	private SysUserDao sysUserDao;

	@Override
	public boolean addUser(SysUser user) {
		// TODO Auto-generated method stub
		return this.sysUserMapper.addUser(user);
	}

	@Override
	public SysUser queryUserByUserLoginName(String userLoginName) {
		// TODO Auto-generated method stub
		return	this.sysUserMapper.queryUserByUserLoginName(userLoginName);
	}

	@Override
	public SysUser queryUserByUserMobilePhone(SysUser user) {
		return sysUserMapper.queryUserByUserMobilePhone(user);
	}


	@Override
	public SysUserInfo getUserInfo(String userId) {
		return sysUserDao.getUserInfo(userId);
	}

	@Override
	public boolean updateUserPassWord(SysUser user) {
		return sysUserMapper.updateUserPassWord(user);
	}

}
