package com.yq.manage.bean;

import java.util.Date;

/**
 * @author 作者: HuHua
 * @version 2016年12月17日
 * 类说明  部门信息表
 */
public class Department {

	private int id;
	
	private int partmentId;		//部门id
	
	private String deptName;	//部门名字
	
	private String deptDesc; //部门描述
	
	private String createUser;	//创建者
	
	private Date createDate; //创建日期
	
	private String updateUser;//修改用户
	
	private Date updateDate;	//修改日期
	
	public Department(){
		
	}
	
	public Department(String deptName, String deptDesc) {
		super();
		this.deptName = deptName;
		this.deptDesc = deptDesc;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public int getPartmentId() {
		return partmentId;
	}

	public void setPartmentId(int partmentId) {
		this.partmentId = partmentId;
	}

	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptDesc() {
		return deptDesc;
	}
	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	  
	  
	  
	
}
