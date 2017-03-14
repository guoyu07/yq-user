package com.yq.admin.business.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.session.Session;
import com.yq.business.service.BusinessService;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.bean.Resource;
import com.yq.manage.service.ManageService;

public class BusinessInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		BusinessService businessService = ServiceCacheFactory.getServiceCache()
				.getService(BusinessService.class);
		ManageService manageService = ServiceCacheFactory.getServiceCache()
				.getService(ManageService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		Session session = businessService.getLoginAdminUserName(sessionhttp.getId());
		
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

				HttpServletRequest request=ServletActionContext.getRequest();
				String path=request.getRequestURI();
				
				Resource resource = manageService.getResourceByUrl(path);
				boolean isSecurity = false;
				if(resource!=null){
					if(resource.getSecurity()==1){
						isSecurity = manageService.isSecurity(userName,resource.getId());
						if(!isSecurity){
							return "noPermission"; 
						}
					}
				}
				
				
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
