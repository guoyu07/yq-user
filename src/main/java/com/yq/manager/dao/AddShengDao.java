package com.yq.manager.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.yq.user.bo.Addsheng;

public class AddShengDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "addsheng";
	
	public boolean add(Addsheng t){
		return jdbc.insert(t)>0;
	}
}
