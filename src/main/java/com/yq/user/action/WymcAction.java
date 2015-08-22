package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.UserService;

public class WymcAction extends ALDAdminActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private Gpjy gpjy;
	
	private int myjyg;
	
	private int id;
	
	private int dqpay;
	
	private int mc70;
	
	private int mc30;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gpjy = userService.getGpjyById(id);
		double dqpay92=(0.9*gpjy.getJypay());
		dqpay=(int)(dqpay92*1+0.1);
		double	mc70a=0.7*dqpay;
		mc70=(int)(mc70a*1+0.1);
		double	mc30a=0.3*dqpay;
		mc30=(int)(mc30a*1+0.1);	
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		myjyg = gcuser.getJyg();
		if(myjyg<gpjy.getMysl()){
			super.setErroCodeNum(1);
		}
		if(status==1){
			userService.mcJf(super.getUserName(), id);
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
	
}
