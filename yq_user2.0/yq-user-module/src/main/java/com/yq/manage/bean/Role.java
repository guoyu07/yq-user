package com.yq.manage.bean;

import java.util.Date;

/**
 * @author 作者: HuHua
 * @version 2016年12月19日
 * 类说明  角色表
 */
public class Role {
	
	private int id;
	
	private String roleName;	//角色名
	
	private String roleDesc;	//角色描述
	
	private String roleCode;	//角色码
	
	private String createUser;	//创建者
	
	private Date createDate; //创建日期
	
	private String updateUser;//修改用户
	
	private Date updateDate;	//修改日期
	
	public Role(){
		
	}
	public Role(String roleName, String roleDesc, String roleCode){
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.roleCode = roleCode;
	}

	public Role(int id, String roleName, String roleDesc, String roleCode, String createUser, Date createDate,
			String updateUser, Date updateDate) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.roleCode = roleCode;
		this.createUser = createUser;
		this.createDate = createDate;
		this.updateUser = updateUser;
		this.updateDate = updateDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
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
