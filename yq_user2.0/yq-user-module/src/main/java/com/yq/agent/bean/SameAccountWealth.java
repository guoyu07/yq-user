package com.yq.agent.bean;

public class SameAccountWealth {
	//1、同名账号积分总额；2、同名账号金币总额；3、同名账号一币总额；4、同名账号已提现总额；
	private double totalPoint;
	private double totalGold;
	private double totalYb;
	private double totalTx;
	public double getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(double totalPoint) {
		this.totalPoint = totalPoint;
	}
	
	public double getTotalGold() {
		return totalGold;
	}
	public void setTotalGold(double totalGold) {
		this.totalGold = totalGold;
	}
	public double getTotalYb() {
		return totalYb;
	}
	public void setTotalYb(double totalYb) {
		this.totalYb = totalYb;
	}
	public double getTotalTx() {
		return totalTx;
	}
	public void setTotalTx(double totalTx) {
		this.totalTx = totalTx;
	}
	
	
	/*public static SameAccountWealth getSameAccountWealth(double totalPoint,double totalGold, double totalYb, double totalTx){
		
		return null;
	}*/

}
