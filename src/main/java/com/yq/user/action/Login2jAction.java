package com.yq.user.action;

import java.util.Date;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.DateUtils;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class Login2jAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String inputUrl;
	private String password3;
	
	private int status;
	
	private int cxt;
	
	private int days;
	
	public String execute(){
		if(status!=0){
			UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
			Gcuser user = userService.getUserByUserName(super.getUserName());
			if(Strings.isNullOrEmpty(password3)||!user.getPassword3().equals(password3)){
				super.setErroCodeNum(1);
				return SUCCESS;
			}
			
			if("login3j.jsp".equals(inputUrl)){
				if(user.isLimitTx()){
					super.setErroCodeNum(2);//alert('您好，您同一姓名账号或同一身份证号码账号已发布成功过，请耐心等待处理完成后再发布第二笔，如果认购方已向您付款，请先确认收款再发布第二笔，谢谢！');
				}
				
				if(user.getTxlb()==3){
					super.setErroCodeNum(3);//alert('您好，一币商城的商家账户暂时不提供卖出功能，谢谢！');
				}
				
				if(user.getCxt()<4 && (user.getCxdate()!=null&&user.getCxdate().getTime()>new Date().getTime())){
					cxt = user.getCxt();
					days = DateUtils.getIntervalDays(user.getCxdate(), new Date());
					super.setErroCodeNum(4);//alert('您好，您的诚信星为"&rs_login("cxt")&"，离取消[限制发布]时间还有"&rs_login("cxdate")-date()&"天，谢谢！');
				}
				
				if(user.getJygt1()==2 || user.getDbt1()==2){
					super.setErroCodeNum(5);//alert('操作错误，请检查输入是否正确！');
				}
				
				if(user.getBank().equals("财付通")||user.getCard().equals("支付宝")){
					super.setErroCodeNum(6);//alert('请把收款方式改为“工商银行”或“农业银行”或“建设银行”再进行卖出操作！');
				}
				ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
				Fcxt fcxt = managerService.getFcxtById(10);
				if(user.getRegtime().getTime()>fcxt.getJsdate().getTime()){
					super.setErroCodeNum(-1);//to userpay.asp
				}else{
					super.setErroCodeNum(-2);//to userpay_10yh.asp
				}
			}
			return SUCCESS;
		}
		
		return INPUT;
	}
	
	public int getErroCodeNum(){
		return super.getErroCodeNum();
	}
	public String getInputUrl() {
		return inputUrl;
	}

	public void setInputUrl(String inputUrl) {
		this.inputUrl = inputUrl;
	}

	public String getPassword3() {
		return password3;
	}
	public void setPassword3(String password3) {
		this.password3 = password3;
	}

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserName() {
		return super.getUserName();
	}

	public int getCxt() {
		return cxt;
	}

	public void setCxt(int cxt) {
		this.cxt = cxt;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}
}
