package com.tjh.base.filter;

import com.tjh.base.UrlRelease;
import com.tjh.pojo.SysUserInfo;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author 创建时间 2021/1/7 14:28
 * 描述
 * 当用户请求的URL时，先进入该过滤器
 */
public class FunctionFilter extends GenericFilterBean {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        boolean release = UrlRelease.isRelease(request);
        if (!release) {
            // url没有放行
            SysUserInfo currentSysUser;
            // 这里进行容错，捕获异常情况下session中拿不到user对象
            try {
                currentSysUser = (SysUserInfo)request.getSession().getAttribute("user");
            } catch (NullPointerException e) {
                //判断有没有登录，没有登录直接跳转到登陆界面
                response.sendRedirect(request.getContextPath());
                return;
            }
            //判断有没有登录，没有登录直接跳转到登陆界面
            if (currentSysUser == null) {
                System.out.println(request.getContextPath());
                System.out.println(request.getServletContext().getContextPath());
                response.sendRedirect(request.getContextPath());
            } else {
                // 已经登录了，进入springMVC的拦截器
                System.out.println("请求路径：" +  request.getRequestURI());
                filterChain.doFilter(request, response);
//                response.sendRedirect(request.getContextPath()+"/sys/index.action");
            }
            return;
        }
        // url放行，进入springMVC的拦截器，拦截器中也有这样的处理，对于放行的url是不会进行拦截的
        filterChain.doFilter(request, response);
    }
}
