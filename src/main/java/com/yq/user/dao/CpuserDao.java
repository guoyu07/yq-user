package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.yq.user.bo.Cpuser;

public class CpuserDao {
	@Autowired
	private Jdbc jdbc;
	
//	private static String table = "cpuser";
	
	public boolean add(Cpuser cpuser){
		return jdbc.insert(cpuser)>0;
	}
	
}
