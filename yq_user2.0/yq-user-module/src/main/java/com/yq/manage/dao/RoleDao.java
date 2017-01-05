package com.yq.manage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.manage.bean.Role;

public class RoleDao {
	

	@Autowired
	private Jdbc jdbc;
	
	private final static String table = "role";

	public Role findByRoleId(int Id) {
		String sql="select * from "+table+" r where r.id = ?";
		SqlParameter sqlparam = new SqlParameter();
		sqlparam.setInt(Id);
		return jdbc.get(sql, Role.class, sqlparam);
	}

	public Role findRoleId(int Id) {
		String sql="select * from "+table+" r where r.id = ? order by r.id ";
		SqlParameter sqlparam = new SqlParameter();
		sqlparam.setInt(Id);
		return jdbc.get(sql, Role.class, sqlparam);
	}
	
	public int deleteByIds(String ids) {
		String sql="delete from "+table+"  where id in("+ids+")";
		return jdbc.getJdbcTemplate().update(sql);
	}


	public IPage<Role> findPageList(int pageSize, int pageIndex) {
		String hql="select * from "+table+" r order by r.update_date desc";
		return jdbc.getListPage(hql, Role.class, null, pageSize, pageIndex);
	}

	public List<Role> getRoleAllList() {
		String sql="select * from "+table;
		return jdbc.getList(sql, Role.class);
	}

	public boolean insert(Role role) {
		return jdbc.insert(role)>0;
	}

	public Role update(Role role) {
 		StringBuffer sql= new StringBuffer();
		SqlParameter sqlparam = new SqlParameter();
		sql.append("update "+table+" set ");
		if(!Strings.isNullOrEmpty(role.getRoleCode())){
			sql.append(" role_code  = ? ");
			sqlparam.setString(role.getRoleCode());
		} if(!Strings.isNullOrEmpty(role.getRoleName())){
			sql.append(",role_name = ? ");
			sqlparam.setString(role.getRoleName());
		} if(!Strings.isNullOrEmpty(role.getRoleDesc())){
			sql.append(",role_desc = ? ");
			sqlparam.setString(role.getRoleDesc());
		}
		if(!Strings.isNullOrEmpty(role.getUpdateUser())){
			sql.append(",update_user = ? ");
			sqlparam.setString(role.getUpdateUser());
		}
		if(role.getUpdateDate()!=null){
			sql.append(",update_date = ? ");
			sqlparam.setObject(role.getUpdateDate());
		}
		sql.append(" where id = ? ");
		sqlparam.setInt(role.getId());
		this.jdbc.update(sql.toString(), sqlparam);
		return role;
	}

	public Role findRoleName(String roleName) {
		String sql="select * from "+table+" where role_name = ?";
		SqlParameter sqlparam = new SqlParameter();
		sqlparam.setString(roleName);
		return jdbc.get(sql, Role.class, sqlparam);
	}


}
