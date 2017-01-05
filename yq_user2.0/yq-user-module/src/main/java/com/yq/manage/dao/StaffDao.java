package com.yq.manage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.manage.bean.Staff;

public class StaffDao {
	
	@Autowired
	private Jdbc jdbc;
	
	private final static String table = "staff";

	public Staff getById(int id) {
		String sql = "select * from "+table+" where id =? limit 1";
		SqlParameter sqlparam= new SqlParameter();
		sqlparam.setInt(id);
		return this.jdbc.get(sql, Staff.class, sqlparam);
		
	}

	public Staff update(Staff oldStaffTable) {
		StringBuilder sql= new StringBuilder();
		sql.append("update "+table+" set ");
		sql.append(" full_name =?,sex=?,mobile_phone=?,email=? where id= ?");
		SqlParameter sqlparam= new SqlParameter();
		sqlparam.setString(oldStaffTable.getFullName());
		sqlparam.setString(oldStaffTable.getSex());
		sqlparam.setString(oldStaffTable.getMobilePhone());
		sqlparam.setString(oldStaffTable.getEmail());
		sqlparam.setInt(oldStaffTable.getId());
		this.jdbc.update(sql.toString(), sqlparam);
		return oldStaffTable;
	}

	public int insert(Staff staffTable) {
		 return this.jdbc.insertBackKeys(staffTable);
	}
	
	public Staff getByUserFullName(String fullName) {
		String sql = "select * from "+table+" where full_name =? limit 1";
		SqlParameter sqlparam= new SqlParameter();
		sqlparam.setString(fullName);
		return this.jdbc.get(sql, Staff.class, sqlparam);
		
	}

	public Staff getListBystaffId(int staffId) {
		String sql = "select * from "+table+" where staffId =? limit 1";
		SqlParameter sqlparam= new SqlParameter();
		sqlparam.setInt(staffId);
		return this.jdbc.get(sql, Staff.class, sqlparam);
	}

	public List<Staff> getListByPartmentId(int departmentId) {
		String sql = "select * from "+table+" where department_id =?";
		SqlParameter sqlparam= new SqlParameter();
		sqlparam.setInt(departmentId);
		return this.jdbc.getList(sql, Staff.class, sqlparam);
	}

	public int delete(int staffId) {
		 String sql = "delete from "+ table+" where id = ? ";
		 SqlParameter sqlparam= new SqlParameter();
		 sqlparam.setInt(staffId);
		 return this.jdbc.update(sql, sqlparam);
	}
	

}
