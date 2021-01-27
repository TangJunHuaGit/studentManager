package com.tjh.base;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.tjh.base.annotation.LogAopPointcut;
import com.tjh.dao.SysUserDao;
import com.tjh.dao.impl.SysUserDaoImpl;
import com.tjh.pojo.OperationLog;
import com.tjh.service.SysUserService;
import com.tjh.util.SessionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Aspect
@Component
public class LogAopAspect {
    private static final Logger LOGGER = LoggerFactory.getLogger(LogAopAspect.class);

    @Autowired
    private SysUserService sysUserService;

    /**
     * Controller层切点
     */
    @Pointcut("@annotation(com.tjh.base.annotation.LogAopPointcut)")
    public void aopPoint() {

    }


    /**
     * 切面 配置通知
     */
    @AfterReturning("aopPoint()")
    public void saveSysLog(JoinPoint joinPoint) {
        //保存日志
        OperationLog log = new OperationLog();

        //从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获取切入点所在的方法
        Method method = signature.getMethod();

        //获取操作
        LogAopPointcut logAopPointcut = method.getAnnotation(LogAopPointcut.class);
        //--------------------
        if (logAopPointcut != null) {
            //模块名称
            log.setLogModuleName(logAopPointcut.logModuleName());
            //功能
            log.setLogDesc(logAopPointcut.logDesc());
            //操作类型
            String index = logAopPointcut.logType().getIndex();
            String name = logAopPointcut.logType().getLogname();
            log.setLogType(name);
        }
        //--------------------
        //获取请求的方法名
        String methodName = method.getName();
        log.setLogMethodName(methodName);
        //--------------------
        //请求的参数
        Object[] args = joinPoint.getArgs();
        //将参数所在的数组转换成json
        Stream<?> stream = ArrayUtils.isEmpty(args) ? Stream.empty() : Arrays.stream(args);
        List<Object> logArgs = stream
                .filter(arg -> (!(arg instanceof HttpServletRequest) && !(arg instanceof HttpServletResponse)))
                .collect(Collectors.toList());
        String params = JSONObject.toJSONString(logArgs);
        log.setLogParams(params);
        //创建参数名称实例
        LocalVariableTableParameterNameDiscoverer discoverer = new LocalVariableTableParameterNameDiscoverer();
        String[] paramterNames = discoverer.getParameterNames(method);
        //传递给方法的参数数据
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        for (int i = 0; i < paramterNames.length; i++) {
            Object o = args[i];
            if(o instanceof String || o instanceof String[]) {
                paramsMap.put(paramterNames[i], o);
            }else {
                continue;
            }
        }
        String paramter = JSON.toJSONString(paramsMap);
        log.setLogParamter(paramter);
        //--------------------
        //获取用户ip地址
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
       //log.setLogIpAddress(IpAddress.getIpAddress(request));
        //--------------------
//        //获取用户名
        if(!methodName.equals("doLogin")){
            log.setUserId(SessionUtils.getCurrentSysUser().getUser().getUserId());
        }
        //调用service保存log实体类到数据库
        sysUserService.insertIntoLog(log);
    }
}
