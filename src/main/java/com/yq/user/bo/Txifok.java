package com.yq.user.bo;

   /**
    * txifok 实体类
    */ 


public class Txifok{
	private int id;
	private String username;
	private String up;
	private String password3;
	private String name;
	private String call;
	private String bz;
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
	public void setUp(String up){
	this.up=up;
	}
	public String getUp(){
		return up;
	}
	public void setPassword3(String password3){
	this.password3=password3;
	}
	public String getPassword3(){
		return password3;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setCall(String call){
	this.call=call;
	}
	public String getCall(){
		return call;
	}
	public void setBz(String bz){
	this.bz=bz;
	}
	public String getBz(){
		return bz;
	}
}

