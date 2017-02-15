package com.yq.common.utils;

import java.math.BigDecimal;

public class BigDecimalUtil {
	
	
	public BigDecimal add(double p1, double p2){
		BigDecimal r1 = new BigDecimal(p1);
		BigDecimal r2 = new BigDecimal(p2);
		BigDecimal r= r1.add(r2);
		return r;
		
	}; //BigDecimal 加法 

	public BigDecimal subtract(BigDecimal val){
		
		return val;
		
	}; //BigDecimal 减法 

	/** 乘法 
	 * @param price
	 * @param count
	 * @return
	 */
	public static double multiply(double price, int count){
		BigDecimal r1 = new BigDecimal(price);
		BigDecimal r2 = new BigDecimal(count);
		double r= r1.multiply(r2).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		return r;
		
	};  //BigDecimal 乘法 

	/**
	 * @param price
	 * @param count
	 * @return
	 */
	public static BigDecimal divide(double price, int count){
		BigDecimal r1 = new BigDecimal(price);
		BigDecimal r2 = new BigDecimal(count);
		BigDecimal r= r1.divide(r2);
		return r;
	}; //除法 
}
