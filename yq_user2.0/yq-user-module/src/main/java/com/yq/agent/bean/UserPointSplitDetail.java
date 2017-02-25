package com.yq.agent.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.Page;
import com.yq.user.bo.Gpjy;

public class UserPointSplitDetail {
	
	private String userName;
	private double incomeCount;		//收益
	private double surplusCount;	//剩餘數量
	private String desc;
	private Date tradeDate;		//交易時間
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public double getIncomeCount() {
		return incomeCount;
	}
	public void setIncomeCount(double incomeCount) {
		this.incomeCount = incomeCount;
	}
	public double getSurplusCount() {
		return surplusCount;
	}
	public void setSurplusCount(double surplusCount) {
		this.surplusCount = surplusCount;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Date getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}
	
	public static IPage<UserPointSplitDetail> getPointSplitDetail(IPage<Gpjy> gpjyList){
		List<UserPointSplitDetail> beanList=new ArrayList<>();
		UserPointSplitDetail bean= null;
		if(gpjyList!=null){
			for (Gpjy gpjy : gpjyList.getData()) {
				bean = new UserPointSplitDetail();
				bean.setUserName(gpjy.getUsername());
				if(gpjy.getMysl()!=null){
					bean.setIncomeCount(gpjy.getMysl());
				}else{
					bean.setIncomeCount(0);
				}
				bean.setSurplusCount(gpjy.getSysl());
				bean.setDesc(gpjy.getBz());
				bean.setTradeDate(gpjy.getCgdate());
				beanList.add(bean);
			}
		}
		
		return new Page<>(beanList, beanList.size(), gpjyList.getPageSize(), (int)gpjyList.getCurrentPage());
		
	}
	

}
