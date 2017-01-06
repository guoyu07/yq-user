package com.yq.manage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.manage.bean.RoleResource;

/**
 * @author 作者: HuHua
 * @version 2016年12月20日
 * 类说明 
 */
public class RoleResourceDao {


	@Autowired
	private Jdbc jdbc;
	
	private final static String table="role_resource";
	
	/*
	public List<Resource> findByRoleId(Long id) {
		//判断传递进来的id值是否为空
		if (StringUtils.hasText(String.valueOf(id))) {
			//组装hql语句
			String hql="select rr.Resource from RoleResource rr where rr.roleTable.id= :id";
			return (List<Resource>)this.getSession().createQuery(hql).setParameter("id", id).list();
		}
		return null;
	}*/
	
	/**
	 * 根据id值删除角色资源对象
	 */
	public int deleteByRoleId(int id) {
		String sql ="delete from "+table+"  where role_id = ?";
		SqlParameter sqlparm = new SqlParameter();
		sqlparm.setInt(id);
		return this.jdbc.update(sql, sqlparm);
	}

	/*public List<Role> findByResourceId(Long id) {
		String hql="select rr.roleTable from RoleResource rr where rr.Resource.id=:id";
		return (List<RoleTable>)this.getSession().createQuery(hql).setParameter("id", id).list();
	}*/

	public int deleteByResourceId(int id) {
		String sql="delete from "+table+" where resource_id= ?";
		SqlParameter sqlparm = new SqlParameter();
		sqlparm.setInt(id);
		return this.jdbc.update(sql,sqlparm); 
	}

	public List<RoleResource> findByRoleId(int roleId) {
		String sql ="select * from "+table+" rr where rr.role_id = ?";
		SqlParameter sqlparm = new SqlParameter();
		sqlparm.setInt(roleId);
		return this.jdbc.getList(sql,RoleResource.class, sqlparm);
	}

	public List<RoleResource> findByResourceId(int resourceId) {
		String sql ="select * from "+table+" rr where rr.resource_id = ?";
		SqlParameter sqlparm = new SqlParameter();
		sqlparm.setInt(resourceId);
		return this.jdbc.getList(sql,RoleResource.class, sqlparm);
	}

	public boolean deleteByResourceId(Long valueOf) {
		return false;
		// TODO Auto-generated method stub
		
	}

	public boolean insert(RoleResource roleResource) {
		return this.jdbc.insert(roleResource)>0;
		
	}

	public boolean isHas(RoleResource roleResource) {
		if(this.getRoleResource(roleResource.getResourceId(),roleResource.getRoleId())!=null){
			return true;
		}else{
			return false;
		}
	}
	
	public RoleResource getRoleResource(int resourceId, int roleId) {
		String sql ="select * from "+table+" rr where rr.resource_id = ? and rr.role_id=? limit 1";
		SqlParameter sqlparm = new SqlParameter();
		sqlparm.setInt(resourceId);
		sqlparm.setInt(roleId);
		return this.jdbc.get(sql,RoleResource.class, sqlparm);
	}

	/*public List<Resource> findChild(String ids,String resoLevel) {
		String hql=" select distinct rr.Resource from RoleResource rr where rr.roleTable.id in ("+ids+") ";
		if(StringUtils.hasText(resoLevel)){
			hql+=" and rr.Resource.resoLevel='"+resoLevel+"' ";
		}	
			hql+=" order by rr.Resource.resoNo asc ";
		return this.getSession().createQuery(hql).list();
	}*/
	
}
