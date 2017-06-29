package com.yq.app.vip.interceptor;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.config.ConfigLoader;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.JsonBaseActionSupport;
import com.sr178.module.web.session.Session;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class VIPInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Gcuser gcuser;
	private String islogin;
	
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		UserService aus = ServiceCacheFactory.getServiceCache()
				.getService(UserService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		Session userSession = aus.getVipTokenSession(sessionhttp.getId());
		if (userSession==null ) {
			return "nologin";
		} else {
			String userName = userSession.getUserName();
			
			if(userName==null){
				return "nologin";
			}
			gcuser = aus.getUserByUserName(userName);
			if(gcuser.getVip()==0){
				return "noPermission";
			}
			
			ALDAdminActionSupport aldAction = null;
			Object obj = actionInvocation.getAction();
			if (obj instanceof ALDAdminActionSupport) {
				aldAction = (ALDAdminActionSupport) obj;
				aldAction.setUserSession(userSession);
				aldAction.setUserName(userName);
				aldAction.setRedirectBaseUrl(ConfigLoader.getStringValue("redirect_base_url"));
			} else {
				String className = obj.getClass().getCanonicalName();
				throw new RuntimeException("ACTION继承的类非ALDAdminActionSupport"+className);
			}
//			Gcuser gcuser = aus.getUserByUserName(userName);
//			if(gcuser.getGanew()!=0&&!(obj instanceof UpdateUserAction)&&!(obj instanceof SmsAction)){
//				return "upuserg";
//			}
			//兼容以前的设置
			if(aldAction.getErrorResult()==null){
				aldAction.setErrorResult("success");
			}
			return actionInvocation.invoke();
		}
	}

	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public String getIslogin() {
		return islogin;
	}

	public void setIslogin(String islogin) {
		this.islogin = islogin;
	}

	
	
	
}
