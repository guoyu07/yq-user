package com.yq.vip.bean;

import java.util.Date;
   /**
    * dldate 实体类
    */ 


public class Dldate{
	private int id;
	private String username;
	private double syjz;
	private double jc;
	private double jyjz;
	private double pay;
	private Date abdate;
	private String regid;
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
	public void setSyjz(double syjz){
	this.syjz=syjz;
	}
	public double getSyjz(){
		return syjz;
	}
	public void setJc(double jc){
	this.jc=jc;
	}
	public double getJc(){
		return jc;
	}
	public void setJyjz(double jyjz){
	this.jyjz=jyjz;
	}
	public double getJyjz(){
		return jyjz;
	}
	public void setPay(double pay){
	this.pay=pay;
	}
	public double getPay(){
		return pay;
	}
	public void setAbdate(Date abdate){
	this.abdate=abdate;
	}
	public Date getAbdate(){
		return abdate;
	}
	public void setRegid(String regid){
	this.regid=regid;
	}
	public String getRegid(){
		return regid;
	}
}

