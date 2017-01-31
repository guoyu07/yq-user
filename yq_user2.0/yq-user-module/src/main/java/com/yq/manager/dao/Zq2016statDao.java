package com.yq.manager.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.yq.common.dao.YqDaoBase;
import com.yq.manager.bo.Zq2016stat;
import com.yq.manager.bo.Zup2016stat;

public class Zq2016statDao extends YqDaoBase<Zq2016stat> {

	public boolean updateBigVipUser(String userName,String bigVipUser,String bigVipName){
		String sql = "update " + super.getTable() +" set big_vip_user=?,big_vip_name=? where user_name=? limit 1";
	    return super.getJdbc().update(sql, SqlParameter.Instance().withString(bigVipUser).withString(bigVipName).withString(userName))>0;
	}
	
	/**
	 * 查询2016年个人所有同名账户的直推业绩
	 * @param userid
	 * @return
	 */
    public Zup2016stat getZup2016stat(String userid){
    	String sql = "select * from zup2016stat where userid=? limit 1";
    	return super.getJdbc().get(sql, Zup2016stat.class, SqlParameter.Instance().withString(userid));
    }
}
