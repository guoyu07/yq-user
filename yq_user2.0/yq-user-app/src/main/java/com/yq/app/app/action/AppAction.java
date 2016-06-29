package com.yq.app.app.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.app.bean.SimpleUserInfoBean;
import com.yq.app.service.AppService;

public class AppAction extends AppBaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 获取用户信息
	 * @return
	 */
	public String getUserInfo(){
		AppService appService = ServiceCacheFactory.getService(AppService.class);
		return this.renderObjectResult(appService.getUserInfo(super.getLoginUser()));
	}
	/**
	 * 获取用户简要信息
	 * @return
	 */
	public String getUserSimpInfo(){
		AppService appService = ServiceCacheFactory.getService(AppService.class);
		return this.renderObjectResult(SimpleUserInfoBean.getSimpleByGcuser(appService.getUserInfo(super.getLoginUser())));
	}
	
	/**
	 * 验证是否登录成功
	 * @return
	 */
	public String verifyUserLogin(){
		return this.renderSuccessResult();
	}
	/**
	 * 一币支付接口
	 */
	private String orderId;
	private String sPassword;
	public String payOrder(){
		
		
		return null;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
}
