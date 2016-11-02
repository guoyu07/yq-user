package com.yq.user.bo;

import java.util.Date;

/**
 * @author 作者: HuHua
 * @version 2016年11月2日
 * 类说明 
 */
public class SysBiLog {
	
	
	private Integer id;
	
	private String username; 				// 充值用户
	
	private Date rechargedate;				//重置时间
	
	private int currentamount;				//用户当前的数量
	
	private int amount;						//重置金额
	
	private String operator;				//操作者

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getRechargedate() {
		return rechargedate;
	}

	public void setRechargedate(Date rechargedate) {
		this.rechargedate = rechargedate;
	}

	public int getCurrentamount() {
		return currentamount;
	}

	public void setCurrentamount(int currentamount) {
		this.currentamount = currentamount;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	
	
	
	
	

}
