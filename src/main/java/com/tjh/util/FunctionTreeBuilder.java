package com.tjh.util;

import java.util.ArrayList;
import java.util.List;

import com.tjh.pojo.SysFunction;
import com.tjh.vo.SysFuntionVo;


public class FunctionTreeBuilder {

	/**
	 * 构造在层级关系的json
	 * @param treeNodes
	 * @param topId
	 * @return
	 */
	public static List<SysFuntionVo> builder(List<SysFuntionVo> SysFuntionVo, Integer topId) {
		List<SysFuntionVo> list = new ArrayList<>();
		for (SysFuntionVo n1 : SysFuntionVo) {
			if(n1.getFunctionParentId()==topId){//说明是根节点
				list.add(n1);
			}
			//再次循环判断treeNodes里面的哪些节点的pid和n1和id一样
			for (SysFuntionVo n2 : SysFuntionVo) {
				if(n2.getFunctionParentId()==n1.getFunctionId()){
					n1.getChildren().add(n2);
				}
			}
		}
		return list;
	}

}
