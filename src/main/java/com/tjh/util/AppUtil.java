package com.tjh.util;


import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationEvent;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 获取上下文bean
 *
 * @author ...
 *
 * */
@Component
public class AppUtil implements ApplicationContextAware {

    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext context)
            throws BeansException {
        AppUtil.context = context;
    }

    /**
     * 获取spring容器上下文。
     *
     * @return ApplicationContext
     */
    public static ApplicationContext getApplicationContext() {
        return context;
    }

    public static ApplicationContext test() {
        return context;
    }

    /**
     * 根据beanId获取配置在系统中的对象实例。
     *
     * @param beanId
     * @return Object
     * @throws
     * @since 1.0.0
     */
    public static Object getBean(String beanId) {
        try {
            return context.getBean(beanId);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * 获取Spring容器的Bean
     *
     * @param beanClass
     * @return T
     * @throws
     * @since 1.0.0
     */
    public static <T> T getBean(Class<T> beanClass) {
        try {
            return context.getBean(beanClass);
        } catch (Exception ex) {
           ex.getMessage();
        }
        return null;
    }

    /**
     * 根据指定的接口或基类获取实现类列表。
     * @param clazz clazz
     * @return List
     * @throws ClassNotFoundException ClassNotFoundException
     */
    public static List<Class> getImplClass(Class clazz) throws ClassNotFoundException {
        List<Class> list = new ArrayList<Class>();
        Map map = context.getBeansOfType(clazz);
        for (Object obj : map.values()) {
            String name = obj.getClass().getName();
            int pos = name.indexOf("$$");
            if (pos > 0) {
                name = name.substring(0, name.indexOf("$$"));
            }
            Class cls = Class.forName(name);
            list.add(cls);
        }
        return list;
    }


    /**
     * 获取接口的实现类实例。
     *
     * @param clazz clazz
     * @return Map
     */
    public static <T> Map<String, T> getImplInstance(Class<T> clazz) {
        return context.getBeansOfType(clazz);
    }

    public static <T> List<T> getImplInstanceArray(Class<T> clazz) {
        Map<String, T> map = context.getBeansOfType(clazz);
        return new ArrayList<>(map.values());
    }

    /**
     * 发布事件
     *
     * @param event void
     */
    public static void publishEvent(ApplicationEvent event) {
        if (context != null) {
            context.publishEvent(event);
        }
    }

    /**
     * 获取Classpath物理路径
     * @return String
     */
    public static String getClasspath() {
        String classPath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
        String rootPath = "";
        //windows下
        if ("\\".equals(File.separator)) {
            rootPath = classPath.substring(1);
            rootPath = rootPath.replace("/", "\\");
        }
        //linux下
        if ("/".equals(File.separator)) {
            rootPath = classPath.substring(1);
            rootPath = rootPath.replace("\\", "/");
        }
        return rootPath;
    }
}
