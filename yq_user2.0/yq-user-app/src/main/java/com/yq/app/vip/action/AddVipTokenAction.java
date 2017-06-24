package com.yq.app.vip.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.session.Session;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.Global;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class AddVipTokenAction extends ALDAdminActionSupport{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String inputUrl;
	
	private Gcuser farenUser;
	
	private Gcuser gcuser;
	
	private String smsCode;
	
	@Override
	public String execute() throws Exception {
		HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);	
		gcuser = userService.getUserByUserName(super.getUserName());
		if(gcuser.getVip()==0){
			super.setErroCodeNum(2003);
			super.setErroDescrip("您不是vip账户！");
			return SUCCESS;
		}
		if(gcuser.getVip()==2){
			farenUser = userService.getUserByUserName(userService.getUserProperty(super.getUserName()).getFaren());
				if(farenUser!=null){
					if(!Strings.isNullOrEmpty(smsCode)){
						if(!smsCode.equals(farenUser.getVipsq())){
							super.setErroCodeNum(2001);
							super.setErroDescrip("短信验证码不正确！");
							return SUCCESS;
						}
					}else{
						super.setErroCodeNum(2001);
						super.setErroDescrip("短信验证码不正确！");
						return SUCCESS;
					}
					
				}else{
					super.setErroCodeNum(2002);
					super.setErroDescrip("法人不存在！");
					return SUCCESS;
				}
		}else{
			if(!Strings.isNullOrEmpty(smsCode)){
				if(!smsCode.equals(gcuser.getVipsq())){
					super.setErroCodeNum(2001);
					super.setErroDescrip("短信验证码不正确！");
					return SUCCESS;
				}
			}else{
				super.setErroCodeNum(2001);
				super.setErroDescrip("短信验证码不正确！");
				return SUCCESS;
			}
		}
		if(gcuser.getVip()!=0){//vip用户给予大门
			Session vipSessionBean = new Session(super.getUserName(), System.currentTimeMillis(),ServletActionContext.getRequest().getRemoteAddr());
			userService.setVipSession(sessionhttp.getId(), vipSessionBean);
		}
		if(gcuser.getVip()==2){
			userService.updateSmsCode(farenUser.getUsername(), Global.INIT_SMS_CODE);
		}else{
			userService.updateSmsCode(gcuser.getUsername(), Global.INIT_SMS_CODE);
		}
		super.setErroCodeNum(2000);
		return SUCCESS;
	}

	public String getInputUrl() {
		return inputUrl;
	}

	public void setInputUrl(String inputUrl) {
		this.inputUrl = inputUrl;
	}

	public Gcuser getFarenUser() {
		return farenUser;
	}

	public void setFarenUser(Gcuser farenUser) {
		this.farenUser = farenUser;
	}

	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public String getSmsCode() {
		return smsCode;
	}

	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}
	
	
}