package com.yq.app.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class ChangeStatsForShopAction extends ALDAdminActionSupport implements ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String states;
	private String ybuser;
	private HttpServletResponse response; 
	public String execute(){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		UserService userService = ServiceCacheFactory.getService(UserService.class);
        PrintWriter pw=null;
        try {  
            pw = response.getWriter();  
            pw.write(userService.ybts(ybuser, states));  
        } catch (IOException e) {  
            LogSystem.error(e,e.getMessage());  
        }  
        pw.flush();  
        pw.close();  
        return null;  
	}
	public String getStates() {
		return states;
	}
	public void setStates(String states) {
		this.states = states;
	}
	public String getYbuser() {
		return ybuser;
	}
	public void setYbuser(String ybuser) {
		this.ybuser = ybuser;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;
	}
}
