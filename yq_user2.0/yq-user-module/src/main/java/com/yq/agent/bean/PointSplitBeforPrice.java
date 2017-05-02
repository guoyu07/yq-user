package com.yq.agent.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PointSplitBeforPrice {
	
	private int id;
	
	private int times;			//拆分次数
	
	private Date splitDate;		//拆分日期
	
	private String price;		//拆前单价
	
	private String beiShu;		//拆分倍数

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public Date getSplitDate() {
		return splitDate;
	}

	public void setSplitDate(Date splitDate) {
		this.splitDate = splitDate;
	}


	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	
	public String getBeiShu() {
		return beiShu;
	}

	public void setBeiShu(String beiShu) {
		this.beiShu = beiShu;
	}

	public static List<PointSplitBeforPrice> getSplitPrice(List<PointSplitBeforPrice> splitBeforPrice) {
		PointSplitBeforPrice pointSplitBeforPrice = null;
		List<PointSplitBeforPrice>	result = new ArrayList<>();
		if(splitBeforPrice!=null){
			for (PointSplitBeforPrice list : splitBeforPrice) {
				pointSplitBeforPrice = new PointSplitBeforPrice();
				pointSplitBeforPrice.setId(list.getId());
				pointSplitBeforPrice.setTimes(list.getId());
				pointSplitBeforPrice.setPrice(list.getPrice());
				pointSplitBeforPrice.setSplitDate(list.getSplitDate());
				pointSplitBeforPrice.setBeiShu(list.getBeiShu());
				result.add(pointSplitBeforPrice);
			}
		}
		
		return result;
	}
	
	
	
	

}
