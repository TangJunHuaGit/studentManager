package com.tjh.base;

import com.tjh.base.filter.ReleaseList;
import com.tjh.util.AppUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class UrlRelease {
    public static boolean isRelease(HttpServletRequest request){
        //拿到需要放行的URL的对象，在applicationContext.xml中进行配置
        ReleaseList bean = AppUtil.getBean(ReleaseList.class);
        String url = request.getRequestURI();
        assert bean != null;
        List<String> releaseUrl = bean.getReleaseUrl();
        boolean isRelease = false;
        //判断该url是否需要放行
        for (String item : releaseUrl) {
            if (url.contains(item)) {
                isRelease = true;
                break;
            }
        }
        return isRelease;
    }
}
