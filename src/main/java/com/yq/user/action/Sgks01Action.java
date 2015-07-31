package com.yq.user.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Sgxt;
import com.yq.user.bo.YouMingxi;
import com.yq.user.bo.ZuoMingxi;
import com.yq.user.service.UserService;

public class Sgks01Action extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String myup;
	
	private String bdid;
	
	private int lb;
	
	private Sgxt sgxt;
	private Sgxt sgxta;
	private Sgxt sgxtb;
	
	private Sgxt sgxtaa;
	private Sgxt sgxtaaa;
	private Sgxt sgxtaab;
	
	
	private Sgxt sgxtab;
	private Sgxt sgxtaba;
	private Sgxt sgxtabb;

	
	private Sgxt sgxtba;
	private Sgxt sgxtbaa;
	private Sgxt sgxtbab;
	
	
	private Sgxt sgxtbb;
	private Sgxt sgxtbba;
	private Sgxt sgxtbbb;

	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		if(lb==1){
			super.setErroCodeNum(1);
		}
		
		if(!Strings.isNullOrEmpty(myup)){
			if(!gcuser.getUsername().equals(myup)){
				ZuoMingxi zuoMingxi = userService.getZuoMingxi(gcuser.getUsername(), myup);
				if(zuoMingxi==null){
					YouMingxi youMingxi = userService.getYouMingxi(gcuser.getUsername(), myup);
					if(youMingxi==null){
						super.setErroCodeNum(2);//alert('用户名输入错误或不属于自己团队的玩家，请检查后再试！');
						return SUCCESS;
					}
				}
			}
			sgxt = userService.getSgxt(myup);
			if(sgxt!=null){
				if(!Strings.isNullOrEmpty(sgxt.getAuid())){
					sgxta = userService.getSgxt(sgxt.getAuid());
				}
				if(!Strings.isNullOrEmpty(sgxt.getBuid())){
					sgxtb = userService.getSgxt(sgxt.getBuid());
				}
			}
			
			if(sgxta!=null){
				if(!Strings.isNullOrEmpty(sgxta.getAuid())){
					sgxtaa = userService.getSgxt(sgxta.getAuid());
				}
				
				if(!Strings.isNullOrEmpty(sgxta.getBuid())){
					sgxtab = userService.getSgxt(sgxta.getBuid());
				}
			}
			
			if(sgxtb!=null){
				if(!Strings.isNullOrEmpty(sgxtb.getAuid())){
					sgxtba = userService.getSgxt(sgxtb.getAuid());
				}
				if(!Strings.isNullOrEmpty(sgxtb.getBuid())){
					sgxtbb = userService.getSgxt(sgxtb.getBuid());
				}
			}
			
			if(sgxtaa!=null){
				if(!Strings.isNullOrEmpty(sgxtaa.getAuid())){
					sgxtaaa = userService.getSgxt(sgxtaa.getAuid());
				}
				
				if(!Strings.isNullOrEmpty(sgxtaa.getBuid())){
					sgxtaab = userService.getSgxt(sgxtaa.getBuid());
				}
			}
			
			if(sgxtab!=null){
				if(!Strings.isNullOrEmpty(sgxtab.getAuid())){
					sgxtaba = userService.getSgxt(sgxtab.getAuid());
				}
				
				if(!Strings.isNullOrEmpty(sgxtab.getBuid())){
					sgxtabb = userService.getSgxt(sgxtab.getBuid());
				}
			}
			
			
			if(sgxtba!=null){
				if(!Strings.isNullOrEmpty(sgxtba.getAuid())){
					sgxtbaa = userService.getSgxt(sgxtba.getAuid());
				}
				
				if(!Strings.isNullOrEmpty(sgxtba.getBuid())){
					sgxtbab = userService.getSgxt(sgxtba.getBuid());
				}
			}
			
			
			if(sgxtbb!=null){
				if(!Strings.isNullOrEmpty(sgxtbb.getAuid())){
					sgxtbba = userService.getSgxt(sgxtbb.getAuid());
				}
				
				if(!Strings.isNullOrEmpty(sgxtbb.getBuid())){
					sgxtbbb = userService.getSgxt(sgxtbb.getBuid());
				}
			}
			
		}
		
		
		
		return SUCCESS;
	}


	public String getMyup() {
		return myup;
	}


	public void setMyup(String myup) {
		this.myup = myup;
	}


	public int getLb() {
		return lb;
	}


	public void setLb(int lb) {
		this.lb = lb;
	}


	public Sgxt getSgxt() {
		return sgxt;
	}


	public void setSgxt(Sgxt sgxt) {
		this.sgxt = sgxt;
	}


	public Sgxt getSgxta() {
		return sgxta;
	}


	public void setSgxta(Sgxt sgxta) {
		this.sgxta = sgxta;
	}


	public Sgxt getSgxtb() {
		return sgxtb;
	}


	public void setSgxtb(Sgxt sgxtb) {
		this.sgxtb = sgxtb;
	}


	public Sgxt getSgxtaa() {
		return sgxtaa;
	}


	public void setSgxtaa(Sgxt sgxtaa) {
		this.sgxtaa = sgxtaa;
	}


	public Sgxt getSgxtaaa() {
		return sgxtaaa;
	}


	public void setSgxtaaa(Sgxt sgxtaaa) {
		this.sgxtaaa = sgxtaaa;
	}


	public Sgxt getSgxtaab() {
		return sgxtaab;
	}


	public void setSgxtaab(Sgxt sgxtaab) {
		this.sgxtaab = sgxtaab;
	}


	public Sgxt getSgxtab() {
		return sgxtab;
	}


	public void setSgxtab(Sgxt sgxtab) {
		this.sgxtab = sgxtab;
	}


	public Sgxt getSgxtaba() {
		return sgxtaba;
	}


	public void setSgxtaba(Sgxt sgxtaba) {
		this.sgxtaba = sgxtaba;
	}


	public Sgxt getSgxtabb() {
		return sgxtabb;
	}


	public void setSgxtabb(Sgxt sgxtabb) {
		this.sgxtabb = sgxtabb;
	}


	public Sgxt getSgxtba() {
		return sgxtba;
	}


	public void setSgxtba(Sgxt sgxtba) {
		this.sgxtba = sgxtba;
	}


	public Sgxt getSgxtbaa() {
		return sgxtbaa;
	}


	public void setSgxtbaa(Sgxt sgxtbaa) {
		this.sgxtbaa = sgxtbaa;
	}


	public Sgxt getSgxtbab() {
		return sgxtbab;
	}


	public void setSgxtbab(Sgxt sgxtbab) {
		this.sgxtbab = sgxtbab;
	}


	public Sgxt getSgxtbb() {
		return sgxtbb;
	}


	public void setSgxtbb(Sgxt sgxtbb) {
		this.sgxtbb = sgxtbb;
	}


	public Sgxt getSgxtbba() {
		return sgxtbba;
	}


	public void setSgxtbba(Sgxt sgxtbba) {
		this.sgxtbba = sgxtbba;
	}


	public Sgxt getSgxtbbb() {
		return sgxtbbb;
	}


	public void setSgxtbbb(Sgxt sgxtbbb) {
		this.sgxtbbb = sgxtbbb;
	}
	
	
	public String getUserName(){
		return super.getUserName();
	}
	
	public int getErroCodeNum(){
		return super.getErroCodeNum();
	}


	public String getBdid() {
		return bdid;
	}


	public void setBdid(String bdid) {
		this.bdid = bdid;
	}

}
