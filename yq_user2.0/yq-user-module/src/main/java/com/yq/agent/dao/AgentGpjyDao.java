package com.yq.agent.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.dao.YqDaoBase;
import com.yq.user.bo.Gpjy;

public class AgentGpjyDao extends YqDaoBase<Gpjy>{

	
	
		public IPage<Gpjy> getAllGpjyPageList(String userName, int pageIndex, int pageSize) {
			String sql="select * from gpjy where username = ? and jy = 1 and  bz not like '拆分%倍'  order by id desc";
			return getJdbc().getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
		}
	
		
		public IPage<Gpjy> getUserPointSplitPageList(String userName, int pageIndex, int pageSize) {
			String sql="select * from gpjy where username = ? and bz like '拆分%倍' order by id desc";
			return getJdbc().getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
		}
		
		
}
