package com.tjh.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tjh.pojo.Dictionary;
import com.tjh.util.DataGridView;
import com.tjh.vo.DictionaryVo;

public interface DictionaryService {

	public boolean addDictionary(Dictionary dictionary);

	public DataGridView loadAllDictionary(DictionaryVo dictionaryVo);

	public boolean updateDictionaryStateByReasonId(Integer reasonId);

	public boolean updateByDictionaryReasonId(Dictionary dictionary);

	public List<Map<String, Object>> loadParentDictionary();

	public Dictionary loadOneDictionary(Integer reasonId);

	public int updateDictionaryStateByReasonIds(Integer[] reasonIds);

	//根居上級字典獲取字典
	public List<Map<String, Object>> loadChildByDictionaryParentId(Integer reasonId);

	//加载所有子字典
	public List<Map<String, Object>> loadChildDictionary();

}
