package com.yq.user.dao;

import java.util.List;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.dao.YqDaoBase;
import com.yq.cw.bean.VipCjglForDc;
import com.yq.user.bo.Vipcjgl;

public class VipcjglDao extends YqDaoBase<Vipcjgl> {

	public boolean add(Vipcjgl vipcjgl){
		return super.add(vipcjgl);
	}
	
	public List<Vipcjgl> getVipcjglList(String userName,String startTime,String endTime){
		String sql = "select * from "+super.getTable()+" where vipuser=? ";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" and cjdate between ? and ?";
			sqlParameter.setString(startTime);
			sqlParameter.setString(endTime);
		}
		sql = sql +" order by cjid desc";
		return super.getJdbc().getList(sql, Vipcjgl.class, sqlParameter);
	}
	
	public List<Vipcjgl> getVipcjglListAsc(String userName,String startTime,String endTime){
		String sql = "select * from "+super.getTable()+" where vipuser=? ";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" and cjdate between ? and ?";
			sqlParameter.setString(startTime);
			sqlParameter.setString(endTime);
		}
		sql = sql +" order by cjid asc";
		return super.getJdbc().getList(sql, Vipcjgl.class, sqlParameter);
	}
	
	public IPage<Vipcjgl> getVipcjglListAsc(String startTime,String endTime,int pageSize,int pageIndex){
		String sql = "select * from "+super.getTable();
		SqlParameter sqlParameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" where cjdate between ? and ?";
			sqlParameter.setString(startTime);
			sqlParameter.setString(endTime);
		}
		sql = sql +" order by cjdate desc";
		return super.getJdbc().getListPage(sql, Vipcjgl.class, sqlParameter,pageSize, pageIndex);
	}
	
	public List<VipCjglForDc> getVipcjglListForDcAsc(String userName,String startTime,String endTime){
		String sql = "select * from "+super.getTable()+" where vipuser=? ";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" and cjdate between ? and ?";
			sqlParameter.setString(startTime);
			sqlParameter.setString(endTime);
		}
		sql = sql +" order by cjid asc";
		return super.getJdbc().getList(sql, VipCjglForDc.class, sqlParameter);
	}
	
	public Vipcjgl getOneBeforeTime(String userName,String endTime){
		String sql = "select * from "+ super.getTable()+" where vipuser=? and  cjdate<? order by cjdate desc limit 1";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		sqlParameter.withString(endTime);
		return super.getJdbc().get(sql, Vipcjgl.class, sqlParameter);
	}
	
	
	public IPage<Vipcjgl> getVipcjglPageList(String userName,String startTime,String endTime,int pageSize,int pageIndex){
		String sql = "select * from "+super.getTable()+" where vipuser=?";
		if(userName==null){
			return getVipcjglListAsc(startTime,endTime,pageSize,pageIndex);
		}
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" and cjdate between ? and ?";
			sqlParameter.setString(startTime);
			sqlParameter.setString(endTime);
		}
		sql = sql +" order by cjid desc";
		return super.getJdbc().getListPage(sql, Vipcjgl.class, sqlParameter,pageSize, pageIndex);
	}
	
	
	public Double getSumVipZc(String userName,String startTime,String endTime){
		String sql = "select sum(cjjo) from "+super.getTable()+" where vipuser=? and cjuser<>'系统'";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" and cjdate between ? and ?";
			sqlParameter.setString(startTime);
			sqlParameter.setString(endTime);
		}
		return super.getJdbc().getDouble(sql, sqlParameter);
	}
	
	public Double getSumVipSr(String userName,String startTime,String endTime){
		String sql = "select sum(cjjo) from "+super.getTable()+" where vipuser=? and cjuser='系统'";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" and cjdate between ? and ?";
			sqlParameter.setString(startTime);
			sqlParameter.setString(endTime);
		}
		return super.getJdbc().getDouble(sql, sqlParameter);
	}
	
	
	
}
