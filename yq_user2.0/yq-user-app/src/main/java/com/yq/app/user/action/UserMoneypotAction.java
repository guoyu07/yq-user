package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class UserMoneypotAction extends ALDAdminPageActionSupport<Gcuser> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String moneypot;

	@Override
	public String execute() throws Exception {
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		moneypot = userService.getMoneyPot(super.getUserName());
		if(moneypot.equals("FAIL")){
			moneypot="暂无数据";
		}
		
		return SUCCESS;
	}

	public String getMoneypot() {
		return moneypot;
	}

	public void setMoneypot(String moneypot) {
		this.moneypot = moneypot;
	}

}
