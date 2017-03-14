package com.yq.admin.business.action;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.common.cache.Cache;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.session.Session;
import com.yq.admin.manage.action.BaseManageAction;
import com.yq.cw.service.CwService;
import com.yq.manage.bean.Resource;
import com.yq.manage.bean.Staff;
import com.yq.manage.service.ManageService;
import com.yq.manage.util.AdminGlobal;
import com.yq.manage.util.SystemInfo;
import com.yq.manager.service.AdminService;
/**
 * @author 作者: HuHua
 * @version 2016年12月17日
 * 类说明  
 */
public class BusinessManagerAction extends BaseManageAction<Object> {
    private static final long   serialVersionUID  = 1L;
    
    private static final String ROOT_RESOURCE     = "ROOT_RESOURCE";
    private static final String ROOT_DEPARTMENT   = "ROOT_DEPARTMENT";
    private static final String LOGIN_ROLE        = "LOGIN_ROLE";
    private static final String LOGIN_RESOURCE    = "LOGIN_RESOURCE";
    private static final String SYSTEM_INFO       = "SYSTEM_INFO";
    private static final String IS_ADMIN          = "IS_ADMIN";
    private static final String IS_DEPARTMENT     = "IS_DEPARTMENT";
    // 系统顶端菜单
    private static final String SYS_MENU          = "SYS_MENU";
    private List<Resource> rootList ;
    // 附加管理
    private static final String  Business    = "FIRST_FJGL_URL";
   /* // 信息管理
    private static final String FIRST_INFO_URL    =  "FIRST_INFO_URL";
    // 玩家管理
    private static final String FIRST_PLAYER_URL  = "FIRST_PLAYER_URL";
    // 系统管理
    private static final String FIRST_ADMIN_URL   = "FIRST_ADMIN_URL";*/

    private String manageuser;

    private Staff staffTable;
    
    
    /**
     * 登录进入管理后台
     * @return
     * @throws Exception
     */
    public String initjoin() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        HttpServletRequest request =  ServletActionContext.getRequest();
        staffTable = this.getCurrentStaff();
        session.setAttribute(AdminGlobal.LOGIN_CURRENT_STAFF, staffTable);
        session.setAttribute(AdminGlobal.LOGIN_CURRENT_USER, this.getCurrentUser());
    	session.setAttribute("LOGIN_CURRENT_DEPARTMENT", this.getCurrentDepartment());
        session.setAttribute(ROOT_RESOURCE, this.getRootResource());
        session.setAttribute(ROOT_DEPARTMENT, this.getRootDepartment());
        session.setAttribute(LOGIN_RESOURCE, this.getLoginResourceList());
        session.setAttribute(LOGIN_ROLE, this.getCurrentRole());// 当前登陆用户角色
        session.setAttribute(IS_ADMIN, this.isAdmin());// 是否系统管理员
        session.setAttribute(IS_DEPARTMENT, this.isDepartment());// 是否含有部门管理角色
        initResources();// 初始化用户资源
        AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
        Cache<String,Session> adcache= adminService.getAdminUserMap();
        CwService cwService = ServiceCacheFactory.getService(CwService.class);
        Cache<String,Session> cwcache= cwService.getCwUserMap();
        // 统计信息
        SystemInfo sf=new SystemInfo();
        sf.setAdminOnlinePlayerNum(adcache.size()+"");
        sf.setCwOnlinePlayerNum(cwcache.size()+"");
        request.setAttribute(SYSTEM_INFO, sf);
        return SUCCESS;
    }
    
    public List<Resource> getRootList() {
		return rootList;
	}

	public void setRootList(List<Resource> rootList) {
		this.rootList = rootList;
	}

	
	
	public Staff getStaffTable() {
		return staffTable;
	}

	public void setStaffTable(Staff staffTable) {
		this.staffTable = staffTable;
	}

	/**
     * 初始化资源路径
     */
    @SuppressWarnings("unchecked")
	public void initResources() {
        HttpServletRequest request = ServletActionContext.getRequest();
        ManageService manageService = ServiceCacheFactory.getService(ManageService.class);
        Resource r = manageService.getRootResource();
       // Resource r = (Resource) ServletActionContext.getRequest().getSession().getAttribute(ROOT_RESOURCE);
        //获取该用户的资源
        List<Resource> list = manageService.getResourceList(super.getUserName());
        List<Resource> rList = new ArrayList<Resource>();
        for (Resource res : list) {
            // 商户管理
            if (("Business").equals(res.getResoCode())) {
                for (Resource child : list) {
                    if (res.getResourceId()==child.getId()) {
                        if (request.getSession().getAttribute(Business) == null) {
                            request.getSession().setAttribute(Business, child.getResoUrl());
                            break;
                        }
                    }
                }
            }
           /* // 信息管理
            if (("INFO_MANAGER").equals(res.getResoCode())) {
                for (Resource child : list) {
                    if (res.getResourceId()==child.getId()) {
                        if (request.getSession().getAttribute(FIRST_INFO_URL) == null) {
                            request.getSession().setAttribute(FIRST_INFO_URL, child.getResoUrl());
                            break;
                        }
                    }
                }
            }
            // 会员管理
            if (("MENBER_MANAGE").equals(res.getResoCode())) {
                for (Resource child : list) {
                    if (res.getResourceId()==child.getId()) {
                        if (request.getSession().getAttribute(FIRST_PLAYER_URL) == null) {
                            request.getSession().setAttribute(FIRST_PLAYER_URL, child.getResoUrl());
                            break;
                        }
                    }
                }
            }
            // 系统管理
            if (("YHGL").equals(res.getResoCode()) || ("JSGL").equals(res.getResoCode()) || ("BMGL").equals(res.getResoCode()) || ("ZYGL").equals(res.getResoCode())) {
                for (Resource child : list) {
                    if (res.getResourceId()==child.getId()) {
                        if (request.getSession().getAttribute(FIRST_ADMIN_URL) == null) {
                            request.getSession().setAttribute(FIRST_ADMIN_URL, child.getResoUrl());
                            break;
                        }
                    }
                }
            }*/
            if (res.getResourceId()==r.getId()) {
            	rList.add(res);
            }
        }
        rootList=rList;
        request.getSession().setAttribute(SYS_MENU, rootList);
    }

	public String getManageuser() {
		return manageuser;
	}

	public void setManageuser(String manageuser) {
		this.manageuser = manageuser;
	}

    
}
