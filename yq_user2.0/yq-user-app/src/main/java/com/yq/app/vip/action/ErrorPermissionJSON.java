package com.yq.app.vip.action;

import com.sr178.module.web.action.JsonBaseActionSupport;

public class ErrorPermissionJSON extends JsonBaseActionSupport{  
	private static final long serialVersionUID = 1L;
	public String noPermission(){
    	return this.renderObjectResult("noPermission");
    }  
    public String noLogin(){  
    	return this.renderObjectResult("nologin");
    }  
      
}  