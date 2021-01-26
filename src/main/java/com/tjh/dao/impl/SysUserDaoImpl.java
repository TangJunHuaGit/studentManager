package com.tjh.dao.impl;

import com.tjh.constant.Constant;
import com.tjh.dao.SysUserDao;
import com.tjh.pojo.SysFunction;
import com.tjh.pojo.SysRole;
import com.tjh.pojo.SysUser;
import com.tjh.pojo.SysUserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author
 * 创建时间 2021/1/6 13:52
 * 描述
 */
@Repository
public class SysUserDaoImpl implements SysUserDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Override
    public SysUserInfo getUserInfo(String userId) {
        List<SysRole> userRole = getRoleByUserId(Integer.valueOf(userId));
        List<SysFunction> roleFunction;
        SysUserInfo userInfo = new SysUserInfo();
        userInfo.setRoles(userRole);
        boolean admin = isAdmin(userRole);
        roleFunction =  getFunctionByUserId(Integer.valueOf(userId),admin);
        userInfo.setFunctions(roleFunction);
        return userInfo;
    }

    @Override
    public List<SysFunction> getUserFunction(Integer userId) {
        boolean admin = isAdmin(getRoleByUserId(userId));
        return getFunctionByUserId(userId, admin);
    }

    @Override
    public List<SysFunction> getRoleFunction(Integer roleId) {
        return getFunctionByRoleId(roleId);
    }

    @Override
    public List<SysUser> getUsersByRoleId(Integer roleId) {
        String sql = "select su.*,sr.* from sys_user su left join sys_role_user sru on su.userId = sru.userId " +
                "left join sys_role sr on sru.roleId = sr.roleId where sr.roleId != ?  and su.userId != '"+ Constant.ADMIN_NAME_ID+"'";
        RowMapper<SysUser> roleRowMapper = (rs,num)->{
            SysUser user = new SysUser();
            user.setState(rs.getInt("state"));
            user.setUserId(rs.getInt("userId"));
            user.setUserMobilePhone(rs.getString("userMobilePhone"));
            user.setUserSex(rs.getInt("userSex"));
            user.setUserName(rs.getString("userName"));
            user.setRemark(rs.getString("remark"));
            return user;
        };
        return jdbcTemplate.query(sql, roleRowMapper,roleId);
    }

    protected boolean isAdmin(List<SysRole> userRole){
        boolean isAdmin = false;
        for (SysRole role : userRole) {
            String roleName = role.getRoleName();
            if (Constant.ADMIN_NAME.equals(roleName)) {
                isAdmin = true;
                break;
            }
        }
        return isAdmin;
    }

    private List<SysRole> getRoleByUserId(Integer userId){
    String sql =
        "select sr.* from sys_user su "
            + "left join sys_role_user sur on su.userId = sur.userid "
            + "left join sys_role sr on sr.roleId = sur.roleid "
            + "where su.userId = " + userId;
        System.out.println(sql);
        RowMapper<SysRole> roleRowMapper = (rs,num)->{
            SysRole role = new SysRole();
            role.setState(rs.getInt("state"));
            role.setRoleId(rs.getInt("roleId"));
            role.setRoleName(rs.getString("roleName"));
            role.setRemark(rs.getString("Remark"));
            return role;
        };
        return jdbcTemplate.query(sql, roleRowMapper);
    }

    private List<SysFunction> getFunctionByUserId(Integer userId,boolean isAdmin){
    String sql =
        "select distinct sf.* from sys_user su "
            + "left join sys_role_user sur on su.userId = sur.userId "
            + "left join sys_role_function srf on sur.roleId = srf.roleId "
            + "left join sys_function sf on srf.functionId = sf.functionId "
            + "where su.userId = " + userId;
        if(isAdmin){
            sql = "select * from sys_function";
        }
        System.out.println(sql);
        return jdbcTemplate.query(sql, getFunctionRowMapper());
    }

    protected List<SysFunction> getFunctionByRoleId(Integer roleId){
        String sql = "select sf.* from sys_role sr " +
                "    left join sys_role_function srf on sr.roleId = srf.roleid " +
                "    left join sys_function sf on srf.functionid = sf.functionId " +
                " where sr.roleId = " + roleId;
        return jdbcTemplate.query(sql, getFunctionRowMapper());
    }

    protected RowMapper<SysFunction> getFunctionRowMapper(){
        return (rs,num)->{
            SysFunction function = new SysFunction();
            function.setFunctionId(rs.getInt("functionId"));
            function.setFunctionParentId(rs.getInt("functionParentId"));
            function.setFunctionType(rs.getString("functionType"));
            function.setFunctionIsParent(rs.getInt("functionIsParent"));
            function.setFunctionCode(rs.getString("functionCode"));
            function.setFunctionName(rs.getString("functionName"));
            function.setFunctionIcon(rs.getString("functionIcon"));
            function.setFunctionHref(rs.getString("functionHref"));
            function.setFunctionTarget(rs.getString("functionTarget"));
            function.setFunctionIsOpen(rs.getInt("functionIsOpen"));
            function.setFunctionOrderNum(rs.getInt("functionOrderNum"));
            function.setState(rs.getInt("state"));
            return function;
        };
    }
}
