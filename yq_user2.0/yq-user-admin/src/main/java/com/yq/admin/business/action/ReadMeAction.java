package com.yq.admin.business.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.business.service.BusinessService;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datepay;

public class ReadMeAction extends ALDAdminPageActionSupport<Datepay>{

	private static final long serialVersionUID = 1L;
	
	
	public String execute(){
		BusinessService businessService = ServiceCacheFactory.getService(BusinessService.class);
		super.initPage(businessService.getYbDetail(super.getUserName(), 27,super.getToPage()));
		return SUCCESS;
		
	}
	

}
