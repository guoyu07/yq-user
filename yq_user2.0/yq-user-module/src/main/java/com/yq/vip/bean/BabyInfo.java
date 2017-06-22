package com.yq.vip.bean;

import java.util.Date;
   /**
    * baby_info 实体类
    */ 


public class BabyInfo{
	private Integer id;
	private String userName;
	private String name;
	private String babyName;
	private int babyAge;
	private String babySex;
	private String dadyName;
	private int dadyAge;
	private String dadyCall;
	private String momName;
	private int momAge;
	private String momCall;
	private String address;
	private String details;
	private int status;
	private String editName;
	private Date editTime;
	private String deleteName;
	private String recoverName;
	private Date createdTime;
	public void setId(Integer id){
	this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setUserName(String userName){
	this.userName=userName;
	}
	public String getUserName(){
		return userName;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setBabyName(String babyName){
	this.babyName=babyName;
	}
	public String getBabyName(){
		return babyName;
	}
	public void setBabyAge(int babyAge){
	this.babyAge=babyAge;
	}
	public int getBabyAge(){
		return babyAge;
	}
	public void setBabySex(String babySex){
	this.babySex=babySex;
	}
	public String getBabySex(){
		return babySex;
	}
	public void setDadyName(String dadyName){
	this.dadyName=dadyName;
	}
	public String getDadyName(){
		return dadyName;
	}
	public void setDadyAge(int dadyAge){
	this.dadyAge=dadyAge;
	}
	public int getDadyAge(){
		return dadyAge;
	}
	public void setDadyCall(String dadyCall){
	this.dadyCall=dadyCall;
	}
	public String getDadyCall(){
		return dadyCall;
	}
	public void setMomName(String momName){
	this.momName=momName;
	}
	public String getMomName(){
		return momName;
	}
	public void setMomAge(int momAge){
	this.momAge=momAge;
	}
	public int getMomAge(){
		return momAge;
	}
	public void setMomCall(String momCall){
	this.momCall=momCall;
	}
	public String getMomCall(){
		return momCall;
	}
	public void setAddress(String address){
	this.address=address;
	}
	public String getAddress(){
		return address;
	}
	public void setDetails(String details){
	this.details=details;
	}
	public String getDetails(){
		return details;
	}
	public void setStatus(int status){
	this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setEditName(String editName){
	this.editName=editName;
	}
	public String getEditName(){
		return editName;
	}
	public void setEditTime(Date editTime){
	this.editTime=editTime;
	}
	public Date getEditTime(){
		return editTime;
	}
	public void setDeleteName(String deleteName){
	this.deleteName=deleteName;
	}
	public String getDeleteName(){
		return deleteName;
	}
	public void setRecoverName(String recoverName){
	this.recoverName=recoverName;
	}
	public String getRecoverName(){
		return recoverName;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
	public BabyInfo(String userName, String name, String babyName, int babyAge, String babySex, String dadyName,
			int dadyAge, String dadyCall, String momName, int momAge, String momCall, String address, String details,
			int status, String editName, Date editTime, String deleteName, String recoverName, Date createdTime) {
		super();
		this.userName = userName;
		this.name = name;
		this.babyName = babyName;
		this.babyAge = babyAge;
		this.babySex = babySex;
		this.dadyName = dadyName;
		this.dadyAge = dadyAge;
		this.dadyCall = dadyCall;
		this.momName = momName;
		this.momAge = momAge;
		this.momCall = momCall;
		this.address = address;
		this.details = details;
		this.status = status;
		this.editName = editName;
		this.editTime = editTime;
		this.deleteName = deleteName;
		this.recoverName = recoverName;
		this.createdTime = createdTime;
	}
	public BabyInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
}

