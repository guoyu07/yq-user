package com.yq.agent.bo;

import java.util.Date;
   /**
    * agent_yb_change_log 实体类
    */ 


public class AgentYbChangeLog{
	private Integer id;
	private String userName;
	private int changeType;
	private int changeNum;
	private int nowNum;
	private String param;
	private Date createdTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setUserName(String userName){
	this.userName=userName;
	}
	public String getUserName(){
		return userName;
	}
	public void setChangeType(int changeType){
	this.changeType=changeType;
	}
	public int getChangeType(){
		return changeType;
	}
	public void setChangeNum(int changeNum){
	this.changeNum=changeNum;
	}
	public int getChangeNum(){
		return changeNum;
	}
	public void setNowNum(int nowNum){
	this.nowNum=nowNum;
	}
	public int getNowNum(){
		return nowNum;
	}
	public void setParam(String param){
	this.param=param;
	}
	public String getParam(){
		return param;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

