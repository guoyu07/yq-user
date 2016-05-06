package com.yq.user.bo;

import java.util.Date;
   /**
    * gcfh 实体类
    */ 


public class Gcfh{
	private String userid;
	private int jtljgc;
	private int sygc;
	private int ljgc;
	private double fhpay;
	private double syfh;
	private double ljfhtj;
	private Date abdate;
	private String bz;
	private int lb;
	private int sf;
	public void setUserid(String userid){
	this.userid=userid;
	}
	public String getUserid(){
		return userid;
	}
	public void setJtljgc(int jtljgc){
	this.jtljgc=jtljgc;
	}
	public int getJtljgc(){
		return jtljgc;
	}
	public void setSygc(int sygc){
	this.sygc=sygc;
	}
	public int getSygc(){
		return sygc;
	}
	public void setLjgc(int ljgc){
	this.ljgc=ljgc;
	}
	public int getLjgc(){
		return ljgc;
	}
	public void setFhpay(double fhpay){
	this.fhpay=fhpay;
	}
	public double getFhpay(){
		return fhpay;
	}
	public void setSyfh(double syfh){
	this.syfh=syfh;
	}
	public double getSyfh(){
		return syfh;
	}
	public void setLjfhtj(double ljfhtj){
	this.ljfhtj=ljfhtj;
	}
	public double getLjfhtj(){
		return ljfhtj;
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
	public void setLb(int lb){
	this.lb=lb;
	}
	public int getLb(){
		return lb;
	}
	public void setSf(int sf){
	this.sf=sf;
	}
	public int getSf(){
		return sf;
	}
}

