package com.yq.agent.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.yq.agent.bo.AppPayRecord;
import com.yq.common.dao.YqDaoBase;

public class AppPayRecordDao extends YqDaoBase<AppPayRecord> {

	
	public AppPayRecord get(String productId){
		StringBuilder sql= new StringBuilder();
		sql.append("select * from app_pay_record where product_order = ? ");
		SqlParameter sqlparam =new SqlParameter();
		sqlparam.setString(productId);
		return getJdbc().get(sql.toString(), AppPayRecord.class, sqlparam);
	}
	
	public boolean add(AppPayRecord appPayRecord){
		return getJdbc().insert(appPayRecord)>0;
	}
	
}
