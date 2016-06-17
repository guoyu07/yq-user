package com.yq.user.dao;
//屏蔽用户列表


import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.dao.YqDaoBase;
import com.yq.user.bo.Tduser;

public class TduserDao extends YqDaoBase<Tduser>{
    
    public Tduser get(String tdName,String tdUserId){
    	String sql = "select * from "+super.getTable()+" where gai=0 and (tdname=? or tduserid=?) limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tdName);
    	parameter.setString(tdUserId);
    	return super.getJdbc().get(sql, Tduser.class, parameter);
    }
    
    public Tduser getTdUserRecord(String tdUserId){
    	String sql = "select * from "+super.getTable()+" where gai=0 and tduserid=? limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tdUserId);
    	return super.getJdbc().get(sql, Tduser.class, parameter);
    }
    
    public IPage<Tduser> getPage(String userName,int pageIndex,int pageSize){
    	String sql = "select * from "+super.getTable();
    	SqlParameter parameter = new SqlParameter();
    	if(Strings.isNullOrEmpty(userName)){
    		sql = sql + " where gai=1";
    	}else{
    		sql = sql +" where gai=1 and (tdname=? or  tduserid=? or tduser=? or tdcall=? or tdqq=?)";
    		parameter.setString(userName);
    		parameter.setString(userName);
    		parameter.setString(userName);
    		parameter.setString(userName);
    		parameter.setString(userName);
    	}
    	return super.getJdbc().getListPage(sql, Tduser.class, parameter, pageSize, pageIndex);
    }
    
    public IPage<Tduser> getTduserPageList(String param,int pageIndex,int pageSize){
    	String sql = "select * from "+super.getTable();
    	sql = sql +" where gai=0 and  (tdname=? or  tduserid=? or tduser=? or tdcall=? or tdqq=?)";
    	SqlParameter parameter = new SqlParameter();
		parameter.setString(param);
		parameter.setString(param);
		parameter.setString(param);
		parameter.setString(param);
		parameter.setString(param);
		return super.getJdbc().getListPage(sql, Tduser.class, parameter, pageSize, pageIndex);
    }
    
    public boolean update(Integer id,String tdname,String tduserid,String tduser,String tdcall,String tdqq){
    	String sql = "update "+super.getTable();
    	sql = sql +" set tdname=? ,  tduserid=? , tduser=? , tdcall=? , tdqq=? where id=?";
    	SqlParameter parameter = new SqlParameter();
		parameter.setString(tdname);
		parameter.setString(tduserid);
		parameter.setString(tduser);
		parameter.setString(tdcall);
		parameter.setString(tdqq);
		parameter.setInt(id);
		return super.getJdbc().update(sql, parameter)>0;
    }
}
