package com.tjh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSONArray;
import com.tjh.base.annotation.Function;
import com.tjh.constant.Constant;
import com.tjh.pojo.SysFunction;
import com.tjh.pojo.SysUserInfo;
import com.tjh.util.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.service.SysFunctionService;
import com.tjh.vo.SysFuntionVo;

@Controller
@RequestMapping("sysFunction")
public class SysFunctionController {

	@Autowired
	private SysFunctionService sysFunctionService;

	/**
	 * 加载首页菜单树
	 * @return DataGridView
	 */
	@RequestMapping("loadAllFunction")
	@ResponseBody
	public DataGridView loadAllFunction() {
		SysUserInfo currentSysUser = SessionUtils.getCurrentSysUser();
		List<SysFunction> functions = currentSysUser.getFunctions();
		List<SysFunction> menus = functions.stream().filter(item -> Constant.MENU.equals(item.getFunctionType())).collect(Collectors.toList());
		List<SysFuntionVo> loadAllFunction = new ArrayList<>();
		menus.forEach(item -> {
			SysFuntionVo vo = new SysFuntionVo();
			BeanUtils.copyProperties(item,vo);
			loadAllFunction.add(vo);
		});

		List<SysFuntionVo> functionTree = FunctionTreeBuilder.builder(loadAllFunction, 1);
		return new DataGridView((long) menus.size(),functionTree);
	}

	/**
	 * 加载菜单管理里面首页菜单列表
	 * @param vo vo
	 * @return DataGridView
	 */
	@Function(functionName = "loadAllMenu")
	@RequestMapping("loadAllMenu")
	@ResponseBody
	public DataGridView loadAllMenu(SysFuntionVo vo) {
		return this.sysFunctionService.loadAllMenu(vo);
	}

	/**
	 * 加所有的父节点
	 * @param vo vo
	 * @return DataGridView
	 */
	@RequestMapping("loadAllParentMenu")
	@ResponseBody
	public DataGridView loadAllParentMenu(SysFuntionVo vo) {
		return this.sysFunctionService.loadAllParentMenu(vo);
	}

	/**
	 * 添加菜单
	 * @param vo vo
	 * @return ResultMessage
	 */
	@Function(functionName = "addMenu")
	@RequestMapping("addMenu")
	@ResponseBody
	public ResultMessage addMenu(SysFuntionVo vo) {
		return this.sysFunctionService.addMenu(vo);
	}

	@Function(functionName = "queryOneMenu")
	@RequestMapping("queryOneMenu")
	@ResponseBody
	public ResultMessage queryOneMenu(Integer functionId) {
		SysFunction sysFunction = this.sysFunctionService.queryOneMenu(functionId);
		return ResultMessage.success(sysFunction,"查询成功");
	}
	@Function(functionName = "updateMenuByMenuId")
	@RequestMapping("updateMenuByMenuId")
	@ResponseBody
	public ResultMessage updateMenuByMenuId(SysFuntionVo vo) {
		int i = this.sysFunctionService.updateMenuByMenuId(vo);
		return ResultMessage.success(i ,"修改成功");
	}

	/**
	 * 加在资源分配的树，所有菜单的数据结构
	 * @param roleId roleId
	 * @return DtreeBuild
	 */
	@Function(functionName = "loadTreeFunction")
	@RequestMapping("loadTreeFunction")
	@ResponseBody
	public DtreeBuild loadTreeFunction(Integer roleId) {
		return this.sysFunctionService.loadTreeFunction(roleId);
	}

	/**
	 * 在编辑菜单或者权限时调用
	 * 排除当前选中的菜单或者权限
	 * @param menuId menuId
	 * @return DtreeBuild
	 */
	@RequestMapping("loadTreeFunctionByEdit")
	@ResponseBody
	public DtreeBuild loadTreeFunctionByEdit(Integer menuId) {
		return this.sysFunctionService.loadTreeFunctionByEdit(menuId);
	}


	@RequestMapping("deleteMenuById")
	@ResponseBody
	public ResultMessage deleteMenuById(Integer functionId) {
		int i =  this.sysFunctionService.deleteMenuById(functionId);
		return i > 0 ? ResultMessage.successDesc("删除成功") : ResultMessage.erreo("删除失败");
	}
	@RequestMapping("deleteMenuByIds")
	@ResponseBody
	public ResultMessage deleteMenuByIds(@RequestParam("ids") String ids) {
		JSONArray functionIds = JSONArray.parseArray(ids);
		int count = 0;
		for(Object id : functionIds){
			this.sysFunctionService.deleteMenuById(Integer.parseInt(id.toString()));
			count++;
		}
		if(count == functionIds.size()){
            return ResultMessage.successDesc("删除成功");
        }else{
            String data = "成功删除"+count+"个，失败"+(functionIds.size() - count)+"个";
            return ResultMessage.success(data,data);
        }
	}
}
