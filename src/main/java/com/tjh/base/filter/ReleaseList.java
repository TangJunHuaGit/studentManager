package com.tjh.base.filter;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ...
 * 创建时间 2021/1/12 9:11
 * 描述 放行url的集合对象
 */
public class ReleaseList {
    private List<String> releaseUrl = new ArrayList<>();

    public ReleaseList() {

    }

    public List<String> getReleaseUrl() {
        return releaseUrl;
    }

    public void setReleaseUrl(List<String> releaseUrl) {
        this.releaseUrl = releaseUrl;
    }
}
