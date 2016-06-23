package com.yq.admin.manager.interceptor;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.session.Session;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class AdminInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		AdminService admin = ServiceCacheFactory.getServiceCache()
				.getService(AdminService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		Session session = admin.getLoginAdminUserName(sessionhttp.getId());
		if(session==null){
			return "nologin"; 
		}
		String userName = session.getUserName();
		if (userName==null) {
			return "nologin";
		} else {
			ALDAdminActionSupport aldAction = null;
			Object obj = actionInvocation.getAction();
			if (obj instanceof ALDAdminActionSupport) {
				aldAction = (ALDAdminActionSupport) obj;
				aldAction.setUserName(userName);
				aldAction.setUserSession(session);
			} else {
				String className = obj.getClass().getCanonicalName();
				throw new RuntimeException("ACTION继承的类非ALDAdminActionSupport"+className);
			}
			//兼容以前的设置
			if(aldAction.getErrorResult()==null){
				aldAction.setErrorResult("success");
			}
			
			return actionInvocation.invoke();
		}
	}
}