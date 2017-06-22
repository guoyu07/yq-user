package com.yq.vip.bean;

import java.util.Date;

public class UserScoresLogForExcel {

	private Integer id;
	private String userName;
	private String fromUser="0";
	private int changeNum;
	private int nowNum;
	private int changeType;
	private String changeTypeStr;
	private double ration;
	private String param;
	private Date createdTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getChangeNum() {
		return changeNum;
	}
	public void setChangeNum(int changeNum) {
		this.changeNum = changeNum;
	}
	public int getNowNum() {
		return nowNum;
	}
	public void setNowNum(int nowNum) {
		this.nowNum = nowNum;
	}
	public int getChangeType() {
		return changeType;
	}
	public void setChangeType(int changeType) {
		this.changeType = changeType;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public double getRation() {
		return ration;
	}
	public void setRation(double ration) {
		this.ration = ration;
	}
	public String getFromUser() {
		return fromUser;
	}
	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}
	
	public String getParam() {
		return param;
	}
	
	public void setParam(String param) {
		this.param = param;
	}
	
	public String getChangeTypeStr() {
		switch(changeType){
		    case 1001:
		    	return "系统赠送";
		    case 1002:
		    	return "商城增加-"+param;
		    case 1003:
		    	return "商城退款-"+param;
		    case 1004:
		    	return "同名账户转账-"+fromUser;
		    case 2001:
		    	return "商城消费-"+param;
		    case 2002:
		    	return "商城退款-"+param;
		    case 2003:
		    	return "同名账户转账-"+fromUser;
		    default:
		    	return "changeType";
		}
	}
	
	public void setChangeTypeStr(String changeTypeStr) {
		this.changeTypeStr = changeTypeStr;
	}
}
