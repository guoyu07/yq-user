package com.yq.agent.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.apache.struts2.views.xslt.ArrayAdapter;

import com.yq.manager.bo.PointsChangeLog;

public class PointChangeInfo {
	
	private String oldPrice;		
	private String newPrice;		
	private Date changeDate;
	
	public String getOldPrice() {
		return oldPrice;
	}
	public void setOldPrice(String oldPrice) {
		this.oldPrice = oldPrice;
	}
	public String getNewPrice() {
		return newPrice;
	}
	public void setNewPrice(String newPrice) {
		this.newPrice = newPrice;
	}
	public Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}
	public static List<PointChangeInfo> getPointChangeInfo(List<PointsChangeLog> logList){
		List<PointChangeInfo> pointsList= new ArrayList<PointChangeInfo>();
		if(logList!=null){
			PointChangeInfo pointsChangeInfo=null;
			for (PointsChangeLog pointsChangeLog : logList) {
				pointsChangeInfo = new PointChangeInfo();
				pointsChangeInfo.setOldPrice(pointsChangeLog.getOldPrice());
				pointsChangeInfo.setNewPrice(pointsChangeLog.getNewPrice());
				pointsChangeInfo.setChangeDate(pointsChangeLog.getCreatedTime());
				pointsList.add(pointsChangeInfo);
			}
			
		}
		return pointsList;
	}
	

}
