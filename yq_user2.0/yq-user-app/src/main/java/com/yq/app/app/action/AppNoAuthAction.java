package com.yq.app.app.action;

import java.util.HashMap;
import java.util.Map;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.app.service.AppService;


public class AppNoAuthAction extends AppBaseActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 登录接口
	 */
	private String user;
	private String passWord;
	public String login(){
		Map<String,String> result = new HashMap<String,String>();
		AppService appService = ServiceCacheFactory.getService(AppService.class);
		result.put("tokenId", appService.login(user, passWord));
        return renderObjectResult(result);
	}
	
    private String orderUserName;
	private String appId;
	private String amount;
	private String productOrder;
	private String productDesc;
	private String param;
	private String sign;
	public String creatOrder(){
		
		AppService appService = ServiceCacheFactory.getService(AppService.class);
		
		
		return null;
	}
	
	
	

	
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}





	public String getOrderUserName() {
		return orderUserName;
	}





	public void setOrderUserName(String orderUserName) {
		this.orderUserName = orderUserName;
	}





	public String getAppId() {
		return appId;
	}





	public void setAppId(String appId) {
		this.appId = appId;
	}





	public String getAmount() {
		return amount;
	}





	public void setAmount(String amount) {
		this.amount = amount;
	}










	public String getProductOrder() {
		return productOrder;
	}





	public void setProductOrder(String productOrder) {
		this.productOrder = productOrder;
	}





	public String getParam() {
		return param;
	}





	public void setParam(String param) {
		this.param = param;
	}





	public String getProductDesc() {
		return productDesc;
	}





	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}





	public String getSign() {
		return sign;
	}





	public void setSign(String sign) {
		this.sign = sign;
	}
	
}
