package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.yq.user.bo.Dldate;

public class DldateDao {
	@Autowired
	private Jdbc jdbc;
	
//	private final String table = "dldate";
	
	public boolean add(Dldate dldate){
		return jdbc.insert(dldate)>0;
	}
}
