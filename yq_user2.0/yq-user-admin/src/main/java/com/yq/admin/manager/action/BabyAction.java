package com.yq.admin.manager.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.BabyInfo;
import com.yq.user.service.UserService;

public class BabyAction extends ALDAdminPageActionSupport<BabyInfo> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String babyName;
	private Integer babyAge;
	private String babySex;
	private String dadyName;
	private Integer dadyAge;
	private String dadyCall;
	private String momName;
	private Integer momAge;
	private String momCall;
	private String address;
	private String details;
	private String smsCode;
	private int st;
	private String pa3;
	public String execute(){
		if(st==0){
			return SUCCESS;
		}
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		userService.addBabyInfo(super.getUserName(), babyName, babyAge, babySex, dadyName, dadyAge, dadyCall, momName, momAge, momCall, address, details,pa3,smsCode);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	private String paramStr;
	private String startDate1;
	private String endDate1;
	private Integer status;
	private String opPa;
	                                            //查询                      //删除                     //修改                  //恢复
	private final String[] pass = new String[]{"xx2016bm","del2016","add2016","add2016"};
	private void checkPass(int type){
		String password = pass[type];
			if(!opPa.equals(password)){
				throw new ServiceException(100, "操作密码错误");
			}
	}
	
	public String babyList(){
		 
		if(Strings.isNullOrEmpty(opPa)){
			return SUCCESS;
		}
		checkPass(0);
		
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		super.initPage(userService.getBabyInfoPage(paramStr,status, queryStartDate, queryEndDatet, super.getToPage(), 30));
		return SUCCESS;
	}
	
	public String outExcel(){
		if(Strings.isNullOrEmpty(opPa)){
			return SUCCESS;
		}
		checkPass(0);
		
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/babyinfo("+paramStr+"-"+startDate1+"=="+endDate1+").xls";
		List<BabyInfo> data = userService.getBabyInfoList(paramStr, status, queryStartDate, queryEndDatet);
		String[] headers = { "id", "用户名", "名字", "宝宝姓名", "宝宝年龄","宝宝性别","爸爸名字","爸爸年龄", "爸爸联系方式", "妈妈名字","妈妈年龄","妈妈联系方式","地址","宝宝描述","状态(0为未删除|1为删除)","修改人名称","修改时间","删除人名称","恢复人名称","报名时间"};
		writeExcel(descDirectoryPath, "宝宝报名信息", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath, response);
		return null;
	}
	private int id;
	private BabyInfo data;
	private String editName;
	public String edit(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(st==0){
			data = userService.getOneBabyInfo(id);
			return SUCCESS;
		}
		checkPass(2);
		userService.updateBabyInfo(id, editName, babyName, babyAge, babySex, dadyName, dadyAge, dadyCall, momName, momAge, momCall, address, details);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	private String deleteName;
	public String delete(){
		checkPass(1);
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		userService.deleteBabyInfo(id, deleteName);
		super.setErroCodeNum(2001);
		return SUCCESS;
	}
	
	
	private String recoverName;
	public String recover(){
		checkPass(3);
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		userService.recoverBabyInfo(id, recoverName);
		super.setErroCodeNum(2002);
		return SUCCESS;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getEditName() {
		return editName;
	}

	public BabyInfo getData() {
		return data;
	}

	public void setData(BabyInfo data) {
		this.data = data;
	}

	public String getRecoverName() {
		return recoverName;
	}

	public void setRecoverName(String recoverName) {
		this.recoverName = recoverName;
	}

	public void setEditName(String editName) {
		this.editName = editName;
	}

	public String getDeleteName() {
		return deleteName;
	}

	public void setDeleteName(String deleteName) {
		this.deleteName = deleteName;
	}

	public String getPa3() {
		return pa3;
	}
	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}
	public String getSmsCode() {
		return smsCode;
	}
	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public String getBabyName() {
		return babyName;
	}
	public void setBabyName(String babyName) {
		this.babyName = babyName;
	}
	public String getBabySex() {
		return babySex;
	}
	public void setBabySex(String babySex) {
		this.babySex = babySex;
	}
	public String getDadyName() {
		return dadyName;
	}
	public void setDadyName(String dadyName) {
		this.dadyName = dadyName;
	}
	public String getDadyCall() {
		return dadyCall;
	}
	public void setDadyCall(String dadyCall) {
		this.dadyCall = dadyCall;
	}
	public String getMomName() {
		return momName;
	}
	public void setMomName(String momName) {
		this.momName = momName;
	}
	public String getMomCall() {
		return momCall;
	}
	public void setMomCall(String momCall) {
		this.momCall = momCall;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}



 
	public String getParamStr() {
		return paramStr;
	}

	public void setParamStr(String paramStr) {
		this.paramStr = paramStr;
	}

	public String getStartDate1() {
		return startDate1;
	}

	public void setStartDate1(String startDate1) {
		this.startDate1 = startDate1;
	}

	public String getEndDate1() {
		return endDate1;
	}

	public void setEndDate1(String endDate1) {
		this.endDate1 = endDate1;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getBabyAge() {
		return babyAge;
	}



	public void setBabyAge(Integer babyAge) {
		this.babyAge = babyAge;
	}



	public Integer getDadyAge() {
		return dadyAge;
	}



	public void setDadyAge(Integer dadyAge) {
		this.dadyAge = dadyAge;
	}



	public Integer getMomAge() {
		return momAge;
	}



	public void setMomAge(Integer momAge) {
		this.momAge = momAge;
	}

	public String getOpPa() {
		return opPa;
	}

	public void setOpPa(String opPa) {
		this.opPa = opPa;
	}
}
