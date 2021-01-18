package com.tjh.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SysFunction {
	@JsonProperty("id")
    private Integer functionId;

	@JsonProperty("pId")
    private Integer functionParentId;

    private String functionType;

    private Integer functionIsParent;

    private String functionCode;
    
    @JsonProperty("title")
    private String functionName;
    
    @JsonProperty("icon")
    private String functionIcon;

    @JsonProperty("href")
    private String functionHref;

    @JsonProperty("name")
    private String functionTarget;

    @JsonProperty("spread")
    private Integer functionIsOpen;

    private Integer functionOrderNum;

    private Integer state;

    private String remark;
    
    private Date createTime;
    
    private Integer createPerson;

	public Integer getFunctionId() {
		return functionId;
	}

	public void setFunctionId(Integer functionId) {
		this.functionId = functionId;
	}

	public Integer getFunctionParentId() {
		return functionParentId;
	}

	public void setFunctionParentId(Integer functionParentId) {
		this.functionParentId = functionParentId;
	}

	public String getFunctionType() {
		return functionType;
	}

	public void setFunctionType(String functionType) {
		this.functionType = functionType;
	}

	public Integer getFunctionIsParent() {
		return functionIsParent;
	}

	public void setFunctionIsParent(Integer functionIsParent) {
		this.functionIsParent = functionIsParent;
	}

	public String getFunctionCode() {
		return functionCode;
	}

	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getFunctionIcon() {
		return functionIcon;
	}

	public void setFunctionIcon(String functionIcon) {
		this.functionIcon = functionIcon;
	}

	public String getFunctionHref() {
		return functionHref;
	}

	public void setFunctionHref(String functionHref) {
		this.functionHref = functionHref;
	}

	public String getFunctionTarget() {
		return functionTarget;
	}

	public void setFunctionTarget(String functionTarget) {
		this.functionTarget = functionTarget;
	}

	public Integer getFunctionIsOpen() {
		return functionIsOpen;
	}

	public void setFunctionIsOpen(Integer functionIsOpen) {
		this.functionIsOpen = functionIsOpen;
	}

	public Integer getFunctionOrderNum() {
		return functionOrderNum;
	}

	public void setFunctionOrderNum(Integer functionOrderNum) {
		this.functionOrderNum = functionOrderNum;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getCreatePerson() {
		return createPerson;
	}

	public void setCreatePerson(Integer createPerson) {
		this.createPerson = createPerson;
	}
}