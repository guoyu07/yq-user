package com.yq.app.user.action;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.MD5Security;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class UpdateUserAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private Gcuser user;
	
	private String name;
	
	private String password;
	
	private String newPassWord1;
	
	private String newPassWord2;
	
	private String secondPassword;
	
	private String newSecondPassword1;
	
	private String newSecondPassword2;
	
	private String qq;
	
	private String idCard;
	
	private String smsCode;
	
	
	
	public String execute() {
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		if(status==0){
			user = userService.getUserByUserName(super.getUserName());
			user.setName(user.getName().substring(0, 1));
			int callLenght = user.getCall().length();
			String callLeft = user.getCall().substring(0, 3);
			String CallRight = user.getCall().substring(callLenght-3, callLenght);
			user.setCall(callLeft+"*****"+CallRight);
			int idCardLenght = user.getUserid().length();
			String idCardLeft = user.getUserid().substring(0, 4);
			String idCardRight = user.getUserid().substring(idCardLenght-4, idCardLenght);
			user.setUserid(idCardLeft+"**********"+idCardRight);
			return INPUT;
		}else{
			
			Gcuser guser = userService.getUserByUserName(super.getUserName());
			
			if(guser==null){
				super.setErroCodeNum(1);//用户不存在
				return SUCCESS;
			}
			
			if(!smsCode.equals(guser.getVipsq())){
					super.setErroCodeNum(2);//alert('您填入的手机验证码不正确！');
					return SUCCESS;
			}
			
			if(!Strings.isNullOrEmpty(super.getUserName())&&!Strings.isNullOrEmpty(password)&&!Strings.isNullOrEmpty(name)&&!Strings.isNullOrEmpty(newPassWord1)&&!Strings.isNullOrEmpty(newPassWord2)&&!Strings.isNullOrEmpty(secondPassword)&&!Strings.isNullOrEmpty(newSecondPassword1)&&!Strings.isNullOrEmpty(newSecondPassword2)){
				if(!MD5Security.md5_16(password).toLowerCase().equals(guser.getPassword())){
					super.setErroCodeNum(3);//alert("您填入的登录密码与您所登记的不相符！");
					return SUCCESS;
				}
				if(!secondPassword.equals(guser.getPassword3())){
					super.setErroCodeNum(4);//alert('您填入的原二级密码与您所登记的不相符，请重新输入！');
					return SUCCESS;
				}
				if(newSecondPassword1.equals(secondPassword)){
					super.setErroCodeNum(5);//alert('新二级密码不能与原二级密码相同，请重新输入！');
					return SUCCESS;
				}
				if(!idCard.equals(guser.getUserid())){
					super.setErroCodeNum(6);//alert('您填入的身份证号码与您所登记的不相符！');
					return SUCCESS;
				}
				if(!name.equals(guser.getName())){
					super.setErroCodeNum(7);//alert('您填入的身份证号码与您所登记的不相符！');
					return SUCCESS;
				}
				//开始更新资料操作
				userService.updateUser(super.getUserName(),name, idCard, MD5Security.md5_16(newPassWord1), newSecondPassword1, 0, qq, guser.getCall(),ServletActionContext.getRequest().getRemoteAddr());
				
				return SUCCESS;
			}else{
				super.setErroCodeNum(3000);//有信息为空
				return SUCCESS;
			}
			
		}
	}


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Gcuser getUser() {
		return user;
	}

	public void setUser(Gcuser user) {
		this.user = user;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassWord1() {
		return newPassWord1;
	}

	public void setNewPassWord1(String newPassWord1) {
		this.newPassWord1 = newPassWord1;
	}

	public String getNewPassWord2() {
		return newPassWord2;
	}

	public void setNewPassWord2(String newPassWord2) {
		this.newPassWord2 = newPassWord2;
	}

	public String getSecondPassword() {
		return secondPassword;
	}

	public void setSecondPassword(String secondPassword) {
		this.secondPassword = secondPassword;
	}

	public String getNewSecondPassword1() {
		return newSecondPassword1;
	}

	public void setNewSecondPassword1(String newSecondPassword1) {
		this.newSecondPassword1 = newSecondPassword1;
	}

	public String getNewSecondPassword2() {
		return newSecondPassword2;
	}

	public void setNewSecondPassword2(String newSecondPassword2) {
		this.newSecondPassword2 = newSecondPassword2;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getSmsCode() {
		return smsCode;
	}

	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}
}
