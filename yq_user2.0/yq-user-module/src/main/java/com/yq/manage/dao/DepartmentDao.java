package com.yq.manage.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.manage.bean.Department;

public class DepartmentDao {
	@Autowired
	private Jdbc jdbc;
	
	private final static String table = "department";
	
	 public IPage<Department> findPageList(int pageSize,int pageindex ) {
	        String sql = "select * from "+table+" d order by d.id asc";
	        return this.jdbc.getListPage(sql, Department.class,null,pageindex,pageSize);
	 }

	    public List<Department> findByPid(int id) {
            String sql = "select * from  "+table+" d where partment_id = ? order by d.id asc";
            SqlParameter sqlparam=new SqlParameter();
            sqlparam.setInt(id);
            return this.jdbc.getList(sql, Department.class, sqlparam);
	    }

	    public List<Department> findByPidAndId(int id, int pId) {
	            String sql = "select * from  "+table+" d where partment_id = ? and d.id= ? order by d.id asc";
	            SqlParameter sqlparam=new SqlParameter();
	            sqlparam.setInt(pId);
	            sqlparam.setInt(id);
	            return this.jdbc.getList(sql, Department.class, sqlparam);
	    }

	    public int deleteByIds(String ids) {
	        String sql = "delete from "+table+"  where id in(?)";
	        SqlParameter sqlparam=new SqlParameter();
            sqlparam.setString(ids);
	        return this.jdbc.update(sql, sqlparam);
	    }

	    public List<Department> findAll() {
	        String sql = "select * from "+table+" d  order by d.id asc";
	        return this.jdbc.getList(sql, Department.class, null);
	    }

	    public Department getRootDepartment() {
	        String sql = "select * from "+table+" d where d.partment_id = 0";
	        return this.jdbc.get(sql, Department.class, null);
	    }

	    public List<Department> findAllChildren() {
	        String sql = "select * from "+table+" d where partment_id <>0 order by d.id asc";
	        return this.jdbc.getList(sql, Department.class);
	    }

		public Department findDepartmentById(int id) {
			 String sql = "select * from "+table+" d where d.id = ? limit 1";
			 SqlParameter sqlparam= new SqlParameter();
			 sqlparam.setInt(id);
		     return this.jdbc.get(sql, Department.class,sqlparam);
		}

		public Department insert(Department department) {
			this.jdbc.insert(department);
			return department;
		}

		public Department update(int id, String deptName, String deptDesc, String oparetor, int departmentId) {
			String sql= "update "+table+" set dept_name=?,dept_desc=?,update_user=?,update_date=? where id=? and partment_id=?";
			SqlParameter sqlparm= new SqlParameter();
			sqlparm.setString(deptName);
			sqlparm.setString(deptDesc);
			sqlparm.setString(oparetor);
			sqlparm.setObject(new Date());
			sqlparm.setInt(id);
			sqlparm.setInt(departmentId);
			this.jdbc.update(sql, sqlparm);
			return findDepartmentById(id);
		}

		public IPage<Department> findPageListByPid(int pagesize, int pageIndex, int pid) {
			  String sql = "select * from "+table+" where id=? or partment_id=? order by id asc";
			  SqlParameter sqlparam= new SqlParameter();
			  sqlparam.setInt(pid);
			  sqlparam.setInt(pid);
		      return this.jdbc.getListPage(sql, Department.class,sqlparam,pageIndex,pagesize);
		}

}
