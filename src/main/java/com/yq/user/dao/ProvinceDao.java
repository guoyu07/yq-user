package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.Province;

public class ProvinceDao {
    @Autowired
	private Jdbc jdbc;
    
    public List<Province> getProvinceList(){
    	String sql = "select * from province where c=1 order by a";
    	return jdbc.getList(sql, Province.class);
    }
    
    public Province getProvinceByB(String b){
    	String sql = "select * from province where c=1 and b=? limit 1";
    	SqlParameter param = new SqlParameter();
    	param.setString(b);
    	return jdbc.get(sql, Province.class, param);
    }
}
