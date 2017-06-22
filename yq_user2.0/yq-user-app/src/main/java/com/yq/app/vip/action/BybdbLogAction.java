package com.yq.app.vip.action;

import java.util.List;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.SysBiLog;
import com.yq.user.service.LogService;

public class BybdbLogAction extends ALDAdminPageActionSupport<SysBiLog> {

	private static final long serialVersionUID = -1196423120979337071L;

	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
        super.setDataList(logService.getSysBiLogPageList(super.getUserName(), null, null, super.getToPage(), 17));
        super.setErroCodeNum(2000);
        return SUCCESS;
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
	
	public List<SysBiLog> getDataList() {
		return super.getDataList();
	}

	public int getPageSize() {
		return super.getPageSize();
	}
	
	
}
