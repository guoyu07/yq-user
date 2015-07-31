package com.yq.user.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.MD5Security;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Province;
import com.yq.user.dao.ProvinceDao;
import com.yq.user.service.UserService;

public class UpdateUserInfoAction extends ALDAdminActionSupport {
	private static final long serialVersionUID = 1L;

	private List<Province> provinceList = Lists.newArrayList();
	
 	private int status;
 	
 	private Gcuser gcuser;
 	//省--》  addsheng
 	private String provinceName;
 	//市--> addshi
 	private String cityName;
 	//区--> addqu
 	private String areaName;
 	
	private String userName;
	
	private String name;
	
	private String newPassWord1;
	
	private String newPassWord2;
	
	private String secondPassword;
	
	private String qq;
	
	private String idCard;
	
	private String smsCode;
 	//银行-->bank
 	private String bank;
 	//银行卡号--》card
 	private String card;
 	//电话号码-->call
 	private String call;
 	
 
	public String execute() {
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		if(status==0){
			ProvinceDao provinceDao = ServiceCacheFactory.getServiceCache().getService(ProvinceDao.class); 
			provinceList = provinceDao.getProvinceList();
			
			gcuser = userService.getUserByUserName(userName);
			
			if(!Strings.isNullOrEmpty(gcuser.getCall())){
				int callLenght = gcuser.getCall().length();
				String callLeft = gcuser.getCall().substring(0, 3);
				String CallRight = gcuser.getCall().substring(callLenght-3, callLenght);
				gcuser.setCall(callLeft+"*****"+CallRight);
			}
		    if(!Strings.isNullOrEmpty(gcuser.getUserid())){
		    	int idCardLenght = gcuser.getUserid().length();
				String idCardLeft = gcuser.getUserid().substring(0, 4);
				String idCardRight = gcuser.getUserid().substring(idCardLenght-4, idCardLenght);
				gcuser.setUserid(idCardLeft+"**********"+idCardRight);
		    }
			
			return INPUT;
		}else{
            Gcuser guser = userService.getUserByUserName(userName);
			
			if(guser==null){
				super.setErroCodeNum(1);//用户不存在
				return SUCCESS;
			}
			
			if(!Strings.isNullOrEmpty(smsCode)){
				if(!smsCode.equals(guser.getVipsq())){
					super.setErroCodeNum(2);//alert('您填入的手机验证码不正确！');
					return SUCCESS;
				}
			}
			
			if(Strings.isNullOrEmpty(secondPassword)||!secondPassword.equals(guser.getPassword3())){
				super.setErroCodeNum(3);//alert('您填入的二级密码不正确！');
				return SUCCESS;
			}
			
			if(Strings.isNullOrEmpty(idCard)||!idCard.equals(guser.getUserid())){
				super.setErroCodeNum(4);//alert('您填入的身份证号码不正确！');
				return SUCCESS;
			}			
			
			if(!Strings.isNullOrEmpty(userName)&&!Strings.isNullOrEmpty(newPassWord1)&&!Strings.isNullOrEmpty(newPassWord2)){
				//开始更新资料操作
				userService.updateUser(userName, guser.getName(), idCard, MD5Security.md5_16(newPassWord1), card, bank, provinceName, cityName, areaName, ServletActionContext.getRequest().getRemoteAddr());
				return SUCCESS;
			}else{
				super.setErroCodeNum(3000);//有信息为空
				return SUCCESS;
			}
		}
		
	}
	
	
	public String getSecondPassword() {
		return secondPassword;
	}

	public void setSecondPassword(String secondPassword) {
		this.secondPassword = secondPassword;
	}

	public String getErroDescrip() {
		return super.getErroDescrip();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
	public List<Province> getProvinceList() {
		return provinceList;
	}
	public void setProvinceList(List<Province> provinceList) {
		this.provinceList = provinceList;
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
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	
}
