package com.yq.user.bo;

import java.util.Date;
   /**
    * vipxtgc 实体类
    */ 


public class Vipxtgc{
	private Integer vipid;
	private String vipname;
	private Date vipdate;
	private int jcyb;
	private int jcbdb;
	public void setVipname(String vipname){
	this.vipname=vipname;
	}
	public String getVipname(){
		return vipname;
	}
	public void setVipdate(Date vipdate){
	this.vipdate=vipdate;
	}
	public Date getVipdate(){
		return vipdate;
	}
	public void setJcyb(int jcyb){
	this.jcyb=jcyb;
	}
	public int getJcyb(){
		return jcyb;
	}
	public void setJcbdb(int jcbdb){
	this.jcbdb=jcbdb;
	}
	public int getJcbdb(){
		return jcbdb;
	}
	public Integer getVipid() {
		return vipid;
	}
	public void setVipid(Integer vipid) {
		this.vipid = vipid;
	}
}

