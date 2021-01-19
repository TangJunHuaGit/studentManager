package com.tjh.mapper;

import com.tjh.pojo.Dictionary;
import com.tjh.vo.DictionaryVo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface DictionaryMapper {

	//添加字典
	public boolean addDictionary(Dictionary dictionary);

	//分页查询
	public List<Dictionary> loadAllDictionary(@Param("dictionaryVo")DictionaryVo dictionaryVo);

	//分页统计数量
	public int loadTotalDictionary(@Param("dictionaryVo")DictionaryVo dictionaryVo);

	//通过id获取字典
	public Dictionary loadOneDictionary(Integer reasonId);

	//通过id删除单个字典（修改数据状态）
	public boolean updateDictionaryStateByReasonId(Integer reasonId);

	//通过id更新字典
	public boolean updateByDictionaryReasonId(Dictionary record);

	//获取所有上级字典
	public List<Map<String, Object>> loadParentDictionary();

	//通过ids删除多个字典（修改数据状态）
	public int updateDictionaryStateByReasonIds(@Param("reasonIds")Integer[] reasonIds);

	//获取所有上级字典
	public List<Map<String, Object>> loadChildByDictionaryParentId(Integer reasonId);
}
