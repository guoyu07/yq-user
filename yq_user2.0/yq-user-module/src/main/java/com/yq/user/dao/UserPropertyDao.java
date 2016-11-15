package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.UserProperty;

/**
 * @author 作者: HuHua
 * @version 2016年11月15日
 * 类说明 
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
		String sql = "select * from  "+table+" where username=?";
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setString(userName);
		userproperty = jdbc.get(sql, UserProperty.class, sqlparameter);
		if(null==userproperty){//如果没有添加默认值
			userproperty = new UserProperty();
			userproperty.setRegion_code(86);
			userproperty.setUsername(userName);
			insertUserProperty(userproperty);
		}
		return jdbc.get(sql, UserProperty.class, sqlparameter);
	}
    
	/**
	 * 修改玩家电话所在区域码
	 * @param userName
	 * @param areaCode
	 * @return
	 */
	public boolean updatePorpertyByName(String userName, int areaCode) {
		String sql = "update "+table+" set region_code=? where  username=? ";//update user_property set region_code='100' where  username='william123'
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setInt(areaCode);
		sqlparameter.setString(userName);
		return jdbc.update(sql, sqlparameter)>0;
	}
    
    
}
