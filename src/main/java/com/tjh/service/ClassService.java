package com.tjh.service;




import java.util.List;

import java.util.Map;
import com.tjh.util.DataGridView;
import com.tjh.vo.ClassVo;
import com.tjh.pojo.Class;


public interface ClassService {
	public List<Map<String, Object>> loadAllClassComboBox();
	
	public boolean addClass(Class classes);
	
	public DataGridView loadAllClass(ClassVo classVo);
	
	public int loadTotalClass(ClassVo classVo);
	
	public boolean updateClassByClassId(Class classes);
	
	public boolean updateClassStateByClassId(Integer classId);
	
	public boolean updateClassStateByClassIds(Integer[] ids);
	
	public Class loadOneClassByClassId(Integer classId);

    List<Map<String, Object>> allotClassComboBox(Integer classId);
}