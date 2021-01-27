package com.tjh.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tjh.mapper.SysUserMapper;
import com.tjh.pojo.SysUser;
import com.tjh.util.ResultMessage;
import com.tjh.dao.SysUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjh.mapper.SysRoleMapper;
import com.tjh.pojo.SysRole;
import com.tjh.service.SysRoleService;
import com.tjh.util.DataGridView;
import com.tjh.util.PageBuilder;
import com.tjh.vo.SysRoleVo;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SysRoleServiceImpl implements SysRoleService{

	@Autowired
	private SysRoleMapper sysRoleMapper;

	@Autowired
	private SysUserMapper userMapper;

	@Autowired
	private SysUserDao sysUserDao;

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
		return this.sysRoleMapper.updateRoleByRoleId(role);
	}

	@Override
	public boolean updateRoleStateByRoleId(Integer roleId) {
		return this.sysRoleMapper.updateRoleStateByRoleId(roleId);
	}

	@Override
	public boolean updateRoleStateByRoleIds(Integer[] ids) {
		return this.sysRoleMapper.updateRoleStateByRoleIds(ids);
	}

	@Override
	public SysRole loadOneRoleByRoleId(Integer roleId) {
		return this.sysRoleMapper.loadOneRoleByRoleId(roleId);
	}

	@Override
	public boolean addBaseRole(Integer roleId, Integer userId) {
		return this.sysRoleMapper.addBaseRole(roleId,userId);
	}

	@Override
	public boolean addRole(SysRole role) {
		return this.sysRoleMapper.addRole(role);
	}

	@Override
	public void insertFunctionByRoleId(int functionId, Integer roleId) {
		this.sysRoleMapper.insetFunctionByRoleId(functionId,roleId);
	}

	@Override
	public void deleteFunctionByRoleId(int functionId, Integer roleId) {
		this.sysRoleMapper.deleteFunctionByRoleId(functionId,roleId);
	}

	@Override
	public DataGridView loadUsersByRoleId(Integer roleId,Integer page,Integer limit) {
		PageHelper.startPage(page, limit);
		List<SysUser> users =userMapper.loadUsersByRoleId(roleId);
		PageInfo<SysUser> pageInfo = new PageInfo<>(users);
		return new DataGridView(pageInfo.getTotal(),pageInfo.getList());
	}

	@Override
	public DataGridView getUsersByRoleId(Integer roleId,Integer page,Integer limit) {
		int curPage = PageBuilder.builderLimit(page, limit);
		int pageSize = PageBuilder.builderPage(page, limit);
		List<SysUser> usersByRoleId = sysUserDao.getUsersByRoleId(roleId);
		List<SysUser> collect = usersByRoleId.stream().skip(pageSize).limit(curPage).collect(Collectors.toList());
		return new DataGridView((long)usersByRoleId.size(),collect);
	}

	@Override
	public ResultMessage addRoleUser(Integer roleId, Integer userId) {
		int i  = this.sysRoleMapper.addRoleUser(roleId,userId);
		return i>0?ResultMessage.successDesc("添加成功"):ResultMessage.erreo("失败");
	}
}
