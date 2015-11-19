package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Vipxtgc;

public class VipxtgcDao {

    @Autowired
	public Jdbc jdbc;
    
    private final String table = "vipxtgc";
    
    public boolean add(Vipxtgc vipxtgc){
    	if(vipxtgc.getVipdate()==null){
    		vipxtgc.setVipdate(new Date());
    	}
    	return jdbc.insert(vipxtgc)>0;
    }
    
    public Vipxtgc get(String vipName,String date){
    	String sql = "select * from "+table+" where vipname=? and vipdate=? limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(vipName);
    	parameter.setString(date);
    	return jdbc.get(sql, Vipxtgc.class, parameter);
    }
    
    public boolean updateJcBdb(String vipName,String date,int jcbdb){
    	String sql = "INSERT INTO "+table+" (vipname,vipdate,jcyb,jcbdb) VALUES (?,?,0,?) ON DUPLICATE KEY UPDATE jcbdb=jcbdb+?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(vipName);
    	parameter.setString(date);
    	parameter.setInt(jcbdb);
    	parameter.setInt(jcbdb);
    	return jdbc.update(sql, parameter)>0;
    }
    
    public boolean updateJcYb(String vipName,String date,int jcbdb){
    	String sql = "INSERT INTO "+table+" (vipname,vipdate,jcyb,jcbdb) VALUES (?,?,?,0) ON DUPLICATE KEY UPDATE jcyb=jcyb+?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(vipName);
    	parameter.setString(date);
    	parameter.setInt(jcbdb);
    	parameter.setInt(jcbdb);
    	return jdbc.update(sql, parameter)>0;
    }
    
    public IPage<Vipxtgc> getPage(String userName,String startDate,String endDate,int pageIndex,int pageSize){
    	String sql = "select * from "+table+" where 1=1";
    	SqlParameter parameter = new SqlParameter();
    	if(!Strings.isNullOrEmpty(userName)){
    	    sql = sql +" and vipname= ?";	
    	    parameter.setString(userName);
    	}
    	if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
    		sql = sql +" and vipdate between ? and ?";
    		parameter.setString(startDate);
    		parameter.setString(endDate);
    	}
    	sql = sql +" order by vipid desc";
    	return jdbc.getListPage(sql, Vipxtgc.class, parameter, pageSize, pageIndex);
    }
}
