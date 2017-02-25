package com.yq.agent.bean;

import java.util.ArrayList;
import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.Page;
import com.yq.user.bo.Gcuser;

public class SameAccount {
	

	private String userName;	//账号
	private int yb;				//一币余额
	private int gold;			//金币余额
	private int point;			//积分余额
	private int txTotal;		//已提現金額
	private int accountLevel;	//账号等级
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
	public static IPage<SameAccount> getPageSameUserPersonalInfo(IPage<Gcuser> gcuserList){
		SameAccount user = null;
		List<SameAccount>	result = new ArrayList<>();
		//Page<SameAccount> result = new Page<>(gcuserList.getData(), gcuserList.getTotalSize(), gcuserList.getPageSize(), gcuserList.getCurrentPage());
		if(gcuserList!=null){
			for (Gcuser gcuser : gcuserList.getData()) {
				user = new SameAccount();
				user.setUserName(gcuser.getUsername());
				user.setYb(gcuser.getPay());
				user.setGold(gcuser.getJydb());
				user.setPoint(gcuser.getJyg());
				if(gcuser.getVip()==2){
					user.setAccountLevel(2);
				}else if(gcuser.getVip()==3){
					user.setAccountLevel(1);
				}else{
					user.setAccountLevel(0);
				}
				user.setTxTotal(gcuser.getMcpay());
				result.add(user);
			}
		}
		
		return new Page<>(result, result.size(), gcuserList.getPageSize(), (int)gcuserList.getCurrentPage());
	}

}
