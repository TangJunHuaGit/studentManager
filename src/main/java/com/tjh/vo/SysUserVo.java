package com.tjh.vo;

import com.tjh.pojo.SysUser;

public class SysUserVo extends SysUser{
		//批量删除使用
		private Integer[] ids;
		
		private Integer page;
		private Integer limit;
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
