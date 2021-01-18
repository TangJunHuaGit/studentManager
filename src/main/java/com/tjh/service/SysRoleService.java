package com.tjh.service;


import com.tjh.pojo.SysRole;
import com.tjh.util.DataGridView;
import com.tjh.vo.SysRoleVo;
import org.apache.ibatis.annotations.Param;

public interface SysRoleService {
	public boolean addRole(SysRole role);
	
	public DataGridView loadAllRole(SysRoleVo roleVo);
	
	public int loadTotalRole(SysRoleVo roleVo);
	
	public boolean updateRoleByRoleId(SysRole role);
	
	public boolean updateRoleStateByRoleId(Integer roleId);
	
	public boolean updateRoleStateByRoleIds(Integer[] ids);
	
	public SysRole loadOneRoleByRoleId(Integer roleId);

	public  boolean addBaseRole(Integer roleId,Integer userId);

}
