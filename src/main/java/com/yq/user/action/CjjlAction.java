package com.yq.user.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datepay;
import com.yq.user.service.LogService;

public class CjjlAction extends ALDAdminPageActionSupport<Datepay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String dl;
	
	private String cj;
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		String lookUserName = super.getUserName();
		if(!Strings.isNullOrEmpty(cj)){
			lookUserName = cj;
		}
		super.initPage(logService.getDatePayChargeListPage(lookUserName, super.getToPage(), 30));
		return SUCCESS;
	}
	
	public String getDl() {
		return dl;
	}
	public void setDl(String dl) {
		this.dl = dl;
	}
	public String getCj() {
		return cj;
	}

	public void setCj(String cj) {
		this.cj = cj;
	}
	
}
