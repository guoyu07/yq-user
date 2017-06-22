package com.yq.app.vip.interceptor;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.interceptor.AbstractUserVisitSpeedInterceptor;
import com.sr178.module.web.session.Session;
import com.yq.user.service.UserService;

public class WebRedisSessiontVipVisitSpeedInterceptor extends AbstractUserVisitSpeedInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void saveSession(Session userSession) {
		UserService aus = ServiceCacheFactory.getServiceCache()
				.getService(UserService.class);
		aus.setVipTokenSession(userSession.getSessionId(), userSession);
	}
	@Override
	public void afterTrigger(Session userSession) {
		UserService aus = ServiceCacheFactory.getServiceCache()
				.getService(UserService.class);
		aus.delVipTokenSession(userSession.getSessionId());
	}
}
