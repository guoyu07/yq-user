package com.yq.manage.bean;

/**
 * @author 作者: HuHua
 * @version 2016年12月19日
 * 类说明  角色资源表(n:n 创建关联表)
 */
public class RoleResource {
	
	private int id;		//ID
	
	private int resourceId;	//资源id
	
	private int roleId;		//角色id

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getResourceId() {
		return resourceId;
	}

	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}


}
