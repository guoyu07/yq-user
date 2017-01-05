package com.yq.admin.manager.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.admin.manage.action.BaseManageAction;
import com.yq.manage.bean.Resource;
import com.yq.manage.service.ManageService;
import com.yq.manage.util.ComparePlayerResource;
import com.yq.manager.bean.PlayerResource;

public class AdminManagerAction extends BaseManageAction<Object> {

	private static final long serialVersionUID = 1L;
    // 系统顶端菜单
    private static final String SYS_MENU          = "SYS_MENU";
    private List<PlayerResource> playerloginResourceList ;
    private List<PlayerResource> rootList ;
    
    private int type;
	
	
	public String execute(){
		initResources();
		return SUCCESS;
	}
	
	
	public String getResource(){
		type = 7;
		initResources();
		return SUCCESS;
	}
	



	/**
     * 初始化资源路径
     */
    public void initResources() {
        HttpServletRequest request = ServletActionContext.getRequest();
        ManageService manageService = ServiceCacheFactory.getService(ManageService.class);
        
        HashSet<PlayerResource> rootset = new HashSet<>();
        //获取该用户的资源
        List<Resource> list = null;
        if(type==7){
        	list = this.getcurrentResource();
        }else{
        	list = this.getLoginResourceList();
        }
        Resource r = manageService.getResourceListById(1);//得到需要显示的根
        
        //筛选出会员中心后台需要显示的根
        for (Resource resource : list) {
        	 // 附加管理
        	if(resource.getResourceId() == r.getId() && ("FJGL").equals(resource.getResoCode())){
        		PlayerResource fjglres = new PlayerResource();
        		fjglres.setId(resource.getId());
        		fjglres.setResoNo(resource.getResoNo());
        		fjglres.setResoName(resource.getResoName());
        		//添加附加管理相关的子根（此处只做二级菜单）
        		ArrayList<Resource> fjgl2resList=new ArrayList<>();
        		Resource fjgl2;
				for (Resource child : list) {
	                    if (child.getResourceId()==fjglres.getId() && !("FJGL").equals(child.getResoCode())) {
	                    	fjgl2 = child;
	                    	fjgl2resList.add(fjgl2);
	                    }
	            }
				fjglres.setResourceList(fjgl2resList);
        		fjglres.setResoCode(resource.getResoCode());
        		fjglres.setResoClass(resource.getResoClass());
        		rootset.add(fjglres);
        	}
        	 // 信息管理
        	if(resource.getResourceId() == r.getId() && ("INFO_MANAGER").equals(resource.getResoCode())){
        		PlayerResource xxglres = new PlayerResource();
        		xxglres.setId(resource.getId());
        		xxglres.setResoNo(resource.getResoNo());
        		xxglres.setResoName(resource.getResoName());
        		//添加附加管理相关的子根（此处只做二级菜单）
        		ArrayList<Resource> xxgl2resList=new ArrayList<>();
        		Resource xxgl2;
				for (Resource child : list) {
	                    if (child.getResourceId()==xxglres.getId() && !("INFO_MANAGER").equals(child.getResoCode())) {
	                    	xxgl2 = child;
	                    	xxgl2resList.add(xxgl2);
	                    }
	            }
				xxglres.setResourceList(xxgl2resList);
				xxglres.setResoCode(resource.getResoCode());
				xxglres.setResoClass(resource.getResoClass());
				rootset.add(xxglres);
        	}
        	 // 会员管理
        	if(resource.getResourceId() == r.getId() && ("MENBER_MANAGE").equals(resource.getResoCode())){
        		PlayerResource hyglres = new PlayerResource();
        		hyglres.setId(resource.getId());
        		hyglres.setResoNo(resource.getResoNo());
        		hyglres.setResoName(resource.getResoName());
        		//添加附加管理相关的子根（此处只做二级菜单）
        		ArrayList<Resource> hygl2resList=new ArrayList<>();
        		Resource hygl2;
				for (Resource child : list) {
	                    if (child.getResourceId()==hyglres.getId() && !("MENBER_MANAGE").equals(child.getResoCode())) {
	                    	hygl2 = child;
	                    	hygl2resList.add(hygl2);
	                    }
	            }
				hyglres.setResourceList(hygl2resList);
				hyglres.setResoCode(resource.getResoCode());
				hyglres.setResoClass(resource.getResoClass());
				rootset.add(hyglres);
        	}
        	
        	
		}
        
        Iterator<PlayerResource> it=rootset.iterator();
        ArrayList<PlayerResource> li=new ArrayList<PlayerResource>();
        while(it.hasNext()){
        	li.add(it.next());
        }
        rootList = li;
        Collections.sort(rootList,new ComparePlayerResource());
        request.getSession().setAttribute(SYS_MENU, rootList);
    }


	public List<PlayerResource> getPlayerloginResourceList() {
		return playerloginResourceList;
	}


	public void setPlayerloginResourceList(List<PlayerResource> playerloginResourceList) {
		this.playerloginResourceList = playerloginResourceList;
	}


    
    

}
