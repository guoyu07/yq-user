package com.yq.common.utils;

import java.math.BigDecimal;

public class BigDecimalUtil {
	

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
	

	/** 乘法 
	 * @param price
	 * @param count
	 * @return
	 */
	public static double multiply(double price, double count){
		BigDecimal r1 = new BigDecimal(price);
		BigDecimal r2 = new BigDecimal(count);
		double r= r1.multiply(r2).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		return r;
		
	};  //BigDecimal 乘法 
	
	
	/**
	 * 除法
	 * @param chushu
	 * @param beichushu
	 * @return
	 */
	public static double divide(double chushu, double beichushu){
		BigDecimal r1 = new BigDecimal(chushu);
		BigDecimal r2 = new BigDecimal(beichushu);
		BigDecimal num3 = r1.divide(r2,10,BigDecimal.ROUND_HALF_DOWN);
		double r= num3.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		return r;
	};
	
	

}
