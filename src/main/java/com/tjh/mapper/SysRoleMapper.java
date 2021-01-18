package com.tjh.mapper;

import com.tjh.pojo.SysRole;
import com.tjh.vo.SysRoleVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysRoleMapper {
	public boolean addRole(SysRole role);
	
	public List<SysRole> loadAllRole(SysRoleVo roleVo);
	
	public int loadTotalRole(SysRoleVo roleVo);
	
	public SysRole loadOneRoleByRoleId(Integer roleId);
	
	public boolean updateRoleByRoleId(SysRole role);
	
	public boolean updateRoleStateByRoleId(Integer roleId);
	
	public boolean updateRoleStateByRoleIds(@Param("ids")Integer[] ids);

	public  boolean addBaseRole(@Param("roleId") Integer roleId,@Param("userId") Integer userId);
}