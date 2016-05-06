package com.yq.user.bo;

import java.util.Date;
   /**
    * dgag 实体类
    */ 


public class Dgag{
	private Integer id;
	private String ggbt;
	private String ggny;
	private Date ggdate;
	private int check;
	private String bz;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setGgbt(String ggbt){
	this.ggbt=ggbt;
	}
	public String getGgbt(){
		return ggbt;
	}
	public void setGgny(String ggny){
	this.ggny=ggny;
	}
	public String getGgny(){
		return ggny;
	}
	public void setGgdate(Date ggdate){
	this.ggdate=ggdate;
	}
	public Date getGgdate(){
		return ggdate;
	}
	public void setCheck(int check){
	this.check=check;
	}
	public int getCheck(){
		return check;
	}
	public void setBz(String bz){
	this.bz=bz;
	}
	public String getBz(){
		return bz;
	}
}

