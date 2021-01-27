package com.tjh.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * (OperationLog)实体类
 *
 * @author makejava
 * @since 2021-01-27 10:54:10
 */
public class OperationLog implements Serializable {
    private static final long serialVersionUID = -96146389367462286L;

    private Integer logId;


    private String logIpAddress;


    private Date logCreateTime;


    private String logModuleName;


    private String logDesc;


    private String logType;


    private String logMethodName;


    private String logParams;

    private String logParamter;

    private  Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLogParamter() {
        return logParamter;
    }

    public void setLogParamter(String logParamter) {
        this.logParamter = logParamter;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getLogIpAddress() {
        return logIpAddress;
    }

    public void setLogIpAddress(String logIpAddress) {
        this.logIpAddress = logIpAddress;
    }

    public Date getLogCreateTime() {
        return logCreateTime;
    }

    public void setLogCreateTime(Date logCreateTime) {
        this.logCreateTime = logCreateTime;
    }

    public String getLogModuleName() {
        return logModuleName;
    }

    public void setLogModuleName(String logModuleName) {
        this.logModuleName = logModuleName;
    }

    public String getLogDesc() {
        return logDesc;
    }

    public void setLogDesc(String logDesc) {
        this.logDesc = logDesc;
    }

    public String getLogType() {
        return logType;
    }

    public void setLogType(String logType) {
        this.logType = logType;
    }

    public String getLogMethodName() {
        return logMethodName;
    }

    public void setLogMethodName(String logMethodName) {
        this.logMethodName = logMethodName;
    }

    public String getLogParams() {
        return logParams;
    }

    public void setLogParams(String logParams) {
        this.logParams = logParams;
    }
}
