package com.yq.agent.bean;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.Page;
import com.yq.manager.bo.PointsChangeLog;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Txpay;

public class UserPersonalInfoBean {

	private String userName;	//账号
	private int yb;				//一币余额
	private int gold;			//金币余额
	private int splitTimes;		//已拆分次数
	private int point;			//积分余额
	private double splitBs;		//上次拆分倍数
	private int txTotal;		//已提現金額
	private int accountLevel;	//账号等级(普通玩家,大vip，小vip)//0普通用户   2大vip  3小vip
	private int isBussiness;	//是否是商家（0不是 1是）
	private String name;		//姓名
	private String userId;		//身份证号码
	//private List<TxDetail>	txdetailList;	//提现明细
	//private Set<PointsChangeInfo> pointsChangeInfoList;	//积分价格变化明细
	
	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getYb() {
		return yb;
	}


	public void setYb(int yb) {
		this.yb = yb;
	}


	public int getGold() {
		return gold;
	}


	public void setGold(int gold) {
		this.gold = gold;
	}


	public int getSplitTimes() {
		return splitTimes;
	}


	public void setSplitTimes(int splitTimes) {
		this.splitTimes = splitTimes;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}



	public double getSplitBs() {
		return splitBs;
	}


	public void setSplitBs(double splitBs) {
		this.splitBs = splitBs;
	}


	public int getTxTotal() {
		return txTotal;
	}


	public void setTxTotal(int txTotal) {
		this.txTotal = txTotal;
	}




	public int getAccountLevel() {
		return accountLevel;
	}


	public void setAccountLevel(int accountLevel) {
		this.accountLevel = accountLevel;
	}


	public int getIsBussiness() {
		return isBussiness;
	}


	public void setIsBussiness(int isBussiness) {
		this.isBussiness = isBussiness;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public static UserPersonalInfoBean getUserPersonalInfoBeanByGcuser(Gcuser gcuser/*,	List<PointsChangeLog> pointsChangeLogList,	List<Txpay> txpayList*/){
		UserPersonalInfoBean result = new UserPersonalInfoBean();
		//Set<PointsChangeInfo> pointsList= new HashSet<PointsChangeInfo>();
		//List<TxDetail>	txdetailList = new ArrayList<>();
		if(gcuser!=null){
			result.setUserName(gcuser.getUsername());
			result.setYb(gcuser.getPay());
			result.setGold(gcuser.getJydb());
			result.setSplitTimes(gcuser.getCfa());
			result.setPoint(gcuser.getJyg());
			result.setSplitBs(gcuser.getCfb());
			result.setTxTotal(gcuser.getMcpay());
			if(gcuser.getVip()==2){
				result.setAccountLevel(2);
			}else if(gcuser.getVip()==3){
				result.setAccountLevel(1);
			}else{
				result.setAccountLevel(0);
			}
			if(gcuser.getTxlb()==3||gcuser.getJb()==5){
				result.setIsBussiness(1);
			}else{
				result.setIsBussiness(0);
			}
			result.setUserId(gcuser.getUserid());
			result.setName(gcuser.getName());
		}
		/*
		if(txpayList!=null){
			TxDetail txDetail=null;
			for (Txpay txpay : txpayList) {
				txDetail = new TxDetail();
				txDetail.setPayDate(txpay.getPaytime());
				txDetail.setRgDate(txpay.getRgdate());
				txDetail.setPaynum(txpay.getPaynum());
				txDetail.setUserName(txpay.getPayusername());
				txdetailList.add(txDetail);
			}
			
		}*/
		//result.setPointsChangeInfoList(pointsList);
		//result.setTxdetailList(txdetailList);
		return result;
	}
	
	
	
}
