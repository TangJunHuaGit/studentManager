package com.tjh.mapper;

import com.tjh.pojo.Class;
import com.tjh.vo.ClassVo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ClassMapper {
	//加载班级下拉树
	public List<Map<String, Object>> loadAllClassComboBox();
	
	//添加班级
	public boolean addClass(Class classes);
	
	//加载所有班级分页
	public List<Class> loadAllClass(ClassVo classVo);
	
	//加载分页查询总数
	public int loadTotalClass(ClassVo classVo);
	
	//加载单个班级
	public Class loadOneClassByClassId(Integer classId);
	
	//更新班级
	public boolean updateClassByClassId(Class classes);
	
	//更新单个班级状态
	public boolean updateClassStateByClassId(Integer classId);
	
	//批量更新班级状态
	public boolean updateClassStateByClassIds(@Param("ids")Integer[] ids);

	List<Map<String, Object>> allotClassComboBox();
}