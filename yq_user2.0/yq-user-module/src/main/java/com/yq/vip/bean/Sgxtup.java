package com.yq.vip.bean;

import java.util.Date;
   /**
    * sgxtup 实体类
    */ 


public class Sgxtup{
	private int id;
	private String username;
	private int sjb;
	private Date bddate;
	private String upname;
	private String upuser;
	private String upcall;
	private String upqq;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setUsername(String username){
	this.username=username;
	}
	public String getUsername(){
		return username;
	}
	public void setSjb(int sjb){
	this.sjb=sjb;
	}
	public int getSjb(){
		return sjb;
	}
	public void setBddate(Date bddate){
	this.bddate=bddate;
	}
	public Date getBddate(){
		return bddate;
	}
	public void setUpname(String upname){
	this.upname=upname;
	}
	public String getUpname(){
		return upname;
	}
	public void setUpuser(String upuser){
	this.upuser=upuser;
	}
	public String getUpuser(){
		return upuser;
	}
	public void setUpcall(String upcall){
	this.upcall=upcall;
	}
	public String getUpcall(){
		return upcall;
	}
	public void setUpqq(String upqq){
	this.upqq=upqq;
	}
	public String getUpqq(){
		return upqq;
	}
}

