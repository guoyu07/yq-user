package com.yq.app.user.action;

import java.math.BigDecimal;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.common.utils.BigDecimalUtil;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class MyslAction extends ALDAdminPageActionSupport<Gpjy> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	//0
	private int zdjyg;
	
	private double jygj;
	
	private int jydb;
	
	//1  
	private int txpay;//买入数量
	
	private String pa3;//2级密码
	private int needJf;
	//2
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		Fcxt fcxt = managerService.getFcxtById(2);
		jygj = fcxt.getJygj();
		jydb = gcuser.getJydb();
		zdjyg = (int)(gcuser.getJydb()/fcxt.getJygj()+0.1);
		if(status==0){
			super.initPage(userService.getMrPageList(super.getUserName(), super.getToPage(), 15));
		}
		if(status==1){
			if(Strings.isNullOrEmpty(pa3)||!pa3.equals(gcuser.getPassword3())){
				super.setErroCodeNum(1);
			}
			double dd = BigDecimalUtil.multiply(jygj, txpay);
			
			needJf = (int)(Math.ceil(dd));
			return "mysl2";
		}
		
		if(status==2){
			userService.buyJf(super.getUserName(), txpay);
			super.setErroCodeNum(2000);
		}
		
		if(status==4){
			super.initPage(userService.getMrPageList(super.getUserName(), super.getToPage(), 10));
			return "moredetail";
		}
		
		return SUCCESS;
	}

	/*private double needjg(double a) {
		 int exponent = Math.getExponent(a);
         double negativeBoundary = -0.0;
         double positiveBoundary = 1.0;
         double sign = 1.0;
	     if (exponent < 0) {
	        return ((a == 0.0) ? a : ( (a < 0.0) ?  negativeBoundary : positiveBoundary) );
	    } else if (exponent >= 52) {
	        return a;
	    }
		
		 assert exponent >= 0 && exponent <= 51;
	
	    long doppel = Double.doubleToRawLongBits(a);
	    long mask   = 4503599627370495l >> exponent;
	
	    if ( (mask & doppel) == 0L )
	        return a; // integral value
	    else {
	        double result = Double.longBitsToDouble(doppel & (~mask));
	        if (sign*a > 0.0)
	            result = result + sign;
	        return result;
	    }
		
	}*/

	public int getZdjyg() {
		return zdjyg;
	}

	public void setZdjyg(int zdjyg) {
		this.zdjyg = zdjyg;
	}

	public double getJygj() {
		return jygj;
	}

	public void setJygj(double jygj) {
		this.jygj = jygj;
	}

	public int getJydb() {
		return jydb;
	}

	public void setJydb(int jydb) {
		this.jydb = jydb;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTxpay() {
		return txpay;
	}

	public void setTxpay(int txpay) {
		this.txpay = txpay;
	}

	public String getPa3() {
		return pa3;
	}

	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}

	public int getNeedJf() {
		return needJf;
	}

	public void setNeedJf(int needJf) {
		this.needJf = needJf;
	}
	
	
}
