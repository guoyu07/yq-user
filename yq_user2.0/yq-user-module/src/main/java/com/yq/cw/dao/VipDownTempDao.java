package com.yq.cw.dao;

import java.util.List;

import com.sr178.common.jdbc.SqlParameter;
import com.yq.common.dao.YqDaoBase;
import com.yq.cw.bo.VipDownTemp;

public class VipDownTempDao extends YqDaoBase<VipDownTemp> {

	private final static String table = "vip_down_temp";
	
	public void insertBatch(List<VipDownTemp> list){
		super.getJdbc().insert(list);
	}

	public List<VipDownTemp> getDownVipList(String userName) {
		String sql = "SELECT * FROM "+ table+" where user_name=?";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withString(userName);
		return super.getJdbc().getList(sql, VipDownTemp.class, sqlParameter);
	}
	
}
