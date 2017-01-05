package com.yq.manage.dao;

import java.util.Date;
import java.util.List;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.dao.YqDaoBase;
import com.yq.manage.bean.ManageUser;

public class ManageUserDao extends YqDaoBase<ManageUser>{
	
	private final static String table = "Fcxt";
	
	public ManageUser getManageUser(String userName) {
		String sql = "SELECT * FROM "+ table+" where adminusername = ? limit 1";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		return super.getJdbc().get(sql, ManageUser.class, sqlParameter);
	}

	public IPage<ManageUser> getPageList(int pageIndex, int pagesize) {
		 String sql = "select * from "+ table+"  order by create_date desc";
	      return super.getJdbc().getListPage(sql, ManageUser.class, null, pagesize, pageIndex);
	      
	}

	public ManageUser getByUserId(int userId) {
		 String sql = "select * from "+ table+" u where id = ? limit 1";
		 SqlParameter sqlparam= new SqlParameter();
		 sqlparam.setInt(userId);
		 return super.getJdbc().get(sql, ManageUser.class, sqlparam);
		 
	}

	public boolean update(String userName, int staffId, int userId, String oparetor) {
		String sql = "update "+ table+" set adminusername=?,staff_id=?,update_date=?,update_name=? where id = ?";
		 SqlParameter sqlparam= new SqlParameter();
		 sqlparam.setString(userName);
		 sqlparam.setInt(staffId);
		 sqlparam.setObject(new Date());
		 sqlparam.setString(oparetor);
		 sqlparam.setInt(userId);
		 return super.getJdbc().update(sql, sqlparam)>0;
	}

	/*public void insert(ManageUser user) {
		super.getJdbc().insert(user);
		
	}*/

	public ManageUser getByStaffId(int id) {
		 String sql = "select * from "+ table+" u where staff_id = ? limit 1";
		 SqlParameter sqlparam= new SqlParameter();
		 sqlparam.setInt(id);
		 return super.getJdbc().get(sql, ManageUser.class, sqlparam);
	}

	public int delete(int userId) {
		 String sql = "delete from "+ table+" where id = ? ";
		 SqlParameter sqlparam= new SqlParameter();
		 sqlparam.setInt(userId);
		 return super.getJdbc().update(sql, sqlparam);
	}

	public boolean updatePw(String newPwd, int userId) {
		String sql = "update "+ table+" set password=? where id = ?";
		 SqlParameter sqlparam= new SqlParameter();
		 sqlparam.setString(newPwd);
		 sqlparam.setInt(userId);
		 return super.getJdbc().update(sql, sqlparam)>0;
	}

	public List<ManageUser> getAllManageUser() {
		 String sql = "select * from "+ table+" order by id";
		 return super.getJdbc().getList(sql, ManageUser.class);
	}

	

}
