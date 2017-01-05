package com.yq.admin.manage.action;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.util.StringUtils;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.manage.bean.ManageUser;
import com.yq.manage.bean.Resource;
import com.yq.manage.service.ManageService;
import com.yq.manage.util.RequestParameter;
public class ManageUserAction extends BaseManageAction<ManageUser>{
    private static final long serialVersionUID = 1L;
    /** 页面传递参数过来 */
    private String            userName;
    private String            node;
    protected int             pageSize;
    protected int             pageNum;
    private ManageUser         userTable;
    private String            treeId;
    private List<Resource> resourceList;
    /** services* */
 /*   private UserTableServices userTableServices;
    private RoleServices      roleServices;*/

    /**
     * 分配角色的时候,加载树
     * 
     * @return
     * @throws Exception
     */
/*    public String loadTree() throws Exception {
        roleServices = (RoleServices) this.getBean("roleServices");
        JsonUtil.outJson(roleServices.loadTree(this.getRequest().getParameter("paramId"),this.isDepartment()), ServletActionContext.getResponse());
        return null;
    }
*/
    /**
     * 采用Ajax无刷新分页 如果参数中ajax=true 那么就执行ajax跳转 如果ajax=false 就执行page跳转
     * 
     * @return
     * @throws Exception
     */
    public String pageList() throws Exception {
        // 获得请求对象
        HttpServletRequest request = ServletActionContext.getRequest();
        // 用户信息操作ServiceBean
        ManageService manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
        List<RequestParameter> params = new ArrayList<RequestParameter>();
       /* PageRequest pageRequest = new PageRequest();
        List<RequestParameter> params = new ArrayList<RequestParameter>();
        int pageSize = this.getPageSize(request.getParameter("pageSize"));
        int pageNum = this.getPageNum(request.getParameter("pageNumber"));*/
        if(this.isRoleAdmin()){
            if (StringUtils.hasText(treeId)) {
                params.add(new RequestParameter("pid", treeId));
                request.setAttribute("clickId", treeId);
            }
        }else{
            params.add(new RequestParameter("pid", this.getCurrentDepartment().getPartmentId()+""));
            request.setAttribute("clickId", this.getCurrentDepartment().getPartmentId());
        }
        String userName = super.getUserName();
        if (StringUtils.hasText(userName)) {
            params.add(new RequestParameter("userName", userName));
            request.setAttribute("userName", userName);
        }
        if (!isRoleAdmin()) {
           params.add(new RequestParameter("depId", getCurrentDepartment().getPartmentId()+""));
       }
        resourceList=manageService.getResourceList(userName);
        
        super.initPage(manageService.getManageUserList(super.getToPage(),10));
        // 判断跳转方式 
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

    
    
   /* *//**
     * 跳转去表单页面
     * 
     * @return
     * @throws Exception
     *//*
    public String form() throws Exception {
        userTableServices = (UserTableServices) this.getBean("userTableServices");
        if (StringUtils.hasText(this.getRequest().getParameter("id"))) {
            this.getRequest().setAttribute("info", userTableServices.findById(this.getLongParameter("id")));
        }
        return "FORM";
    }

    *//**
     * 保存角色
     * 
     * @return
     * @throws Exception
     *//*
    public String save() throws Exception {
        roleServices = (RoleServices) this.getBean("roleServices");
        JsonUtil.outJson(roleServices.saveTree(this.getRequest().getParameter("userId"), this.getRequest().getParameter("roleCheckId"), this.getSession()), ServletActionContext.getResponse());
        return null;
    }

    *//**
     * 删除用户
     * 
     * @return
     * @throws Exception
     *//*
    public String deleteUser() throws Exception {
        userTableServices = (UserTableServices) this.getBean("userTableServices");
        userTableServices.deleteUsers(this.getRequest().getParameter("ids"), this.getSession());
        return pageList();
    }

    *//**
     * 新增用户
     * 
     * @return
     * @throws Exception
     *//*
    public String createUser() throws Exception {
        userTableServices = (UserTableServices) this.getBean("userTableServices");
        boolean isSuccess = false;
        String id = this.getRequest().getParameter("id");
        if (StringUtils.hasText(id)) {
            userTable.setId(Long.valueOf(id));
            isSuccess = userTableServices.update(userTable, staffTable, this.getRequest().getParameter("deptId"));
        } else {
            isSuccess = userTableServices.createUser(userTable, staffTable, this.getRequest().getParameter("deptId"), this.getCurrentUser(), this.getSession());
        }
        if (isSuccess) {
            return "LIST";
        } else {
            this.getRequest().setAttribute("user", I18NUtil.returnBundle(null).getString("UsernameAlreadyExists"));
            return "LIST";
        }
    }

    *//**
     * 角色分配跳转
     * 
     * @return
     * @throws Exception
     *//*
    public String treePageForward() throws Exception {
        this.getRequest().setAttribute("userId", this.getRequest().getParameter("userId"));
        return "TREEPAGEFORWARD";
    }

    *//**
     * 检查旧密码是否相等
     * 
     * @return
     * @throws Exception
     *//*
    public String checkedPwd() throws Exception {
        userTableServices = (UserTableServices) this.getBean("userTableServices");
        HttpServletRequest request = this.getRequest();
        JsonUtil.outJson(userTableServices.checkedPwd(request.getParameter("oldPwd"), request.getParameter("userId"), request.getSession()), this.getResponse());
        return null;
    }

    *//**
     * 修改密码
     * 
     * @return
     * @throws Exception
     *//*
    public String savePwd() throws Exception {
        userTableServices = (UserTableServices) this.getBean("userTableServices");
        HttpServletRequest request = this.getRequest();
        JsonUtil.outJson(userTableServices.savePwd(request.getParameter("newPwd"), request.getParameter("userId"), request.getSession()), this.getResponse());
        return null;
    }

    *//**
     * 跳转修改密码页
     * 
     * @return
     * @throws Exception
     *//*
    public String toPwdPage() throws Exception {
        HttpServletRequest request = this.getRequest();
        request.setAttribute("id", request.getParameter("id"));
        return "PWD";
    }

    *//**
     * 登陆用户名称检查
     * 
     * @return
     * @throws Exception
     *//*
    public String checkedUserName() throws Exception {
        userTableServices = (UserTableServices) this.getBean("userTableServices");
        HttpServletRequest request = this.getRequest();
        String userName = request.getParameter("userTable.userName");
        String oldUserName = request.getParameter("oldUserName");
        if (!oldUserName.equals(userName)) {
            AjaxResult ar = userTableServices.checkedUserName(userName, getSession());
            if (ar.getInfo().equals("true")) {
                this.getResponse().getWriter().write("true");
            } else {
                this.getResponse().getWriter().write("false");
            }
        } else {
            this.getResponse().getWriter().write("true");
        }
        return null;
    }

    *//**
     * 用户详细信息
     * 
     * @return
     * @throws Exception
     *//*
    public String userInfo() throws Exception {
        userTableServices = (UserTableServices) this.getBean("userTableServices");
        HttpServletRequest request = this.getRequest();
        request.setAttribute("info", userTableServices.findById(Long.valueOf(request.getParameter("id"))));
        return "INFO";
    }

    *//**
     * 保存用户分配的游戏服
     * @return
     * @throws Exception
     *//*
    public String saveServerIds() throws Exception {
        userTableServices = (UserTableServices) this.getBean("userTableServices");
        JsonUtil.outJson(userTableServices.saveServerIds(this.getRequest().getParameter("userId"), this.getRequest().getParameter("serverIds"), this.getSession()), this.getResponse());
        return null;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
    }

    public void setUserServices(UserTableServices userTableServices) {
        this.userTableServices = userTableServices;
    }

    public void setUserTableServices(UserTableServices userTableServices) {
        this.userTableServices = userTableServices;
    }

    public void setRoleServices(RoleServices roleServices) {
        this.roleServices = roleServices;
    }

    public UserTable getUserTable() {
        return userTable;
    }

    public void setUserTable(UserTable userTable) {
        this.userTable = userTable;
    }

    public StaffTable getStaffTable() {
        return staffTable;
    }

    public void setStaffTable(StaffTable staffTable) {
        this.staffTable = staffTable;
    }

    public String getTreeId() {
        return treeId;
    }

    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }*/
}
