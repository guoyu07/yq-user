package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Txpay;

public class EpjyscAction extends ALDAdminPageActionSupport<Txpay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Double sumPayNum;
	
	public String execute(){
		
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);

		sumPayNum = adminService.getSumpayNumOfTxpay();
		super.initPage(adminService.getTxpayPageList(super.getToPage(), 50));
		return SUCCESS;
	}

	public Double getSumPayNum() {
		return sumPayNum;
	}

	public void setSumPayNum(Double sumPayNum) {
		this.sumPayNum = sumPayNum;
	}
}
