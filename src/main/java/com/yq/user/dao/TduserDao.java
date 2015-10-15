package com.yq.user.dao;
//屏蔽用户列表


import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.dao.YqDaoBase;
import com.yq.user.bo.Tduser;

public class TduserDao extends YqDaoBase<Tduser>{
    
    public Tduser get(String tdName,String tdUserId){
    	String sql = "select * from "+super.getTable()+" where tdname=? or tduserid=?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tdName);
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
}
