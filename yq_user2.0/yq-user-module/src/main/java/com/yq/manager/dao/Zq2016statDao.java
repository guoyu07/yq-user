package com.yq.manager.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.yq.common.dao.YqDaoBase;
import com.yq.manager.bo.Zq2016stat;

public class Zq2016statDao extends YqDaoBase<Zq2016stat> {

	public boolean updateBigVipUser(String userName,String bigVipUser,String bigVipName){
		String sql = "update " + super.getTable() +" set big_vip_user=?,big_vip_name=? where user_name=? limit 1";
	    return super.getJdbc().update(sql, SqlParameter.Instance().withString(bigVipUser).withString(bigVipName).withString(userName))>0;
	}
}
