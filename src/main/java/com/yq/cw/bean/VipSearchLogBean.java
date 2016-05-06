package com.yq.cw.bean;

import java.util.List;


public class VipSearchLogBean {

	private int startNum;
	private List<DatepayCw> logList;
	private StatBean dayStat;
	private StatBean monthStat;
	private StatBean yearStat;
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public List<DatepayCw> getLogList() {
		return logList;
	}
	public void setLogList(List<DatepayCw> logList) {
		this.logList = logList;
	}
	public StatBean getDayStat() {
		return dayStat;
	}
	public void setDayStat(StatBean dayStat) {
		this.dayStat = dayStat;
	}
	public StatBean getMonthStat() {
		return monthStat;
	}
	public void setMonthStat(StatBean monthStat) {
		this.monthStat = monthStat;
	}
	public StatBean getYearStat() {
		return yearStat;
	}
	public void setYearStat(StatBean yearStat) {
		this.yearStat = yearStat;
	}
}
