package com.tjh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.service.SysDeptService;
import com.tjh.util.DataGridView;
import com.tjh.util.RedisUtil;
import com.tjh.vo.SysDeptVo;



@Controller
@RequestMapping("Sysdept")
public class SysDeptController {
	@Autowired 
	private SysDeptService sysDeptService;
	
	
	@RequestMapping("loadAllDept")
	@ResponseBody
	public DataGridView loadAllDept(SysDeptVo sysDeptVo) {
		DataGridView loadAllDept = this.sysDeptService.loadAllDept(sysDeptVo);
		return loadAllDept;
	}
}
