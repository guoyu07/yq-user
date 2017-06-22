package com.yq.vip.bean;

import java.util.Date;
   /**
    * jftzb 实体类
    */ 


public class Jftzb{
	private Integer tid;
	private String tzuser;
	private int tzlba;
	private int tzsla;
	private Date tzdate;
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
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

