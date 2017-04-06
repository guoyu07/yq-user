package com.yq.manage.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.Page;
import com.sr178.game.framework.plugin.IAppPlugin;
import com.sr178.module.utils.JedisUtils;
import com.yq.manage.bean.Resource;
import com.yq.manage.util.CompareResource;
public class ResourceDao implements IAppPlugin{

	@Autowired
	private Jdbc jdbc;
	
	private final static String  table = "resource";
	
	/**资源权限缓存键*/
	private static final String RESOURCE_KEY = "resource_key";
	
	
	
	private void setCacheList(String key,List<Resource> list){
		JedisUtils.setList(key, list);
	}
	
	private List<Resource> getCacheList(String key){
		return JedisUtils.getList(key, Resource.class);
	}
	
	private void delCache(String key){
		JedisUtils.delete(key);
	}

	/**
	 * 获得资源（权限列表）
	 * 
	 * @return
	 */
	public List<Resource> getResourceList(){
		List<Resource> resourceCache = getCacheList(RESOURCE_KEY);
		if(resourceCache==null || resourceCache.isEmpty()){
			return initResourceCache();
		}
		return resourceCache;
		/*List<Resource> list = findAll();
		return list;*/
	}
	
	
	/**
	 * 
	 * 初始化缓存资源
	 * 
	 * @return
	 */
	private List<Resource> initResourceCache(){
		List<Resource> list = findAll();
		setCacheList(RESOURCE_KEY, list);
		return list;
	}
	
    public int deleteByIds(String ids) {
       /* String sql="delete from "+table+"  where id in(?)";
        SqlParameter sqlparam = new SqlParameter();
        sqlparam.setString(ids);
        int i = this.jdbc.update(sql, sqlparam);*/
        /*boolean flag = i>0;
        if(flag){
			 delCache(RESOURCE_KEY);
			 initResourceCache();
		 }*/
		 
        return 1;
    }

    public Resource getByid(int id) {
    	List<Resource> list = getResourceList();
    	for (Resource resource : list) {
			if(resource.getId()==id){
				return resource;
			}
		}
    	return null;
/*    	
    	
    	  String sql="select * from "+table+" where id= ? limit 1 ";
          SqlParameter sqlparam = new SqlParameter();
          sqlparam.setInt(id);
          return this.jdbc.get(sql, Resource.class, sqlparam);
*/    }

    public int add(Resource resource) {
         int i = this.jdbc.insertBackKeys(resource);
         /*boolean flag = i>0;
         if(flag){
 			 delCache(RESOURCE_KEY);
 			 initResourceCache();
 		 }*/
         return i;
    }


    public IPage<Resource> findPageList(int pageSize, int pageIndex) {
    	List<Resource> list = getResourceList();
        Collections.sort(list, new CompareResource());
    	IPage<Resource> page= new Page<>(list, list.size(), pageSize, pageIndex);
    	return page;
    	
       /* String sql="select * from "+table+" r order by r.id ";
        return this.jdbc.getListPage(sql, Resource.class,null, pageSize, pageIndex);*/
    }


    public List<Resource> findAllChild() {
        String sql="select * from  "+table+" r where r.resourceId <>0 order by r.id asc";
        return this.jdbc.getList(sql, Resource.class, null);
    }

	public List<Resource> findByResourceId(int id) {
		List<Resource> list = getResourceList();
		List<Resource> result = new ArrayList<>(); 
    	for (Resource resource : list) {
			if(resource.getResourceId()==id){
				result.add(resource);
			}
		}
    	Collections.sort(result, new CompareResource());
    	return result;
           /* String sql="select * from  "+table+" r where r.resource_id = ? order by r.id asc";
            SqlParameter sqlparam = new SqlParameter();
            sqlparam.setInt(id);
            return this.jdbc.getList(sql, Resource.class, sqlparam);*/
	}
	

	/**
	 * 得到资源根
	 * @return
	 */
	public Resource getRootResource() {
		String sql="select * from  "+table+"  where resource_id = 0 order by id asc limit 1";
	    return this.jdbc.get(sql, Resource.class, null);
	}

	/*public Resource findById(int id) {
		 String sql="select * from "+table+" where id= ? limit 1";
         SqlParameter sqlparam = new SqlParameter();
         sqlparam.setInt(id);
         return this.jdbc.get(sql, Resource.class, sqlparam);
	}*/

	public Resource update(Resource resourceTable) {
		 String sql="update "+table+" set reso_name = ?,reso_code =?,reso_url=?,reso_level=?,reso_no=?,reso_class=?,security=? where id= ? ";
		 SqlParameter sqlparam = new SqlParameter();
         sqlparam.setString(resourceTable.getResoName());
         sqlparam.setString(resourceTable.getResoCode());
         sqlparam.setString(resourceTable.getResoUrl());
         sqlparam.setInt(resourceTable.getResoLevel());
         sqlparam.setInt(resourceTable.getResoNo());
         sqlparam.setString(resourceTable.getResoClass());
         sqlparam.setInt(resourceTable.getSecurity());
         sqlparam.setInt(resourceTable.getId());
         this.jdbc.update(sql, sqlparam);
		 /*if(this.jdbc.update(sql, sqlparam)>0){
			 delCache(RESOURCE_KEY);
			 initResourceCache();
		 }*/
		 
		 return resourceTable;
	}

	public IPage<Resource> findResourceByIdOrResourcePageList(int pageSize, int pageIndex, int pid) {
		   String sql="select * from  "+table+" where id='"+pid+"' or resource_id='"+pid+"' order by id ";
	       return this.jdbc.getListPage(sql, Resource.class, null,pageSize,pageIndex);
		
	}
	
	public List<Resource> findResourceByIdOrResourceList(int pid) {
		List<Resource> list = getResourceList();
		List<Resource> result = new ArrayList<>(); 
    	for (Resource resource : list) {
			if(resource.getId()==pid || resource.getResourceId()==pid){
				result.add(resource);
			}
		}
        Collections.sort(result, new CompareResource());
    	return result;
		  /* String sql="select * from  "+table+" where id='"+pid+"' or resource_id='"+pid+"' order by id ";
	       return this.jdbc.getList(sql, Resource.class);*/
		
	}

	public List<Resource> findAll() {
		 String sql="select * from "+table+" order by id ";
         return this.jdbc.getList(sql, Resource.class, null);
	}

	public Resource getByResourceUrl(String path) {
		 String sql="select * from "+table+" where reso_url= ? limit 1";
         SqlParameter sqlparam = new SqlParameter();
         sqlparam.setString(path);
         return this.jdbc.get(sql, Resource.class, sqlparam);
	}


	public List<Resource> getByResourceId(int resourceId) {
		List<Resource> list = getResourceList();
		List<Resource> result = new ArrayList<>(); 
    	for (Resource resource : list) {
			if(resource.getResourceId()==resourceId){
				result.add(resource);
			}
		}
        Collections.sort(result, new CompareResource());
    	return result;
		
		/*String sql="select * from "+table+" where resource_id= ? order by reso_no";
        SqlParameter sqlparam = new SqlParameter();
        sqlparam.setInt(resourceId);
        return this.jdbc.getList(sql, Resource.class, sqlparam);*/
	}

	public void cleanCache() {
		delCache(RESOURCE_KEY);
	}

	@Override
	public void startup() throws Exception {
		cleanCache();
		initResourceCache();
		
	}

	@Override
	public void shutdown() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int cpOrder() {
		// TODO Auto-generated method stub
		return 0;
	}

}
