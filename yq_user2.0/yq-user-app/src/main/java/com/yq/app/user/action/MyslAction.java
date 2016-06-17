package com.yq.app.user.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.DatepayMore;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.LogService;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class MyslAction extends ALDAdminPageActionSupport<DatepayMore> {

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
			LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
			super.initPage(logService.getDatePayJfmrListPage(super.getUserName(), super.getToPage(), 15));
		}
		if(status==1){
			if(Strings.isNullOrEmpty(pa3)||!pa3.equals(gcuser.getPassword3())){
				super.setErroCodeNum(1);
			}
			needJf = (int)(Math.ceil(jygj*txpay));
			return "mysl2";
		}
		
		if(status==2){
			userService.buyJf(super.getUserName(), txpay);
			super.setErroCodeNum(2000);
		}
		
		return SUCCESS;
	}

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
