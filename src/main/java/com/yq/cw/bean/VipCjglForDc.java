package com.yq.cw.bean;

import java.util.Date;

public class VipCjglForDc {
	//充值时间
	private Date cjdate;
	//备注
	private String bzs;
	private int sr;
	private int zc;
	//剩余充值币
	private int sycjb;
	//充值用户
	private String cjuser;
	//充值金额
	private int cjjo;
	//操作者
	private String vipuser;
	public Date getCjdate() {
		return cjdate;
	}
	public void setCjdate(Date cjdate) {
		this.cjdate = cjdate;
	}
	public String getBzs() {
		return cjuser.equals("系统")?"从系统处获得":"转给"+cjuser;
	}
	public int getSr() {
		return cjuser.equals("系统")?cjjo:0;
	}
	public int getZc() {
		return cjuser.equals("系统")?0:cjjo;
	}
	public int getSycjb() {
		return sycjb;
	}
	public void setSycjb(int sycjb) {
		this.sycjb = sycjb;
	}
	public void setCjuser(String cjuser) {
		this.cjuser = cjuser;
	}
	public void setCjjo(int cjjo) {
		this.cjjo = cjjo;
	}
	public void setVipuser(String vipuser) {
		this.vipuser = vipuser;
	}
}
