package com.yq.app.agent.interceptor;

import java.util.Map;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.BaseActionSupport;
import com.sr178.module.web.action.JsonBaseActionSupport;
import com.yq.agent.service.AgentService;
import com.yq.app.service.AppService;

public class AgentLoginInterceptor extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		JsonBaseActionSupport aldAction = null;
		Object obj = actionInvocation.getAction();
		if (obj instanceof JsonBaseActionSupport) {
			aldAction = (JsonBaseActionSupport)obj;
			Map<String,Object> map = actionInvocation.getInvocationContext().getParameters();
			Object values = map.get("tokenId");
			String tokenId = values==null?null:((String[])values)[0];
			AgentService aus = ServiceCacheFactory.getServiceCache()
					.getService(AgentService.class);
			String userName = aus.isLogin(tokenId);
			if(userName==null){
				return aldAction.renderErrorResult(100, "token已失效！");
			}else{
				aldAction.setUserName(userName);
				aldAction.setTokenId(tokenId);
			}
			return actionInvocation.invoke();
		}else{
			//不支持这种方式 直接中断
			String className = obj.getClass().getCanonicalName();
			throw new RuntimeException("ACTION继承的类非JsonBaseActionSupportt"+className);
		}
	}

}
