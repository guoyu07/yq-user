package com.yq.common.interceptor;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.exception.ServiceException;

/**
 * struts异常拦截器
 * 
 * @author mc
 * 
 */
public class StrutsExceptionInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> map=invocation.getInvocationContext().getParameters();  
        Set<String> keys = map.keySet();  
                Iterator<String> iters = keys.iterator();  
                while(iters.hasNext()){  
                    String key = iters.next();  
                    Object value = map.get(key);  
                    map.put(key, transactSQLInjection((String[])value));  
                }  
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
					if(exception.getCode()==1860){
						return "glober_alert";
					}
					throw e;
				}else{
//					LogSystem.error(e, "");
//					aldAction.setErroCodeNum(8888);
//					return "glober_error";
					throw e;
				}
			}else{
				throw e;
			}
		}
		return result;
	}
	
	public String[] transactSQLInjection(String[] str)
	{
		for(int i=0;i<str.length;i++){
			str[i] = str[i].replaceAll("'", "");
			str[i] = str[i].replaceAll("SELECT", "");
			str[i] = str[i].replaceAll("select", "");
			str[i] = str[i].replaceAll("update", "");
			str[i] = str[i].replaceAll("UPDATE", "");
			str[i] = str[i].replaceAll("CASE", "");
			str[i] = str[i].replaceAll("case", "");
			str[i] = str[i].replaceAll("WHEN", "");
			str[i] = str[i].replaceAll("when", "");
			str[i] = str[i].replaceAll("drop", "");
			str[i] = str[i].replaceAll("DROP", "");
			str[i] = str[i].replaceAll("alert", "");
			str[i] = str[i].replaceAll("ALERT", "");
		}
	    return str;
	}
}
