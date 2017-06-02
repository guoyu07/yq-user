package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.BigDecimalUtil;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.constant.GpjyChangeType;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class WymcAction extends ALDAdminActionSupport {

	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private Gpjy gpjy;
	
	private int myjyg;
	
	private int id;
	
	private int dqpay;
	
	private int mc65;
	
	private int mc30;
	
	private double mc5;
	
	private String pa3;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		gpjy = userService.getGpjyById(id);
		
		Fcxt fcxt = managerService.getFcxtById(2);
		if(gpjy.getNewjy()!=GpjyChangeType.BUY_BY_SYSTEM){
			gpjy.setPay(fcxt.getJygj());
			gpjy.setMysl(Double.valueOf(gpjy.countNum(fcxt.getJygj())));
		}
		
		
		double dqpay92=(0.9*gpjy.getJypay());
		dqpay=(int)(dqpay92*1+0.1);
		double	mc65a=0.65*dqpay;
		mc65=(int)(mc65a*1+0.1);
		double	mc30a=0.3*dqpay;
		mc30=(int)(mc30a*1+0.1);
		mc5 = BigDecimalUtil.multiply(0.05, dqpay);
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		myjyg = gcuser.getJyg();
		if(myjyg<gpjy.getMysl()){
			super.setErroCodeNum(1);
		}
		if(status==1){
			userService.mcJf(super.getUserName(), id,pa3);
			super.setErroCodeNum(2000);
		}
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Gpjy getGpjy() {
		return gpjy;
	}
	public void setGpjy(Gpjy gpjy) {
		this.gpjy = gpjy;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMc65() {
		return mc65;
	}
	public void setMc65(int mc65) {
		this.mc65 = mc65;
	}
	
	public double getMc5() {
		return mc5;
	}
	public void setMc5(double mc5) {
		this.mc5 = mc5;
	}
	public int getMc30() {
		return mc30;
	}
	public void setMc30(int mc30) {
		this.mc30 = mc30;
	}
	public int getDqpay() {
		return dqpay;
	}
	public void setDqpay(int dqpay) {
		this.dqpay = dqpay;
	}
	public int getMyjyg() {
		return myjyg;
	}
	public void setMyjyg(int myjyg) {
		this.myjyg = myjyg;
	}
	public String getPa3() {
		return pa3;
	}
	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}
	
}
