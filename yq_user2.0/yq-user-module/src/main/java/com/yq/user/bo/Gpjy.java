package com.yq.user.bo;

import java.util.Date;

import com.yq.common.utils.BigDecimalUtil;
   /**
    * gpjy 实体类
    */ 


public class Gpjy{
	private Integer id;
	private int jyid;
	private int kjqi;
	private String username;
	private Double mysl;
	private Double mcsl;
	private Double sysl;
	private Double pay;
	private Double jypay;	//该笔订单买入或卖出需要的金币数量
	private Date abdate;
	private String bz;
	private Date cgdate;
	private int jy;
	private String dfuser;
	private Date dqdate;
	private int newjy;//用这个来标识类型  100系统代买
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getJyid() {
		return jyid;
	}
	public void setJyid(int jyid) {
		this.jyid = jyid;
	}
	public int getKjqi() {
		return kjqi;
	}
	public void setKjqi(int kjqi) {
		this.kjqi = kjqi;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Double getMysl() {
		return mysl;
	}
	public void setMysl(Double mysl) {
		this.mysl = mysl;
	}
	public Double getMcsl() {
		return mcsl;
	}
	public void setMcsl(Double mcsl) {
		this.mcsl = mcsl;
	}
	public Double getSysl() {
		return sysl;
	}
	public void setSysl(Double sysl) {
		this.sysl = sysl;
	}
	public Double getPay() {
		return pay;
	}
	public void setPay(Double pay) {
		this.pay = pay;
	}
	public Double getJypay() {
		return jypay;
	}
	public void setJypay(Double jypay) {
		this.jypay = jypay;
	}
	public Date getAbdate() {
		return abdate;
	}
	public void setAbdate(Date abdate) {
		this.abdate = abdate;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public Date getCgdate() {
		return cgdate;
	}
	public void setCgdate(Date cgdate) {
		this.cgdate = cgdate;
	}
	public int getJy() {
		return jy;
	}
	public void setJy(int jy) {
		this.jy = jy;
	}
	public String getDfuser() {
		return dfuser;
	}
	public void setDfuser(String dfuser) {
		this.dfuser = dfuser;
	}
	public Date getDqdate() {
		return dqdate;
	}
	public void setDqdate(Date dqdate) {
		this.dqdate = dqdate;
	}
	public int getNewjy() {
		return newjy;
	}
	public void setNewjy(int newjy) {
		this.newjy = newjy;
	}
	public int countNum(double price){
		return (int)(BigDecimalUtil.divide(this.jypay, price));
	}
	@Override
	public String toString() {
		return "Gpjy [id=" + id + ", jyid=" + jyid + ", kjqi=" + kjqi + ", username=" + username + ", mysl=" + mysl
				+ ", mcsl=" + mcsl + ", sysl=" + sysl + ", pay=" + pay + ", jypay=" + jypay + ", abdate=" + abdate
				+ ", bz=" + bz + ", cgdate=" + cgdate + ", jy=" + jy + ", dfuser=" + dfuser + ", dqdate=" + dqdate
				+ ", newjy=" + newjy + "]";
	}
	
}

