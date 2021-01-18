package com.tjh.pojo;

import java.io.Serializable;
import java.util.Date;

public class SysDept implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer deptId;

    private Integer deptParentId;

    private String deptName;

    private String deptAdress;

    private String deptNameRemarks;

    private Integer deptOrderNum;

    private Integer deptIsOpen;

    private Integer deptTel;

    private String deptFax;

    private Integer state;

    private String remark;

    private Date createTime;
    
    private Integer createPerson;

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Integer getDeptParentId() {
		return deptParentId;
	}

	public void setDeptParentId(Integer deptParentId) {
		this.deptParentId = deptParentId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptAdress() {
		return deptAdress;
	}

	public void setDeptAdress(String deptAdress) {
		this.deptAdress = deptAdress;
	}

	public String getDeptNameRemarks() {
		return deptNameRemarks;
	}

	public void setDeptNameRemarks(String deptNameRemarks) {
		this.deptNameRemarks = deptNameRemarks;
	}

	public Integer getDeptOrderNum() {
		return deptOrderNum;
	}

	public void setDeptOrderNum(Integer deptOrderNum) {
		this.deptOrderNum = deptOrderNum;
	}

	public Integer getDeptIsOpen() {
		return deptIsOpen;
	}

	public void setDeptIsOpen(Integer deptIsOpen) {
		this.deptIsOpen = deptIsOpen;
	}

	public Integer getDeptTel() {
		return deptTel;
	}

	public void setDeptTel(Integer deptTel) {
		this.deptTel = deptTel;
	}

	public String getDeptFax() {
		return deptFax;
	}

	public void setDeptFax(String deptFax) {
		this.deptFax = deptFax;
	}


	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
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