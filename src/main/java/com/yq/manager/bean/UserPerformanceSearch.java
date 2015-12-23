package com.yq.manager.bean;

import com.yq.user.bo.Sgxt;

public class UserPerformanceSearch {
	//个人总业绩
    private int sigleAllPerformance;
    //个人时间段总业绩
    private int sigleTimeAllPerformance;
	//5层左区总业绩
	private int fiveLeftPerformance;
	//5层左区时间段总业绩
	private int fiveLeftTimePerformance;
	//5层右区总业绩
	private int fiveRightPerformance;
	//5层右区时间段总业绩
	private int fiveRightTimePerformance;
	//5层二叉树
	private Performance performance;
	//用户业绩记录
	private Sgxt sgxt;
	//时间段内所有左区业绩
	private int allTimeLeftPerformance;
	//时间段内所有右区业绩
	private int allTimeRightPerformance;
	//是否满5层
	private boolean isFiveFull;
	
	public Performance getPerformance() {
		return performance;
	}
	public void setPerformance(Performance performance) {
		this.performance = performance;
	}
	public boolean getIsFiveFull() {
		return isFiveFull;
	}
	public void setIsFiveFull(boolean isFiveFull) {
		this.isFiveFull = isFiveFull;
	}
	public int getFiveLeftPerformance() {
		return fiveLeftPerformance;
	}
	public void setFiveLeftPerformance(int fiveLeftPerformance) {
		this.fiveLeftPerformance = fiveLeftPerformance;
	}
	public int getFiveRightPerformance() {
		return fiveRightPerformance;
	}
	public void setFiveRightPerformance(int fiveRightPerformance) {
		this.fiveRightPerformance = fiveRightPerformance;
	}
	public int getSigleAllPerformance() {
		return sigleAllPerformance;
	}
	public void setSigleAllPerformance(int sigleAllPerformance) {
		this.sigleAllPerformance = sigleAllPerformance;
	}
	public Sgxt getSgxt() {
		return sgxt;
	}
	public void setSgxt(Sgxt sgxt) {
		this.sgxt = sgxt;
	}
	public int getAllTimeLeftPerformance() {
		return allTimeLeftPerformance;
	}
	public void setAllTimeLeftPerformance(int allTimeLeftPerformance) {
		this.allTimeLeftPerformance = allTimeLeftPerformance;
	}
	public int getAllTimeRightPerformance() {
		return allTimeRightPerformance;
	}
	public void setAllTimeRightPerformance(int allTimeRightPerformance) {
		this.allTimeRightPerformance = allTimeRightPerformance;
	}
	public void setFiveFull(boolean isFiveFull) {
		this.isFiveFull = isFiveFull;
	}
	public int getSigleTimeAllPerformance() {
		return sigleTimeAllPerformance;
	}
	public void setSigleTimeAllPerformance(int sigleTimeAllPerformance) {
		this.sigleTimeAllPerformance = sigleTimeAllPerformance;
	}
	public int getFiveLeftTimePerformance() {
		return fiveLeftTimePerformance;
	}
	public void setFiveLeftTimePerformance(int fiveLeftTimePerformance) {
		this.fiveLeftTimePerformance = fiveLeftTimePerformance;
	}
	public int getFiveRightTimePerformance() {
		return fiveRightTimePerformance;
	}
	public void setFiveRightTimePerformance(int fiveRightTimePerformance) {
		this.fiveRightTimePerformance = fiveRightTimePerformance;
	}
	public int getAllTimePerformance(){
		return allTimeLeftPerformance+allTimeRightPerformance;
	}
}
