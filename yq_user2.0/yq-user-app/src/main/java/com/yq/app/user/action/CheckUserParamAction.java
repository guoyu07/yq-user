package com.yq.app.user.action;

import java.util.HashMap;
import java.util.Map;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;


/**检测玩家属性等参数Action*/
public class CheckUserParamAction extends ALDAdminActionSupport  {

	private static final long serialVersionUID = 1L;
	
	private String toUserName;
	private int status;
	private String inputCall;
	private String username;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==8){//验证手机号
			Map<String, String> param= new HashMap<>();
			param.put("call", inputCall);
			userService.checkUserInfo(toUserName,param);
			return "success";
		}
		return "success";
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getInputCall() {
		return inputCall;
	}

	public void setInputCall(String inputCall) {
		this.inputCall = inputCall;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	
}
