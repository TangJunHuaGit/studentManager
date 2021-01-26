package com.tjh.service.impl;

import java.util.List;

import com.tjh.dao.SysUserDao;
import com.tjh.mapper.TeacherMapper;
import com.tjh.pojo.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjh.mapper.SysRoleMapper;
import com.tjh.pojo.SysRole;
import com.tjh.service.SysRoleService;
import com.tjh.util.DataGridView;
import com.tjh.util.PageBuilder;
import com.tjh.vo.SysRoleVo;
@Service
public class SysRoleServiceImpl implements SysRoleService{

	@Autowired
	private SysRoleMapper sysRoleMapper;

	@Override
	public DataGridView loadAllRole(SysRoleVo roleVo) {
		//重新计算 page limit
		roleVo.setLimit(PageBuilder.builderLimit(roleVo.getPage(), roleVo.getLimit()));
		roleVo.setPage(PageBuilder.builderPage(roleVo.getPage(), roleVo.getLimit()));
		//查询数据库所有角色 根据页面传入条件
		List<SysRole> allRole = this.sysRoleMapper.loadAllRole(roleVo);
		//查询数据库所有角色总数 根据页面传入条件
		int total = this.sysRoleMapper.loadTotalRole(roleVo);
		return new DataGridView((long)total, allRole);
	}

	@Override
	public int loadTotalRole(SysRoleVo roleVo) {
		return this.sysRoleMapper.loadTotalRole(roleVo);
	}

	@Override
	public boolean updateRoleByRoleId(SysRole role) {
		// TODO Auto-generated method stub
		return this.sysRoleMapper.updateRoleByRoleId(role);
	}

	@Override
	public boolean updateRoleStateByRoleId(Integer roleId) {
		// TODO Auto-generated method stub
		return this.sysRoleMapper.updateRoleStateByRoleId(roleId);
	}

	@Override
	public boolean updateRoleStateByRoleIds(Integer[] ids) {
		// TODO Auto-generated method stub
		return this.sysRoleMapper.updateRoleStateByRoleIds(ids);
	}

	@Override
	public SysRole loadOneRoleByRoleId(Integer roleId) {
		// TODO Auto-generated method stub
		return this.sysRoleMapper.loadOneRoleByRoleId(roleId);
	}

	@Override
	public boolean addBaseRole(Integer roleId, Integer userId) {
		return this.sysRoleMapper.addBaseRole(roleId,userId);
	}

	@Override
	public boolean addRole(SysRole role) {
		// TODO Auto-generated method stub
		return this.sysRoleMapper.addRole(role);
	}

	@Override
	public void insetFunctionByRoleId(int functionId, Integer roleId) {
		this.sysRoleMapper.insetFunctionByRoleId(functionId,roleId);
	}

	@Override
	public void deleteFunctionByRoleId(int functionId, Integer roleId) {
		this.sysRoleMapper.deleteFunctionByRoleId(functionId,roleId);
	}
}
