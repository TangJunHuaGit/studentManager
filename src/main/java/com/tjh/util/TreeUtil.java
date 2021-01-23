package com.tjh.util;

import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author 熊志伟
 * 创建时间 2021/1/15 13:04
 * 描述 把具有树形结构的list集合转成树结构
 */
public class TreeUtil<T> {

    protected boolean isSort;

    /**
     * 把具有树形结构的list转换成树形结构的list，需要排序
     * 如
     * [{"id":"1","pid":0},{"id":"2","pid":"1"},{"id":"3","pid":"1"}]
     * 转成
     * [{
     *     "id":"1",
     *     pid:"2",
     *     subData:[{
     *         {"id":"2","pid":"1","subData":[]},
     *         {"id":"3","pid":"1","subData":[]}
     *     }]
     * }]
     *
     * @param list 要转换list
     * @param isContainRoot 是否包含跟节点
     * @param parentId 父节点id
     * @param idAlias id别名
     * @param parentIdAlias 父id别名
     * @param sortAlias 排序别名
     * @param subAlias 子对象别名
     * @return list
     */
    public List<Map<String, Object>> listToTree(List<T> list,boolean isContainRoot, String parentId, String idAlias, String parentIdAlias, String sortAlias, String subAlias){
        isSort = true;
        List<Map<String, Object>> mapList = conversionJson(list,idAlias, parentIdAlias, sortAlias);
        List<Map<String, Object>> retList = listToTree(mapList, parentId, idAlias, parentIdAlias, sortAlias, subAlias);
        if(isContainRoot){
            return containsParentNode(mapList, retList,idAlias,parentId,subAlias);
        }else{
            return retList;
        }
    }

    /**
     * 把具有树形结构的list转换成树形结构的list，不需要排序
     * 如
     * [{"id":"1","pid":0},{"id":"2","pid":"1"},{"id":"3","pid":"1"}]
     * 转成
     * [{
     *     "id":"1",
     *     "pid":"2",
     *     subData:[{
     *         {"id":"2","pid":"1","subData":[]},
     *         {"id":"3","pid":"1","subData":[]}
     *     }]
     * }]
     *
     * @param list 要转换list
     * @param isContainRoot 是否包含跟节点
     * @param parentId 父节点id
     * @param idAlias id别名
     * @param parentIdAlias 父id别名
     * @param subAlias 子对象别名
     * @return list
     */
    public List<Map<String, Object>> listToTree(List<T> list,boolean isContainRoot, String parentId, String idAlias, String parentIdAlias, String subAlias){
        isSort = false;
        List<Map<String, Object>> mapList = conversionJson(list,idAlias, parentIdAlias, "");
        List<Map<String, Object>> retList = listToTree(mapList, parentId, idAlias, parentIdAlias, "", subAlias);
        if(isContainRoot){
            return containsParentNode(mapList, retList,idAlias,parentId,subAlias);
        }else{
            return retList;
        }
    }

    protected List<Map<String, Object>> listToTree(List<Map<String, Object>> mapList, String rootId, String idAlias, String parentAlias, String sortAlias, String subAlias) {
        return mapList.stream().filter(item -> rootId.equals(item.get(parentAlias).toString()))
                .peek(item -> item.put(subAlias, setSubList(mapList, item, idAlias, parentAlias, sortAlias, subAlias)))
                .collect(Collectors.toList());
    }

    protected List<Map<String, Object>> conversionJson(List<T> t,String idAlias, String parentAlias, String sortAlias) {
        List<Map<String, Object>> retList = new ArrayList<>();
        t.forEach(item -> {
            String jsonString = JSONObject.toJSONString(item);
            JSONObject jsonObject = JSONObject.parseObject(jsonString);
            retList.add(jsonObject);
        });

        validationAlias(retList,idAlias, parentAlias, sortAlias);
        return retList;
    }

    protected void validationAlias(List<Map<String, Object>> list, String idAlias,String parentAlias, String sortAlias) {
        int idFlag = 0;
        int parentFlag = 0;
        int sortFlag = 0;
        for (Map<String, Object> validationObjectMap : list) {
            for (Map.Entry<String, Object> entry : validationObjectMap.entrySet()) {
                String key = entry.getKey();
                if (parentAlias.equals(key)) {
                    parentFlag++;
                }
                if (sortAlias.equals(key)) {
                    sortFlag++;
                }
                if (idAlias.equals(key)) {
                    idFlag++;
                }
            }
        }
        if (idFlag == 0) {
            throw new NullPointerException("不存在的ID列名：" + idAlias);
        }
        if (parentFlag == 0) {
            throw new NullPointerException("不存在的父节点列名：" + parentAlias);
        }
        if (sortFlag == 0) {
            if(isSort){
                throw new NullPointerException("不存在的排序列名：" + sortAlias);
            }
        }
    }

    protected List<Map<String, Object>> setSubList(List<Map<String, Object>> all, Map<String, Object> root, String idAlias, String parentAlias, String sortAlias, String subAlias) {
        if(isSort){
            Comparator<Map<String, Object>> taskComparator = (item1, item2) -> {
                String sortVal1 = item1.get(sortAlias).toString();
                String sortVal2 = item2.get(sortAlias).toString();
                int intVal1 = Integer.parseInt(sortVal1);
                int intVal2 = Integer.parseInt(sortVal2);
                return intVal1 > intVal2 ? 0 : -1;
            };
            return all.stream().filter(rootItem -> rootItem.get(parentAlias).equals(root.get(idAlias)))
                    .peek(subItem -> subItem.put(subAlias, setSubList(all, subItem, idAlias, parentAlias, sortAlias, subAlias)))
                    .sorted(taskComparator)
                    .collect(Collectors.toList());
        }else{
            return all.stream().filter(rootItem -> rootItem.get(parentAlias).equals(root.get(idAlias)))
                    .peek(subItem -> subItem.put(subAlias, setSubList(all, subItem, idAlias, parentAlias, sortAlias, subAlias)))
                    .collect(Collectors.toList());
        }

    }

    protected List<Map<String, Object>> containsParentNode(List<Map<String, Object>> allList,List<Map<String, Object>> resList,String idAlisa,String rootId,String subAlias){
        List<Map<String, Object>> collect = allList.stream().filter(item -> item.get(idAlisa).toString().equals(rootId)).collect(Collectors.toList());
        if(collect.size() == 0){
            return resList;
        }
        return allList.stream().filter(item -> item.get(idAlisa).toString().equals(rootId)).peek(item -> item.put(subAlias, resList)).collect(Collectors.toList());
    }
}
