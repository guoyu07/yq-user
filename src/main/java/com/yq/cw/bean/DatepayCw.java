package com.yq.cw.bean;

import com.yq.user.bo.Datepay;

public class DatepayCw extends Datepay {

	private Double inPrice;
	
	private Double outPrice;

	public Double getInPrice() {
		return inPrice;
	}

	public void setInPrice(Double inPrice) {
		this.inPrice = inPrice;
	}

	public Double getOutPrice() {
		return outPrice;
	}

	public void setOutPrice(Double outPrice) {
		this.outPrice = outPrice;
	}
}
