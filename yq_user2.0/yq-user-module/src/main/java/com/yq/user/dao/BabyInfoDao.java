package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.BabyInfo;

public class BabyInfoDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "baby_info";
	
	
	public boolean add(BabyInfo babyInfo){
		return jdbc.insert(babyInfo)>0;
	}
	
	
	public IPage<BabyInfo> getPage(String param,Integer status,int pageIndex,int pageSize,String startTime,String endTime){
		String sql = "select * from "+table+" where 1=1 ";
		SqlParameter parameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(param)){
			sql = sql + " and (user_name=? or name=? or baby_name=? or dady_name=? or mom_name=? or dady_call=? or mom_call=?)";
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
		}
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql + " and created_time between ? and ?";
			parameter.setString(startTime);
			parameter.setString(endTime);
		}
		if(status!=null){
			sql = sql + " and status=?";
			parameter.setInt(status);
		}
		sql = sql +" order by id desc";
		return jdbc.getListPage(sql, BabyInfo.class, parameter, pageSize,pageIndex);
	}
	
	public List<BabyInfo> getList(String param,Integer status,String startTime,String endTime){
		String sql = "select * from "+table+" where 1=1 ";
		SqlParameter parameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(param)){
			sql = sql + " and (user_name=? or name=? or baby_name=? or dady_name=? or mom_name=? or dady_call=? or mom_call=?)";
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
			parameter.setString(param);
		}
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql + " and created_time between ? and ?";
			parameter.setString(startTime);
			parameter.setString(endTime);
		}
		if(status!=null){
			sql = sql + " and status=?";
			parameter.setInt(status);
		}
		sql = sql +" order by id desc";
		return jdbc.getList(sql, BabyInfo.class, parameter);
	}
	
	public boolean delete(int id){
		String sql = "delete from "+table+" where id=? limit 1";
		SqlParameter parameter = SqlParameter.Instance();
		parameter.setInt(id);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean update(BabyInfo babyInfo){
		if(babyInfo.getId()!=null){
			this.delete(babyInfo.getId());
			return this.add(babyInfo);
		}
		return false;
	}
	
	public BabyInfo getBabyInfo(int id){
		String sql = "select * from "+table+" where id=? limit 1";
		SqlParameter parameter = SqlParameter.Instance();
		parameter.setInt(id);
		return jdbc.get(sql, BabyInfo.class, parameter);
	}
	
}
