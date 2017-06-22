package com.yq.vip.bean;

import java.util.Date;

public class Vipcjgl {
	private Integer cjid;
	//充值用户
	private String cjuser;
	//充值金额
	private int cjjo;
	//充值时间
	private Date cjdate;
	//操作者
	private String vipuser;
	//剩余充值币
	private int sycjb;
	//备注
	private String bz;
	public Integer getCjid() {
		return cjid;
	}
	public void setCjid(Integer cjid) {
		this.cjid = cjid;
	}
	public String getCjuser() {
		return cjuser;
	}
	public void setCjuser(String cjuser) {
		this.cjuser = cjuser;
	}
	public int getCjjo() {
		return cjjo;
	}
	public void setCjjo(int cjjo) {
		this.cjjo = cjjo;
	}
	public Date getCjdate() {
		return cjdate;
	}
	public void setCjdate(Date cjdate) {
		this.cjdate = cjdate;
	}
	public String getVipuser() {
		return vipuser;
	}
	public void setVipuser(String vipuser) {
		this.vipuser = vipuser;
	}
	public int getSycjb() {
		return sycjb;
	}
	public void setSycjb(int sycjb) {
		this.sycjb = sycjb;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
}
