package com.yq.user.dao;

import java.util.Date;

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
		if(sgxt.getBddate()==null){
			sgxt.setBddate(new Date());
		}
		return jdbc.insert(sgxt)>0;
	}
	
	public boolean updateAuid(String userName,String auid){
		String sql = "update "+table+" set auid=? where username=? and auid is null";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(auid);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateBuid(String userName,String buid){
		String sql = "update "+table+" set buid=? where username=? and buid is null";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(buid);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateDoubleCount(int id,int pay,double cbpay,int aq,int bq){
		String sql = "update "+table+" set pay=?,cbpay=?,aq=?,bq=? where id=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(pay);
		parameter.setDouble(cbpay);
		parameter.setInt(aq);
		parameter.setInt(bq);
		parameter.setInt(id);
		return jdbc.update(sql, parameter)>0;
	}
	
	/**
	 * 
	 * 更新用户左区的业绩
	 * 
	 * @param userName 用户名
	 * 
	 * @param filedName 左区字段（通常16层内：z1~z16）
	 * 
	 * @param filedValue 左区字段的值
	 *   
	 * @param dqyou 
	 * 
	 * @param count 左区所在层数
	 * 
	 * */
	public boolean updateZOrYfiled(String userName,String filedName,int filedValue){
		String sql = "update "+table+" set "+filedName+"=? where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(filedValue);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	/**
	 * 
	 * 更新用右区的业绩
	 * 
	 * @param userName 用户名
	 * 
	 * @param filedName 右区字段（通常16层内：y1~y16）
	 * 
	 * @param filedValue 右区字段的值
	 *   
	 * @param dqyou 
	 * 
	 * @param count 右区所在层数
	 * 
	 * */
	
//	public boolean updateYfiled(String userName,String filedName,int filedValue,int dqyou,int count){
//		String sql = "update "+table+" set "+filedName+"=?,dqyou=?,count=? where username=?";
//		SqlParameter parameter = new SqlParameter();
//		parameter.setInt(filedValue);
//		parameter.setInt(dqyou);
//		parameter.setInt(count);
//		parameter.setString(userName);
//		return jdbc.update(sql, parameter)>0;
//	}
	
	
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
	
	public IPage<Sgxt> getDoubleAreaCountPageList(int pageIndex,int pageSize){
		String sql = "select * from "+table+" where aq>0 and bq>0 order by id desc";
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
	 
	 public Double getSumField(String fieldName){
		 String sql = "SELECT sum("+fieldName+") FROM "+table;
		 return jdbc.getDouble(sql, null);
	 }
	 public Double getSumSjbById(int lastId){
		 String sql = "select sum(sjb) as ljnd from sgxt where id>?";
		 return jdbc.getDouble(sql, SqlParameter.Instance().withInt(lastId));
	 }
	 
	 public IPage<Sgxt> getSgxtUserNameAndSjb(int pageIndex,int pageSize){
		 String sql = "select username,sjb from sgxt order by id";
		 return jdbc.getListPage(sql, Sgxt.class, null, pageSize, pageIndex);
	 }
	 
	 public void resetZaqAndZbq(){
		 String sql = "update "+table+" set zaq=0,zbq=0";
		 jdbc.update(sql, null);
	 }
	 
	 public boolean resetZaqAndZbq(String userName){
		 String sql = "update "+table+" set zaq=0,zbq=0 where username='"+userName+"' limit 1";
		 return jdbc.update(sql, null)>0;
	 }
	 
	 public boolean updateVipUser(String userName,String vipUser){
		 String sql = "update "+table+" set vipuser=? where username=? limit 1";
	    	SqlParameter parameter = new SqlParameter();
	    	parameter.setString(vipUser);
	    	parameter.setString(userName);
	    	return jdbc.update(sql, parameter)>0;
	 }
	 
	 public boolean updateVip(String userName,int vip){
		 String sql = "update "+table+" set vip=? where username=? limit 1";
		 SqlParameter parameter = new SqlParameter();
	     parameter.setInt(vip);
	     parameter.setString(userName);
	     return jdbc.update(sql, parameter)>0;
	 }
	 
	 public boolean resetUserSgxtInfo(String username){
		 String sql1 = "update sgxt set auid=null where auid=? limit 1";
		 String sql2 = "update sgxt set buid=null where buid=? limit 1";
		 String sql3 = "delete from sgxt where username=? and auid is null and buid is null limit 1";
		 if(jdbc.update(sql3, SqlParameter.Instance().withString(username))>0){
			 jdbc.update(sql2, SqlParameter.Instance().withString(username));
			 jdbc.update(sql1, SqlParameter.Instance().withString(username));
			 return true;
		 }
		 return false;
	 }
	 
	 public int executeSql(String sql){
		return jdbc.update(sql, null);
	 }
}
