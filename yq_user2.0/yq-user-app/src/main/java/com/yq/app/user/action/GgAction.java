package com.yq.app.user.action;

import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.NotAllowedCode;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Dgag;
import com.yq.user.bo.Gcuser;
import com.yq.user.dao.TxPayDao;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;
/**
 * 公告列表
 * @author ThinkPad User
 *
 */
public class GgAction extends ALDAdminPageActionSupport<Dgag> {
 
	private static final long serialVersionUID = 1L;
	
	private String dq;
	//<script language=javascript>alert('您有认购他人一币还没有付款，请尽快完成付款！');location.replace('../vip/epmyjl.asp');</script>
	private boolean isHaveTxPayBuy;
	//<script language=javascript>alert('您的一币卖出已有他人收购并给您付款，请你尽快查收并及时确认，如有问题联系客服！');location.replace('../vip/epmcjl.asp');</script>
	private boolean isHaveTxPaySale;
	
	private Gcuser gcuser;
	public String execute(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		@NotAllowedCode
		TxPayDao txPayDao = ServiceCacheFactory.getServiceCache().getService(TxPayDao.class);
		dq = gcuser.getDqu()+"";
		isHaveTxPayBuy = txPayDao.getTxPayByDfuser(gcuser.getUsername(), 1)==null?false:true;
		if(!isHaveTxPayBuy){
			isHaveTxPaySale = txPayDao.getTxPayByPayUserName(gcuser.getUsername(), 2)==null?false:true;
			if(isHaveTxPaySale){
				return SUCCESS;
			}
		}else{
			return SUCCESS;
		}
		
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		IPage<Dgag> page =managerService.getDgagPageList(super.getToPage(), 20);
		super.initPage(page);
		return SUCCESS;
	}

	public List<Dgag> getDgagList() {
		return super.getDataList();
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

	public void setHaveTxPayBuy(boolean isHaveTxPayBuy) {
		this.isHaveTxPayBuy = isHaveTxPayBuy;
	}

	public boolean getIsHaveTxPaySale() {
		return isHaveTxPaySale;
	}

	public void setHaveTxPaySale(boolean isHaveTxPaySale) {
		this.isHaveTxPaySale = isHaveTxPaySale;
	}
}
