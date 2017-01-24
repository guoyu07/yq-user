package com.yq.manager.bo;

   /**
    * zup2016stat 实体类
    */ 


public class Zup2016stat{
	private String userid;
	private String name;
	private int allSjb;
	public void setUserid(String userid){
	this.userid=userid;
	}
	public String getUserid(){
		return userid;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setAllSjb(int allSjb){
	this.allSjb=allSjb;
	}
	public int getAllSjb(){
		return allSjb;
	}
}

