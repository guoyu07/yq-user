package com.yq.manage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.manage.bean.ManageUser;
import com.yq.manage.bean.UserRole;

/**
 * @author 作者: HuHua
 * @version 2016年12月20日
 * 类说明 
 */
public class UserRoleDao {
	
	@Autowired
	private Jdbc jdbc;
	
	private final static String table = "user_role";
	
	public List<UserRole> findAllByUserId(int userId) {
		String sql="select * from "+table+" ur where ur.user_id = ?";
		SqlParameter sqlparam=new SqlParameter();
		sqlparam.setInt(userId);
		return this.jdbc.getList(sql, UserRole.class,sqlparam);
	}

	public int deleteByUserId(int id) {
		String sql = "delete from "+table+" where user_id = ?";
		SqlParameter sqlparam=new SqlParameter();
		sqlparam.setInt(id);
		return this.jdbc.update(sql,sqlparam);
	}

	public UserRole save(UserRole userRole) {
		this.jdbc.insert(userRole);
		return userRole;
	}


	public int deleteByRoleId(int id) {
		String sql = "delete from "+table+"  where role_id = ?";
		SqlParameter sqlparam=new SqlParameter();
		sqlparam.setInt(id);
		return this.jdbc.update(sql,sqlparam);
	}

	public void deleteByUserIds(String ids) {
		String sql="delete from "+table+"  where user_id in(?)";
		SqlParameter sqlparam=new SqlParameter();
		sqlparam.setString(ids);
		this.jdbc.update(sql,sqlparam);
	}

	public List<UserRole> findByRoleId(int roleId) {
		String sql = "select * from "+table+" where role_id = ?";
		SqlParameter sqlparam = new SqlParameter();
		sqlparam.setInt(roleId);
		return this.jdbc.getList(sql, UserRole.class,sqlparam);
	}


	/*public List<RoleTable> findByUserName(String userName) {
		String hql="select ur.roleTable from UserRole ur where ur.userTable.userName=:userName";
		return (List<RoleTable>)this.getSession().createQuery(hql).setParameter("userName", userName).list();
	}*/

}
