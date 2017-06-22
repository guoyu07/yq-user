package com.yq.app.agent.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.JsonBaseActionSupport;
import com.yq.user.service.UserService;

public class TTAction  extends JsonBaseActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String startDate;
	private String endDate;
	public String tt(){
		
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		return null;//this.renderObjectResult(userService.jb(startDate,endDate));
		
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	

}
