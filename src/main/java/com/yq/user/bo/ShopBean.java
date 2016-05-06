package com.yq.user.bo;

public class ShopBean {

	private String shopper;
	private int ybValue;//一币金额
	private int scoresValue;//购物券金额
	private String shopperOrder;//商户订单号
	
	public String getShopper() {
		return shopper;
	}
	public void setShopper(String shopper) {
		this.shopper = shopper;
	}
	public int getYbValue() {
		return ybValue;
	}
	public void setYbValue(int ybValue) {
		this.ybValue = ybValue;
	}
	public int getScoresValue() {
		return scoresValue;
	}
	public void setScoresValue(int scoresValue) {
		this.scoresValue = scoresValue;
	}
	public String getShopperOrder() {
		return shopperOrder;
	}
	public void setShopperOrder(String shopperOrder) {
		this.shopperOrder = shopperOrder;
	}
}
