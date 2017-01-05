package com.yq.manage.bean;

import java.util.Date;

/**
 * @author 作者: HuHua
 * @version 2017年1月3日
 * 类说明 		后台管理 操作日志
 */
public class AdminOperateLog {
	
	private int id;				//id
	
	private String operator;	//操作人
	
	private String ip;			//操作人ip地址（登录IP）
	
	private Date operateDate;	//操作时间
	
	private int operateType;	//操作功能块
	
	private String operateDesc;	//操作描述
	
	
	public AdminOperateLog(){
	}

	public AdminOperateLog(String operator, String ip, Date operateDate, int operateType, String operateDesc) {
		super();
		this.operator = operator;
		this.ip = ip;
		this.operateDate = operateDate;
		this.operateType = operateType;
		this.operateDesc = operateDesc;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getOperateDate() {
		return operateDate;
	}

	public void setOperateDate(Date operateDate) {
		this.operateDate = operateDate;
	}

	public int getOperateType() {
		return operateType;
	}

	public void setOperateType(int operateType) {
		this.operateType = operateType;
	}

	public String getOperateDesc() {
		return operateDesc;
	}

	public void setOperateDesc(String operateDesc) {
		this.operateDesc = operateDesc;
	}
	
	

}
