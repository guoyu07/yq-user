package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class Ypqgks extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int epsl;//价格
	
	private int cpbh;//商品id  42开始   ---》54
	//返回的错误 提示中的内容
	private int dqep;
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		int result = userService.yqQg(super.getUserName(), cpbh, 1, 1);
		if(result>0){
			dqep = result;
			super.setErroCodeNum(3);
		}
		
		return SUCCESS;
	}

	public int getEpsl() {
		return epsl;
	}


	public void setEpsl(int epsl) {
		this.epsl = epsl;
	}


	public int getCpbh() {
		return cpbh;
	}


	public void setCpbh(int cpbh) {
		this.cpbh = cpbh;
	}


	public int getDqep() {
		return dqep;
	}


	public void setDqep(int dqep) {
		this.dqep = dqep;
	}

}
