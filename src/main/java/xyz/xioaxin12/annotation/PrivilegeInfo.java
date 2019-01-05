package xyz.xioaxin12.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Inherited
public @interface PrivilegeInfo {

    String value(); //权限名称
}

