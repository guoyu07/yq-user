package com.yq.app.app.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
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
}
