package com.yq.app.vip.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.module.web.action.BaseActionSupport;

public class NoLoginInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		Object obj = invocation.getAction();
		if (obj instanceof BaseActionSupport) {
			return invocation.invoke();
		}else{
			String className = obj.getClass().getCanonicalName();
			throw new RuntimeException("ACTION继承的类非BaseActionSupport"+className);
		}
	}

}
