package com.yq.cw.interceptor;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.cw.service.CwService;

public class CwInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		//HttpSession session = ServletActionContext.getRequest().getSession();
        //String sessionID = session.getId();
		CwService cw = ServiceCacheFactory.getServiceCache()
				.getService(CwService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		String userName = cw.getLoginCwUserName(sessionhttp.getId());
		if (userName==null) {
			return "nologin";
		} else {
//			Gcuser user = aus.getUserByUserName(userName);
			ALDAdminActionSupport aldAction = null;
			Object obj = actionInvocation.getAction();
			if (obj instanceof ALDAdminActionSupport) {
				aldAction = (ALDAdminActionSupport) obj;
				aldAction.setUserName(userName);
			} else {
				String className = obj.getClass().getCanonicalName();
				throw new RuntimeException("ACTION继承的类非ALDAdminActionSupport"+className);
			}
			// 异常处理
			String result = actionInvocation.invoke();
			return result;
		
		}
	}
}
