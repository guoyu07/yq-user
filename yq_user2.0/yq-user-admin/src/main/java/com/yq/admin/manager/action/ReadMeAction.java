package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.NotAllowedCode;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.dao.TxPayDao;

public class ReadMeAction extends ALDAdminActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute(){
		
		@NotAllowedCode
		TxPayDao txPayDao = ServiceCacheFactory.getServiceCache().getService(TxPayDao.class);
		
		if(txPayDao.getByPayOnoff("尚未转账")!=null){
			super.setErroCodeNum(100);
		}
		
		return SUCCESS;
	}
}
