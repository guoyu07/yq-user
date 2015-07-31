package com.yq.user.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.MD5Security;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class YbsfAction extends ALDAdminActionSupport {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//商户二级密码
	private String shpa;
	
	private int sfpay;
	
	private String pay10;
	//需要支付的一币数目
	private int ybpay;
	//支付的用户名
	private String user;
	//密码
	private String pa01;
    //用户二级密码	
	private String pa02;
	//手机校验码
	private String sfcode;
	
	private int status;
	
	
	private Gcuser gcuser;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		gcuser = userService.getUserByUserName(super.getUserName());
		
		if(status==0){
			return INPUT;
		}else{
			if(gcuser.getJb()!=5){
				super.setErroCodeNum(1);//alert('非商户用户名，请联系管理员！');
				return SUCCESS;
			}
			
			if(Strings.isNullOrEmpty(shpa)||!shpa.equals(gcuser.getPassword3())){
				super.setErroCodeNum(2);//alert('输入的商户二级密码不正确，请检查输入是否正确！');
				return SUCCESS;
			}
			
			if(ybpay<=0){
				super.setErroCodeNum(3);//alert('订单信息有误，请重新提交！');
				return SUCCESS;
			}
			
			Gcuser beReduceUser = userService.getUserByUserName(user);
			if(beReduceUser==null){
				super.setErroCodeNum(4);//alert('输入的用户名不存在，请检查输入是否正确！');
				return SUCCESS;
			}
			
			if(Strings.isNullOrEmpty(pa01)||!MD5Security.md5_16(pa01).equals(beReduceUser.getPassword())){
				super.setErroCodeNum(5);//alert('输入的登录密码不正确，请检查输入是否正确！');
				return SUCCESS;
			}
			
			if(Strings.isNullOrEmpty(pa02)||!pa02.equals(beReduceUser.getPassword3())){
				super.setErroCodeNum(6);//alert('输入的二级密码不正确，请检查输入是否正确！');
				return SUCCESS;
			}
			
			if(beReduceUser.getPay()<ybpay){
				super.setErroCodeNum(7);//alert('您的一币余额不足，请检查输入是否正确！');
				return SUCCESS;
			}
			
			if(!beReduceUser.getVipsq().equals(sfcode)){
				super.setErroCodeNum(8);//alert('您好，手机验证码不正确，请重新输入！');
				return SUCCESS;
			}
			//减一币
			if(!userService.changeYb(user, -ybpay,gcuser.getName(),12,null)){
				super.setErroCodeNum(7);//alert('您的一币余额不足，请检查输入是否正确！');
				return SUCCESS;
			}
			//加一币
			if(!userService.changeYb(gcuser.getUsername(), ybpay,gcuser.getName()+"-"+beReduceUser.getName(),5,null)){
				super.setErroCodeNum(9);//alert('未知错误');
				return SUCCESS;
			}
			return SUCCESS;
		}
	}
	
	public int getErroCodeNum(){
		return super.getErroCodeNum();
	}
	
	public Gcuser getGcuser(){
		return gcuser;
	}


	public String getShpa() {
		return shpa;
	}


	public void setShpa(String shpa) {
		this.shpa = shpa;
	}


	public int getSfpay() {
		return sfpay;
	}


	public void setSfpay(int sfpay) {
		this.sfpay = sfpay;
	}


	public String getPay10() {
		return pay10;
	}


	public void setPay10(String pay10) {
		this.pay10 = pay10;
	}


	public int getYbpay() {
		return ybpay;
	}


	public void setYbpay(int ybpay) {
		this.ybpay = ybpay;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public String getPa01() {
		return pa01;
	}


	public void setPa01(String pa01) {
		this.pa01 = pa01;
	}


	public String getPa02() {
		return pa02;
	}


	public void setPa02(String pa02) {
		this.pa02 = pa02;
	}


	public String getSfcode() {
		return sfcode;
	}


	public void setSfcode(String sfcode) {
		this.sfcode = sfcode;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}
	
}
