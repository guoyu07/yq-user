package com.yq.admin.manager.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.bean.UserStatBean;
import com.yq.manager.service.AdminService;
/**
 * 一些工具
 * @author ThinkPad User
 *
 */
public class ToolsAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String user;
	private int ssjb;
	private String desc;
	public String addAqAndBq(){
       /* if(!super.getUserName().equals("admin1")){
            return INPUT;
        }
*/
		new Thread(new Runnable() {
			@Override
			public void run() {
				AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
				adminService.addAqOrBqForUserNoLog(user, ssjb, desc);
			}
		}).start();
		return SUCCESS;
	}
	
	private String cardNum;
	private List<UserStatBean> list;
	public String theSameUserInfo(){
        /*if(!super.getUserName().equals("admin1")){
            return INPUT;
        }*/

		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(!Strings.isNullOrEmpty(cardNum)){
			list = adminService.getUserStatBeanList(cardNum);
		}
		return "thesameuserinfo";
	}
	
	
	public String theSameUserInfoToExcel(){
       /* if(!super.getUserName().equals("admin1")){
            return INPUT;
        }
*/
		if(Strings.isNullOrEmpty(cardNum)){
			return "thesameuserinfo";
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		list = adminService.getUserStatBeanList(cardNum);
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/"+cardNum+"-thesameuserinfo.xls";
		String[] headers =
		{ "用户名", "名字","激活时间", "报单数量", "充值数量", "当前积分","当前一币","买进","卖出","小结"};
		
		writeExcel(descDirectoryPath, "身份证号"+cardNum+"的同名账户概况", headers, list, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath, response);
		return null;
	}
	
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getSsjb() {
		return ssjb;
	}
	public void setSsjb(int ssjb) {
		this.ssjb = ssjb;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public List<UserStatBean> getList() {
		return list;
	}
	public void setList(List<UserStatBean> list) {
		this.list = list;
	}
}
