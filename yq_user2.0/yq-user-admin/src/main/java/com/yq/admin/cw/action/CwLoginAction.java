package com.yq.admin.cw.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.cw.service.CwService;

public class CwLoginAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
		private String csUserName;
		private String passWord;
		private int status;
		
		public String execute(){
			if(status==0){
				return SUCCESS;
			}
			CwService cwService = ServiceCacheFactory.getServiceCache().getService(CwService.class);
			HttpSession sessionhttp = ServletActionContext.getRequest()
					.getSession();
			if(cwService.cwLogin(csUserName, passWord, sessionhttp.getId())){
				return "redirect";
			}else{
				super.setErroCodeNum(1);
				super.setErroDescrip("用户名或密码错误！");
				return SUCCESS;
			}
			
		}

		public String getCsUserName() {
			return csUserName;
		}

		public void setCsUserName(String csUserName) {
			this.csUserName = csUserName;
		}

		public String getPassWord() {
			return passWord;
		}

		public void setPassWord(String passWord) {
			this.passWord = passWord;
		}

		public int getStatus() {
			return status;
		}

		public void setStatus(int status) {
			this.status = status;
		}

		
}
