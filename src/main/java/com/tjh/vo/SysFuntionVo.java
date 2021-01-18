package com.tjh.vo;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.tjh.pojo.SysFunction;

public class SysFuntionVo extends SysFunction{
	@JsonProperty("list")
	private List<SysFunction> children = new ArrayList<SysFunction>();

	//批量删除使用
	private Integer[] ids;

	private Integer page;
	private Integer limit;

	public List<SysFunction> getChildren() {
		return children;
	}

	public void setChildren(List<SysFunction> children) {
		this.children = children;
	}

	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public Integer[] getIds() {
		return ids;
	}
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	

}
