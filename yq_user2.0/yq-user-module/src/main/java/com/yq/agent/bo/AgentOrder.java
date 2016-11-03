package com.yq.agent.bo;

import java.util.Date;
   /**
    * agent_order 实体类
    */ 


public class AgentOrder{
	public static final int ST_CTREATE = 0;
	public static final int ST_SUCCESS = 1;
	private int id;
	private String orderUserName;
	private String appId;
	private int amount;
	private String productOrder;
	private String productDesc;
	private String param;
	private String payUserName;
	private int status;
	private int callBackStatus;
	private Date payTime;
	private Date callBackTime;
	private Date createdTime;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setOrderUserName(String orderUserName){
	this.orderUserName=orderUserName;
	}
	public String getOrderUserName(){
		return orderUserName;
	}
	public void setAppId(String appId){
	this.appId=appId;
	}
	public String getAppId(){
		return appId;
	}
	public void setAmount(int amount){
	this.amount=amount;
	}
	public int getAmount(){
		return amount;
	}
	public void setProductOrder(String productOrder){
	this.productOrder=productOrder;
	}
	public String getProductOrder(){
		return productOrder;
	}
	public void setProductDesc(String productDesc){
	this.productDesc=productDesc;
	}
	public String getProductDesc(){
		return productDesc;
	}
	public void setParam(String param){
	this.param=param;
	}
	public String getParam(){
		return param;
	}
	public void setPayUserName(String payUserName){
	this.payUserName=payUserName;
	}
	public String getPayUserName(){
		return payUserName;
	}
	public void setStatus(int status){
	this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setCallBackStatus(int callBackStatus){
	this.callBackStatus=callBackStatus;
	}
	public int getCallBackStatus(){
		return callBackStatus;
	}
	public void setPayTime(Date payTime){
	this.payTime=payTime;
	}
	public Date getPayTime(){
		return payTime;
	}
	public void setCallBackTime(Date callBackTime){
	this.callBackTime=callBackTime;
	}
	public Date getCallBackTime(){
		return callBackTime;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

