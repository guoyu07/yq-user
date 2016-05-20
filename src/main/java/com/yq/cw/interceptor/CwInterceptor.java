package com.yq.cw.interceptor;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.exception.ServiceException;
import com.yq.common.interceptor.BaseInterceptor;
import com.yq.cw.service.CwService;

public class CwInterceptor extends BaseInterceptor {

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
			String msgTag =super.getMsgTag()+"[userName]=["+userName+"],";
						try {
							String result = actionInvocation.invoke();
							if(aldAction.getErroCodeNum()!=0){
								LogSystem.info(msgTag+"code="+aldAction.getErroCodeNum()+",msg=["+aldAction.getErroDescrip()+"]");
							}
							return result;
						} catch (Exception e) {
							if(e instanceof ServiceException){
								ServiceException exception = (ServiceException)e;
								aldAction.setErroCodeNum(exception.getCode());
								LogSystem.info(msgTag+exception.getMessage());
								return "success";
							}else{
								LogSystem.error(e, msgTag);
								aldAction.setErroCodeNum(8888);
								return "glober_error";
							}
						}
		
		}
	}
}
