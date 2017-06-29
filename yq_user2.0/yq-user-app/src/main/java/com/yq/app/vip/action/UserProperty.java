package com.yq.app.vip.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;
import com.yq.vip.bean.VipUser;

public class UserProperty extends ALDAdminActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String gguser;
	private String callback;
	private VipUser vipuser;
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		vipuser = userService.getVipUserByUserName(super.getUserName());
		super.setErroCodeNum(2002);
		return SUCCESS;
	}
	
	
	public String getCallback() {
		return callback;
	}


	public void setCallback(String callback) {
		this.callback = callback;
	}


	public String getGguser() {
		return gguser;
	}
	public void setGguser(String gguser) {
		this.gguser = gguser;
	}
	public String getErroDescrip() {
		return super.getErroDescrip();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}


	public VipUser getVipuser() {
		return vipuser;
	}


	public void setVipuser(VipUser vipuser) {
		this.vipuser = vipuser;
	}
	
	
}
