package com.yq.manager.bo;

   /**
    * zq2016stat 实体类
    */ 


public class Zq2016stat{
	private String userName;
	private int zaq;
	private int zbq;
	private int zmin;
	private String bigVipUser;
	private String phone;
	private String name;
	private String userid;
	public void setUserName(String userName){
	this.userName=userName;
	}
	public String getUserName(){
		return userName;
	}
	public void setZaq(int zaq){
	this.zaq=zaq;
	}
	public int getZaq(){
		return zaq;
	}
	public void setZbq(int zbq){
	this.zbq=zbq;
	}
	public int getZbq(){
		return zbq;
	}
	public void setZmin(int zmin){
	this.zmin=zmin;
	}
	public int getZmin(){
		return zmin;
	}
	public void setBigVipUser(String bigVipUser){
	this.bigVipUser=bigVipUser;
	}
	public String getBigVipUser(){
		return bigVipUser;
	}
	public void setPhone(String phone){
	this.phone=phone;
	}
	public String getPhone(){
		return phone;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setUserid(String userid){
	this.userid=userid;
	}
	public String getUserid(){
		return userid;
	}
}

