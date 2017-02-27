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
    
    /**
     * 
     * 通过上、下级用户得到左明细记录
     * 
     * @param tjuser
     * 
     * @param down
     * 
     * */
    public ZuoMingxi get(String tjuser,String down){
    	String sql = "select * from "+table+" where tjuser = ? and down = ? limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	parameter.setString(down);
    	return jdbc.get(sql, ZuoMingxi.class, parameter);
    }
    
    /**
     * 
     * 通过下级用户得到左明细记录
     * 
     * */
    public ZuoMingxi get(String down){
    	String sql = "select * from "+table+" where down = ? limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(down);
    	return jdbc.get(sql, ZuoMingxi.class, parameter);
    }
    
    
    public boolean add(ZuoMingxi zuoMingxi){
    	return jdbc.insert(zuoMingxi)>0;
    }
    
    public void batchInsert(List<ZuoMingxi> list){
    	jdbc.insert(list);
    }
    
    /**
     * 
     * 通过下级用户获取左明细记录列表
     * 
     * */
    public List<ZuoMingxi> getDownList(String down){
    	String sql = "select * from "+table+" where down = ?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(down);
    	return jdbc.getList(sql, ZuoMingxi.class, parameter);
    }
    
    /**
     * 
     * 通过上级用户获取左明细记录
     * 
     * */
    public List<ZuoMingxi> getTjuserList(String tjuser){
    	String sql = "select * from "+table+" where tjuser = ?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	return jdbc.getList(sql, ZuoMingxi.class, parameter);
    }
    
    /**
     * 
     * 通过上级用户和用户所在层数得到业绩总和
     * 
     * @param tjuser 上级用户
     * 
     * @param count 用户所在层数
     * 
     * */
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
    
    public int getZUserAllPerformanceByTime(String userName,String startTime,String endTime,int count){
    	String sql = "select sum(zm.sjb) from "+table+" zm left join sgxt sg on zm.down=sg.username where zm.tjuser = ?";
    	SqlParameter paramter = new SqlParameter();
		paramter.setString(userName);
    	if(startTime!=null&&endTime!=null){
    		sql = sql +" and sg.bddate between ? and ?";
    		paramter.setString(startTime);
    		paramter.setString(endTime);
    	}
    	if(count!=0){
    		sql = sql + " and zm.count<="+count;
    	}
		return this.jdbc.getInt(sql, paramter);
	}
    
    public int getDownCountByStep(String tjuser,int count){
    	String sql = "select count(*) from "+table+" where tjuser=? and count =?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tjuser);
    	parameter.setInt(count);
    	return jdbc.getInt(sql,  parameter);
    }
    
    public boolean deleteAllDown(String down){
    	String sql = "delete from "+ table +" where down=?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(down);
    	return jdbc.update(sql, parameter)>0;
    }
}
