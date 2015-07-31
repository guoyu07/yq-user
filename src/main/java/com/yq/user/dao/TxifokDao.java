package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.yq.user.bo.Txifok;

public class TxifokDao {
    @Autowired
	public Jdbc jdbc;
    
    public boolean add(Txifok txifok){
    	return jdbc.insert(txifok)>0;
    }
}
