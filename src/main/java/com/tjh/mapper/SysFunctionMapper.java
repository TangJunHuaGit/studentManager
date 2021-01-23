package com.tjh.mapper;

import java.util.List;

import com.tjh.pojo.SysFunction;
import com.tjh.vo.SysFuntionVo;

public interface SysFunctionMapper {
	List<SysFuntionVo> loadAllMenu(SysFuntionVo vo);

	Integer loadAllMenuCount();

	List<SysFuntionVo> loadAllFunction();

	Integer addMenu(SysFuntionVo vo);

	SysFunction queryOneMenu(Integer functionId);

	int updateMenuByMenuId(SysFuntionVo vo);

	List<SysFunction> queryAll();

	int deleteMenuById(Integer functionId);
}
