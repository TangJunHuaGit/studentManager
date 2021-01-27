package com.tjh.dao;

import com.tjh.pojo.OperationLog;
import com.tjh.pojo.SysFunction;
import com.tjh.pojo.SysUser;
import com.tjh.pojo.SysUserInfo;

import java.util.List;

/**
 * @author
 * 创建时间 2021/1/6 13:47
 * 描述 使用JDBC查询用户角色和功能菜单信息
 */
public interface SysUserDao {
    /**
     * 获取用户角色功能信息
     * @param userId userId
     * @return SysUserInfo
     */
    SysUserInfo getUserInfo(String userId);

    List<SysFunction> getUserFunction(Integer userId);

    List<SysFunction> getRoleFunction(Integer roleId);

    List<SysUser> getUsersByRoleId(Integer roleId);
    //插入日志
    boolean insertIntoLog(OperationLog log);
}
