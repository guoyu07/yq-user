package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class McslAction extends ALDAdminPageActionSupport<Gpjy> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Fcxt fcxt;
	
	private Gcuser gcuser;
	
	private int status;
	
	private String pa3;
	
	private double jygj;//卖出单价
	
	private int txpay;//卖出数量
	
	private int dqpay;
	private int mc70;
	private int mc30;
	
	
	
	public String execute(){
		UserService userService  = ServiceCacheFactory.getServiceCache().getService(UserService.class);

		ManagerService managerService  = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		fcxt = managerService.getFcxtById(2);
		
		if(status==1){
			
			userService.checkSaleJf(super.getUserName(), jygj, txpay, pa3);
			double dqpay10 = txpay*jygj;
			double dqpay92=(0.9*dqpay10);
				   dqpay=(int)(dqpay92*1+0.1);
			double	mc70a=0.7*dqpay;
					mc70=(int)(mc70a*1+0.1);
			double	mc30a=0.3*dqpay;
					mc30=(int)(mc30a*1+0.1);
			return "mcsl2";
		}
		if(status==2){
			userService.saleJf(super.getUserName(), jygj, txpay, "-1");
			super.setErroCodeNum(2000);
			return "mcsl2";
		}
		if(status==0){
			super.initPage(userService.getAllGpjyDetailsPageList(super.getUserName(), super.getToPage(), 15));
		}
		if(status==4){
			super.initPage(userService.getAllGpjyDetailsPageList(super.getUserName(), super.getToPage(), 10));
			return "moredetail";
		}
		
		return SUCCESS;
	}
	
	

	public Fcxt getFcxt() {
		return fcxt;
	}

	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}

	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPa3() {
		return pa3;
	}

	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}

	public double getJygj() {
		return jygj;
	}

	public void setJygj(double jygj) {
		this.jygj = jygj;
	}

	public int getTxpay() {
		return txpay;
	}

	public void setTxpay(int txpay) {
		this.txpay = txpay;
	}

	public int getDqpay() {
		return dqpay;
	}

	public void setDqpay(int dqpay) {
		this.dqpay = dqpay;
	}

	public int getMc70() {
		return mc70;
	}

	public void setMc70(int mc70) {
		this.mc70 = mc70;
	}

	public int getMc30() {
		return mc30;
	}

	public void setMc30(int mc30) {
		this.mc30 = mc30;
	}

}
