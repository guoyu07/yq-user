package com.yq.manage.bean;

import java.util.Date;

import com.yq.user.bo.Fcxt;

/**
 * 
 * @author 作者: HuHua
 * @version 2016年12月16日
 * 类说明 :管理用户表
 */
public class ManageUser extends Fcxt{
	private String 			  name;			//真是姓名
    private String            resouceIds;	//资源（一个数组类型的字符串）
	
	private String 			  roleName;
	
	private String 			  fullName;
	
	
	public ManageUser(){
		
	}
	
	
	
	public ManageUser(String name, String resouceIds, Date createDate, String createName,
			Date updateDate, String updateName, String roleName, String fullName) {
		super();
		this.name = name;
		this.resouceIds = resouceIds;
		this.roleName = roleName;
		this.fullName = fullName;
	}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResouceIds() {
		return resouceIds;
	}
	public void setResouceIds(String resouceIds) {
		this.resouceIds = resouceIds;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	

}
