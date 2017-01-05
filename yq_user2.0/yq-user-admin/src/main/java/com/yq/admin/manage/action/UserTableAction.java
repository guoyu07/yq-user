package com.yq.admin.manage.action;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.util.StringUtils;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.manage.bean.Department;
import com.yq.manage.bean.ManageUser;
import com.yq.manage.bean.Staff;
import com.yq.manage.service.ManageService;
import com.yq.manage.util.JsonUtil;
import com.yq.manage.util.RequestParameter;
/**
 * @author 作者: HuHua
 * @version 2016年12月22日
 * 类说明 
 */
public class UserTableAction extends BaseManageAction<ManageUser> {
    private static final long serialVersionUID = 1L;
    /** 页面传递参数过来 */
    private String            node;
    private ManageUser        userTable;
    private Staff        	  staffTable;
    private Department        department;
    private String            treeId;
    /** services* */
    private ManageService manageService;
    
    private HttpServletRequest request;
    
    /**
     * 分配角色的时候,加载树
     * 
     * @return
     * @throws Exception
     */
    public String loadTree() throws Exception {
    	request = ServletActionContext.getRequest();
    	manageService = ServiceCacheFactory.getService(ManageService.class);
        JsonUtil.outJson(manageService.loadRoleTree(request.getParameter("paramId"),super.getUserName()), ServletActionContext.getResponse());
        return null;
    }

    private String pid;
    /**
     * 采用Ajax无刷新分页 如果参数中ajax=true 那么就执行ajax跳转 如果ajax=false 就执行page跳转
     * 
     * @return
     * @throws Exception
     */
    public String pageList() throws Exception {
        // 获得请求对象
        HttpServletRequest request = ServletActionContext.getRequest();
        manageService = ServiceCacheFactory.getService(ManageService.class);
        List<RequestParameter> params = new ArrayList<RequestParameter>();
        if(this.isRoleAdmin()){
            if (StringUtils.hasText(treeId)) {
                params.add(new RequestParameter("pid", treeId));
                request.setAttribute("clickId", treeId);
            }
        }else{
        	int depid =this.getCurrentDepartment().getId();
            params.add(new RequestParameter("pid", depid+""));
            request.setAttribute("clickId", depid+"");
        }

        String queryUserName = request.getParameter("queryUserName");
        if(StringUtils.hasText(queryUserName)){
        	super.initPage(manageService.findUserPageListByName(queryUserName, super.getToPage(), 30));
        }else{
	        if(treeId!=null){
	        	super.initPage(manageService.findUserPageListByPid(Integer.parseInt(treeId), super.getToPage(), 30));
	        }else{
	        	super.initPage(manageService.findUserPageListByPid(0, super.getToPage(), 30));
	        }
        }
        /* 判断跳转方式 */
        String ajax = request.getParameter("ajax");
        if ("true".equals(ajax) && ajax != null) {
            return "AJAX";
        } else {
            return "LIST";
        }
    }

    
    private int id;
    /**
     * 跳转去表单页面
     * 
     * @return
     * @throws Exception
     */
    public String form() throws Exception {
    	 manageService = ServiceCacheFactory.getService(ManageService.class);
    	 request = ServletActionContext.getRequest();
    	 String userId = request.getParameter("id");
    	 if(userId!=null){
    		userTable= manageService.findManageUserByUserId(Integer.parseInt(userId));
        	request.setAttribute("info",userTable);
        	staffTable = manageService.getStaffById(userTable.getStaffId());
        	department = manageService.findDepartmentById(staffTable.getDepartmentId());
        }
       
        return "FORM";
    }
    

    /**
     * 保存角色
     * 
     * @return
     * @throws Exception
     */
    public String save() throws Exception {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	manageService = ServiceCacheFactory.getService(ManageService.class);
        JsonUtil.outJson(manageService.saveUserRoleTree(request.getParameter("userId"), request.getParameter("roleCheckId"), request.getSession()), ServletActionContext.getResponse());
        return null;
    }

    /**
     * 删除用户
     * 
     * @return
     * @throws Exception
     */
    public String deleteUser() throws Exception {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	manageService = ServiceCacheFactory.getService(ManageService.class);
    	manageService.deleteManageUsers(request.getParameter("ids"));
        return pageList();
    }

    /**
     * 新增或修改用户
     * 
     * @return
     * @throws Exception
     */
    public String createUser(){
    	manageService = ServiceCacheFactory.getService(ManageService.class);
    	HttpServletRequest request = ServletActionContext.getRequest();
        boolean isSuccess = false;
        String id = request.getParameter("id");
        String deptId = request.getParameter("deptId");
        if (StringUtils.hasText(id)) {
            userTable.setId(Integer.parseInt(id));
            isSuccess = manageService.updateManageUser(userTable, staffTable, deptId, super.getUserName());
        } else {
            isSuccess = manageService.createManageUser(userTable, staffTable, deptId, super.getUserName());
        }
        if (isSuccess) {
            return "LIST";
        } else {
            return "LIST";
        }
    }

    /**
     * 角色分配跳转
     * 
     * @return
     * @throws Exception
     */
    public String treePageForward() throws Exception {
    	HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("userId", request.getParameter("userId"));
        return "TREEPAGEFORWARD";
    }

    /**
     * 检查旧密码是否相等
     * 
     * @return
     * @throws Exception
     */
    public String checkedPwd() throws Exception {
    	manageService = ServiceCacheFactory.getService(ManageService.class);
    	HttpServletRequest request = ServletActionContext.getRequest();
        JsonUtil.outJson(manageService.checkedPwd(request.getParameter("oldPwd"), Integer.parseInt(request.getParameter("userId")), request.getSession()), ServletActionContext.getResponse());
        return null;
    }

    /**
     * 修改密码
     * 
     * @return
     * @throws Exception
     */
    public String savePwd() throws Exception {
    	manageService = ServiceCacheFactory.getService(ManageService.class);
    	HttpServletRequest request = ServletActionContext.getRequest();
        JsonUtil.outJson(manageService.savePwd(request.getParameter("newPwd"), request.getParameter("userId")), ServletActionContext.getResponse());
        return null;
    }

    private int status;
    /**
     * 跳转修改密码页
     * 
     * @return
     * @throws Exception
     */
    public String toPwdPage() throws Exception {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	manageService = ServiceCacheFactory.getService(ManageService.class);
    	ManageUser user =manageService.getManageUser(super.getUserName());
        request.setAttribute("id", user.getId());
        if(status==2){
        	return "APWD";
        }
        return "PWD";
    }
    
    /**
     * 登陆用户名称检查
     * 
     * @return
     * @throws Exception
     */
   /* public String checkedUserName() throws Exception {
    	manageService = ServiceCacheFactory.getService(ManageService.class);
        HttpServletRequest request = this.getRequest();
        String userName = request.getParameter("userTable.userName");
        String oldUserName = request.getParameter("oldUserName");
        if (!oldUserName.equals(userName)) {
            AjaxResult ar = manageService.checkedUserName(userName, request.getSession());
            if (ar.getInfo().equals("true")) {
            	ServletActionContext.getResponse().getWriter().write("true");
            } else {
            	ServletActionContext.getResponse().getWriter().write("false");
            }
        } else {
        	ServletActionContext.getResponse().getWriter().write("true");
        }
        return null;
    }
*/
    /**
     * 用户详细信息
     * 
     * @return
     * @throws Exception
     */
    public String userInfo() throws Exception {
    	manageService = ServiceCacheFactory.getService(ManageService.class);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("info", manageService.findManageUserByUserId(Integer.parseInt(request.getParameter("id"))));
        return "INFO";
    }

    
   

	public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
    }


    public ManageUser getUserTable() {
		return userTable;
	}

	public void setUserTable(ManageUser userTable) {
		this.userTable = userTable;
	}

	public Staff getStaffTable() {
		return staffTable;
	}

	public void setStaffTable(Staff staffTable) {
		this.staffTable = staffTable;
	}

	public ManageService getManageService() {
		return manageService;
	}

	public void setManageService(ManageService manageService) {
		this.manageService = manageService;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getTreeId() {
        return treeId;
    }

    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public Department getDepartment() {
		return department;
	}


	public void setDepartment(Department department) {
		this.department = department;
	}


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}
	
    
}
