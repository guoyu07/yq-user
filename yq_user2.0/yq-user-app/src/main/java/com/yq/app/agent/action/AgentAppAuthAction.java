package com.yq.app.agent.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.JsonBaseActionSupport;
import com.yq.app.bean.SimpleUserInfoBean;
import com.yq.app.service.AppService;

public class AgentAppAuthAction extends JsonBaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 验证是否登录成功
	 * @return
	 */
	public String verifyUserLogin(){
		return this.renderSuccessResult();
	}
	/**
	 * 获取用户简要信息
	 * @return
	 */
	public String getUserSimpInfo(){
		AppService appService = ServiceCacheFactory.getService(AppService.class);
		return this.renderObjectResult(SimpleUserInfoBean.getSimpleByGcuser(appService.getUserInfo(super.getUserName())));
	}
	
}
