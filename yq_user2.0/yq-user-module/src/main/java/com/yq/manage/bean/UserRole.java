package com.yq.manage.bean;

import java.util.Date;

/**
 * @author 作者: HuHua
 * @version 2016年12月19日
 * 类说明  用户角色表（n:n关系）
 */
public class UserRole {
	
	private int id;
	
	private int userId;  	  //用户id
	
	private int roleId;		  //角色id
	
	private String createUser;	//创建者
	
	private Date createDate; //创建日期
	
	private String updateUser;//修改用户
	
	private Date updateDate;	//修改日期

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
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
