package com.yq.agent.dao;

import java.util.List;

import com.yq.common.dao.YqDaoBase;
import com.yq.manager.bo.PointsChangeLog;

public class AgentPointsChangeLogDao extends YqDaoBase<PointsChangeLog>{
	
	private static final String table = "points_change_log";
	
	public List<PointsChangeLog> get10(){
		String sql = "select * from "+table+" order by id desc LIMIT 10";
		return getJdbc().getList(sql, PointsChangeLog.class);
	}
	

}
