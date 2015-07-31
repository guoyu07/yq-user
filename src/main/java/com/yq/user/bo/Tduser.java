package com.yq.user.bo;

import java.util.Date;
   /**
    * tduser 实体类
    */ 


public class Tduser{
	private int id;
	private String tdname;
	private String tduserid;
	private String tduser;
	private String tdcall;
	private String tdqq;
	private Date tddate;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setTdname(String tdname){
	this.tdname=tdname;
	}
	public String getTdname(){
		return tdname;
	}
	public void setTduserid(String tduserid){
	this.tduserid=tduserid;
	}
	public String getTduserid(){
		return tduserid;
	}
	public void setTduser(String tduser){
	this.tduser=tduser;
	}
	public String getTduser(){
		return tduser;
	}
	public void setTdcall(String tdcall){
	this.tdcall=tdcall;
	}
	public String getTdcall(){
		return tdcall;
	}
	public void setTdqq(String tdqq){
	this.tdqq=tdqq;
	}
	public String getTdqq(){
		return tdqq;
	}
	public void setTddate(Date tddate){
	this.tddate=tddate;
	}
	public Date getTddate(){
		return tddate;
	}
}

