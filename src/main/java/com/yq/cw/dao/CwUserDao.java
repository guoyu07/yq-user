package com.yq.cw.dao;

import com.sr178.common.jdbc.bean.SqlParamBean;
import com.yq.common.dao.YqDaoBase;
import com.yq.cw.bo.CwUser;

public class CwUserDao extends YqDaoBase<CwUser>{

	
	public CwUser getCwUser(String userName){
		return this.get(new SqlParamBean("user_name", userName));
	}
}
