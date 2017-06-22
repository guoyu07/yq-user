package com.yq.app.vip.interceptor;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.config.ConfigLoader;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.session.Session;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class VipUserInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Gcuser gcuser;
	
	private Gcuser farenUser;
	
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		UserService aus = ServiceCacheFactory.getServiceCache()
				.getService(UserService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		Session vipSession = aus.getVipSession(sessionhttp.getId());
		Session userSession = aus.getVipTokenSession(sessionhttp.getId());
		
		gcuser = aus.getUserByUserName(userSession.getUserName());
		
		if(gcuser.getVip()==2){
			farenUser = aus.getUserByUserName(aus.getUserProperty(userSession.getUserName()).getFaren());
			if(farenUser==null){
				return "noFaren";
			}
			if(!Strings.isNullOrEmpty(farenUser.getCall())){
				int callLenght = farenUser.getCall().length();
				String callLeft = farenUser.getCall().substring(0, 3);
				String CallRight = farenUser.getCall().substring(callLenght-3, callLenght);
				farenUser.setCall(callLeft+"*****"+CallRight);
			}
		}
		
		if(!Strings.isNullOrEmpty(gcuser.getCall())){
			int callLenght = gcuser.getCall().length();
			String callLeft = gcuser.getCall().substring(0, 3);
			String CallRight = gcuser.getCall().substring(callLenght-3, callLenght);
			gcuser.setCall(callLeft+"*****"+CallRight);
		}
		
		if (vipSession==null) {
			return "noVipToken";
		} else {
			String userName = vipSession.getUserName();
			
			if(userName==null){
				return "noVipToken";
			}
			ALDAdminActionSupport aldAction = null;
			Object obj = actionInvocation.getAction();
			if (obj instanceof ALDAdminActionSupport) {
				aldAction = (ALDAdminActionSupport) obj;
				aldAction.setUserSession(vipSession);
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

	public Gcuser getFarenUser() {
		return farenUser;
	}

	public void setFarenUser(Gcuser farenUser) {
		this.farenUser = farenUser;
	}
	
	
}
