package com.yq.app.vip.action;

import java.util.List;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Txpay;
import com.yq.user.service.UserService;

public class EpmyjlAction extends ALDAdminPageActionSupport<Txpay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		super.setDataList(userService.getTxpayBuyDetailsPage(super.getUserName(), super.getToPage(),super.getPageSize()));
        super.setErroCodeNum(2000);
        return SUCCESS;
	}
	public String epmyjlmrdetail(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		super.initPage(userService.getTxpayBuyDetailsPage(super.getUserName(), super.getToPage(), 10));
		return "mrdetail";
	}
	
	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getToPage() {
		return super.getToPage();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}

	public long getTotalSize() {
		return super.getTotalSize();
	}
	
	public List<Txpay> getDataList() {
		return super.getDataList();
	}

	public int getPageSize() {
		return super.getPageSize();
	}
	
	
	
}
