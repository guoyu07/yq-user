package com.yq.admin.manage.action;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.util.StringUtils;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.manage.bean.Department;
import com.yq.manage.service.ManageService;
import com.yq.manage.util.JsonUtil;
import com.yq.manage.util.RequestParameter;
public class DepartmentAction extends BaseManageAction<Department> {
    private static final long  serialVersionUID = 1L;
    /** *services** */
    private ManageService manageService;
    /** *页面传递参数** */
    private String             treeId;
    private String             node;
    private String             param;
    private String             deptName;
    private String             enabled;
    private String             deptDesc;

    /**
     * 跳转去表单页面
     * 
     * @return
     * @throws Exception
     */
    public String form() throws Exception {
    	manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
    	HttpServletRequest request = ServletActionContext.getRequest();
        if (StringUtils.hasText(request.getParameter("id"))) {
        	request.setAttribute("info", manageService.findDepartmentById(Integer.parseInt(request.getParameter("id"))));
            request.setAttribute("treeId", request.getParameter("treeId"));
        }
        return "FORM";
    }

    /**
     * 删除部门信息
     * 
     * @return
     * @throws Exception
     */
    public String deleteDepartment() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
        manageService.deleteDepartment(request.getParameter("ids"));
        return listPage();
    }

    
    private String pid ;
    /**
     * 资源信息分页
     * 
     * @return
     * @throws Exception
     */
    public String listPage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
        //List<RequestParameter> params = new ArrayList<RequestParameter>();
        if (StringUtils.hasText(treeId)) {
            pid=treeId;
            request.getSession().setAttribute("treePid", treeId);
            request.setAttribute("clickId", treeId);
        } else {
            // params.add(new RequestParameter("pid", this.getCurrentArea().getId().toString()));
        }
        if(pid!=null){
        	super.initPage(manageService.findDepartmentPageList(super.getToPage(),20,Integer.parseInt(pid)));
        }else{
        	super.initPage(manageService.findDepartmentPageList(super.getToPage(),20,0));
        }
       
        String ajax = request.getParameter("ajax");
        if ("true".equals(ajax) && ajax != null) {
            return "AJAX";
        } else {
            return "LIST";
        }
    }

    /**
     * 保存部门信息
     * 
     * @return
     * @throws Exception
     */
    public String saveOrUpdateDepartment() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
        if (StringUtils.hasText(request.getParameter("id"))) {
        	manageService.updateDepartment(deptName, enabled, deptDesc, request.getParameter("id"), super.getUserName());
        } else {
        	manageService.saveDepartment(deptName, enabled, deptDesc, request.getSession().getAttribute("treePid").toString(), super.getUserName());
        }
        return listPage();
    }
    
    /**
     * TODO 用户中心，点击部门树查询用户
     * 
     * @return
     * @throws Exception
     */
    public String clickTree() throws Exception {
		 HttpServletRequest request = ServletActionContext.getRequest();
		 manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
        List<RequestParameter> params = new ArrayList<RequestParameter>();
        params.add(new RequestParameter("param", param));
        params.add(new RequestParameter("userName", request.getParameter("userName")));
        params.add(new RequestParameter("treeId", request.getParameter("treeId")));
       //	super.initPage(manageService.clickTree(super.getToPage(),5,request.getParameter("treeId"),super.getUserName()));
        request.setAttribute("clickTreeId", request.getParameter("treeId"));
        return "SUAJAX";
    }
    
    

    /**
     * 部门树加载
     * 
     * @return
     * @throws Exception
     */
    public String loadTree() throws Exception {
    	 HttpServletRequest request = ServletActionContext.getRequest();
    	 manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
        if (StringUtils.hasText(node)) {
            if (StringUtils.hasText(request.getParameter("isgl"))) {
                JsonUtil.outJson(manageService.loadDepartmentTreeByid(Integer.parseInt(node), 0), ServletActionContext.getResponse());
            } else {
                JsonUtil.outJson(manageService.loadDepartmentTree(Integer.parseInt(node)), ServletActionContext.getResponse());
            }
        } else {
            JsonUtil.outJson(manageService.loadDepartmentTree(0), ServletActionContext.getResponse());
        }
        return null;
    }

    /**
     * 游戏服部门树分配
     * @return
     * @throws Exception
     */
    /*public String loadDepTree() throws Exception {
    	 HttpServletRequest request = ServletActionContext.getRequest();
    	manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
        JsonUtil.outJson(manageService.loadDepTree(request.getParameter("gameId")));
        return null;
    }*/


    /**
     * 保存用户分配的游戏服
     * @return
     * @throws Exception
     */
   /* public String saveServerIds() throws Exception {
    	 HttpServletRequest request = ServletActionContext.getRequest();
		 manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
        JsonUtil.outJson(manageService.saveDepartmentIds(request.getParameter("gameId"), request.getParameter("depIds")));
        return null;
    }*/

    public String getTreeId() {
        return treeId;
    }

    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }

    public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    public String getDeptDesc() {
        return deptDesc;
    }

    public void setDeptDesc(String deptDesc) {
        this.deptDesc = deptDesc;
    }

	public ManageService getManageService() {
		return manageService;
	}

	public void setManageService(ManageService manageService) {
		this.manageService = manageService;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
    
}
