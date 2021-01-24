package com.tjh.base;

import com.alibaba.fastjson.JSONObject;
import com.tjh.constant.Constant;
import com.tjh.pojo.SysFunction;
import com.tjh.pojo.SysUserInfo;
import com.tjh.util.SessionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 创建时间 2021/1/6 9:23
 * 描述  需要放行登录注册和忘记密码
 * 对于找不到对应的mapping映射，都会走这个servlet，跳转到对应的jsp（url访问的地址是存在的）
 * 然后会进行一个url的拦截（如果用户已经登录）
 */
public class BaseServlet extends DispatcherServlet {
    @Override
    protected void noHandlerFound(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String requestUri = request.getRequestURI();
        // 处理RequestURI
        String contextPath = request.getContextPath();
        int cxtIndex = requestUri.indexOf(contextPath);
        if (cxtIndex != -1) {
            requestUri = requestUri.substring(cxtIndex + contextPath.length());
        }
        String uri = requestUri.replace(".action", "");
        String jspPath = uri + ".jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/view" + jspPath);
        SysUserInfo currentSysUser = SessionUtils.getCurrentSysUser();
        int flag = 0;
        if (currentSysUser != null) {
            boolean release = UrlRelease.isRelease(request);
            if (!release) {
                //如何用户已经登录，判断他访问的地址是否在他的菜单权限范围里面
                List<SysFunction> functions = currentSysUser.getFunctions();
                for (SysFunction function : functions) {
                    String href = function.getFunctionHref();
                    //要和数据库的地址一样
                    if (StringUtils.isEmpty(href)) {
                        continue;
                    }
                    if (href.contains(requestUri)) {
                        // 访问的url在对应的用户中有该菜单权限 flag = 1
                        flag = 1;
                        break;
                    }
                }
                //将当前登陆用户的权限添加到ModelAndView的上下文参数中
                List<SysFunction> permissionList = SessionUtils.getCurrentSysUser().getFunctions().stream().filter(per -> per.getFunctionType().equals(Constant.PERMISSION)).collect(Collectors.toList());
                request.setAttribute("currentUserPermission", JSONObject.toJSONString(permissionList));
            }else{
                // 在放行的URL中配置了，无需判断权限，放行请求，渲染界面
                requestDispatcher.forward(request, response);
                return;
            }
        } else {
            // 用户没有登录 flag = 2，直接放行，在之后的过滤器中会拦截这个请求，跳转到登录界面
            // 可以考虑直接在这里跳转到登录界面，而不是过滤器中
            flag = 2;
        }
        if (flag > 0) {
            // 有权限，请求通过，渲染界面
            requestDispatcher.forward(request, response);
        } else {
            // 当flag=0时，证明他没有该菜单权限，直接跳到501界面
            request.getRequestDispatcher("/WEB-INF/view/error/501.jsp").forward(request, response);
        }
    }
}
