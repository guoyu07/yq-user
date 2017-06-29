package com.yq.vip.bean;

import com.yq.user.bo.Gcuser;

public class VipUser{
	private Integer id;
	private String user;			//用户名
	private String up;				//上级
	private int vip;				//vip
	private int ljjyyb;				//累计交易一币
	private int yb;					//当前可用一币
	private int ljsyyb;				//累计使用一币(已提现)
	private int vipyb;				//表示服务中心转入或游戏收益部分的一币
	private int jb;					//金币
	private int jf;					//积分
	private int czbye;				//充值币余额、
	private int czbljczs;			//累计充值数
	private int yyczb;				//已用充值币
	private int bybdb;				//备用报单币
	private String moneypot;		//钱罐余额
	private int sybdb;				//报单币
	private String call;			//电话号码
	private String vipsq;
	private String name;			
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getUp() {
		return up;
	}
	public void setUp(String up) {
		this.up = up;
	}
	public int getVip() {
		return vip;
	}
	public void setVip(int vip) {
		this.vip = vip;
	}
	public int getLjjyyb() {
		return ljjyyb;
	}
	public void setLjjyyb(int ljjyyb) {
		this.ljjyyb = ljjyyb;
	}
	public int getYb() {
		return yb;
	}
	public void setYb(int yb) {
		this.yb = yb;
	}
	public int getLjsyyb() {
		return ljsyyb;
	}
	public void setLjsyyb(int ljsyyb) {
		this.ljsyyb = ljsyyb;
	}
	public int getVipyb() {
		return vipyb;
	}
	public void setVipyb(int vipyb) {
		this.vipyb = vipyb;
	}
	public int getJb() {
		return jb;
	}
	public void setJb(int jb) {
		this.jb = jb;
	}
	public int getJf() {
		return jf;
	}
	public void setJf(int jf) {
		this.jf = jf;
	}
	public int getCzbye() {
		return czbye;
	}
	public void setCzbye(int czbye) {
		this.czbye = czbye;
	}
	public int getCzbljczs() {
		return czbljczs;
	}
	public void setCzbljczs(int czbljczs) {
		this.czbljczs = czbljczs;
	}
	public int getYyczb() {
		return yyczb;
	}
	public void setYyczb(int yyczb) {
		this.yyczb = yyczb;
	}
	public int getBybdb() {
		return bybdb;
	}
	public void setBybdb(int bybdb) {
		this.bybdb = bybdb;
	}
	public String getMoneypot() {
		return moneypot;
	}
	public void setMoneypot(String moneypot) {
		this.moneypot = moneypot;
	}
	public int getSybdb() {
		return sybdb;
	}
	public void setSybdb(int sybdb) {
		this.sybdb = sybdb;
	}
	
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getVipsq() {
		return vipsq;
	}
	public void setVipsq(String vipsq) {
		this.vipsq = vipsq;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public static VipUser getVipUser(Gcuser user){
		if(user!=null){
			VipUser vipuser = new VipUser();
			vipuser.setUser(user.getUsername());
			vipuser.setUp(user.getUp());
			vipuser.setVip(user.getVip());
			vipuser.setLjjyyb(user.getCbpay());
			vipuser.setYb(user.getPay());
			vipuser.setLjsyyb(user.getTxpay());
			vipuser.setVipyb(user.getVippay());
			vipuser.setCzbye(user.getVipcjcjb());
			vipuser.setCzbljczs(user.getVipljcjb());
			vipuser.setYyczb(user.getVipsycjb());
			vipuser.setBybdb(user.getSyep());
			vipuser.setSybdb(user.getSybdb());
			vipuser.setCall(user.getCall());
			vipuser.setVipsq(user.getVipsq());
			vipuser.setName(user.getName());
			return vipuser;
		}else{
			return null;
		}
	}
	
	
	
}

