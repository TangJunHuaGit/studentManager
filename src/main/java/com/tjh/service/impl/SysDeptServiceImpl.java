package com.tjh.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.tjh.mapper.SysDeptMapper;
import com.tjh.pojo.SysDept;
import com.tjh.service.SysDeptService;
import com.tjh.util.DataGridView;
import com.tjh.vo.SysDeptVo;
@Service
public class SysDeptServiceImpl implements SysDeptService{
	
	@Autowired SysDeptMapper sysDeptMapper;

	@Override
	public DataGridView loadAllDept(SysDeptVo sysDeptVo) {
		// TODO Auto-generated method stub
		Page<SysDept> page = PageHelper.startPage(sysDeptVo.getPage(), sysDeptVo.getLimit());
		List<SysDept> list= sysDeptMapper.loadAllDept();
		DataGridView view=new DataGridView();
		view.setCount(page.getTotal());
		view.setData(list);
		return view;
	}
   
}