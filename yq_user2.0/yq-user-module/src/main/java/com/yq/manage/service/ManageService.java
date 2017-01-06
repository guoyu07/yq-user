package com.yq.manage.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.Page;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.yq.common.utils.MD5Security;
import com.yq.manage.bean.Department;
import com.yq.manage.bean.ManageUser;
import com.yq.manage.bean.Resource;
import com.yq.manage.bean.Role;
import com.yq.manage.bean.RoleResource;
import com.yq.manage.bean.Staff;
import com.yq.manage.bean.UserRole;
import com.yq.manage.dao.DepartmentDao;
import com.yq.manage.dao.ManageUserDao;
import com.yq.manage.dao.ResourceDao;
import com.yq.manage.dao.RoleDao;
import com.yq.manage.dao.RoleResourceDao;
import com.yq.manage.dao.StaffDao;
import com.yq.manage.dao.UserRoleDao;
import com.yq.manage.util.AjaxResult;
import com.yq.manage.util.CompareResource;
import com.yq.manage.util.JqueryZTreeNode;
import com.yq.manage.util.MyTool;
import com.yq.manager.service.AdminService;

/**
 * @author 作者: HuHua
 * @version 2016年12月19日
 * 类说明  后台管理服务
 */
public class ManageService {

	//private Cache<String,Session> manageUserMap = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();
	@Autowired
  	private ManageUserDao manageUserDao;
	@Autowired
  	private DepartmentDao departmentDao;
	@Autowired
  	private ResourceDao	  resourceDao;
	@Autowired
  	private RoleDao		  roleDao;
	@Autowired
  	private UserRoleDao   userRoleDao;
	@Autowired
  	private RoleResourceDao roleResourceDao;
	@Autowired
  	private StaffDao staffDao;
	
	/*public Session getLoginManageUserName(String sessionId) {
		Session cwSession = manageUserMap.getIfPresent(sessionId);
  		return cwSession;
	}*/
	
	/**
	 * 管理人员登录
	 * @param csUserName
	 * @param passWord
	 * @param id
	 * @return
	 *//*
	public boolean adminLogin(String userName, String passWord, String sessionId) {
		String md5pass = MD5Security.md5_16(passWord);
		//管理员登录 并且获取相关的资源
		ManageUser manageUser = manageUserDao.getManageUser(userName);
		if(manageUser!=null&&manageUser.getPassword().equals(md5pass)){
			Session manageSession = new Session(userName, System.currentTimeMillis(), sessionId);
			manageUserMap.put(sessionId, manageSession);
			return true;
		}
		return false;
		
	}*/



	/**
	 * 得到玩家所有资源
	 * @param manageuser
	 * @return
	 */
	public List<Resource> getResourceList(String manageuser) {
		Set<Resource> set = new HashSet<Resource>();
		List<Role> list = this.getRole(manageuser);
        if (list.size() > 0) {
            for (Role r : list) {
                List<RoleResource> roleresList = roleResourceDao.findByRoleId(r.getId());
                if (roleresList.size() > 0) {
                    for (RoleResource roleres : roleresList) {
                    	Resource res=resourceDao.getByid(roleres.getResourceId());
                    	if(res!=null){
                    		 set.add(res);
                    	}
                    }
                }
            }
        }
        List<Resource> resourceList = new ArrayList<Resource>(set);
        Collections.sort(resourceList, new CompareResource());
        return resourceList;
	}



	public ManageUser getManageUser(String manageuser) {
		return manageUserDao.getManageUser(manageuser);
	}



	public Department getDepartment(String manageuser) {
		ManageUser user=manageUserDao.getManageUser(manageuser);
		return departmentDao.findDepartmentById(staffDao.getById(user.getStaffId()).getDepartmentId());
	}


	public IPage<ManageUser> getManageUserList(int pageIndex, int pageSize) {
		return manageUserDao.getPageList(pageIndex, pageSize);
	}

	public ManageUser findByUserName(String userName) {
		return manageUserDao.getManageUser(userName);
	}


	/**
	 * 根据id得到资源
	 * @param id
	 * @return
	 */
	public Resource getResource(int id) {
		return resourceDao.getByid(id);
	}

	/**
	 * 根据根资源
	 * @param id
	 * @return
	 */
	public Resource getRootResource() {
		return resourceDao.getRootResource();
	}

	
	
	/**
	 * 加载资源树
	 * @param pid
	 * @param paramId
	 * @return
	 */
	public List<JqueryZTreeNode> loadResourceTree(int pid, String paramId) {

        try{
            List<JqueryZTreeNode> treeList = new ArrayList<JqueryZTreeNode>();
            //if(pid!=0){
                List<Resource> list=resourceDao.findByResourceId(pid);
                if(list!=null&&list.size()>0){
                    for(Resource res : list){              
                        JqueryZTreeNode tree = new JqueryZTreeNode();
                        tree.setName(res.getResoName());
                        tree.setId(res.getId()+"");
                        tree.setOpen(true);
                        tree.setChecked(false);
                        if(resourceDao.findByResourceId(res.getResourceId()).size()>0){
                            tree.setIsParent("true");
                            tree.setIconOpen(JqueryZTreeNode.iconOpenText);
                            tree.setIconClose(JqueryZTreeNode.iconCloseText);
                        }else{
                            tree.setIsParent("false");
                            tree.setIcon(JqueryZTreeNode.iconText);
                        }
                        //tree.setChecked(true);
                        if(StringUtils.hasText(paramId)){
                            List<RoleResource> listRoleR=roleResourceDao.findByRoleId(Integer.parseInt(paramId));
                            List<Resource> values = new ArrayList<>();
                            for (RoleResource roleresource : listRoleR) {
                            	values.add(resourceDao.getByid(roleresource.getResourceId()));
							}
                            if(values.size()>0){
                                for(Resource r:values){    
                                    if(r.getId()==res.getId()){
                                        tree.setChecked(true);
                                    }
                                }
                            }
                        }
                    treeList.add(tree);
                    }
            //  }
            return treeList;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }   
        return null;
	}

	/**
	 * 得到资源分页
	 * @param pageIndex 
	 * @param pageSize
	 * @return
	 */
	public IPage<Resource> findResourcePageList(int pageIndex, int pageSize) {
		return resourceDao.findPageList(pageSize, pageIndex);
	}

	/**
	 * @param id
	 * @return
	 */
	public List<JqueryZTreeNode> loadResource(String id) {
        List<JqueryZTreeNode> treeList = new ArrayList<JqueryZTreeNode>();
        List<RoleResource> list = roleResourceDao.findByResourceId(Integer.parseInt(id));
        if(list!=null&&list.size()>0){
            for (RoleResource roleResource : list) {
	            	Role role=roleDao.findRoleId(roleResource.getRoleId());
	            	if(role!=null){
		                JqueryZTreeNode tree = new JqueryZTreeNode();
		                tree.setName(role.getRoleName());
		                tree.setId(role.getId()+"");
		                tree.setChecked(true);
		                treeList.add(tree);
	            	}
                }
            }
        return treeList;
    }

	public Resource findResourceById(int id) {
		return resourceDao.getByid(id);
	}

	/**修改资源
	 * @param resoName
	 * @param resoCode
	 * @param resoUrl
	 * @param resoLevel
	 * @param resoNo
	 * @param resoClass
	 * @param parameter
	 * @param security
	 */
	public AjaxResult updateResource(String resoName, String resoCode, String resoUrl, String resoLevel, String resoNo,
			String resoClass, int id, int security) {
		try {
            Resource resourceTable =resourceDao.getByid(id);
            resourceTable.setResoName(resoName);
            resourceTable.setResoCode(resoCode);
            resourceTable.setResoUrl(resoUrl);
            resourceTable.setResoLevel(Integer.parseInt(resoLevel));
            resourceTable.setResoNo(Integer.parseInt(resoNo));
            resourceTable.setResoClass(resoClass);
            resourceTable.setSecurity(security);
            Resource newResourceTable=resourceDao.update(resourceTable);
            AjaxResult result=new AjaxResult();
            if(newResourceTable!=null){
                result.setSuccess(true);
            }else{
                result.setFailure(true);
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
		
	}

	/**
	 * 增加资源
	 * @param resoName
	 * @param resoCode
	 * @param resoUrl
	 * @param resoLevel
	 * @param resoNo
	 * @param resoClass
	 * @param string
	 * @param security
	 */
	public AjaxResult saveResource(String resoName, String resoCode, String resoUrl, String resoLevel, String resoNo,
			String resoClass, int treePid, int security) {
		try {
            Resource resource=new Resource();
            resource.setResoName(resoName);
            resource.setResoCode(resoCode);
            resource.setResoUrl(resoUrl);
            resource.setResoLevel(Integer.parseInt(resoLevel));
            resource.setResoNo(Integer.parseInt(resoNo));
            resource.setResoClass(resoClass);
            resource.setResourceId(treePid);
            resource.setSecurity(security);
            Resource newResourceTable=resourceDao.add(resource);
            AjaxResult result=new AjaxResult();
            if(newResourceTable!=null){
                result.setSuccess(true);
            }else{
                result.setFailure(true);
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
		
	}

	/**
	 * 得到部门根资源
	 * @return
	 */
	public Department getRootDepartment() {
		return departmentDao.getRootDepartment();
	}

	
	public List<Role> getRole(String manageuser) {
		ManageUser user=manageUserDao.getManageUser(manageuser);
		if(user==null){
			throw new  ServiceException(2, "用户不存在！");
		}
		List<UserRole> userRoleList = userRoleDao.findAllByUserId(user.getId());
		if(userRoleList==null){
			throw new  ServiceException(3, "用户角色不存在！");
		}
		List<Role> list = new ArrayList<Role>();
		for (UserRole userRole : userRoleList) {
			Role role=roleDao.findRoleId(userRole.getRoleId());
			if(role!=null){
				list.add(role);
			}
		}
		return list;
	}

	/**
	 * 是否是管理员
	 * @param manageuser
	 * @return
	 */
	public Boolean isAdmin(String manageuser) {
        List<Role> list = this.getRole(manageuser);
        for (Role roles:list) {
            if (roles.getRoleCode().equals("ROLE_ADMIN") || roles.getRoleCode().equals("ROLE_SUPER_ADVANCED")) {
                return true;
            }
        }
        return false;
    }

    /**
     * 是否是系统管理员
     * @param manageuser
     * @return
     */
    public Boolean isRoleAdmin(String manageuser) {
    	 List<Role> list = this.getRole(manageuser);
        for (Role roles:list) {
            if (roles.getRoleCode().equals("ROLE_ADMIN")) {
                return true;
            }
        }
        return false;
    }

    
    /**
     * 是否是部门管理者
     * 
     * @param manageuser
     * @return
     */
    public Boolean isDepartmentManage(String manageuser) {
    	 List<Role> list = this.getRole(manageuser);
        for (Role roles:list) {
            if (roles.getRoleCode().equals("ROLE_ADMIN")) {
                return true;
            }
        }
        return false;
    }


	/**
	 * @param id
	 * @return
	 */
	public Department findDepartmentById(int id) {
		return departmentDao.findDepartmentById(id);
	}

	/**
	 * @param ids
	 */
	public int deleteDepartment(String ids) {
		return departmentDao.deleteByIds(ids);
		
	}

	/**
	 * @param pageIndex
	 * @param pagesize
	 * @param pid
	 * @return
	 */
	public IPage<Department> findDepartmentPageList(int pageIndex, int pagesize, int pid) {
		if(pid==0){
			return departmentDao.findPageList(pageIndex,pagesize);
		}else{
			return departmentDao.findPageListByPid(pageIndex, pagesize, pid);
		}
	}

	/**
	 * 更新部门
	 * 
	 * @param deptName
	 * @param enabled
	 * @param deptDesc
	 * @param id
	 * @param oparetor
	 * @return
	 */
	public AjaxResult updateDepartment(String deptName, String enabled, String deptDesc, String id, String oparetor) {
		 AjaxResult result = new AjaxResult();
		try {
            Department department = departmentDao.findDepartmentById(Integer.parseInt(id));
            department.setDeptName(deptName);
            department.setDeptDesc(deptDesc);
            Department newDepartment = departmentDao.update(Integer.parseInt(id),deptName,deptDesc,oparetor,department.getPartmentId());
          
            if (newDepartment != null) {
                result.setSuccess(true);
                result.setInfo("成功");
            } else {
                result.setFailure(true);
                result.setInfo("失败");
            }
            return result;
        } catch (Exception e) {
        	 result.setFailure(true);
             result.setInfo("失败");
            e.printStackTrace();
        }
        return null;
		
	}

	/**
	 * 新增部门
	 * @param deptName
	 * @param enabled
	 * @param deptDesc
	 * @param treePid
	 * @param oparetor
	 * @return
	 */
	public AjaxResult saveDepartment(String deptName, String enabled, String deptDesc, String treePid, String oparetor) {
		 AjaxResult result = new AjaxResult();  
		try {
	            Department department = new Department();
	            department.setDeptName(deptName);
	            department.setDeptDesc(deptDesc);
	            department.setPartmentId(Integer.parseInt(treePid));
	            department.setCreateUser(oparetor);
	            department.setCreateDate(new Date());
	            Department newDepartment = departmentDao.insert(department);
	            if (newDepartment != null) {
	                result.setSuccess(true);
	                result.setInfo("成功");
	            } else {
	                result.setFailure(true);
	                result.setInfo("失败");
	            }
	            return result;
	        } catch (Exception e) {
	        	result.setFailure(true);
                result.setInfo("失败");
	            e.printStackTrace();
	        }
	        return null;
	}

	/**
	 * @param id
	 * @param cId
	 * @return
	 */
	public List<JqueryZTreeNode> loadDepartmentTreeByid(int id, int cId) {
		try {
            List<JqueryZTreeNode> treeList = new ArrayList<JqueryZTreeNode>();
            // if(id!=null){
            List<Department> list = departmentDao.findByPidAndId(id, cId);
            if (list != null && list.size() > 0) {
                for (Department department : list) {
                    JqueryZTreeNode tree = new JqueryZTreeNode();
                    tree.setName(department.getDeptName());
                    tree.setId(String.valueOf(department.getId()));
                    tree.setOpen(true);
                    tree.setChecked(false);
                    // 判断当前节点是否有子节点
                    if (departmentDao.findByPid(department.getId()).size() > 0) {
                        tree.setIsParent("true");
                    } else {
                        tree.setIsParent("false");
                    }
                    treeList.add(tree);
                }
            }
            return treeList;
            // }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
	}

	public List<JqueryZTreeNode> loadDepartmentTree(int id) {
		 try {
	            List<JqueryZTreeNode> treeList = new ArrayList<JqueryZTreeNode>();
	            // if(id!=0){
	            List<Department> list = departmentDao.findByPid(id);
	            if (list != null && list.size() > 0) {
	                for (Department department : list) {
	                    JqueryZTreeNode tree = new JqueryZTreeNode();
	                    tree.setName(department.getDeptName());
	                    tree.setId(String.valueOf(department.getId()));
	                    tree.setOpen(true);
	                    tree.setChecked(false);
	                    // 判断当前节点是否有子节点
	                    if (departmentDao.findByPid(department.getId()).size() > 0) {
	                        tree.setIsParent("true");
	                    } else {
	                        tree.setIsParent("false");
	                    }
	                    treeList.add(tree);
	                }
	            }
	            return treeList;
	            // }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	}


	/**
	 * TODO 
	 */
	public IPage<ManageUser> clickTree(int toPage, int pageSize, String pid, String userName) {
		List<ManageUser> userList=new ArrayList<>();
		if(pid!=null){
			List<Staff> staffList = staffDao.getListByPartmentId(Integer.parseInt(pid));
			for (Staff staff : staffList) {
				userList.add(manageUserDao.getByStaffId(staff.getId()));
			}
		}
		return new Page<ManageUser>(userList, userList.size(), pageSize, toPage);
	}

	public List<JqueryZTreeNode> loadRoleTree(String id, String username) {
		//Boolean isdpm=this.isDepartmentManage(username);
		Boolean isAdmin=this.isAdmin(username);
		 List<JqueryZTreeNode> treeList = new ArrayList<JqueryZTreeNode>();
	        List<Role> list = roleDao.getRoleAllList();
	        if (list != null && list.size() > 0) {
	            for (Role r : list) {
	                if(r.getRoleCode().equals("ROLE_ADMIN")&&!isAdmin){
	                    continue;
	                }
	                JqueryZTreeNode tree = new JqueryZTreeNode();
	                tree.setName(r.getRoleName());
	                tree.setId(r.getId()+"");
	                if (StringUtils.hasText(id)) {
	                    List<UserRole> userRoles = userRoleDao.findAllByUserId(Integer.parseInt(id));
	                    if (userRoles != null && userRoles.size() > 0) {
	                        for (UserRole rv : userRoles) {
	                        		Role role = roleDao.findByRoleId(rv.getRoleId());
	                        		if(role!=null){
		                        		 if (r.getId()==role.getId()) {
		 	                                tree.setChecked(true);
		                        		 }
	                        		}
	                           
	                        }
	                    }
	                    treeList.add(tree);
	                }
	            }
	        }
	        return treeList;
	}

	public Department getCurrentDepartment(String userName) {
		ManageUser user=this.getManageUser(userName);
		return departmentDao.findDepartmentById(staffDao.getById(user.getStaffId()).getDepartmentId());
	}

	/**
	 * @param queryUserName
	 * @param pid
	 * @param pageIndex
	 * @param pagesize
	 * @return
	 */
	public IPage<ManageUser> findUserPageListByPid(int pid, int pageIndex, int pagesize) {
		if(pid!=0){
			List<Staff> stafList = staffDao.getListByPartmentId(pid);
			List<ManageUser> userList= new ArrayList<>();
			for (Staff staff : stafList) {
				ManageUser user = manageUserDao.getByStaffId(staff.getId());
				if(user!=null){
					user.setFullName(staff.getFullName());
					userList.add(user);
				}
			}
			IPage<ManageUser> list = new Page<>(userList, userList.size(), pagesize, pageIndex);
	        if (list != null && list.getData().size() > 0) {
	            StringBuffer sb = new StringBuffer();
	            for (ManageUser user : list.getData()) {
	                sb.delete(0, sb.length());
	                List<UserRole> userroleList = userRoleDao.findAllByUserId(user.getId());
	                for (UserRole userRole : userroleList) {
	                		Role role= roleDao.findByRoleId(userRole.getRoleId());
	                		if(role!=null){
	                			sb.append(role.getRoleName()).append(" | ");
	                		}
					}
	                if (sb.length() > 0) {
	                    user.setRoleName(sb.substring(0, sb.lastIndexOf("|")));
	                } else {
	                    user.setRoleName("");
	                }
	            }
	        }
	        return list;
		}else{
			
			List<ManageUser> muserList =  manageUserDao.getAllManageUser();
			List<ManageUser> userList= new ArrayList<>();
			for (ManageUser user : muserList) {
				Staff staff = staffDao.getById(user.getStaffId());
				if(staff!=null){
					user.setFullName(staff.getFullName());
					userList.add(user);
				}
			}
			IPage<ManageUser> list = new Page<>(userList, userList.size(), pagesize, pageIndex);
			if (list != null && list.getData().size() > 0) {
	            StringBuffer sb = new StringBuffer();
	            for (ManageUser user : list.getData()) {
	                sb.delete(0, sb.length());
	                List<UserRole> userroleList = userRoleDao.findAllByUserId(user.getId());
	                for (UserRole userRole : userroleList) {
	                		Role role= roleDao.findByRoleId(userRole.getRoleId());
	                		if(role!=null){
	                			sb.append(role.getRoleName()).append(" | ");
	                		}
					}
	                if (sb.length() > 0) {
	                    user.setRoleName(sb.substring(0, sb.lastIndexOf("|")));
	                } else {
	                    user.setRoleName("");
	                }
	            }
	        }
			return list;
		}
	}

	public boolean updateManageUser(ManageUser userTable, Staff staffTable, String depId,  String oparetor) {
		if(Strings.isNullOrEmpty(depId)){
			throw new ServiceException(2, "请选择部门");
		}
		//try {
            ManageUser user = manageUserDao.getByUserId(userTable.getId());
            Staff oldStaffTable = staffDao.getById(user.getStaffId());
            oldStaffTable.setFullName(staffTable.getFullName());
            oldStaffTable.setSex(staffTable.getSex());
            oldStaffTable.setMobilePhone(staffTable.getMobilePhone());
            oldStaffTable.setEmail(staffTable.getEmail());
            oldStaffTable.setDepartmentId(Integer.parseInt(depId));
            Staff newStaffTable = staffDao.update(oldStaffTable);
            if (newStaffTable != null) {
                if (manageUserDao.update(userTable.getAdminusername(),newStaffTable.getId(),user.getId(),oparetor)) {
                    return true;
                }
            }
       /* } catch (RuntimeException e) {
            e.printStackTrace();
        }*/
        return false;
	}

	public boolean createManageUser(ManageUser userTable, Staff staffTable, String depId, String oparetor) {
		if(Strings.isNullOrEmpty(depId)){
			throw new ServiceException(2, "请选择部门");
		}
		try {
			
            ManageUser hasUser = manageUserDao.getManageUser(userTable.getAdminusername());
            if (hasUser != null) {
                return false;//TODO 提示此用户名已经有人注册了
            }
          
            if(userTable.getPassword()==null){
            	 return false;//TODO 密码为空
            }
            String md5pass = MD5Security.md5_16(userTable.getPassword());
    		AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
            staffTable.setDepartmentId(Integer.parseInt(depId));
            int staffId = staffDao.insert(staffTable);
            if (staffId != 0) {
            	
            	//Fcxt fcxt = new Fcxt();
            	userTable.setAdminusername(userTable.getAdminusername());
            	userTable.setPassword(md5pass);
            	userTable.setStaffId(staffId);
            	userTable.setPassword(md5pass);
            	userTable.setIsOverdue(0);// 默认不是海外用户
            	userTable.setCreateName(oparetor);
            	userTable.setCreateDate(new Date());
               /* if(adminService.getFcxt(userTable.getAdminusername())==null){
                	 adminService.addFcxt(fcxt);
                     manageUserDao.insert(userTable);
                }*/
                manageUserDao.insert(userTable);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           // SessionMap.getInstance().removeBySessionId(user.getAdminusername(), Global.REGISTER_RESULT);
        }
        return false;
	}

	/**
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Role> findRolePageList(int pageIndex, int pageSize) {
		
		return roleDao.findPageList(pageSize, pageIndex);
	}

	/**
	 * 根据角色id得到角色信息
	 * @param roleId
	 * @return
	 */
	public Role findRoleById(int roleId) {
		return roleDao.findByRoleId(roleId);
	}

	public AjaxResult updateRole(int id, String roleName, String roleCode, String roleDesc,String oprator) {
		 	Role role = roleDao.findByRoleId(id);
            role.setRoleName(roleName);
            role.setRoleCode(roleCode);
            role.setRoleDesc(roleDesc);
            role.setUpdateDate(new Date());
            role.setUpdateUser(oprator);
            role.setId(id);
            Role newRole = roleDao.update(role);
            AjaxResult result = new AjaxResult();
            if (newRole != null) {
                result.setSuccess(true);
            } else {
                result.setFailure(true);
            }
            return result;
	}

	
	public void saveRole(String roleName, String roleCode, String roleDesc,String oprator) {
		if(roleName==null || roleCode==null || roleDesc==null){
			return  ;
		}
			Role oldrole = roleDao.findRoleName(roleName);
			if(oldrole!=null){
				return ;
			}
            Role role = new Role();
            role.setRoleName(roleName);
            role.setRoleCode(roleCode);
            role.setRoleDesc(roleDesc);
            role.setCreateDate(new Date());
            role.setCreateUser(oprator);
            roleDao.insert(role);
	}

	/**
	 * 批量删除角色
	 * @param ids
	 * @return
	 */
	public AjaxResult deleteRoles(String ids) {
		AjaxResult result = new AjaxResult();
        try {
            int count = roleDao.deleteByIds(ids);
            if (count > 0) {
                result.setSuccess(true);
            } else {
                result.setFailure(true);
            }
        } catch (RuntimeException e) {
            result.setFailure(true);
        }
        return result;
	}

	public List<JqueryZTreeNode> loadAllRoleTree(String paramId) {
		try{
            HttpServletRequest request = ServletActionContext.getRequest();
            String ctx=request.getContextPath();
            
            List<JqueryZTreeNode> treeList = new ArrayList<JqueryZTreeNode>();
            
            List<Resource> values=new ArrayList<Resource>();
            if(StringUtils.hasText(paramId)){
            	List<RoleResource> roleResourceList=roleResourceDao.findByRoleId(Integer.parseInt(paramId));
            	for (RoleResource roleResource : roleResourceList) {
            		Resource resource= resourceDao.getByid(roleResource.getResourceId());
            		if(resource!=null){
            			values.add(resource);
            		}
				}
                 
                
            }
            //if(pid!=null){
                List<Resource> list=resourceDao.getResourceList();
                if(list!=null&&list.size()>0){
                    for(Resource res : list){           
                        JqueryZTreeNode tree = new JqueryZTreeNode();
                        tree.setName(res.getResoName());
                        tree.setId(res.getId()+"");
                        tree.setOpen(true);
                        tree.setChecked(false);
                        if(res.getResourceId()!=0){
                            tree.setpId(res.getResourceId()+""); 
                        }
                        if(resourceDao.findByResourceId(res.getId()).size()>0){
                            tree.setIsParent("true");
                            tree.setOpen(true);
                            tree.setIconOpen(ctx+"/scripts/zTree/zTreeStyle/img/minus.gif");
                            tree.setIconClose(ctx+"/scripts/zTree/zTreeStyle/img/plus.gif");
                        }else{
                            tree.setIsParent("false");
                            tree.setOpen(false);
                            tree.setIcon(ctx+"/scripts/zTree/zTreeStyle/img/join.gif");
                        }
                        //tree.setChecked(true);
                    
                            if(values.size()>0){
                                for (int i = 0; i < values.size(); i++) {
                                    Resource r=values.get(i);
                                    if(r.getId()==res.getId()){
                                        tree.setChecked(true);
                                        values.remove(i);
                                    }
                                }
                        }
                    treeList.add(tree);
                    }
            //  }
            return treeList;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }   
        return null;
	}

	public AjaxResult saveRloeTree(String roleId, String resourcesCheckId, HttpSession session) {
		 AjaxResult result = new AjaxResult();
        try {
            if(StringUtils.hasText(roleId)) {
                if (StringUtils.hasText(resourcesCheckId)) {
                    roleResourceDao.deleteByRoleId(Integer.parseInt(roleId));
                    List<Integer> list = MyTool.getCheckedId(resourcesCheckId);
                    Role role=roleDao.findByRoleId(Integer.parseInt(roleId));
                    for (Integer checkId : list) {
                        RoleResource roleResource = new RoleResource();
                        roleResource.setResourceId(checkId);
                        roleResource.setRoleId(role.getId());
                        if(!roleResourceDao.isHas(roleResource)){
                        	 roleResourceDao.insert(roleResource);
                        }
                       
                    }
                    result.setSuccess(true);
                    result.setInfo("成功");
                } else {
                    roleResourceDao.deleteByRoleId(Integer.parseInt(roleId));
                    result.setSuccess(true);
                    result.setInfo("成功");
                }
            }
        } catch (Exception ex) {
            result.setFailure(true);
            result.setInfo("失败");
            ex.printStackTrace();
        }
        return result;
	}

	public List<JqueryZTreeNode> loadUserTree(int rootId) {
		 List<JqueryZTreeNode> treeList = new ArrayList<JqueryZTreeNode>();
		 	List<ManageUser> list=new ArrayList<>();
	        List<UserRole> userRolelist = userRoleDao.findByRoleId(rootId);
	        for (UserRole userRole : userRolelist) {
	        	ManageUser manageUser = this.findManageUserByUserId(userRole.getUserId());
	        	if(manageUser!=null){
	        		list.add(manageUser);
	        	}
			}
	        
	        if (list != null && list.size() > 0) {
	            for (ManageUser user : list) {
	            	Staff staff=staffDao.getById(user.getStaffId());
	            	if(staff!=null){
		                JqueryZTreeNode tree = new JqueryZTreeNode();
		                tree.setName(staff.getFullName() + "(" + user.getAdminusername() + ")");
		                tree.setId(user.getId()+"");
		                tree.setChecked(true);
		                treeList.add(tree);
	            	}
	            }
	        }
	        return treeList;
	}


	/**
	 * 保存资源分配
	 * @param resourcesId
	 * @param roleCheckId
	 * @return
	 */
	public AjaxResult saveRoleTree(String resourcesId, String roleCheckId) {
		 AjaxResult result = new AjaxResult();
	        try {
	            if(StringUtils.hasText(resourcesId)) {
	                if (StringUtils.hasText(roleCheckId)) {
	                    roleResourceDao.deleteByResourceId(Integer.parseInt(resourcesId));
	                    List<Integer> list = MyTool.getCheckedId(roleCheckId);
	                    Resource resource=resourceDao.getByid(Integer.parseInt(resourcesId));
	                    if(resource==null){
	                    	result.setFailure(true);
	 	                    result.setInfo("资源不存在，失败！");
	                    }
	                    for (Integer checkId : list) {
	                        RoleResource roleResource = new RoleResource();
	                        roleResource.setResourceId(resource.getId());
	                        roleResource.setRoleId(roleDao.findByRoleId(checkId).getId());
	                        roleResourceDao.insert(roleResource);
	                    }
	                    result.setSuccess(true);
	                    result.setInfo("成功");
	                } else {
	                    roleResourceDao.deleteByResourceId(Long.valueOf(resourcesId));
	                    result.setSuccess(true);
	                    result.setInfo("成功");
	                }
	            }
	        } catch (Exception ex) {
	            result.setFailure(true);
	            result.setInfo("失败");
	            ex.printStackTrace();
	        }
	        return result;
	}

	/**根据resourceID或者id得到资源
	 * @param pageSize
	 * @param pageIndex
	 * @param pid
	 * @return
	 */
	public IPage<Resource> findResourceByIdOrResourcePageList(int pageSize,int pageIndex, int pid) {
		return resourceDao.findResourceByIdOrResourcePageList(pageSize, pageIndex, pid);
	}
	
	
	public List<Resource> findResourceByIdOrResourceList(int pid) {
		return resourceDao.findResourceByIdOrResourceList(pid);
	}
	
	

	/**
	 * 删除资源
	 * @param ids
	 * @param session
	 */
	public int deleteResources(String ids, HttpSession session) {
		return resourceDao.deleteByIds(ids);
		
	}

	public AjaxResult saveUserRoleTree(String userId, String roleCheckId, HttpSession session) {
		AjaxResult result = new AjaxResult();
        try {
            if (StringUtils.hasText(userId)) {
                if (StringUtils.hasText(roleCheckId)) {
                    int id = Integer.parseInt(userId);
                    userRoleDao.deleteByUserId(id);
                    List<Integer> list = MyTool.getCheckedId(roleCheckId);
                    ManageUser user = this.findManageUserByUserId(id);
                    for (Integer checkId : list) {
                        UserRole userRole = new UserRole();
                        userRole.setUserId(user.getId());
                        userRole.setRoleId(checkId);
                        userRole.setCreateDate(new Date());
                        userRoleDao.save(userRole);
                    }
                    result.setSuccess(true);
                    result.setInfo("成功");
                } else {
                    result.setFailure(true);
                    result.setInfo("失败");
                }
            }
        } catch (Exception ex) {
            result.setFailure(true);
            result.setInfo("玩家为空");
            ex.printStackTrace();
        }
        return result;
	}

	public ManageUser findManageUserByUserId(int id) {
		return manageUserDao.getByUserId(id);
	}


	public Resource getResourceByUrl(String path) {
		return resourceDao.getByResourceUrl(path);
		
	}

	public AjaxResult deleteManageUsers(String ids) {
		AjaxResult result = null;
        try {
            result = new AjaxResult();
            userRoleDao.deleteByUserIds(ids);
            List<Integer> list = MyTool.getCheckedId(ids);
            for (Integer id : list) {
                ManageUser userTable = manageUserDao.getByUserId(id);
                if (userTable != null) {
                    int userId = userTable.getId();
                    int staffId = userTable.getStaffId();
                    manageUserDao.delete(userId);
                    staffDao.delete(staffId);
                }
            }
            result.setSuccess(true);
        } catch (RuntimeException e) {
            result.setFailure(true);
            e.printStackTrace();
        }
        return result;
		
	}

	/*public void logout(String sessionId) {
		manageUserMap.invalidate(sessionId);
	}
*/
	public Staff getStaffByUserName(String manageuser) {
		ManageUser user = getManageUser(manageuser);
		return staffDao.getById(user.getStaffId());
	}


	public AjaxResult savePwd(String newPwd, String id) {
		 ManageUser user = manageUserDao.getByUserId(Integer.parseInt(id));
		 String pass = MD5Security.md5_16(newPwd);
		 AjaxResult result = new AjaxResult();
		 if(user==null){
			 result.setFailure(true);
			 result.setInfo("用户不存在");
		 }
		 boolean flag=manageUserDao.updatePw(pass, user.getId());
/*		 AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
		 adminService.updateFcxtPass(user.getAdminusername(),pass);
*/        if (flag) {
            result.setSuccess(true);
            result.setInfo("成功");
            //TODO 更新成功后需要移除会话
          /*  HttpSession sessionhttp = ServletActionContext.getRequest()
    				.getSession();
            adminService.logout(sessionhttp.getId());*/
           
        } else {
            result.setFailure(true);
            result.setInfo("失败");
        }
        return result;
	}

	public Staff getStaffById(int id) {
		return staffDao.getById(id);
	}

	public AjaxResult checkedPwd(String oldPwd, int userId, HttpSession session) {
		ManageUser user = manageUserDao.getByUserId(userId);
		 String tempPwd = MD5Security.md5_16(oldPwd);
		 AjaxResult result = new AjaxResult();
		if(user==null){
			result.setFailure(true);
			result.setInfo("玩家为空");
		}
        if (tempPwd.equals(user.getPassword())) {
            result.setSuccess(true);
            result.setInfo("成功");
        } else {
            result.setFailure(true);
            result.setInfo("失败");
        }
        return result;
	}


	public Resource getResourceListById(int id) {
		return resourceDao.getByid(id);
	}

	public boolean isSecurity(String userName, int resourceId) {
		int userId = manageUserDao.getManageUser(userName).getId();
		List<UserRole> userRoleLis=userRoleDao.findAllByUserId(userId);
		for (UserRole userRole : userRoleLis) {
			List<RoleResource> roleResourceLis=roleResourceDao.findByRoleId(userRole.getRoleId());
			for (RoleResource roleResource : roleResourceLis) {
				if(resourceId==roleResource.getResourceId()){
					return true;
				}
			}
		}
		return false;
		
	}

	public IPage<ManageUser> findUserPageListByName(String queryUserName, int pageIndex, int pagesize) {
		ManageUser muserList =  manageUserDao.getManageUser(queryUserName);
		if(muserList==null){
			Staff staff = staffDao.getByUserFullName(queryUserName);
			if(staff!=null){
			 muserList = manageUserDao.getByStaffId(staff.getId());
			}
		}
		
		List<ManageUser> userList= new ArrayList<>();
		Staff staff = staffDao.getById(muserList.getStaffId());
		if(staff!=null){
			muserList.setFullName(staff.getFullName());
			userList.add(muserList);
		}
		IPage<ManageUser> list = new Page<>(userList, userList.size(), pagesize, pageIndex);
		if (list != null && list.getData().size() > 0) {
            StringBuffer sb = new StringBuffer();
            for (ManageUser user : list.getData()) {
                sb.delete(0, sb.length());
                List<UserRole> userroleList = userRoleDao.findAllByUserId(user.getId());
                for (UserRole userRole : userroleList) {
                		Role role= roleDao.findByRoleId(userRole.getRoleId());
                		if(role!=null){
                			sb.append(role.getRoleName()).append(" | ");
                		}
				}
                if (sb.length() > 0) {
                    user.setRoleName(sb.substring(0, sb.lastIndexOf("|")));
                } else {
                    user.setRoleName("");
                }
            }
        }
		return list;
	}



	/**
	 * 
	 *  会员中心管理后台密码修改
	 * 
	 * @param newPwd
	 * @param password2
	 * @param id
	 * @return
	 */
	public boolean savePwd(String newPwd,String password2, int id) {
		 ManageUser user = manageUserDao.getByUserId(id);
		 String pass = MD5Security.md5_16(newPwd);
		 if(newPwd==null){
			throw new ServiceException(2, "密码不能为空");
		 }
		 if(password2==null){
				throw new ServiceException(5, "确认密码不能为空");
		 }
		 if(!newPwd.equals(password2)){
				throw new ServiceException(6, "两次输入密码不一致");
		 }
		 if(user==null){
				throw new ServiceException(3, "玩家不存在");
		 }
		 boolean flag=manageUserDao.updatePw(pass, user.getId());
		 AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
        if (flag) {
            HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
            adminService.logout(sessionhttp.getId());
            return true;
        } else {
        	throw new ServiceException(4, "修改密码失败");
        }
		
	}


}
