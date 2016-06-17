package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.yq.user.bo.UserPerformance;

public class UserPerformanceDao {
    @Autowired
	public Jdbc jdbc;
    
    private final String table = "user_performance";
    
    public void insert(List<UserPerformance> list){
    	jdbc.insert(list);
    }
    
    public List<UserPerformance> getListPage(String date){
    	
    	String sql = "select * from "+table+" where add_time='"+date+"'";
    	return jdbc.getList(sql, UserPerformance.class, null);
    }
    
    public void removeAll(){
    	String sql = "delete from "+table;
    	jdbc.update(sql, null);
    }
}
