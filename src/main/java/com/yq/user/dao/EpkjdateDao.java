package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Epkjdate;

public class EpkjdateDao {
    @Autowired
	private Jdbc jdbc;
    
    private static final String table="epkjdate";
    
    
    public Epkjdate get(){
    	String sql = "select * from "+table+" order by kid desc limit 1";
    	return jdbc.get(sql, Epkjdate.class,null);
    }
    
    
    public IPage<Epkjdate> getPageList(int pageIndex,int pageSize){
    	String sql = "select * from epkjdate where bz=1 order by kid desc";
    	return jdbc.getListPage(sql, Epkjdate.class, null, pageSize, pageIndex);
    }
    
    public Epkjdate getBz0(){
    	String sql = "select * from "+table+" where bz=0 order by kid desc limit 1";
    	return jdbc.get(sql, Epkjdate.class,null);
    }
    
    
    public boolean update(int dan,int shuang,int da,int xiao){
    	String sql = "update "+table+" set dan=dan+?,shuang=shuang+?,da=da+?,xiao=xiao+? where bz=0 order by kid desc limit 1";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setInt(dan);
    	parameter.setInt(shuang);
    	parameter.setInt(da);
    	parameter.setInt(xiao);
    	return jdbc.update(sql, parameter)>0;
    }
    
}
