package com.yq.common.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.exception.ServiceException;

public class NoLoginInterceptor extends BaseInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		String result = null;
		try {
			result = invocation.invoke();
		} catch (Exception e) {
			ALDAdminActionSupport aldAction = null;
			Object obj = invocation.getAction();
			if (obj instanceof ALDAdminActionSupport) {
				aldAction = (ALDAdminActionSupport) obj;
				if(e instanceof ServiceException){
					ServiceException exception = (ServiceException)e;
					aldAction.setErroCodeNum(exception.getCode());
					LogSystem.info(exception.getMessage());
					return "success";
				}else{
					LogSystem.error(e, "");
					aldAction.setErroCodeNum(8888);
					return "glober_error";
				}
			}else{
				LogSystem.error(e, "");
				return "glober_error";
			}
		}
		return result;
	}

}
