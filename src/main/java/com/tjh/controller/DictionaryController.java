package com.tjh.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjh.base.annotation.Function;
import com.tjh.pojo.Dictionary;
import com.tjh.service.DictionaryService;
import com.tjh.util.DataGridView;
import com.tjh.vo.DictionaryVo;

@RequestMapping("dictionary")
@Controller
public class DictionaryController {
	@Autowired
	private DictionaryService dictionaryService;

	@RequestMapping("addDictionary")
	@ResponseBody
	public Map<String,String> addDictionary(Dictionary dictionary){
		boolean flag = dictionaryService.addDictionary(dictionary);
		Map<String, String> map = new HashMap<String, String>();
		if(flag) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}
	@RequestMapping("loadAllDictionary")
	@ResponseBody
	public DataGridView loadAllDictionary(DictionaryVo dictionaryVo){
		DataGridView loadAllDictionary = dictionaryService.loadAllDictionary(dictionaryVo);
		return loadAllDictionary;
	}

	@RequestMapping("updateDictionaryStateByReasonId")
	@ResponseBody
	public Map<String,String> updateDictionaryStateByReasonId(String reasonId){
		boolean flag = dictionaryService.updateDictionaryStateByReasonId(Integer.valueOf(reasonId));
		Map<String, String> map = new HashMap<String, String>();
		if(flag) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}

	@RequestMapping("updateByDictionaryReasonId")
	@ResponseBody
	public Map<String,String> updateByDictionaryReasonId(Dictionary dictionary){
		boolean flag = dictionaryService.updateByDictionaryReasonId(dictionary);
		Map<String, String> map = new HashMap<String, String>();
		if(flag) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}

	@RequestMapping("loadParentDictionary")
	@ResponseBody
	public List<Map<String, Object>> loadParentDictionary(){
		List<Map<String, Object>> parentDictionary = dictionaryService.loadParentDictionary();
		return parentDictionary;

	}

	@RequestMapping("loadOneDictionary")
	@ResponseBody
	public Dictionary loadOneDictionary(String reasonId){
		Dictionary dictionary = dictionaryService.loadOneDictionary(Integer.valueOf(reasonId));
		return dictionary;
	}

	@RequestMapping("updateDictionaryStateByReasonIds")
	@ResponseBody
	public  Map<String,String> updateDictionaryStateByReasonIds(DictionaryVo dictionaryVo){
		System.out.println(dictionaryVo.getIds());
		int result = dictionaryService.updateDictionaryStateByReasonIds(dictionaryVo.getIds());
		Map<String, String> map = new HashMap<String, String>();
		if(result>0) {
			map.put("msg", "成功");
			map.put("code", "100");
			return map;
		}else {
			map.put("msg", "失败");
			map.put("code", "101");
			return map;
		}
	}

	@RequestMapping("loadChildByDictionaryParentId")
	@ResponseBody
	public  List<Map<String, Object>> loadChildByDictionaryParentId(Integer reasonId){
		List<Map<String, Object>> maps = dictionaryService.loadChildByDictionaryParentId(reasonId);
		return  maps;
	}

	@RequestMapping("loadChildDictionary")
	@ResponseBody
	public  List<Map<String, Object>> loadChildDictionary(){
		List<Map<String, Object>> maps = dictionaryService.loadChildDictionary();
		return  maps;
	}

}
