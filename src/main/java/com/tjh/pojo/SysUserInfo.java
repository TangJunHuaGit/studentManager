package com.tjh.pojo;

import com.github.pagehelper.util.StringUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @author
 * 创建时间 2021/1/6 13:50
 * 描述
 */
public class SysUserInfo{
    private SysUser user;
    private List<SysRole> roles = new ArrayList<>();
    private List<SysFunction> functions = new ArrayList<>();

    public List<SysRole> getRoles() {
        return roles;
    }

    public void setRoles(List<SysRole> roles) {
        this.roles = roles;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public List<SysFunction> getFunctions() {
        return functions;
    }

    public void setFunctions(List<SysFunction> functions) {
        this.functions = functions;
    }

    @Override
    public String toString() {
        return "SysUserInfo{" +
                "roles=" + roles +
                ", functions=" + functions +
                '}';
    }
}
