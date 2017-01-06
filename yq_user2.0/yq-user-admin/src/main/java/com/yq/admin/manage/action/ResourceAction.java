package com.yq.admin.manage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.util.StringUtils;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.manage.bean.Resource;
import com.yq.manage.service.ManageService;
import com.yq.manage.util.JsonUtil;

public class ResourceAction extends BaseManageAction<Resource> {
	
	/** 页面传递参数过来*/ 
	private String node;
	private String treeId;
	private String resoName;
	private String resoUrl;
	private String resoCode;
	private String resoLevel;
	private String resoNo;
	private String resoClass;
	private int security;
	
	private static final long serialVersionUID = 1L;
	
	/**services**/
	private ManageService manageServices;

	
	
	private String paramId;
	
	private int id;
	
	private Resource info;
	
	private String treePid;
	
	private List<Resource> resourceList;
	
	
	
	/**
	 * 资源树加载
	 * @return
	 * @throws Exception
	 */
	public String loadTree(){
		manageServices = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		if(StringUtils.hasText(node)){
			JsonUtil.outJson(manageServices.loadResourceTree(Integer.parseInt(node),paramId),ServletActionContext.getResponse());
		}else {
			JsonUtil.outJson(manageServices.loadResourceTree(0,paramId),ServletActionContext.getResponse());
		}
		return null;
	}
	
	/**
	 * 资源分配树加载
	 * @return
	 * @throws Exception
	 */
	public String loadResourceTree() throws Exception{
		manageServices = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		JsonUtil.outJson(manageServices.loadResource(paramId),ServletActionContext.getResponse());
		return null;
	}
	
	/**
	 * 角色分配跳转
	 * @return
	 * @throws Exception
	 *//*
	public String treePageForward()throws Exception{
		manageServices = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		//this.getRequest().setAttribute("resource", manageServices.findById(Long.valueOf(this.getRequest().getParameter("id"))));
		return "TREEPAGEFORWARD";
	}
	
	*//**
	 * 跳转去表单页面
	 * @return
	 * @throws Exception
	 */
	public String form()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		manageServices = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		if(id!=0){
			request.setAttribute("info", manageServices.findResourceById(id));
		}
		return "FORM";
	}
	
	/**
	 * 保存资源信息
	 * @return
	 * @throws Exception
	 */
	public String saveOrUpdateResource() throws Exception  {
		manageServices = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		if(id!=0){
			manageServices.updateResource(resoName,resoCode,resoUrl,resoLevel,resoNo,resoClass,id, security);
		}else{
			manageServices.saveResource(resoName,resoCode,resoUrl,resoLevel,resoNo,resoClass,Integer.parseInt(treeId), security);
		}
		return listPage();
	}
	
	

	private int pid;
	
	private String clickId;
	
	private int pageNumber;
	/**
	 * 资源信息分页
	 * @return
	 * @throws Exception
	 */
	public String listPage() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		manageServices = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		if(StringUtils.hasText(treeId)){
			pid=Integer.parseInt(treeId);
			request.getSession().setAttribute("treePid",treeId);
			request.setAttribute("clickId", treeId);
		}else{
			//params.add(new RequestParameter("pid",((ResourceTable)request.getSession().getAttribute("ROOT_RESOURCE")).getId().toString()));
		}
		resourceList = manageServices.findResourceByIdOrResourceList(pid);
		
		String ajax = request.getParameter("ajax");
		if ("true".equals(ajax) && ajax != null) {
			return "AJAX";
		} else {
			return "LIST";
		}
	}
	

	public List<Resource> getResourceList() {
		return resourceList;
	}

	public void setResourceList(List<Resource> resourceList) {
		this.resourceList = resourceList;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getClickId() {
		return clickId;
	}

	public void setClickId(String clickId) {
		this.clickId = clickId;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	/**
	 * 删除资源信息
	 * @return
	 * @throws Exception
	 */
	public String deleteResource() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		manageServices = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		manageServices.deleteResources(request.getParameter("ids"), request.getSession());
		return listPage();
	}
	
	/**
	 * 角色分配保存
	 * @return
	 * @throws Exception
	 */
	public String saveResourcesTree()throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		manageServices = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		JsonUtil.outJson(manageServices.saveRoleTree(request.getParameter("resourcesId"),request.getParameter("roleCheckId")),ServletActionContext.getResponse());
		return null;
	}


	public String getNode() {
		return node;
	}

	public void setNode(String node) {
		this.node = node;
	}

	public String getTreeId() {
		return treeId;
	}

	public void setTreeId(String treeId) {
		this.treeId = treeId;
	}

	public String getResoName() {
		return resoName;
	}

	public void setResoName(String resoName) {
		this.resoName = resoName;
	}

	public String getResoUrl() {
		return resoUrl;
	}

	public void setResoUrl(String resoUrl) {
		this.resoUrl = resoUrl;
	}

	public String getResoCode() {
		return resoCode;
	}

	public void setResoCode(String resoCode) {
		this.resoCode = resoCode;
	}

	public String getResoLevel() {
		return resoLevel;
	}

	public void setResoLevel(String resoLevel) {
		this.resoLevel = resoLevel;
	}

	public String getResoNo() {
		return resoNo;
	}

	public void setResoNo(String resoNo) {
		this.resoNo = resoNo;
	}

	public String getResoClass() {
		return resoClass;
	}

	public void setResoClass(String resoClass) {
		this.resoClass = resoClass;
	}

	public ManageService getManageServices() {
		return manageServices;
	}

	public void setManageServices(ManageService manageServices) {
		this.manageServices = manageServices;
	}

	public String getParamId() {
		return paramId;
	}

	public void setParamId(String paramId) {
		this.paramId = paramId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Resource getInfo() {
		return info;
	}

	public void setInfo(Resource info) {
		this.info = info;
	}

	public String getTreePid() {
		return treePid;
	}

	public void setTreePid(String treePid) {
		this.treePid = treePid;
	}

	public int getSecurity() {
		return security;
	}

	public void setSecurity(int security) {
		this.security = security;
	}


	
}
