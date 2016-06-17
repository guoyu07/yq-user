package com.yq.app.user.action;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.NotAllowedCode;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Dgag;
import com.yq.user.bo.Gcuser;
import com.yq.user.dao.TxPayDao;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class ManagerAction extends ALDAdminPageActionSupport<Dgag> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String dq;
	//<script language=javascript>alert('您有认购他人一币还没有付款，请尽快完成付款！');location.replace('../vip/epmyjl.asp');</script>
	private boolean isHaveTxPayBuy;
	//<script language=javascript>alert('您的一币卖出已有他人收购并给您付款，请你尽快查收并及时确认，如有问题联系客服！');location.replace('../vip/epmcjl.asp');</script>
	private boolean isHaveTxPaySale;
	
	private Gcuser gcuserup;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		Gcuser gcuserb = userService.getUserByUserName(super.getUserName());
		
		gcuserup = userService.getUserByUserName(gcuserb.getVipname());
		
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		IPage<Dgag> page =managerService.getDgagPageList(super.getToPage(), 5);
		super.initPage(page);
		
		
		@NotAllowedCode
		TxPayDao txPayDao = ServiceCacheFactory.getServiceCache().getService(TxPayDao.class);
		dq = gcuserb.getDqu()+"";
		isHaveTxPayBuy = txPayDao.getTxPayByDfuser(gcuserb.getUsername(), 1)==null?false:true;
		if(!isHaveTxPayBuy){
			isHaveTxPaySale = txPayDao.getTxPayByPayUserName(gcuserb.getUsername(), 2)==null?false:true;
			if(isHaveTxPaySale){
				return SUCCESS;
			}
		}else{
			return SUCCESS;
		}
		
		return SUCCESS;
	}
	public Gcuser getGcuserup() {
		return gcuserup;
	}
	public void setGcuserup(Gcuser gcuserup) {
		this.gcuserup = gcuserup;
	}
	public String getDq() {
		return dq;
	}
	public void setDq(String dq) {
		this.dq = dq;
	}
	public boolean getIsHaveTxPayBuy() {
		return isHaveTxPayBuy;
	}
	public void setIsHaveTxPayBuy(boolean isHaveTxPayBuy) {
		this.isHaveTxPayBuy = isHaveTxPayBuy;
	}
	public boolean getIsHaveTxPaySale() {
		return isHaveTxPaySale;
	}
	public void setIsHaveTxPaySale(boolean isHaveTxPaySale) {
		this.isHaveTxPaySale = isHaveTxPaySale;
	}
	
	
}
