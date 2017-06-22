package com.yq.vip.bean;

import java.util.Date;
   /**
    * eptzb 实体类
    */ 


public class Eptzb{
	private int tid;
	private String tzuser;
	private int tzlba;
	private int tzsla;
	private Date tzdate;
	public void setTid(int tid){
	this.tid=tid;
	}
	public int getTid(){
		return tid;
	}
	public void setTzuser(String tzuser){
	this.tzuser=tzuser;
	}
	public String getTzuser(){
		return tzuser;
	}
	public void setTzlba(int tzlba){
	this.tzlba=tzlba;
	}
	public int getTzlba(){
		return tzlba;
	}
	public void setTzsla(int tzsla){
	this.tzsla=tzsla;
	}
	public int getTzsla(){
		return tzsla;
	}
	public void setTzdate(Date tzdate){
	this.tzdate=tzdate;
	}
	public Date getTzdate(){
		return tzdate;
	}
}

