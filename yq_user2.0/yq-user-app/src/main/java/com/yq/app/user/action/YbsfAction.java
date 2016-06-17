package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class YbsfAction extends ALDAdminActionSupport {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//商户二级密码
	private String shpa;
	
	private int sfpay;
	
	private String pay10;
	//需要支付的一币数目
	private int ybpay;
	//支付的用户名
	private String user;
	//密码
	private String pa01;
    //用户二级密码	
	private String pa02;
	//手机校验码
	private String sfcode;
	
	private int status;
	
	
	private Gcuser gcuser;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		if(status==0){
			if(gcuser.getJb()!=5){
				super.setErroCodeNum(1);//alert('非商户用户名，请联系管理员！');
			}
			return INPUT;
		}else{
			userService.transferYbToShop(super.getUserName(), shpa, sfpay, pay10, ybpay, user, pa01, pa02, sfcode);
			return SUCCESS;
		}
	}
	
	public int getErroCodeNum(){
		return super.getErroCodeNum();
	}
	
	public Gcuser getGcuser(){
		return gcuser;
	}


	public String getShpa() {
		return shpa;
	}


	public void setShpa(String shpa) {
		this.shpa = shpa;
	}


	public int getSfpay() {
		return sfpay;
	}


	public void setSfpay(int sfpay) {
		this.sfpay = sfpay;
	}


	public String getPay10() {
		return pay10;
	}


	public void setPay10(String pay10) {
		this.pay10 = pay10;
	}


	public int getYbpay() {
		return ybpay;
	}


	public void setYbpay(int ybpay) {
		this.ybpay = ybpay;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public String getPa01() {
		return pa01;
	}


	public void setPa01(String pa01) {
		this.pa01 = pa01;
	}


	public String getPa02() {
		return pa02;
	}


	public void setPa02(String pa02) {
		this.pa02 = pa02;
	}


	public String getSfcode() {
		return sfcode;
	}


	public void setSfcode(String sfcode) {
		this.sfcode = sfcode;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}
	
}
