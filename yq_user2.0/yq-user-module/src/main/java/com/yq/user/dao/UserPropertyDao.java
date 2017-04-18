package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.UserProperty;

/**
 * @author 作者: HuHua
 * @version 2016年11月15日
 * 类说明   玩家属性Dao，以后玩家属性扩展字段就在此进行增、删、改、查
 */
public class UserPropertyDao {
	

	@Autowired
	private Jdbc jdbc;
	
	private static String table = "user_property";
	
	
	private UserProperty userproperty;
    
    public List<UserProperty> getAllList(){
    	String sql = "select * from "+table+" order by country";
    	return jdbc.getList(sql, UserProperty.class);
    }

    
    /**
     * 添加玩家属性
     * @param userproperty
     * @return
     */
    public int insertUserProperty(UserProperty userproperty){
    	
    	return jdbc.insert(userproperty);
    }

    
	/**
	 * 通过用户名得到玩家属性
	 * @param userName
	 * @return
	 */
	public UserProperty getPorpertyByName(String userName) {
		String sql = "select * from  "+table+" where username=? limit 1 ";
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setString(userName);
		userproperty = jdbc.get(sql, UserProperty.class, sqlparameter);
		if(null==userproperty){//如果没有添加默认值
			userproperty = new UserProperty();
			userproperty.setRegion_code(86);
			userproperty.setUsername(userName);
		}
		return userproperty;
	}
    
	/**
	 * 修改玩家电话所在区域码
	 * @param userName
	 * @param areaCode
	 * @return
	 */
	public boolean updateUserAreaCodeByName(String userName, int areaCode,String coutryCode) {
		String sql = "update "+table+" set region_code=?,country_code=? where  username=? ";
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setInt(areaCode);
		sqlparameter.setString(coutryCode);
		sqlparameter.setString(userName);
		return jdbc.update(sql, sqlparameter)>0;
	}
    
	
	/**
	 * 是否有同名记录
	 * @param userName
	 * @return
	 */
	public boolean isHasUserpropertyByName(String userName){
		
		String sql = "select * from  "+table+" where username=?  limit 1 ";
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setString(userName);
		if(null!=jdbc.get(sql, UserProperty.class, sqlparameter)){
			return true;
		}
		return false;
		
	}
	
	/**
	 * 修改法人
	 * 
	 * @param userName
	 * @param faren
	 * @return
	 */
	public boolean updatefaren(String userName, String faren) {
		String sql = "update "+table+" set faren=? where  username=? ";
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setString(faren);
		sqlparameter.setString(userName);
		return jdbc.update(sql, sqlparameter)>0;
	}
    
    
	/**
	 * 通过用户名得到玩家属性
	 * @param userName
	 * @return
	 */
	public UserProperty getHasPorpertyByName(String userName) {
		String sql = "select * from  "+table+" where username=? limit 1 ";
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setString(userName);
		return jdbc.get(sql, UserProperty.class, sqlparameter);
	}
    
	
}
