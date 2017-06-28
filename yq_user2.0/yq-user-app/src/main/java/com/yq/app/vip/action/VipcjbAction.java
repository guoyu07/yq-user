package com.yq.app.vip.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.SysBiLog;
import com.yq.user.bo.Vipcjgl;
import com.yq.user.service.UserService;

public class VipcjbAction extends ALDAdminPageActionSupport<Vipcjgl> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Gcuser gcuser;
	private int status;
	private Gcuser farenUser;
	private String smsCode;
	
	private String inputUrl;
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		if(gcuser.getVip()==2){
			farenUser = userService.getUserByUserName(userService.getUserProperty(super.getUserName()).getFaren());
			if(farenUser==null){
				super.setErroCodeNum(2002);
				return SUCCESS;
			}
			if(!Strings.isNullOrEmpty(farenUser.getCall())){
				int callLenght = farenUser.getCall().length();
				String callLeft = farenUser.getCall().substring(0, 3);
				String CallRight = farenUser.getCall().substring(callLenght-3, callLenght);
				farenUser.setCall(callLeft+"*****"+CallRight);
			}
		}
		
		if(!Strings.isNullOrEmpty(gcuser.getCall())){
			int callLenght = gcuser.getCall().length();
			String callLeft = gcuser.getCall().substring(0, 3);
			String CallRight = gcuser.getCall().substring(callLenght-3, callLenght);
			gcuser.setCall(callLeft+"*****"+CallRight);
		}
		HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
		HttpServletRequest request=ServletActionContext.getRequest();
		String vipuserSession = userService.isHasVipToken(sessionhttp.getId());
		if(vipuserSession==null || !vipuserSession.equals(super.getUserName())){
			inputUrl= request.getRequestURI();
			return "noVipToken";
		}
		super.initPage(userService.getVipcjbPageList(super.getUserName(), super.getToPage(), 10));
		if(status==1){
			return "cjbdetail";
		}
		return SUCCESS;
	}
	
	private String cjuser;
	private int cjpay;
	private String cjpass;
	public String cj(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
		HttpServletRequest request=ServletActionContext.getRequest();
		if(gcuser.getVip()==2){
			farenUser = userService.getUserByUserName(userService.getUserProperty(super.getUserName()).getFaren());
			if(farenUser==null){
				super.setErroCodeNum(2002);
				super.setErroDescrip("法人不存在！");
				return SUCCESS;
			}
			if(!Strings.isNullOrEmpty(farenUser.getCall())){
				int callLenght = farenUser.getCall().length();
				String callLeft = farenUser.getCall().substring(0, 3);
				String CallRight = farenUser.getCall().substring(callLenght-3, callLenght);
				farenUser.setCall(callLeft+"*****"+CallRight);
			}
		}
		
		if(!Strings.isNullOrEmpty(gcuser.getCall())){
			int callLenght = gcuser.getCall().length();
			String callLeft = gcuser.getCall().substring(0, 3);
			String CallRight = gcuser.getCall().substring(callLenght-3, callLenght);
			gcuser.setCall(callLeft+"*****"+CallRight);
		}
		
		String vipuserSession = userService.isHasVipToken(sessionhttp.getId());
		if(vipuserSession==null || !vipuserSession.equals(super.getUserName())){
			inputUrl= request.getRequestURI();
			super.setErroCodeNum(2005);
			return SUCCESS;
		}
		if(status==1){
			userService.vipCj(super.getUserName(), cjuser, cjpay, cjpass,farenUser);
			super.setErroCodeNum(2000);
			return SUCCESS;
		}
		return SUCCESS;
	}
	
	public String vipcjbcjbdetail(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		super.setDataList(userService.getVipcjbPageList(super.getUserName(), super.getToPage(), super.getPageSize()));
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

	public String getSmsCode() {
		return smsCode;
	}

	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}

	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public String getCjuser() {
		return cjuser;
	}

	public void setCjuser(String cjuser) {
		this.cjuser = cjuser;
	}

	public int getCjpay() {
		return cjpay;
	}

	public void setCjpay(int cjpay) {
		this.cjpay = cjpay;
	}

	public String getCjpass() {
		return cjpass;
	}

	public void setCjpass(String cjpass) {
		this.cjpass = cjpass;
	}
	public String getErroDescrip() {
		return super.getErroDescrip();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
	
	public int getToPage() {
		return super.getToPage();
	}

	public long getTotalSize() {
		return super.getTotalSize();
	}
	
	public List<Vipcjgl> getDataList() {
		return super.getDataList();
	}

	public int getPageSize() {
		return super.getPageSize();
	}
}
