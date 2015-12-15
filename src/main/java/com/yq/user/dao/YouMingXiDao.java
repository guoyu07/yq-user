package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.YouMingxi;

public class YouMingXiDao {
    @Autowired
	public Jdbc jdbc;
    
    private final String table = "you_mingxi";
    
    public YouMingxi get(String tjuser,String down){
    	String sql = "select * from "+table+" where tjuser = ? and down = ? limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	parameter.setString(down);
    	return jdbc.get(sql, YouMingxi.class, parameter);
    }
    
    public YouMingxi get(String down){
    	String sql = "select * from "+table+" where down = ? limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(down);
    	return jdbc.get(sql, YouMingxi.class, parameter);
    }
    
    public boolean add(YouMingxi youMingxi){
    	return jdbc.insert(youMingxi)>0;
    }
    
    public void batchInsert(List<YouMingxi> list){
    	jdbc.insert(list);
    }
    
    public List<YouMingxi> getDownList(String down){
    	String sql = "select * from "+table+" where down = ?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(down);
    	return jdbc.getList(sql, YouMingxi.class, parameter);
    }
    
    
    public int getSumSjb(String tjuser,int count){
    	String sql = "select sum(sjb) from "+table+" where tjuser = ? and count = ?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	parameter.setInt(count);
    	return jdbc.getInt(sql,  parameter);
    }
    
    public boolean delete(String tjuser,String down,int count){
    	String sql = "delete from "+table+" where tjuser=? and down=? and count =?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	parameter.setString(down);
    	parameter.setInt(count);
    	return jdbc.update(sql, parameter)>0;
    }
    
    public void deleteAll(){
    	String sql = "delete from "+table;
    	jdbc.update(sql, null);
    }
    
    public int getYUserAllPerformanceByTime(String userName,String startTime,String endTime){
    	String sql = "select sum(ym.sjb) from "+table+" ym left join sgxt sg on ym.down=sg.username where ym.tjuser = ? and sg.bddate between ? and ?";
		SqlParameter paramter = new SqlParameter();
		paramter.setString(userName);
		paramter.setString(startTime);
		paramter.setString(endTime);
		return this.jdbc.getInt(sql, paramter);
	}
    
    public int getDownCountByStep(String tjuser,int count){
    	String sql = "select count(*) from "+table+" where tjuser=? and count =?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	parameter.setInt(count);
    	return jdbc.getInt(sql,  parameter);
    }
}
