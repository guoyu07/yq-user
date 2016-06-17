package com.yq.admin.cservice.action;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.cservice.service.CsService;

public class CsLoginAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String csUserName;
	private String passWord;
	private int status;
	private String dl;
	public String execute(){
		if(status==0){
			return SUCCESS;
		}
		CsService csService = ServiceCacheFactory.getServiceCache().getService(CsService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		if(csService.csLogin(csUserName, passWord, sessionhttp.getId())){
			return "redirect";
		}else{
			super.setErroCodeNum(1);
			super.setErroDescrip("用户名或密码错误！");
			return SUCCESS;
		}
		
	}
	
	public String getDl() {
		return dl;
	}

	public void setDl(String dl) {
		this.dl = dl;
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
