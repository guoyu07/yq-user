package com.yq.admin.manager.action;

import java.util.List;

import com.google.common.collect.Lists;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Province;
import com.yq.user.dao.ProvinceDao;
import com.yq.user.service.UserService;

public class UserListAction extends ALDAdminPageActionSupport<Gcuser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Province> provinceList = Lists.newArrayList();
	
	public String execute(){
		ProvinceDao provinceDao = ServiceCacheFactory.getServiceCache().getService(ProvinceDao.class); 
		provinceList = provinceDao.getProvinceList();
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		super.initPage(userService.getUserPageList(super.getToPage(), 100));
		
		return SUCCESS;
	}

	public List<Province> getProvinceList() {
		return provinceList;
	}

	public void setProvinceList(List<Province> provinceList) {
		this.provinceList = provinceList;
	}

}
