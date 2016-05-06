package com.yq.user.bo;

import java.util.Date;
   /**
    * cbzyc 实体类
    */ 


public class Cbzyc{
	private int id;
	private int bid;
	private String buser;
	private Date bdate;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setBid(int bid){
	this.bid=bid;
	}
	public int getBid(){
		return bid;
	}
	public void setBuser(String buser){
	this.buser=buser;
	}
	public String getBuser(){
		return buser;
	}
	public void setBdate(Date bdate){
	this.bdate=bdate;
	}
	public Date getBdate(){
		return bdate;
	}
}

