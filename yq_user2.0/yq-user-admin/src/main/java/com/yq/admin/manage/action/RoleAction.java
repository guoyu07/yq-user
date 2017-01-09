package com.yq.admin.manage.action;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.util.StringUtils;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.manage.bean.Role;
import com.yq.manage.bean.Staff;
import com.yq.manage.service.ManageService;
import com.yq.manage.util.JsonUtil;


/**
 * @author 作者: HuHua
 * @version 2016年12月22日
 * 类说明 
 */
public class RoleAction extends BaseManageAction<Role>  {
	
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest request;
	
	/***services***/
	private ManageService manageService;
	
	private int id;
	
	private Role info;
	
	private String manageUser;
	
	private Staff staffTable;

	/***
	 * 角色分页
	 * @return 
	 * @throws Exception
	 */
	public String pageList()throws Exception{
		manageService = ServiceCacheFactory.getService(ManageService.class);
		manageUser = super.getUserName();
		  // 获得请求对象
        HttpServletRequest request = ServletActionContext.getRequest();
		super.initPage(manageService.findRolePageList(super.getToPage(),20));
		staffTable = manageService.getStaffByUserName(manageUser);
		 /*判断跳转方式 */
		String ajax = request.getParameter("ajax");
		if ("true".equals(ajax) && ajax != null) {
			return "AJAX";
		} else {
			return "LIST";
		}
	}

	
	
	public Staff getStaffTable() {
		return staffTable;
	}



	public void setStaffTable(Staff staffTable) {
		this.staffTable = staffTable;
	}



	public String getManageUser() {
		return manageUser;
	}



	public void setManageUser(String manageUser) {
		this.manageUser = manageUser;
	}



	/**
	 * 跳转去表单页面
	 * @return
	 * @throws Exception
	 */
	public String form()throws Exception{
		manageService = ServiceCacheFactory.getService(ManageService.class);
		if (id!=0) {
			info = manageService.findRoleById(id);
		}
		return "FORM";
	}

	
	/**
	 * 保存，更新角色信息
	 * @return
	 * @throws Exception
	 */
	public String saveOrUpdateRole() throws Exception{
		manageService = ServiceCacheFactory.getService(ManageService.class);
		HttpServletRequest request=ServletActionContext.getRequest();
		if(id!=0){	//如果ID存在说明是更新			
			manageService.updateRole(id,request.getParameter("roleName"),request.getParameter("roleCode"),request.getParameter("roleLevel"),request.getParameter("roleDesc"),super.getUserName());
		}else{
			manageService.saveRole(request.getParameter("roleName"),request.getParameter("roleCode"),request.getParameter("roleLevel"),request.getParameter("roleDesc"),super.getUserName());
		}
		return pageList();
	}
	
	/**
	 * 删除角色，中间以(,)分割
	 * @return
	 * @throws Exception
	 */
	public String deleteRole()throws Exception{
		request = ServletActionContext.getRequest();
		manageService = ServiceCacheFactory.getService(ManageService.class);
		manageService.deleteRoles(request.getParameter("ids"));
		return pageList();
	}
	
	/**
	 * 角色资源分配---EXT树加载
	 * @return
	 * @throws Exception
	 */
	public String loadTree()throws Exception{
		manageService = ServiceCacheFactory.getService(ManageService.class);
		HttpServletRequest request=ServletActionContext.getRequest();
	    String paramId = request.getParameter("paramId");
	    String node=request.getParameter("node");
		if(StringUtils.hasText(node)){
			JsonUtil.outJson(manageService.loadRoleTree(node,paramId),ServletActionContext.getResponse());
			
		}else {
			JsonUtil.outJson(manageService.loadRoleTree("",paramId),ServletActionContext.getResponse());
		}
		return null;
	}
	
	
	/**
	 * 角色资源分配---EXT树加载
	 * @return
	 * @throws Exception
	 */
	public String loadAllTree()throws Exception{
		manageService = ServiceCacheFactory.getService(ManageService.class);
		HttpServletRequest request=ServletActionContext.getRequest();
	    String paramId =request.getParameter("paramId");
	    String node=request.getParameter("node");
		if(StringUtils.hasText(node)){
			JsonUtil.outJson(manageService.loadAllRoleTree(paramId),ServletActionContext.getResponse());
		}else {
			JsonUtil.outJson(manageService.loadAllRoleTree(paramId),ServletActionContext.getResponse());
		}
		return null;
	}
	
	/**
	 * 资源分配跳转
	 * @return
	 * @throws Exception
	 */
	public String treePageForward()throws Exception{
		request.setAttribute("roleId", request.getParameter("id"));
		return "TREEPAGEFORWARD";
	}
	
	/**
	 *  资源树保存
	 * @return
	 * @throws Exception
	 */
	public String saveResourcesTree()throws Exception{
		manageService = ServiceCacheFactory.getService(ManageService.class);
		request = ServletActionContext.getRequest();
		JsonUtil.outJson(manageService.saveRloeTree(request.getParameter("roleId"),request.getParameter("resourcesCheckId"), request.getSession()),ServletActionContext.getResponse());
		return null;
	}
	
	/**
	 * 人员角色树
	 * @return
	 * @throws Exception
	 */
	public String loadUserTree()throws Exception{
		manageService = ServiceCacheFactory.getService(ManageService.class);
		HttpServletRequest request=ServletActionContext.getRequest();
		JsonUtil.outJson(manageService.loadUserTree(Integer.parseInt(request.getParameter("node"))),ServletActionContext.getResponse());
		return null;
	}
	
	/**
	 * 人员角色分配跳转
	 * @return
	 * @throws Exception
	 */
	public String treePageForwardByUser()throws Exception{
		manageService = ServiceCacheFactory.getService(ManageService.class);
		request.setAttribute("role", manageService.findRoleById(Integer.parseInt(request.getParameter("id"))));
		return "TREEPAGEFORWARDBYUSER";
	}
	

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public ManageService getManageService() {
		return manageService;
	}

	public void setManageService(ManageService manageService) {
		this.manageService = manageService;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Role getInfo() {
		return info;
	}

	public void setInfo(Role info) {
		this.info = info;
	}
	
	
	
}
