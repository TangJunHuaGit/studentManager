package com.tjh.base.annotation;

import java.lang.annotation.*;

/**
 * @author ...
 * 权限注解
 */
@Documented
@Target({ElementType.METHOD})
@Inherited
@Retention(RetentionPolicy.RUNTIME )
public @interface Function {
    String functionName() default "";
}
