package com.yq.user.bo;

import java.util.Date;
   /**
    * gpjy 实体类
    */ 


public class Gpjy{
	private int id;
	private int jyid;
	private int kjqi;
	private String username;
	private double mysl;
	private double mcsl;
	private double sysl;
	private double pay;
	private double jypay;
	private Date abdate;
	private String bz;
	private Date cgdate;
	private int jy;
	private String dfuser;
	private Date dqdate;
	private int newjy;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setJyid(int jyid){
	this.jyid=jyid;
	}
	public int getJyid(){
		return jyid;
	}
	public void setKjqi(int kjqi){
	this.kjqi=kjqi;
	}
	public int getKjqi(){
		return kjqi;
	}
	public void setUsername(String username){
	this.username=username;
	}
	public String getUsername(){
		return username;
	}
	public void setMysl(double mysl){
	this.mysl=mysl;
	}
	public double getMysl(){
		return mysl;
	}
	public void setMcsl(double mcsl){
	this.mcsl=mcsl;
	}
	public double getMcsl(){
		return mcsl;
	}
	public void setSysl(double sysl){
	this.sysl=sysl;
	}
	public double getSysl(){
		return sysl;
	}
	public void setPay(double pay){
	this.pay=pay;
	}
	public double getPay(){
		return pay;
	}
	public void setJypay(double jypay){
	this.jypay=jypay;
	}
	public double getJypay(){
		return jypay;
	}
	public void setAbdate(Date abdate){
	this.abdate=abdate;
	}
	public Date getAbdate(){
		return abdate;
	}
	public void setBz(String bz){
	this.bz=bz;
	}
	public String getBz(){
		return bz;
	}
	public void setCgdate(Date cgdate){
	this.cgdate=cgdate;
	}
	public Date getCgdate(){
		return cgdate;
	}
	public void setJy(int jy){
	this.jy=jy;
	}
	public int getJy(){
		return jy;
	}
	public void setDfuser(String dfuser){
	this.dfuser=dfuser;
	}
	public String getDfuser(){
		return dfuser;
	}
	public void setDqdate(Date dqdate){
	this.dqdate=dqdate;
	}
	public Date getDqdate(){
		return dqdate;
	}
	public void setNewjy(int newjy){
	this.newjy=newjy;
	}
	public int getNewjy(){
		return newjy;
	}
}

