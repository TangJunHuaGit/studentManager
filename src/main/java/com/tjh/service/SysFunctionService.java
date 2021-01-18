package com.tjh.service;


import java.util.List;

import com.tjh.pojo.SysFunction;
import com.tjh.util.DataGridView;
import com.tjh.util.DtreeBuild;
import com.tjh.util.ResultMessage;
import com.tjh.vo.SysFuntionVo;


public interface SysFunctionService {
	List<SysFuntionVo> loadAllFunction();

	ResultMessage addMenu(SysFuntionVo vo);

	DataGridView loadAllMenu(SysFuntionVo vo);

	DataGridView loadAllParentMenu(SysFuntionVo vo);

	SysFunction queryOneMenu(Integer functionId);

	int updateMenuByMenuId(SysFuntionVo vo);

	DtreeBuild loadTreeFunction(Integer userId);
}
