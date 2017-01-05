package com.yq.manager.bean;

import java.util.List;

import com.yq.manage.bean.Resource;

/**
 * @author 作者: HuHua
 * @version 2017年1月2日
 * 类说明  用戶前端显示封装
 */
public class PlayerResource {
	
	private int 			  id;	
	private Resource		  resource;
    private String            resoName;
    private String            resoCode;
    private String            resoUrl;
    private Integer           resoNo;
    private Integer           resoLevel;
    private String            resoClass;
    private int				  security;		  //是否需要权限才能访问的功能资源 0是否 1是需要
    private List<Resource>	resourceList;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getResoName() {
		return resoName;
	}
	public void setResoName(String resoName) {
		this.resoName = resoName;
	}
	public String getResoCode() {
		return resoCode;
	}
	public void setResoCode(String resoCode) {
		this.resoCode = resoCode;
	}
	public String getResoUrl() {
		return resoUrl;
	}
	public void setResoUrl(String resoUrl) {
		this.resoUrl = resoUrl;
	}
	public Integer getResoNo() {
		return resoNo;
	}
	public void setResoNo(Integer resoNo) {
		this.resoNo = resoNo;
	}
	public Integer getResoLevel() {
		return resoLevel;
	}
	public void setResoLevel(Integer resoLevel) {
		this.resoLevel = resoLevel;
	}
	public String getResoClass() {
		return resoClass;
	}
	public void setResoClass(String resoClass) {
		this.resoClass = resoClass;
	}
	public int getSecurity() {
		return security;
	}
	public void setSecurity(int security) {
		this.security = security;
	}
	public List<Resource> getResourceList() {
		return resourceList;
	}
	public void setResourceList(List<Resource> resourceList) {
		this.resourceList = resourceList;
	}
	public Resource getResource() {
		return resource;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
	}
    
    
}
