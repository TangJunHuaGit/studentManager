package com.tjh.util;




public class PageBuilder {
	public static int builderPage(Integer page, Integer limit) {
		return   limit * (page - 1);
	}
	public static int builderLimit(Integer page, Integer limit) {
		return page * limit;
	}
}
