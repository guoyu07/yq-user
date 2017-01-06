package com.yq.manage.bean;

import java.util.Date;

/**
 * 
 * @author 作者: HuHua
 * @version 2016年12月16日
 * 类说明 :管理用户表
 */
public class ManageUser{
	private int 			  id;			//作为adminId,唯一值
	private String 		      adminusername;//登录昵称
	private String 			  password;		//密码
	private String 			  name;			//真是姓名
    private String            resouceIds;	//资源（一个数组类型的字符串）
	//为整合权限系统管理用户表所添加的字段
	private int            	  isOverdue;	//是否是海外用户
	private Date			  createDate;	//创建日期
	private String			  createName;	//创建者
	private Date			  updateDate;	//修改日期
	private String			  updateName;	//修改者
	private int				  staffId;		//职员id
	
	
	//是否涉及功能控制账号，设计目的：为不影响之前的功能模块，加入此判断
	private int function;					//用于区分整合前后功能与用户名的字段  0表示否，1表示是，如之前的admin1，admin2,admin5... 得须设值为：1
	
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



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getAdminusername() {
		return adminusername;
	}



	public void setAdminusername(String adminusername) {
		this.adminusername = adminusername;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public int getIsOverdue() {
		return isOverdue;
	}



	public void setIsOverdue(int isOverdue) {
		this.isOverdue = isOverdue;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getCreateName() {
		return createName;
	}



	public void setCreateName(String createName) {
		this.createName = createName;
	}



	public Date getUpdateDate() {
		return updateDate;
	}



	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}



	public String getUpdateName() {
		return updateName;
	}



	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}



	public int getStaffId() {
		return staffId;
	}



	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}



	public int getFunction() {
		return function;
	}



	public void setFunction(int function) {
		this.function = function;
	}
	
	

}
