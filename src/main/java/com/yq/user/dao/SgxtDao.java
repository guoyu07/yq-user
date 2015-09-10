package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Sgxt;

public class SgxtDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "sgxt";
	
	
	public Sgxt get(String userName){
		String sql = "select * from "+table+" where username = ? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		return this.jdbc.get(sql, Sgxt.class, parameter);
	}
	
	public Sgxt getLast(){
		String sql = "select * from "+table+" order by id desc limit 1";
		return this.jdbc.get(sql, Sgxt.class, null);
	}
	
	public Sgxt getByAOrBuid(String uid){
		String sql = "select * from "+table+" where auid = ? or buid = ? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(uid);
		parameter.setString(uid);
		return this.jdbc.get(sql, Sgxt.class, parameter);
	}
	
	public boolean add(Sgxt sgxt){
		return jdbc.insert(sgxt)>0;
	}
	
	public boolean updateAuid(String userName,String auid){
		String sql = "update "+table+" set auid=? where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(auid);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateBuid(String userName,String buid){
		String sql = "update "+table+" set buid=? where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(buid);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateZfiled(String userName,String filedName,int filedValue,int dqzuo,int count){
		String sql = "update "+table+" set "+filedName+"=?,dqzuo=?,count=? where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(filedValue);
		parameter.setInt(dqzuo);
		parameter.setInt(count);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	
	public boolean updateZaq(String userName,int zaq){
		String sql = "update "+table+" set zaq=zaq+? where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(zaq);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateZbq(String userName,int zbq){
		String sql = "update "+table+" set zbq=zbq+? where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(zbq);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	
	public boolean updateAq(String userName,int aq){
		String sql = "update "+table+" set aq=aq+? where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(aq);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateBq(String userName,int bq){
		String sql = "update "+table+" set bq=bq+? where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(bq);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public IPage<Sgxt> getPageList(int pageIndex,int pageSize){
		String sql = "select * from "+table+" order by id desc";
		return jdbc.getListPage(sql, Sgxt.class, null, pageSize, pageIndex);
	}
	
	 public boolean updateZ(String userName,int dqzuo,int count){
	    	String sql = "update "+table+" set dqzuo=?,count=? where username=?";
	    	SqlParameter parameter = new SqlParameter();
	    	parameter.setInt(dqzuo);
	    	parameter.setInt(count);
	    	parameter.setString(userName);
	    	return jdbc.update(sql, parameter)>0;
	 }
	 
	 public boolean updateY(String userName,int dqyou,int count){
	    	String sql = "update "+table+" set dqyou=?,count=? where username=?";
	    	SqlParameter parameter = new SqlParameter();
	    	parameter.setInt(dqyou);
	    	parameter.setInt(count);
	    	parameter.setString(userName);
	    	return jdbc.update(sql, parameter)>0;
	 }
	 
	 public Double getSumSjbByTime(String startTimeStr,String endTimeStr){
		 String sql = "select sum(sjb) from "+table+" where bddate between ? and ?  and xxnew>0";
		 return jdbc.getDouble(sql, SqlParameter.Instance().withString(startTimeStr).withString(endTimeStr));
	 }
	 
	 public Double getSumSjb(){
		 String sql = "select sum(sjb) from "+table+" where xxnew>0";
		 return jdbc.getDouble(sql,null);
	 }
	 
	 public Double getSumZfh(){
		 String sql = "select sum(zfh) from "+table+" where xxnew>0";
		 return jdbc.getDouble(sql, null);
	 }
	 
	 public Double getSumZfhBigMqfh(){
		 String sql = "select sum(zfh) from "+table+" where xxnew>0 and mqfh<zfh";
		 return jdbc.getDouble(sql, null);
	 }
	 
	 public Double getSumMqfh(){
		 String sql = "select sum(mqfh) from "+table+" where xxnew>0";
		 return jdbc.getDouble(sql, null);
	 }
	 
	 public IPage<Sgxt> backCountPage(String timeTop,int pageIndex,int pageSize){
		 String sql = "select * from "+table+" where bddate<? and xxnew=3 and mqfh<zfh and ((id>9000 and id<12000) or (id>11999 and id<14000) or id>15369) order by id";
		 return jdbc.getListPage(sql, Sgxt.class, SqlParameter.Instance().withString(timeTop), pageSize, pageIndex);
	 }
	 
	 public void backCount(String timeTop){
		 String sql = "update "+table+" set mqfh=mqfh+sjb*500*fhbl where bddate<? and xxnew=3 and mqfh<zfh and ((id>9000 and id<12000) or (id>11999 and id<14000) or id>15369) order by id";
		 jdbc.update(sql, SqlParameter.Instance().withString(timeTop));
	 }
}
