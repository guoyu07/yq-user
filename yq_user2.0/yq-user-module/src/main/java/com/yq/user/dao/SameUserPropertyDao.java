package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.SameUserProperty;

public class SameUserPropertyDao {
	
	
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "same_user_property";
	
	
	/**
     * 添加玩家同名属性
     * @param sameuserproperty
     * @return
     */
    public boolean insertSameUserProperty(SameUserProperty sameuserproperty){
    	return jdbc.insert(sameuserproperty)>0;
    }

	
    
    /**
     * 得到同名账户属性
     * @param nameUserId
     * @return
     */
    public SameUserProperty getSameUserProperty(String nameUserId){
    	StringBuilder sql = new StringBuilder();
    	SqlParameter sqlParam = new SqlParameter();
    	sql.append("select * from "+table+" where  name_userid= ?");
    	sqlParam.setString(nameUserId);
    	return jdbc.get(sql.toString(), SameUserProperty.class, sqlParam);
    }
    
    
    /**
     * 增加没确认次数
     * @param nameUserId
     * @return
     */
    public int addNoSureTimes(String nameUserId){
    	StringBuilder sql = new StringBuilder();
    	SqlParameter sqlParam= new SqlParameter();
    	sql.append("update "+table+" set no_sure_times = no_sure_times+1, last_date = ? where name_userid = ?");
    	sqlParam.setObject(new Date());
    	sqlParam.setString(nameUserId);
    	return jdbc.update(sql.toString(), sqlParam);
    }



	public boolean updatePayPassword(String nameUserid, String md5_16_Small) {
		StringBuilder sql = new StringBuilder();
    	SqlParameter sqlParam= new SqlParameter();
    	sql.append("update "+table+" set app_pay_password = ?,modify_time=? where name_userid = ?");
    	sqlParam.setString(md5_16_Small);
    	sqlParam.setObject(new Date());
    	sqlParam.setString(nameUserid);
    	return jdbc.update(sql.toString(), sqlParam)>0;
		
	}
	

}
