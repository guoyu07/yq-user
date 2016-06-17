package com.yq.admin.cservice.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.cservice.bean.ChargeStat;
import com.yq.cservice.service.CsService;
import com.yq.user.bo.Datecj;

public class ChargeRecordAction extends ALDAdminPageActionSupport<Datecj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private ChargeStat stat;
	public String execute(){
		CsService csService = ServiceCacheFactory.getService(CsService.class);
		super.initPage(csService.getCsRecordList(super.getUserName(), super.getToPage(), 20));
		stat = csService.getChargeStat(super.getUserName());
		return SUCCESS;
	}
	public ChargeStat getStat() {
		return stat;
	}
	public void setStat(ChargeStat stat) {
		this.stat = stat;
	}
}
