package com.tjh.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


public class Student {
    private Integer studentId;

    private String studentName;

    private String studentPhone;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date studentBirthday;

    private String studentReason;

	private String studentSource;

	private String studentFileName;

	private String reasonText;

	private Integer dictionaryId;//请假类型

	private Integer dictionaryPid;

	private Integer classId;//班级

    private Integer teacherId;//老师

    private Integer userId;//家长

    private Integer state;

    private String remark;



    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    private Integer createPerson;//添加人

	public Integer getUserId() {
		return userId;
	}

	public String getStudentSource() {
		return studentSource;
	}
	public void setStudentSource(String studentSource) {
		this.studentSource = studentSource;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentPhone() {
		return studentPhone;
	}

	public Integer getDictionaryId() {
		return dictionaryId;
	}

	public void setDictionaryId(Integer dictionaryId) {
		this.dictionaryId = dictionaryId;
	}

	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}

	public Date getStudentBirthday() {
		return studentBirthday;
	}

	public void setStudentBirthday(Date studentBirthday) {
		this.studentBirthday = studentBirthday;
	}

	public String getStudentReason() {
		return studentReason;
	}

	public void setStudentReason(String studentReason) {
		this.studentReason = studentReason;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
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

	public Integer getDictionaryPid() {
		return dictionaryPid;
	}

	public void setDictionaryPid(Integer dictionaryPid) {
		this.dictionaryPid = dictionaryPid;
	}

	public String getStudentFileName() {
		return studentFileName;
	}

	public void setStudentFileName(String studentFileName) {
		this.studentFileName = studentFileName;
	}

	public String getReasonText() {
		return reasonText;
	}

	public void setReasonText(String reasonText) {
		this.reasonText = reasonText;
	}
}
