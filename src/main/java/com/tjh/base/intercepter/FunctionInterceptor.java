package com.tjh.base.intercepter;

import com.tjh.base.UrlRelease;
import com.tjh.base.annotation.Function;
import com.tjh.base.filter.ReleaseList;
import com.tjh.pojo.SysFunction;
import com.tjh.pojo.SysUserInfo;
import com.tjh.util.AppUtil;
import com.tjh.util.ReturnViewException;
import com.tjh.util.SessionUtils;
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
     * @param request request
     * @param response response
     * @param handler handler请求的对象
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
            // 反射获取请求的controller类的所有方法
            Method[] methods = handlerMethod.getBean().getClass().getDeclaredMethods();
            boolean flag = false;
            for (Method method : methods) {
                if(flag){
                    break;
                }
                if (method.isAnnotationPresent(Function.class)) {
                    for (SysFunction function : functions) {
                        //System.out.println(method.getAnnotation(Function.class).functionName());
                        if(method.getAnnotation(Function.class).functionName().equals(function.getFunctionCode())){
                            flag = true;
                            break;
                        }
                    }
                }else{
                    return true;
                }
            }
            if(!flag){
                throw new ReturnViewException("501");
            }
            /*for (Method method : methods) {
                //判断方法是否有@Function注解
                if (method.isAnnotationPresent(Function.class)) {
                    //拿到Function注解对象
                    Function appleAnnotation = method.getAnnotation(Function.class);
                    //循环判断权限，没有权限直接抛出501异常，会在异常捕获中捕获，跳转到没有权限界面
                    for (SysFunction function : functions) {
                        String functionCode = function.getFunctionCode();
                        if(StringUtils.isEmpty(functionCode)){
                            continue;
                        }
                        String name = appleAnnotation.functionName();
                        if (functionCode.equals(name)) {
                            return true;
                        } else {
                            throw new ReturnViewException("501");
                        }
                    }
                }
            }*/
        }
        return true;
    }

    /**
     * 前提：preHandle方法返回true才会执行这个方法
     * post和get请求都会执行这个方法
     * 在controller方法执行完成后，界面渲染之前执行
     * @param request request
     * @param response response
     * @param handler handler
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
     * @param request request
     * @param response response
     * @param handler handler
     * @param ex ex
     * @throws Exception Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion：渲染后");
    }
}
