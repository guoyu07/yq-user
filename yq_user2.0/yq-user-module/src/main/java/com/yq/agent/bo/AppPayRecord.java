package com.yq.agent.bo;

import java.util.Date;

public class AppPayRecord {
	
	private int id;
	private String appId;
	private String fromUserName;
	private String toUserName;
	private int amount;
	private String productOrder;
	private String productDesc;
	private String param;
	private int status;
	private int callBackStatus;
	private Date payTime;
	private Date callBackTime;
	private Date createdTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getFromUserName() {
		return fromUserName;
	}
	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getProductOrder() {
		return productOrder;
	}
	public void setProductOrder(String productOrder) {
		this.productOrder = productOrder;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCallBackStatus() {
		return callBackStatus;
	}
	public void setCallBackStatus(int callBackStatus) {
		this.callBackStatus = callBackStatus;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public Date getCallBackTime() {
		return callBackTime;
	}
	public void setCallBackTime(Date callBackTime) {
		this.callBackTime = callBackTime;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public static String getAppPayRecord(String queryTrasactionOder) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
