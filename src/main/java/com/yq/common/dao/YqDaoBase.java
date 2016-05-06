package com.yq.common.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.dao.BaseDao;

public class YqDaoBase<T> extends BaseDao<T> {
    @Autowired
	private Jdbc jdbc;
	
	@Override
	public Jdbc getJdbc() {
		return jdbc;
	}

}
