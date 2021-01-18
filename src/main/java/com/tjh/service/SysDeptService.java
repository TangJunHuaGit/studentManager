package com.tjh.service;

import com.tjh.util.DataGridView;
import com.tjh.vo.SysDeptVo;


public interface SysDeptService {
	//加载部门树
	public DataGridView loadAllDept(SysDeptVo sysDeptVo);
}