package com.tjh.service.impl;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjh.mapper.DictionaryMapper;
import com.tjh.pojo.Dictionary;
import com.tjh.service.DictionaryService;
import com.tjh.util.DataGridView;
import com.tjh.util.PageBuilder;
import com.tjh.vo.DictionaryVo;
@Service
public class DictionaryServiceImpl implements DictionaryService{

	@Autowired
	private DictionaryMapper dictionaryMapper;

	@Override
	public boolean addDictionary(Dictionary dictionary) {
		// TODO Auto-generated method stub
		return dictionaryMapper.addDictionary(dictionary);
	}

	@Override
	public DataGridView loadAllDictionary(DictionaryVo dictionaryVo) {
		// TODO Auto-generated method stub
		int limit = PageBuilder.builderLimit(dictionaryVo.getPage(), dictionaryVo.getLimit());
	    int page = PageBuilder.builderPage(dictionaryVo.getPage(), dictionaryVo.getLimit());
	    dictionaryVo.setLimit(limit);
	    dictionaryVo.setPage(page);
		List<Dictionary> list= this.dictionaryMapper.loadAllDictionary(dictionaryVo);
		int total = this.dictionaryMapper.loadTotalDictionary(dictionaryVo);
		DataGridView view=new DataGridView((long)total,list);
		return view;
	}

	@Override
	public boolean updateDictionaryStateByReasonId(Integer reasonId) {
		// TODO Auto-generated method stub
		return this.dictionaryMapper.updateDictionaryStateByReasonId(reasonId);
	}

	@Override
	public boolean updateByDictionaryReasonId(Dictionary dictionary) {
		// TODO Auto-generated method stub
		return this.dictionaryMapper.updateByDictionaryReasonId(dictionary);
	}

	@Override
	public List<Map<String, Object>> loadParentDictionary() {
		// TODO Auto-generated method stub
		return dictionaryMapper.loadParentDictionary();
	}

	@Override
	public Dictionary loadOneDictionary(Integer reasonId) {
		// TODO Auto-generated method stub
		return dictionaryMapper.loadOneDictionary(reasonId);
	}

	@Override
	public int updateDictionaryStateByReasonIds(Integer[] reasonIds) {
		// TODO Auto-generated method stub
		return dictionaryMapper.updateDictionaryStateByReasonIds(reasonIds);
	}

	@Override
	public List<Map<String, Object>> loadChildByDictionaryParentId(Integer reasonId) {
		return dictionaryMapper.loadChildByDictionaryParentId(reasonId);
	}

	@Override
	public List<Map<String, Object>> loadChildDictionary() {
		return dictionaryMapper.loadChildDictionary();
	}

	@Override
	public List<Map<String, Object>> loadPie() {
			return dictionaryMapper.loadPie();
	}

}
