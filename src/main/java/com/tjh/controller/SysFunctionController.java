package com.tjh.controller;





import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.tjh.pojo.SysFunction;
import com.tjh.pojo.SysUserInfo;
import com.tjh.util.SessionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.service.SysFunctionService;
import com.tjh.util.DataGridView;
import com.tjh.util.FunctionTreeBuilder;
import com.tjh.vo.SysFuntionVo;

@Controller
@RequestMapping("sysFunction")
public class SysFunctionController {
	
	@Autowired
	private SysFunctionService sysFunctionService;
	
	@RequestMapping("loadAllFunction")
	@ResponseBody
	public DataGridView loadAllFunction() {
		SysUserInfo currentSysUser = SessionUtils.getCurrentSysUser();
		List<SysFunction> functions = currentSysUser.getFunctions();
		List<SysFunction> menus = functions.stream().filter(item -> item.getFunctionType().equals("menu")).collect(Collectors.toList());

		List<SysFuntionVo> loadAllFunction = new ArrayList<>();
		menus.forEach(item -> {
			SysFuntionVo vo = new SysFuntionVo();
			BeanUtils.copyProperties(item,vo);
			loadAllFunction.add(vo);
		});

		List<SysFuntionVo> functionTree = FunctionTreeBuilder.builder(loadAllFunction, 1);
		DataGridView data = new DataGridView((long) menus.size(),functionTree);
		return data;
	}
	@RequestMapping("loadAllMenu")
	@ResponseBody
	public DataGridView loadAllMenu(SysFuntionVo vo) {
		return this.sysFunctionService.loadAllMenu(vo);
	}
}
