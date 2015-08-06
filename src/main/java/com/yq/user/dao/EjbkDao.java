package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.yq.user.bo.Ejbk;

public class EjbkDao {
    @Autowired
	private Jdbc jdbc;
    
    private static final String table = "ejbk";
    
    public void batchAdd(List<Ejbk> list){
    	 jdbc.insert(list);
    }
}
