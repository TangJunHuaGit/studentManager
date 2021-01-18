package com.tjh.base;

import com.alibaba.fastjson.support.spring.FastJsonJsonView;
import com.tjh.util.ReturnViewException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author
 * 拦截运行异常出现的错误
 * 主要用来拦截运行时产生的错误
 * 没有权限或者其他情况造成访问不到界面，跳转到对应的错误界面
 */
public class WebExceptionHandler implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        //判断是否为ajax请求，默认不是
        boolean isAjaxRequest = false;
        //这段代码能够得知是否为ajax请求，也就是我们说的json请求
        if(!StringUtils.isBlank(request.getHeader("x-requested-with")) && "XMLHttpRequest".equals(request.getHeader("x-requested-with"))){
            isAjaxRequest = true;
        }
        if(isAjaxRequest) {
            ex.printStackTrace();
            String message = ex.getMessage();
            ModelAndView model = new ModelAndView();
            FastJsonJsonView view = new FastJsonJsonView();
            Map<String,Object> map = new HashMap<>();
            map.put("code", 500);
            map.put("message", message);
            view.setAttributesMap(map);
            model.setView(view);
            return model;
        }else {
            //如果不是ajax请求 那么异常后需要返回页面
            ReturnViewException returnViewException = null;
            //如果抛出的异常类型是我们预想的，会想前台返回我们指定在参数里的页面
            if(ex instanceof ReturnViewException) {
                returnViewException = (ReturnViewException) ex;
            }else {
                //系统默认跳转到error页面
                ex.printStackTrace();
                returnViewException = new ReturnViewException("error");
            }
            ModelAndView model = new ModelAndView();
            model.setViewName("error/"+returnViewException.getMessage());
            model.addObject("exception",ex.getMessage());
            return model;
        }
    }
}
