package com.yq.user.bo;

   /**
    * fhname 实体类
    */ 


public class Fhname{
	private int fhid;
	private String fhuser;
	private double ljfhpay;
	private double txfhpay;
	private String bz;
	public void setFhid(int fhid){
	this.fhid=fhid;
	}
	public int getFhid(){
		return fhid;
	}
	public void setFhuser(String fhuser){
	this.fhuser=fhuser;
	}
	public String getFhuser(){
		return fhuser;
	}
	public void setLjfhpay(double ljfhpay){
	this.ljfhpay=ljfhpay;
	}
	public double getLjfhpay(){
		return ljfhpay;
	}
	public void setTxfhpay(double txfhpay){
	this.txfhpay=txfhpay;
	}
	public double getTxfhpay(){
		return txfhpay;
	}
	public void setBz(String bz){
	this.bz=bz;
	}
	public String getBz(){
		return bz;
	}
}

