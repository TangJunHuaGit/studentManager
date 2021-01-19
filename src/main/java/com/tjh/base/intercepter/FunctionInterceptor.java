package com.tjh.base.intercepter;

import com.tjh.base.UrlRelease;
import com.tjh.base.annotation.Function;
import com.tjh.pojo.SysFunction;
import com.tjh.pojo.SysUserInfo;
import com.tjh.util.ReturnViewException;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.List;

/**
 * @author 创建时间 2021/1/11 10:50
 * 处理从过滤器中出来URL
 * 对于没有放行的URL，通过请求的handler对象，反射出请求的哪个controller的哪个mapping(方法)
 * 在判断请求的方法上面是否有@Function注解，并且对里面值进行判断（权限的判断）
 */
public class FunctionInterceptor extends HandlerInterceptorAdapter {
    /**
     * 进入Controller方法直前的处理
     *
     * @param request  request
     * @param response response
     * @param handler  handler请求的对象
     * @return boolean
     * @throws Exception ReturnViewException
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean release = UrlRelease.isRelease(request);
        if (!release) {
            // url没有放行
            // 这里的user对象一定是有的
            SysUserInfo currentSysUser = (SysUserInfo) request.getSession().getAttribute("user");
            // 拿到该用户的权限集合
            List<SysFunction> functions = currentSysUser.getFunctions();
            // 转成HandlerMethod对象
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            // 获取方法对象
            Method method = handlerMethod.getMethod();
            if(method.isAnnotationPresent(Function.class)){
                // 获取@Function注解对象
                Function annotation = method.getAnnotation(Function.class);
                boolean isEmptyFunction = false;
                for (SysFunction function : functions) {
                    String functionCode = function.getFunctionCode();
                    if(StringUtils.isEmpty(functionCode)){
                        continue;
                    }
                    String name = annotation.functionName();
                    if (functionCode.equals(name)) {
                        return true;
                    } else {
                        isEmptyFunction = true;
                    }
                }
                if(isEmptyFunction){
                    throw new ReturnViewException("501");
                }
            }
        }
        //url放行 直接返回true
        return true;
    }

    /**
     * 前提：preHandle方法返回true才会执行这个方法
     * post和get请求都会执行这个方法
     * 在controller方法执行完成后，界面渲染之前执行
     *
     * @param request      request
     * @param response     response
     * @param handler      handler
     * @param modelAndView modelAndView
     * @throws Exception Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle：方法执行后");
//        System.out.println(SessionUtils.getCurrentSysUser().getUser().getUserName());
//        this.preHandle(request, response, handler);
    }

    /**
     * 前提：preHandle方法返回true才会执行这个方法
     * post和get请求都会执行这个方法
     * 界面渲染之后执行
     *
     * @param request  request
     * @param response response
     * @param handler  handler
     * @param ex       ex
     * @throws Exception Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion：渲染后");
    }
}
