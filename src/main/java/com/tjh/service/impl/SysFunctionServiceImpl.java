package com.tjh.service.impl;

import java.util.List;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.tjh.util.DtreeBuild;
import com.tjh.util.PageBuilder;
import com.tjh.util.ResultMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjh.mapper.SysFunctionMapper;
import com.tjh.pojo.SysFunction;
import com.tjh.service.SysFunctionService;
import com.tjh.util.DataGridView;
import com.tjh.vo.SysFuntionVo;
@Service
public class SysFunctionServiceImpl implements SysFunctionService{

	@Autowired
	private SysFunctionMapper sysFunctionMapper;
	
	@Override
	public List<SysFuntionVo> loadAllFunction() {
		SysFuntionVo vo = new SysFuntionVo();
		vo.setPage(0);
		vo.setLimit(99999);
		return this.sysFunctionMapper.loadAllMenu(vo);
	}

	@Override
	public ResultMessage addMenu(SysFuntionVo vo) {
		return null;
	}

	@Override
	public DataGridView loadAllMenu(SysFuntionVo vo) {
		vo.setLimit(PageBuilder.builderLimit(vo.getPage(), vo.getLimit()));
		vo.setPage(PageBuilder.builderPage(vo.getPage(), vo.getLimit()));
		List<SysFuntionVo> list = this.sysFunctionMapper.loadAllMenu(vo);
		DataGridView view=new DataGridView();
		view.setCount(47L);
		view.setData(list);
		return view;
	}

	@Override
	public DataGridView loadAllParentMenu(SysFuntionVo vo) {
		return null;
	}

	@Override
	public SysFunction queryOneMenu(Integer functionId) {
		return null;
	}

	@Override
	public int updateMenuByMenuId(SysFuntionVo vo) {
		return 0;
	}

	@Override
	public DtreeBuild loadTreeFunction(Integer userId) {
		return null;
	}


}
