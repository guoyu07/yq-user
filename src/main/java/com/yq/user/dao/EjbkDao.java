package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Ejbk;

public class EjbkDao {
    @Autowired
	private Jdbc jdbc;
    
    private static final String table = "ejbk";
    
    public void batchAdd(List<Ejbk> list){
    	 jdbc.insert(list);
    }
    
    public IPage<Ejbk> getPageList(String upUserName,int pageIndex,int pageSize){
    	String sql = "select * from "+table+" where up = ? order by gpa";
    	return this.jdbc.getListPage(sql, Ejbk.class, SqlParameter.Instance().withString(upUserName), pageSize, pageIndex);
    }
    
    public Ejbk get(String pdid){
    	String sql = "select * from "+table+" where pdid = ? limit 1";
    	return this.jdbc.get(sql, Ejbk.class, SqlParameter.Instance().withString(pdid));
    }
    
    public boolean update(String pdid,String pdpamd5,String fwidmd5){
    	String sql = "update "+table+" set pdpamd5=?,fwidmd5=?,gpa=gpa+1 where pdid=? limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withString(pdpamd5).withString(fwidmd5).withString(pdid))>0;
    }
    
    public boolean delete(String pdid){
    	String sql = "delete from "+table+" where pdid=? limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withString(pdid))>0;
    }
}
