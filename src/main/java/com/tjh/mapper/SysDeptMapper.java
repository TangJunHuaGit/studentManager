package com.tjh.mapper;

import com.tjh.pojo.SysDept;

import java.util.List;

public interface SysDeptMapper {
	//加载部门树
   public List<SysDept> loadAllDept();
}