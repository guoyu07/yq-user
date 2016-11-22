package com.yq.common.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.config.ConfigLoader;
import com.yq.common.action.ALDAdminActionSupport;

public class NoLoginInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		Object obj = invocation.getAction();
		if (obj instanceof ALDAdminActionSupport) {
			ALDAdminActionSupport aldAction = (ALDAdminActionSupport) invocation.getAction();
			//兼容以前的设置
			if(aldAction.getErrorResult()==null){
				aldAction.setErrorResult("success");
			}
			aldAction.setRedirectBaseUrl(ConfigLoader.getStringValue("redirect_base_url"));
			return invocation.invoke();
		}else{
			//不支持这种方式 直接中断
			String className = obj.getClass().getCanonicalName();
			throw new RuntimeException("ACTION继承的类非ALDAdminActionSupport"+className);
		}
//		String result = null;
//		try {
//			result = invocation.invoke();
//		} catch (Exception e) {
//			ALDAdminActionSupport aldAction = null;
//			Object obj = invocation.getAction();
//			if (obj instanceof ALDAdminActionSupport) {
//				aldAction = (ALDAdminActionSupport) obj;
//				if(e instanceof ServiceException){
//					ServiceException exception = (ServiceException)e;
//					aldAction.setErroCodeNum(exception.getCode());
//					LogSystem.info(exception.getMessage());
//					return "success";
//				}else{
//					LogSystem.error(e, "");
//					aldAction.setErroCodeNum(8888);
//					return "glober_error";
//				}
//			}else{
//				LogSystem.error(e, "");
//				return "glober_error";
//			}
//		}
//		return result;
	}

}
