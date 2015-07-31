package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.ZuoMingxi;

public class ZuoMingxiDao {

    @Autowired
	public Jdbc jdbc;
    
    private final String table = "zuo_mingxi";
    
    
    public ZuoMingxi get(String tjuser,String down){
    	String sql = "select * from "+table+" where tjuser = ? and down = ? limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	parameter.setString(down);
    	return jdbc.get(sql, ZuoMingxi.class, parameter);
    }
    
    public ZuoMingxi get(String down){
    	String sql = "select * from "+table+" where down = ? limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(down);
    	return jdbc.get(sql, ZuoMingxi.class, parameter);
    }
    
    
    public boolean add(ZuoMingxi zuoMingxi){
    	return jdbc.insert(zuoMingxi)>0;
    }
    
    
    public List<ZuoMingxi> getDownList(String down){
    	String sql = "select * from "+table+" where down = ?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(down);
    	return jdbc.getList(sql, ZuoMingxi.class, parameter);
    }
    
    public int getSumSjb(String tjuser,int count){
    	String sql = "select sum(sjb) from "+table+" where tjuser = ? and count = ?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	parameter.setInt(count);
    	return jdbc.getInt(sql,  parameter);
    }
}
