package com.tjh.service.impl;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjh.mapper.ClassMapper;
import com.tjh.pojo.Class;
import com.tjh.service.ClassService;
import com.tjh.util.DataGridView;
import com.tjh.util.PageBuilder;
import com.tjh.vo.ClassVo;
import org.springframework.util.ObjectUtils;

@Service
public class ClassServiceImpl implements ClassService{
	
	@Autowired
	private ClassMapper classMapper;
	@Override
	public List<Map<String, Object>> loadAllClassComboBox() {
		List<Map<String, Object>> AllClass = this.classMapper.loadAllClassComboBox();
		return AllClass;
	}
	@Override
	public boolean addClass(Class classes) {
		// TODO Auto-generated method stub
		return this.classMapper.addClass(classes);
	}
	@Override
	public DataGridView loadAllClass(ClassVo classVo) {
		// TODO Auto-generated method stub
		int page = PageBuilder.builderPage(classVo.getPage(), classVo.getLimit());
		int limit = PageBuilder.builderLimit(classVo.getPage(), classVo.getLimit());
		classVo.setPage(page);
		classVo.setLimit(limit);
		List<Class> allClass = this.classMapper.loadAllClass(classVo);
		int total = this.classMapper.loadTotalClass(classVo);
		return new DataGridView((long)total,allClass);
	}
	@Override
	public int loadTotalClass(ClassVo classVo) {
		// TODO Auto-generated method stub
		return this.classMapper.loadTotalClass(classVo);
	}
	@Override
	public boolean updateClassByClassId(Class classes) {
		// TODO Auto-generated method stub
		return this.classMapper.updateClassByClassId(classes);
	}
	@Override
	public boolean updateClassStateByClassId(Integer classId) {
		// TODO Auto-generated method stub
		return this.classMapper.updateClassStateByClassId(classId);
	}
	@Override
	public boolean updateClassStateByClassIds(Integer[] ids) {
		// TODO Auto-generated method stub
		return this.classMapper.updateClassStateByClassIds(ids);
	}
	@Override
	public Class loadOneClassByClassId(Integer classId) {
		// TODO Auto-generated method stub
		return this.classMapper.loadOneClassByClassId(classId);
	}

	@Override
	public List<Map<String, Object>> allotClassComboBox(Integer classId) {
		Class aClass = loadOneClassByClassId(classId);
		List<Map<String, Object>> maps = this.classMapper.allotClassComboBox();
		String str = JSONObject.toJSONString(aClass);
		JSONObject jsonObject = JSONObject.parseObject(str);
		if(!ObjectUtils.isEmpty(aClass)){
			maps.add(jsonObject);
		}

		return maps;
	}
}
