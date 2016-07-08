package com.yq.agent.bo;

import java.util.Date;
   /**
    * agent_scores_change_log 实体类
    */ 


public class AgentScoresChangeLog{
	private Integer id;
	private String orderId;
	private String userName;
	private String toUser;
	private String appId;
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
	public String getToUser() {
		return toUser;
	}
	public void setToUser(String toUser) {
		this.toUser = toUser;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	/**
	 * @param userName
	 * @param toUser
	 * @param appId
	 * @param changeType
	 * @param changeNum
	 * @param nowNum
	 * @param param
	 * @param createdTime
	 */
	public AgentScoresChangeLog(String userName, String toUser, String appId, int changeType, int changeNum, int nowNum,
			String param, Date createdTime) {
		super();
		this.userName = userName;
		this.toUser = toUser;
		this.appId = appId;
		this.changeType = changeType;
		this.changeNum = changeNum;
		this.nowNum = nowNum;
		this.param = param;
		this.createdTime = createdTime;
	}
	/**
	 * 
	 */
	public AgentScoresChangeLog() {
		super();
	}
	
	
}

