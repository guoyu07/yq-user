package com.yq.user.bo;

import java.util.Date;
   /**
    * dgag 实体类
    */ 


public class Dgag{
	private Integer id;
	private String ggbt;
	private String ggny;
	private String ggbt_en;
	private String ggny_en;
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
	public String getGgbt_en() {
		return ggbt_en;
	}
	public void setGgbt_en(String ggbt_en) {
		this.ggbt_en = ggbt_en;
	}
	public String getGgny_en() {
		return ggny_en;
	}
	public void setGgny_en(String ggny_en) {
		this.ggny_en = ggny_en;
	}
	
	
}

