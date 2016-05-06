package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class JztobjAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int pay;
	
	private int status;
	//2
	private int gmmj;
	//3
	private int gmsl;
	
	//4
	private int mj;
	
	private String pa3;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		pay = gcuser.getPay();
		if(pay<15){
			super.setErroCodeNum(1);
		}
		if(status==1){
			return "suc2";
		}
		if(status==2){
			if((double)pay<(double)gmsl*(double)mj*1.5){
				super.setErroCodeNum(2);
			}
			return "suc3";
		}
		if(status==3){
			userService.buyJb(super.getUserName(), mj, gmsl,pa3);
			super.setErroCodeNum(2000);
			return "suc4";
		}
		return SUCCESS;
	}

	
	public String getPa3() {
		return pa3;
	}


	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}


	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getGmmj() {
		return gmmj;
	}

	public void setGmmj(int gmmj) {
		this.gmmj = gmmj;
	}

	public int getGmsl() {
		return gmsl;
	}

	public void setGmsl(int gmsl) {
		this.gmsl = gmsl;
	}

	public int getMj() {
		return mj;
	}

	public void setMj(int mj) {
		this.mj = mj;
	}
}
