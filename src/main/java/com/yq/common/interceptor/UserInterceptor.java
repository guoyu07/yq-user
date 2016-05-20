package com.yq.common.interceptor;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.exception.ServiceException;
import com.yq.user.action.SmsAction;
import com.yq.user.action.UpdateUserAction;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class UserInterceptor extends BaseInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		// TODO Auto-generated method stub
		//HttpSession session = ServletActionContext.getRequest().getSession();
        //String sessionID = session.getId();
		UserService aus = ServiceCacheFactory.getServiceCache()
				.getService(UserService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		String userName = aus.isLogin(sessionhttp.getId());
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
			
			Gcuser gcuser = aus.getUserByUserName(userName);
			if(gcuser.getGanew()!=0&&!(obj instanceof UpdateUserAction)&&!(obj instanceof SmsAction)){
//				super.setErroCodeNum(4);//重定向去修改用户信息
				return "upuserg";
			}
			String msgTag =super.getMsgTag()+"[userName]=["+userName+"],";
			// 异常处理
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
