package com.yq.user.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.GpjyIndexMc;
import com.yq.user.bo.GpjyIndexMr;

public class GpjyDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "gpjy";
	
	private List<Gpjy> mcCache = null;
	
	private List<Gpjy> mrCache = null;
	
//	public boolean update(){
//		String sql = "update "+table+" set jy=0 where now()>dqdate+0.0006 and jy=2";
//		return this.jdbc.update(sql, null)>0;
//	}
	
	private void cleanCache(Integer id){
		if(id==null){
			mcCache = null;
			mrCache = null;
		}
		if(mcCache!=null){
			boolean isClean = false;
			for(Gpjy gpjy:mcCache){
			    if(gpjy.getId().intValue()==id.intValue()){
			    	isClean = true;
			    	break;
			    }	
			}
			if(isClean){
				mcCache = null;
			}
		}
		
		if(mrCache!=null){
			boolean isClean = false;
			for(Gpjy gpjy:mrCache){
			    if(gpjy.getId().intValue()==id.intValue()){
			    	isClean = true;
			    	break;
			    }	
			}
			if(isClean){
				mrCache = null;
			}
		}
	}
	
	
	
	private void initMcCache(int pageSize){
//		String sql="select * from "+table+" where jy=0 and mcsl>0 order by pay asc limit "+pageSize;
		String sql="select * from "+table+" where id in(select t.id from (select id from gpjy_index_mc order by pay asc limit "+pageSize+")t )";
		List<Gpjy> list = this.jdbc.getList(sql, Gpjy.class, null);
		mcCache = list;
	}
	
	private void initMrCache(int pageSize){
//		String sql="select * from "+table+" where jy=0 and mysl>0 order by pay asc limit "+pageSize;
		String sql="select * from "+table+" where id in(select t.id from (select id from gpjy_index_mr order by id asc limit "+pageSize+")t )";
		List<Gpjy> list = this.jdbc.getList(sql, Gpjy.class, null);
		mrCache = list;
	}
	
	public boolean add(Gpjy gpjy){
		if(gpjy.getAbdate()==null){
			gpjy.setAbdate(new Date());
		}
		
		int id = this.jdbc.insertBackKeys(gpjy);
		
			if(gpjy.getMcsl()!=null&&gpjy.getMcsl()>0&&gpjy.getJy()==0){
				if(mcCache!=null&&mcCache.size()<10){
					mcCache = null;
				}
				//添加卖出市场索引
				GpjyIndexMc mc = new GpjyIndexMc();
				mc.setId(id);
				mc.setPay(gpjy.getPay());
				mc.setMcsl(gpjy.getMcsl());
				mc.setCreatedTime(new Date());
				jdbc.insert(mc);
			}
			if(gpjy.getMysl()!=null&&gpjy.getMysl()>0&&gpjy.getJy()==0){
				if(mrCache!=null&&mrCache.size()<10){
					mrCache = null;
				}
				//添加买入市场索引
				GpjyIndexMr my = new GpjyIndexMr();
				my.setId(id);
				my.setPay(gpjy.getPay());
				my.setMysl(gpjy.getMysl());
				my.setCreatedTime(new Date());
				jdbc.insert(my);
		}
		
		return true;
	}
	
	public void deleteIndex(int id){
		String sqlMc = "delete from gpjy_index_mc where id="+id;
		jdbc.update(sqlMc, null);
		String sqlMr = "delete from gpjy_index_mr where id="+id;
		jdbc.update(sqlMr, null);
	}
	
	public void updateIndexPay(int id,double pay){
		String sqlMc = "update gpjy_index_mc set pay=? where id="+id;
		String sqlMr = "update gpjy_index_mr set pay=? where id="+id;
		jdbc.update(sqlMc, SqlParameter.Instance().withDouble(pay));
		jdbc.update(sqlMr, SqlParameter.Instance().withDouble(pay));
	}
	
	
	public IPage<Gpjy> getPageList(String userName,int pageIndex,int pageSize){
		String sql = "select * from gpjy where username = ? and kjqi>0 order by id desc" ;
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}
	
	public Gpjy get(){
		
//		String sql="select * from "+table+" where jy=0 and mcsl>0 limit 1";
		String sql = "select * from gpjy_index_mc limit 1";
		return this.jdbc.get(sql, Gpjy.class, null);
	}
	
	
//	public IPage<Gpjy> getMcPage(int pageIndex,int pageSize){
//		String sql="select * from "+table+" where jy=0 and mcsl>0 order by id";
//		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
//	}
	public List<Gpjy> getMcPageList(int pageSize){
//		String sql="select * from "+table+" where jy=0 and mcsl>0 order by pay asc limit "+pageSize;
//		return this.jdbc.getList(sql, Gpjy.class, null);
		if(mcCache==null){
			initMcCache(pageSize);
		}
		return mcCache;
	}
	
	public IPage<Gpjy> getAdminMcPage(int pageIndex,int pageSize){
		String sql="select * from "+table+" where mcsl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public List<Gpjy> getMrPage(int pageSize){
//		String sql="select * from "+table+" where jy=0 and mysl>0 order by pay asc limit "+pageSize;
//		return this.jdbc.getList(sql, Gpjy.class, null);
		if(mrCache==null){
			initMrCache(pageSize);
		}
		return mrCache;
	}
	
	public IPage<Gpjy> getAdminMrPage(int pageIndex,int pageSize){
		String sql="select * from "+table+" where mysl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getAllPageList(String userName,int pageIndex,int pageSize){
		String sql="select * from "+table+" where username = ? order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getUserPageDetailsList(String userName,int pageIndex,int pageSize){
		String sql="select * from "+table+" where username = ? and jy=0 and mcsl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}
	
	public boolean updateJy(int jy,int id){
		String sql = "update "+table+" set jy=? where id=? and jy=0";
		boolean result =  this.jdbc.update(sql, SqlParameter.Instance().withInt(jy).withInt(id))>0;
		if(result){
			cleanCache(id);
		}
		return result;
	}
	
	public boolean updateDqdate(int id){
		String sql = "update "+table+" set dqdate=? where id=?";
		boolean result = this.jdbc.update(sql, SqlParameter.Instance().withObject(new Date()).withInt(id))>0;
		if(result){
			cleanCache(id);
		}
		return result;
	}	
	
	public boolean updateCgdate(int id){
		String sql = "update "+table+" set cgdate=? where id=?";
		boolean result =  this.jdbc.update(sql, SqlParameter.Instance().withObject(new Date()).withInt(id))>0;
		if(result){
			cleanCache(id);
		}
		return result;
	}
	
	public boolean updateBz(int id,String bz){
		String sql = "update "+table+" set bz=? where id=?";
		boolean result = this.jdbc.update(sql, SqlParameter.Instance().withString(bz).withInt(id))>0;
		if(result){
			cleanCache(id);
		}
		return result;
	}
	
	public boolean updatePayAndJyPay(int id,double pay,int jypay){
		String sql = "update "+table+" set pay=?,jypay=? where id=? and jy=0 limit 1";
		boolean result = this.jdbc.update(sql, SqlParameter.Instance().withDouble(pay).withInt(jypay).withInt(id))>0;
		if(result){
			cleanCache(id);
		}
		return result;
	}
	
	public Gpjy getByJyId(int jyid){
		String sql="select * from "+table+" where jyid=? limit 1";
		return this.jdbc.get(sql, Gpjy.class, SqlParameter.Instance().withInt(jyid));
	}
	
	public Gpjy getById(int id){
		String sql="select * from "+table+" where id=? limit 1";
		return this.jdbc.get(sql, Gpjy.class, SqlParameter.Instance().withInt(id));
	}
	
	public boolean updateSaleSuccess(int id,String buyUser,String bz){
		String sql = "update "+table+" set bz=?,cgdate=?,jy=1,dfuser=? where id=? and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(bz);
		parameter.setObject(new Date());
		parameter.setString(buyUser);
		parameter.setInt(id);
		boolean result =  this.jdbc.update(sql, parameter)>0;
		if(result){
			cleanCache(id);
		}
		return result;
	}
	
	public boolean updateBuySuccess(int id,String buyUser,String bz,int jyg){
		String sql = "update "+table+" set bz=?,cgdate=?,sysl=?,jy=1,dfuser=? where id=? and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(bz);
		parameter.setObject(new Date());
		parameter.setInt(jyg);
		parameter.setString(buyUser);
		parameter.setInt(id);
		boolean result =  this.jdbc.update(sql, parameter)>0;
		if(result){
			cleanCache(id);
		}
		return result;
	}
	
	public boolean delete(int id,int indexId){
		String sql = "delete from "+table+" where jyid =? and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(id);
		boolean result =  this.jdbc.update(sql, parameter)>0;
		if(result){
			cleanCache(indexId);
		}
		return result;
	}
	
	public IPage<Gpjy> getPageList(int pageIndex,int pageSize){
		String sql = "select * from "+table+" order by id desc";
		return jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public boolean update(String userName,int amount ,String dfuser){
		String sql = "update "+table+" set mysl=mysl+?,sysl=sysl+?,jypay=jypay+? where username=? and dfuser=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(amount).withInt(amount).withInt(amount).withString(userName).withString(dfuser))>0;
	}
	
	public Gpjy get(String userName,String dfuser){
		String sql = "select * from "+table+" where username=? and dfuser=? limit 1";
		return jdbc.get(sql, Gpjy.class, SqlParameter.Instance().withString(userName).withString(dfuser));
	}
	
//	public boolean updateGpjy(String userName,String dfuser,String bz,String toDfuser,Date cgdate){
//		String sql = "update table set bz=?,dfuser=?,cgdate=?,newjy=0 where username=? and dfuser=? limit 1";
//		return jdbc.update(sql, SqlParameter.Instance().withString(bz).withString(toDfuser).withObject(cgdate).withString(userName).withString(dfuser))>0;
//	}
	
	public Double getSumMcsl(){
		String sql = "select sum(mcsl) as ljmc from gpjy" ;
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumMcslByDate(String startTime,String endTime){
		String sql = "select sum(mcsl) as ljmc from gpjy where abdate between ? and ?" ;
		SqlParameter parameter = new SqlParameter();
		parameter.setString(startTime);
		parameter.setString(endTime);
		return jdbc.getDouble(sql, parameter);
	}
	
	public Double getSumMysl(){
		String sql = "select sum(mysl) as ljmc from gpjy" ;
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumMyslByDate(String startTime,String endTime){
		String sql = "select sum(mysl) as ljmc from gpjy where abdate between ? and ?" ;
		SqlParameter parameter = new SqlParameter();
		parameter.setString(startTime);
		parameter.setString(endTime);
		return jdbc.getDouble(sql, parameter);
	}
	
	public IPage<Gpjy> getSearchResultPageDetailsList(String field,String value,int pageIndex,int pageSize){
		String sql="select * from "+table+" where "+field+" = ? order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(value), pageSize, pageIndex);
	}

}
