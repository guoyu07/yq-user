package com.yq.app.action;

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
}
