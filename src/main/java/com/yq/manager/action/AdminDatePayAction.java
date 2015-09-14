package com.yq.manager.action;


import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datepay;
import com.yq.user.service.LogService;

public class AdminDatePayAction extends ALDAdminPageActionSupport<Datepay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer beizhu;
	
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		IPage<Datepay> page = logService.getAdminDatePayListPage((beizhu==null||beizhu==0)?null:beizhu, super.getToPage(), 50);
		
		super.initPage(page);
		
		return SUCCESS;
	}

	public Integer getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(Integer beizhu) {
		this.beizhu = beizhu;
	}
	
	
	
}
