package com.yq.user.action;

import java.util.List;

import com.google.common.collect.Lists;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Province;
import com.yq.user.dao.ProvinceDao;
import com.yq.user.service.UserService;

public class RegAction extends ALDAdminActionSupport {
	private static final long serialVersionUID = 1L;

	private List<Province> provinceList = Lists.newArrayList();
	
 	private int status;
 	//用户名-->username
 	private String gguser;
 	//推荐人-->up
 	private String upvip;
 	//姓名--》name
 	private String ggname;
 	//身份证号码--》userid
 	private String gguserid;
 	//一级密码-->password
 	private String ggpa1;
 	//二级密码-->password3
 	private String ggpa3;
 	//银行-->bank
 	private String ggbank;
 	//银行卡号--》card
 	private String ggcard;
 	//电话号码-->call
 	private String ggcall;
 	//qq
 	private String ggqq;
 	//省--》  addsheng
 	private String provinceName;
 	//市--> addshi
 	private String cityName;
 	//区--> addqu
 	private String areaName;
 	
 	
 	private String tag;
	public String execute() {
		if(status==0){
			ProvinceDao provinceDao = ServiceCacheFactory.getServiceCache().getService(ProvinceDao.class); 
			provinceList = provinceDao.getProvinceList();
			return INPUT;
		}else{
			//开启校验
			UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
			int result = userService.reg(gguser, upvip, ggname, gguserid, ggpa1, ggpa3, ggbank, ggcard, ggcall, ggqq, provinceName, cityName, areaName);
			//开始添加账号
			super.setErroCodeNum(result);
			return SUCCESS;
		}
		
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
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getGguser() {
		return gguser;
	}
	public void setGguser(String gguser) {
		this.gguser = gguser;
	}
	public String getUpvip() {
		return upvip;
	}
	public void setUpvip(String upvip) {
		this.upvip = upvip;
	}
	public String getGgname() {
		return ggname;
	}
	public void setGgname(String ggname) {
		this.ggname = ggname;
	}
	public String getGguserid() {
		return gguserid;
	}
	public void setGguserid(String gguserid) {
		this.gguserid = gguserid;
	}
	public String getGgpa1() {
		return ggpa1;
	}
	public void setGgpa1(String ggpa1) {
		this.ggpa1 = ggpa1;
	}
	public String getGgpa3() {
		return ggpa3;
	}
	public void setGgpa3(String ggpa3) {
		this.ggpa3 = ggpa3;
	}
	public String getGgbank() {
		return ggbank;
	}
	public void setGgbank(String ggbank) {
		this.ggbank = ggbank;
	}
	public String getGgcard() {
		return ggcard;
	}
	public void setGgcard(String ggcard) {
		this.ggcard = ggcard;
	}
	public String getGgcall() {
		return ggcall;
	}
	public void setGgcall(String ggcall) {
		this.ggcall = ggcall;
	}
	public String getGgqq() {
		return ggqq;
	}
	public void setGgqq(String ggqq) {
		this.ggqq = ggqq;
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
	
	
}
