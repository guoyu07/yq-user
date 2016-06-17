package com.yq.user.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class ManagerLogin extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String pa;

	public String execute() {

		UserService aus = ServiceCacheFactory.getServiceCache()
				.getService(UserService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		Gcuser au = aus.loginByManager(sessionhttp.getId(), id, pa,ServletActionContext.getRequest().getRemoteAddr());
		if (au == null) {
			super.setErroCodeNum(3);
			super.setErroDescrip("登录失败，用户名或密码错误");
			return SUCCESS;
		} else {
			if(au.getGanew()!=0){
//				super.setErroCodeNum(4);//重定向去修改用户信息
				return "upuser";
			}
			//扫描重置vip名称
			try {
				aus.resetVip(au.getUsername());
			} catch (Exception e) {
				LogSystem.error(e, "重置vip名称出错!~~~");
			}
			return SUCCESS;
		}
	}

	public String getErroDescrip() {
		return super.getErroDescrip();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPa() {
		return pa;
	}

	public void setPa(String pa) {
		this.pa = pa;
	}

}
