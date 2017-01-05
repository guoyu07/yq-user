package com.yq.manage.util;

/**
 * @author 作者: HuHua
 * @version 2017年1月5日
 * 类说明 
 */
public class SystemInfo {

    private String            adminOnlinePlayerNum;		//管理后台在线人数
    private String            cwOnlinePlayerNum;		//财务后台在线人数
    private String            menberOnlinePlayerNum;	//会员中心在线人数
	public String getAdminOnlinePlayerNum() {
		return adminOnlinePlayerNum;
	}
	public void setAdminOnlinePlayerNum(String adminOnlinePlayerNum) {
		this.adminOnlinePlayerNum = adminOnlinePlayerNum;
	}
	public String getCwOnlinePlayerNum() {
		return cwOnlinePlayerNum;
	}
	public void setCwOnlinePlayerNum(String cwOnlinePlayerNum) {
		this.cwOnlinePlayerNum = cwOnlinePlayerNum;
	}
	public String getMenberOnlinePlayerNum() {
		return menberOnlinePlayerNum;
	}
	public void setMenberOnlinePlayerNum(String menberOnlinePlayerNum) {
		this.menberOnlinePlayerNum = menberOnlinePlayerNum;
	}
    
    
}
