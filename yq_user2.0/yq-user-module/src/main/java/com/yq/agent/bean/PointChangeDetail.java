package com.yq.agent.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.Page;
import com.yq.user.bo.Gpjy;

public class PointChangeDetail {
	
	private String 	userName;
	private double 	saleCount;		//賣出數量
	private double 	buyCount;		//買入數量
	//private double 	surplusCount;	//剩餘數量
	private double 	price;			//價格
	//private String 	desc;			//備註
	//private Date 	listingDate; 	//掛牌時間
	private Date	tradeDate;		//交易時間
	
	

	public String getUserName() {
		return userName;
	}








	public void setUserName(String userName) {
		this.userName = userName;
	}








	public double getSaleCount() {
		return saleCount;
	}








	public void setSaleCount(double saleCount) {
		this.saleCount = saleCount;
	}








	public double getBuyCount() {
		return buyCount;
	}








	public void setBuyCount(double buyCount) {
		this.buyCount = buyCount;
	}










	public double getPrice() {
		return price;
	}








	public void setPrice(double price) {
		this.price = price;
	}












	public Date getTradeDate() {
		return tradeDate;
	}








	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}








	public static IPage<PointChangeDetail> getPointChangeDetail(IPage<Gpjy> pointDetail) {
		List<PointChangeDetail> beanList=new ArrayList<>();
		PointChangeDetail bean= null;
		if(pointDetail!=null){
			for (Gpjy gpjy : pointDetail.getData()) {
				bean = new PointChangeDetail();
				bean.setUserName(gpjy.getUsername());
				if(gpjy.getMcsl()!=null){
					bean.setSaleCount(gpjy.getMcsl());
				}else if(gpjy.getMysl()!=null){
					bean.setBuyCount(gpjy.getMysl());
				}
				
				//bean.setSurplusCount(gpjy.getSysl());
				bean.setPrice(gpjy.getPay());
				//bean.setDesc(gpjy.getBz());
				//bean.setListingDate(gpjy.getAbdate());
				bean.setTradeDate(gpjy.getCgdate());
				beanList.add(bean);
			}
		}
		
		return new Page<>(beanList, beanList.size(), pointDetail.getPageSize(), (int)pointDetail.getCurrentPage());
	}

}
