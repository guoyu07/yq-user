package com.yq.cservice.bean;

public class ChargeStat {
private Double todaySum;
private Double yesterdaySum;
private Double oldYesterdaySum;
private Double all;
public Double getTodaySum() {
	return todaySum;
}
public void setTodaySum(Double todaySum) {
	this.todaySum = todaySum;
}
public Double getYesterdaySum() {
	return yesterdaySum;
}
public void setYesterdaySum(Double yesterdaySum) {
	this.yesterdaySum = yesterdaySum;
}
public Double getOldYesterdaySum() {
	return oldYesterdaySum;
}
public void setOldYesterdaySum(Double oldYesterdaySum) {
	this.oldYesterdaySum = oldYesterdaySum;
}
public Double getAll() {
	return all;
}
public void setAll(Double all) {
	this.all = all;
}
}
