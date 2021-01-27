package com.tjh.pojo;

import java.io.Serializable;
import java.util.Date;

public class SysUser implements Serializable {
    private Integer userId;

    private String userName;

    private String userMobilePhone;

    private String userHomePhone;

    private String userEmail;

    private String userQQ;

    private String userLogName;

    private String userLogPwd;

    private Integer userSex;

    private String userFax;

    private String userAddress;

    private String userZipCode;

    private String userImages;

    private String userCard;

    private String userSalt;

    private Date userBirthday;

    private Integer userOrderNum;

    private Date userLastLogTime;

    private Integer userPosition;

    private Integer userProvinceId;

    private Integer userCityId;

    private Integer userCountyId;

    private Integer deptId;

    private Integer state;

    private String remark;

    private Date createTime;

	private Integer createPerson;


	public Integer getCreatePerson() {
		return createPerson;
	}

	public void setCreatePerson(Integer createPerson) {
		this.createPerson = createPerson;
	}



	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMobilePhone() {
		return userMobilePhone;
	}

	public void setUserMobilePhone(String userMobilePhone) {
		this.userMobilePhone = userMobilePhone;
	}

	public String getUserHomePhone() {
		return userHomePhone;
	}

	public void setUserHomePhone(String userHomePhone) {
		this.userHomePhone = userHomePhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserQQ() {
		return userQQ;
	}

	public void setUserQQ(String userQQ) {
		this.userQQ = userQQ;
	}

	public String getUserLogName() {
		return userLogName;
	}

	public void setUserLogName(String userLogName) {
		this.userLogName = userLogName;
	}

	public String getUserLogPwd() {
		return userLogPwd;
	}

	public void setUserLogPwd(String userLogPwd) {
		this.userLogPwd = userLogPwd;
	}

	public Integer getUserSex() {
		return userSex;
	}

	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
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

	public String getUserFax() {
		return userFax;
	}

	public void setUserFax(String userFax) {
		this.userFax = userFax;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserZipCode() {
		return userZipCode;
	}

	public void setUserZipCode(String userZipCode) {
		this.userZipCode = userZipCode;
	}

	public String getUserImages() {
		return userImages;
	}

	public void setUserImages(String userImages) {
		this.userImages = userImages;
	}

	public String getUserCard() {
		return userCard;
	}

	public void setUserCard(String userCard) {
		this.userCard = userCard;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUserSalt() {
		return userSalt;
	}

	public void setUserSalt(String userSalt) {
		this.userSalt = userSalt;
	}

	public Date getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	public Integer getUserOrderNum() {
		return userOrderNum;
	}

	public void setUserOrderNum(Integer userOrderNum) {
		this.userOrderNum = userOrderNum;
	}

	public Date getUserLastLogTime() {
		return userLastLogTime;
	}

	public void setUserLastLogTime(Date userLastLogTime) {
		this.userLastLogTime = userLastLogTime;
	}

	public Integer getUserPosition() {
		return userPosition;
	}

	public void setUserPosition(Integer userPosition) {
		this.userPosition = userPosition;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Integer getUserProvinceId() {
		return userProvinceId;
	}

	public void setUserProvinceId(Integer userProvinceId) {
		this.userProvinceId = userProvinceId;
	}

	public Integer getUserCityId() {
		return userCityId;
	}

	public void setUserCityId(Integer userCityId) {
		this.userCityId = userCityId;
	}

	public Integer getUserCountyId() {
		return userCountyId;
	}

	public void setUserCountyId(Integer userCountyId) {
		this.userCountyId = userCountyId;
	}

}
