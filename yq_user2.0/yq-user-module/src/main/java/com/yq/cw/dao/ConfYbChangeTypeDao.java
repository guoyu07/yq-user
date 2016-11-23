package com.yq.cw.dao;

import java.util.List;

import com.yq.common.dao.YqDaoBase;
import com.yq.cw.bo.ConfYbChangeType;

public class ConfYbChangeTypeDao extends YqDaoBase<ConfYbChangeType>{
private final static String table = "conf_ybchange_type";

	public List<ConfYbChangeType> getAllList() {
		String sql = "SELECT * FROM "+ table;
		return super.getJdbc().getList(sql, ConfYbChangeType.class, null);
	}
}
