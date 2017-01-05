package com.yq.manage.bean;
/**
 * @author 作者: HuHua
 * @version 2016年12月20日
 * 类说明   职员信息表
 */
public class Staff {
	
	private int 		   id;
  	private int 		   departmentId;//部门
    private String         fullName;    //全名
    private String         sex;			//性别
    private String         mobilePhone;	//电话
    private String         email;		//email
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    
    

}
