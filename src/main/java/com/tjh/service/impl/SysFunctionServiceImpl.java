package com.tjh.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tjh.constant.Constant;
import com.tjh.dao.SysUserDao;
import com.tjh.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjh.mapper.SysFunctionMapper;
import com.tjh.pojo.SysFunction;
import com.tjh.service.SysFunctionService;
import com.tjh.vo.SysFuntionVo;

@Service
public class SysFunctionServiceImpl implements SysFunctionService {

	@Autowired
	private SysFunctionMapper sysFunctionMapper;

	@Autowired
	private SysUserDao userDao;

	@Override
	public List<SysFuntionVo> loadAllFunction() {
		SysFuntionVo vo = new SysFuntionVo();
		vo.setPage(0);
		vo.setLimit(99999);
		return this.sysFunctionMapper.loadAllMenu(vo);
	}

	@Override
	public DataGridView loadAllMenu(SysFuntionVo vo) {
		PageHelper.startPage(vo.getPage(), vo.getLimit());
		List<SysFuntionVo> teachers = sysFunctionMapper.loadAllMenu(vo);
		PageInfo<SysFuntionVo> pageInfo = new PageInfo<>(teachers);
		List<SysFuntionVo> list = pageInfo.getList().stream().peek(item -> {
			switch (item.getFunctionType()) {
				case Constant.MENU:
					item.setFunctionType("菜单");
					break;
				case Constant.PERMISSION:
					item.setFunctionType("权限");
					break;
				case Constant.JUMP:
					item.setFunctionType("跳转");
					break;
				default:
			}
		}).collect(Collectors.toList());
		return new DataGridView(pageInfo.getTotal(),list);
	}

	@Override
	public DataGridView loadAllParentMenu(SysFuntionVo vo) {
		List<?> collect = this.loadAllMenu(vo).getData().stream().filter(menu -> {
			SysFunction f = (SysFunction) menu;
			return f.getFunctionIsParent() == 1;
		}).collect(Collectors.toList());
		DataGridView view = new DataGridView();
		view.setData(collect);
		return view;
	}

	@Override
	public SysFunction queryOneMenu(Integer functionId) {
		return this.sysFunctionMapper.queryOneMenu(functionId);
	}

	@Override
	public ResultMessage addMenu(SysFuntionVo vo) {
		Integer integer = this.sysFunctionMapper.addMenu(vo);
		return integer > 0 ? ResultMessage.success(200, "插入成功") : ResultMessage.erreo(500, integer, "插入失败");
	}

	@Override
	public int updateMenuByMenuId(SysFuntionVo vo) {
		return this.sysFunctionMapper.updateMenuByMenuId(vo);
	}

	@Override
	public DtreeBuild loadTreeFunction(Integer roleId) {
		long begin = System.currentTimeMillis();
		List<SysFunction> sysFunctionVos = this.sysFunctionMapper.queryAll();
		return getDtreeBuild(roleId, begin, sysFunctionVos);
	}

	@Override
	public int deleteMenuById(Integer functionId) {
		return this.sysFunctionMapper.deleteMenuById(functionId);
	}

	@Override
	public DtreeBuild loadTreeFunctionByEdit(Integer functionId) {
		long begin = System.currentTimeMillis();
		List<SysFunction> sysFunctionVos = this.sysFunctionMapper.queryAll().stream().filter(item ->!item.getFunctionId().equals(functionId)).collect(Collectors.toList());
		return getDtreeBuild(functionId, begin, sysFunctionVos);
	}

	protected DtreeBuild getDtreeBuild(Integer functionId, long begin, List<SysFunction> sysFuntionVos) {
		List<JSONObject> disposeMaps = specialDispose(sysFuntionVos, functionId);
		TreeUtil<JSONObject> treeUtil = new TreeUtil<>();
		List<Map<String, Object>> maps = treeUtil.listToTree(disposeMaps, true, "1", "functionId", "functionParentId", "functionOrderNum", "children");
		DtreeBuild dtreeBuild = new DtreeBuild();
		dtreeBuild.setData(maps);
		Map<String, Object> status = new HashMap<>(1);
		status.put("code", 200);
		status.put("message", "操作成功");
		dtreeBuild.setStatus(status);
		long end = System.currentTimeMillis();
		System.out.println("加载树结构时间：" + (end - begin) + "ms");
		return dtreeBuild;
	}

	protected List<JSONObject> specialDispose(List<SysFunction> list, Integer roleId) {
		//已有的权限
		List<SysFunction> userFunction = this.userDao.getRoleFunction(roleId);
		//所有当前用户拥有的functionID
		List<Integer> currFunctionIds = new ArrayList<>();
		userFunction.forEach(item -> currFunctionIds.add(item.getFunctionId()));
		// 先给所有的加上checked
		// 将所有的菜单和权限转成JSON对象，然后在循环加上checkArr对象
		String jsonString = JSONArray.toJSONString(list);
		JSONArray allJsonList = (JSONArray) JSONArray.parse(jsonString);
		//转换后的全部集合
		List<JSONObject> allJsonMenuObj = new ArrayList<>();
		for (Object allMenu : allJsonList) {
			Map<String, String> check = new HashMap<>();
			check.put("type", "0");
			check.put("checked", "0");
			//转成JSONObject
			String allMapStr = JSONObject.toJSONString(allMenu);
			JSONObject allMenuObj = JSONObject.parseObject(allMapStr);
			allMenuObj.put("checkArr", check);
			allJsonMenuObj.add(allMenuObj);
		}

		// 把已拥有的和所有的找出来，设置checked item.put("checked", "1")
		List<JSONObject> equalsList = new ArrayList<>();
		for (Integer currFunctionId : currFunctionIds) {
			List<JSONObject> eqObj = allJsonMenuObj.stream().filter(menu -> {
				Integer functionId = Integer.parseInt(menu.get("functionId").toString());
				return functionId.equals(currFunctionId);
			}).peek(item -> {
				Map<String, String> check = new HashMap<>();
				check.put("type", "0");
				check.put("checked", "1");
				item.put("checkArr", check);
			}).collect(Collectors.toList());
			equalsList.addAll(eqObj);
		}
		//删掉全部中和equalsList中相同的在把equalsList加上
		equalsList.forEach(eqMenu -> allJsonMenuObj.removeIf(allMenu -> allMenu.get("functionId").toString().equals(eqMenu.get("functionId").toString())));
		allJsonMenuObj.addAll(equalsList);
		return allJsonMenuObj;
	}
}
