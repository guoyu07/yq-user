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
		Gcuser user = userService.getUserByUserName(super.getUserName());
		String moneypot = userService.getMoneyPot(super.getUserName());
		if(user!=null){
			if(user.getVip()!=0){
				vipuser = new VipUser();
				vipuser.setUser(user.getUsername());
				vipuser.setUp(user.getUp());
				vipuser.setVip(user.getVip());
				vipuser.setLjjyyb(user.getCbpay());
				vipuser.setYb(user.getPay());
				vipuser.setLjsyyb(user.getTxpay());
				vipuser.setVipyb(user.getVippay());
				vipuser.setCzbye(user.getVipcjcjb());
				vipuser.setCzbljczs(user.getVipljcjb());
				vipuser.setYyczb(user.getVipsycjb());
				vipuser.setBybdb(user.getSyep());
				vipuser.setMoneypot(moneypot);
				vipuser.setSybdb(user.getSybdb());
				super.setErroCodeNum(2000);
				return SUCCESS;
			}else{
				super.setErroCodeNum(2002);
				return SUCCESS;
			}
		}
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
