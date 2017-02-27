package com.yq.app.agent.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.JsonBaseActionSupport;
import com.yq.agent.bean.PointChangeDetail;
import com.yq.agent.bean.PointChangeInfo;
import com.yq.agent.bean.SameAccount;
import com.yq.agent.bean.SameAccountWealth;
import com.yq.agent.bean.UserPersonalInfoBean;
import com.yq.agent.bean.UserPointSplitDetail;
import com.yq.agent.service.AgentService;

public class AgentAppPersonalNoAuthAction extends JsonBaseActionSupport{

	private static final long serialVersionUID = 1L;
	
	
	private String appId;
	private String user;
	private String passWord;	  	//登录密码
	private String secondPassWord;	//二级密码
	private String param;
	private String sign;
	
	
	public String userPersonalInfo(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		//TODO 驗證
		agentService.checkSign(appId,user, param, sign);
		return this.renderObjectResult(UserPersonalInfoBean.getUserPersonalInfoBeanByGcuser(agentService.getUserInfo(appId, user,param,sign)));
	}

	
	public String pointChangeinfo(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		return this.renderObjectResult(PointChangeInfo.getPointChangeInfo(agentService.getPointsChangeLog(appId, param, sign)));
	}

	
	private int currentPage;
	private int pageSize;
	public String getSameUserPersonalInfo(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		agentService.checkSign(appId,user, param, sign);
		return this.renderPageResult(SameAccount.getPageSameUserPersonalInfo(agentService.getSameUserInfo(user,currentPage, pageSize)));
	}
	
	
	public String userPointChangeDetail(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		agentService.checkSign(appId,user, param, sign);
		return this.renderPageResult(PointChangeDetail.getPointChangeDetail(agentService.getPointDetail(user,currentPage, pageSize)));
	}
	
	
	public String userPointSplitDetail(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		agentService.checkSign(appId,user, param, sign);
		return this.renderPageResult(UserPointSplitDetail.getPointSplitDetail(agentService.getUserPointSplitDetail(user,currentPage, pageSize)));
		
	}
	
	public String getSameUserTotalWealth(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		agentService.checkSign(appId,user, param, sign);
		return this.renderObjectResult(agentService.getSameAccountWealth(user));
	}
	
	public String getAppId() {
		return appId;
	}


	public void setAppId(String appId) {
		this.appId = appId;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public String getParam() {
		return param;
	}


	public void setParam(String param) {
		this.param = param;
	}


	public String getSign() {
		return sign;
	}


	public void setSign(String sign) {
		this.sign = sign;
	}


	public String getPassWord() {
		return passWord;
	}


	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}


	public String getSecondPassWord() {
		return secondPassWord;
	}


	public void setSecondPassWord(String secondPassWord) {
		this.secondPassWord = secondPassWord;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	
	
}
