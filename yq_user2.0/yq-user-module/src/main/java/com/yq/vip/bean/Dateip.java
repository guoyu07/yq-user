package com.yq.vip.bean;

import java.util.Date;
   /**
    * dateip 实体类
    */ 


public class Dateip{
	private int id;
	private String user;
	private Date dldate;
	private Date tcdate;
	private String dlfs;
	private String dlip;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setUser(String user){
	this.user=user;
	}
	public String getUser(){
		return user;
	}
	public void setDldate(Date dldate){
	this.dldate=dldate;
	}
	public Date getDldate(){
		return dldate;
	}
	public void setTcdate(Date tcdate){
	this.tcdate=tcdate;
	}
	public Date getTcdate(){
		return tcdate;
	}
	public void setDlfs(String dlfs){
	this.dlfs=dlfs;
	}
	public String getDlfs(){
		return dlfs;
	}
	public void setDlip(String dlip){
	this.dlip=dlip;
	}
	public String getDlip(){
		return dlip;
	}
}

