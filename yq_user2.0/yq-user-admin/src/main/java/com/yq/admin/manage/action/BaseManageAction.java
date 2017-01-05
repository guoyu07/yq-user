package com.yq.admin.manage.action;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manage.bean.Department;
import com.yq.manage.bean.ManageUser;
import com.yq.manage.bean.Resource;
import com.yq.manage.bean.Role;
import com.yq.manage.bean.Staff;
import com.yq.manage.service.ManageService;
import com.yq.manage.util.AdminGlobal;

/**
 * @author 作者: HuHua
 * @version 2016年12月30日
 * 类说明 
 * @param <T>
 */
public class BaseManageAction<T> extends ALDAdminPageActionSupport<T> {

	private static final long serialVersionUID = 1L;
	ManageService manageService = ServiceCacheFactory.getService(ManageService.class);
	
	
    public HttpSession getSession(){
    	 return ServletActionContext.getRequest().getSession();
    }
	
    public HttpServletRequest getRequest(){
    	  return ServletActionContext.getRequest();
    }
	
    public HttpServletResponse getResponse(){
	  	  return ServletActionContext.getResponse();
  }
    /**
     * 得到当前用户
     * 
     * @return
     */
    public ManageUser getCurrentUser() {
        return this.getCurrentLoginUser();
    }
    
    /**
     * 得到当前职员
     * 
     * @return
     */
    public Staff getCurrentStaff() {
        return this.getCurrentLoginStaff();
    }
	
	private Staff getCurrentLoginStaff() {
		  HttpSession session = getSession();
	        if (session.getAttribute(AdminGlobal.LOGIN_CURRENT_STAFF) == null) {
	            String loginUser = super.getUserName();
	            Staff staff = manageService.getStaffByUserName(loginUser);
	            if (staff != null) {
	                session.setAttribute(AdminGlobal.LOGIN_CURRENT_STAFF, staff);
	                session.setAttribute(AdminGlobal.LOGIN_CURRENT_FULLNAME, staff.getFullName());
	                return staff;
	            }
	            return null;
	        } else {
	            return (Staff) session.getAttribute(AdminGlobal.LOGIN_CURRENT_STAFF);
	        }
	}

	/**
	 * 得到当前登录用户
	 * @return
	 */
	public ManageUser getCurrentLoginUser() {
        HttpSession session = getSession();
        if (session.getAttribute(AdminGlobal.LOGIN_CURRENT_USER) == null) {
            String loginUser = super.getUserName();
            ManageUser user = manageService.findByUserName(loginUser);
            if (user != null) {
                session.setAttribute(AdminGlobal.LOGIN_CURRENT_USER, user);
                session.setAttribute(AdminGlobal.LOGIN_CURRENT_NAME, user.getAdminusername());
                return user;
            }
            return null;
        } else {
            return (ManageUser) session.getAttribute(AdminGlobal.LOGIN_CURRENT_USER);
        }
	}

	/**
	 * 得到当前部门
	 * 
	 * @return
	 */
	public Department getCurrentDepartment() {
        HttpSession session = this.getSession();
        Department department = (Department) this.getSession().getAttribute(AdminGlobal.LOGIN_CURRENT_DEPARTMENT);
        if (department == null) {
            department = manageService.getCurrentDepartment(super.getUserName());
            session.setAttribute(AdminGlobal.LOGIN_CURRENT_DEPARTMENT, department);
        }
        return department;
    }
	
	/**
	 * 得到资源根
	 * 
	 * @return
	 */
	public Resource getRootResource(){
		return  manageService.getRootResource();
	};
	
	/**
	 * 得到部门根
	 * @return
	 */
	public Department getRootDepartment(){
		return  manageService.getRootDepartment();
	};
	
	
	/**
	 * 得到登录用户的资源
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Resource> getLoginResourceList(){
		HttpSession session = this.getSession();
        if (session.getAttribute(AdminGlobal.LOGIN_CURRENT_ROLES) == null) {
            List<Resource> resourceList = manageService.getResourceList(super.getUserName());
            session.setAttribute(AdminGlobal.LOGIN_RESOURCE, resourceList);
            return resourceList;
        } else {
        	return (List<Resource>) session.getAttribute(AdminGlobal.LOGIN_RESOURCE);
        }
	};
	

	/**
	 * 
	 * 得到当前玩家的所有角色
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Role> getCurrentRole() {
		HttpSession session = this.getSession();
        if (session.getAttribute(AdminGlobal.LOGIN_CURRENT_ROLES) == null) {
            List<Role> roleList = manageService.getRole(super.getUserName());
            session.setAttribute(AdminGlobal.LOGIN_CURRENT_ROLES, roleList);
            return roleList;
        } else {
            return (List<Role>) session.getAttribute(AdminGlobal.LOGIN_CURRENT_ROLES);
        }
    }
	
	/**
	 * @return
	 */
	public Boolean isAdmin() {
        List<Role> list = getCurrentRole();
        for (Role roles:list) {
            if (roles.getRoleCode().equals("ROLE_ADMIN") || roles.getRoleCode().equals("ROLE_SUPER_ADVANCED") || roles.getRoleCode().equals("ROLE_SUPER_ADMIN")) {
                return true;
            }
        }
        return false;
    }
	

    public Boolean isRoleAdmin() {
        List<Role> list = getCurrentRole();
        for (Role roles:list) {
            if (roles.getRoleCode().equals("ROLE_ADMIN") || roles.getRoleCode().equals("ROLE_SUPER_ADMIN")) {
                return true;
            }
        }
        return false;
    }
	
    /**
     * 是否含有部门管理角色
     * 
     * @return
     */
    public Boolean isDepartment() {
        List<Role> list = getCurrentRole();
        for (Role roles:list) {
            if (roles.getRoleCode().equals("ROLE_ADMIN") || roles.getRoleCode().equals("ROLE_SUPER_ADMIN")) {
                return true;
            }
        }
        return false;
    }
    

	public List<Resource> getcurrentResource() {
		return manageService.getResourceList(super.getUserName());
	}


    
}
