package com.yq.manager.bean;




public class UserPerformanceSearch {

	private int siglePerformance;
	private int allPerformance;
	private Performance performance;
	private boolean isFiveFull;
	
	public int getSiglePerformance() {
		return siglePerformance;
	}
	public void setSiglePerformance(int siglePerformance) {
		this.siglePerformance = siglePerformance;
	}
	public int getAllPerformance() {
		return allPerformance;
	}
	public void setAllPerformance(int allPerformance) {
		this.allPerformance = allPerformance;
	}
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
}
