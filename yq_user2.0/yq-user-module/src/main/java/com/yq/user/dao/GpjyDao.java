package com.yq.user.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.module.utils.JedisUtils;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.GpjyIndexMc;
import com.yq.user.bo.GpjyIndexMr;

public class GpjyDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "gpjy";
	
//	private List<Gpjy> mcCache = null;
//	
//	private List<Gpjy> mrCache = null;
	
//	public boolean update(){
//		String sql = "update "+table+" set jy=0 where now()>dqdate+0.0006 and jy=2";
//		return this.jdbc.update(sql, null)>0;
//	}
	private static final String MC_KEY = "gpjy_mc_cache_key";
	private static final String MR_KEY = "gpjy_mr_cache_key";
	
	private void setCacheList(String key,List<Gpjy> list){
		JedisUtils.setList(key, list);
	}
	
	private List<Gpjy> getCacheList(String key){
		return JedisUtils.getList(key, Gpjy.class);
	}
	
	private void delCache(String key){
		JedisUtils.delete(key);
	}
	
	public void cleanCache(Integer id){
			if (id == null) {
				delCache(MC_KEY);
				delCache(MR_KEY);
//				mcCache = null;
//				mrCache = null;
				return;
			}
			List<Gpjy> mcCache = getCacheList(MC_KEY);
			if (mcCache != null) {
				boolean isClean = false;
				for (Gpjy gpjy : mcCache) {
					if (gpjy.getId().intValue() == id.intValue()) {
						isClean = true;
						break;
					}
				}
				if (isClean) {
					delCache(MC_KEY);
					return;
//					mcCache = null;
				}
			}
			List<Gpjy> mrCache = getCacheList(MR_KEY);
			if (mrCache != null) {
				boolean isClean = false;
				for (Gpjy gpjy : mrCache) {
					if (gpjy.getId().intValue() == id.intValue()) {
						isClean = true;
						break;
					}
				}
				if (isClean) {
					delCache(MR_KEY);
					return;
//					mrCache = null;
				}
			}
	}
	
	
	public void cleanCache(){
			delCache(MC_KEY);
			delCache(MR_KEY);
	}
	
	
	
	
	private List<Gpjy> initMcCache(int pageSize, String userName){
//		String sql="select * from "+table+" where jy=0 and mcsl>0 order by pay asc limit "+pageSize;
		/*String sql="select * from "+table+" where id in(select t.id from (select id from gpjy_index_mc order by pay asc limit "+pageSize+")t ) and username <> ?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		List<Gpjy> list = this.jdbc.getList(sql, Gpjy.class, parameter);*/
		String sql="select * from "+table+" where id in(select t.id from (select id from gpjy_index_mc order by pay asc limit "+pageSize+")t )";
		List<Gpjy> list = this.jdbc.getList(sql, Gpjy.class, null);
//		mcCache = list;
		setCacheList(MC_KEY, list);
		return list;
	}
	
	private List<Gpjy> initMrCache(int pageSize, String userName){
//		String sql="select * from "+table+" where jy=0 and mysl>0 order by pay asc limit "+pageSize;
		/*String sql="select * from "+table+" where id in(select t.id from (select id from gpjy_index_mr order by pay desc,id asc limit "+pageSize+")t ) and username <> ?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		List<Gpjy> list = this.jdbc.getList(sql, Gpjy.class, parameter);*/
		String sql="select * from "+table+" where id in(select t.id from (select id from gpjy_index_mr order by pay desc,id asc limit "+pageSize+")t )";
		List<Gpjy> list = this.jdbc.getList(sql, Gpjy.class, null);
		
		setCacheList(MR_KEY, list);
//		mrCache = list;
		return list;
	}
	
	public boolean add(Gpjy gpjy){
		if(gpjy.getAbdate()==null){
			gpjy.setAbdate(new Date());
		}
		
		int id = this.jdbc.insertBackKeys(gpjy);
		
			if(gpjy.getMcsl()!=null&&gpjy.getMcsl()>0&&gpjy.getJy()==0){
				//添加卖出市场索引
				GpjyIndexMc mc = new GpjyIndexMc();
				mc.setId(id);
				mc.setPay(gpjy.getPay());
				mc.setMcsl(gpjy.getMcsl());
				mc.setCreatedTime(new Date());
				jdbc.insert(mc);
				List<Gpjy> mcCache = getCacheList(MC_KEY);
				if(mcCache!=null&&mcCache.size()<10){
					delCache(MC_KEY);
//					mcCache = null;
				}

			}
			if(gpjy.getMysl()!=null&&gpjy.getMysl()>0&&gpjy.getJy()==0){
				//添加买入市场索引
				GpjyIndexMr my = new GpjyIndexMr();
				my.setId(id);
				my.setPay(gpjy.getPay());
				my.setMysl(gpjy.getMysl());
				my.setCreatedTime(new Date());
				jdbc.insert(my);
				List<Gpjy> mrCache = getCacheList(MR_KEY);
				if(mrCache!=null&&mrCache.size()<10){
					delCache(MR_KEY);
//					mrCache = null;
				}
		}
		
		return true;
	}
	
	public void deleteIndex(int id){
		String sqlMc = "delete from gpjy_index_mc where id="+id;
		jdbc.update(sqlMc, null);
		String sqlMr = "delete from gpjy_index_mr where id="+id;
		jdbc.update(sqlMr, null);
		
		cleanCache(id);
	}
	
	
	
	public void updateIndexPay(int id,double pay){
		String sqlMc = "update gpjy_index_mc set pay=? where id="+id;
		String sqlMr = "update gpjy_index_mr set pay=? where id="+id;
		jdbc.update(sqlMc, SqlParameter.Instance().withDouble(pay));
		jdbc.update(sqlMr, SqlParameter.Instance().withDouble(pay));
	}
	
	/**
	 * 
	 * 修改买卖索引交易数量
	 * 
	 * @param id	
	 * 	
	 * @param count 交易数量
	 * 
	 * */
	public void updateIndexCount(int id,double count){
		String sqlMc = "update gpjy_index_mc set mcsl=mcsl-? where id="+id;
		String sqlMr = "update gpjy_index_mr set mysl=mysl-? where id="+id;
		jdbc.update(sqlMc, SqlParameter.Instance().withDouble(count));
		jdbc.update(sqlMr, SqlParameter.Instance().withDouble(count));
		cleanCache();
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
	public List<Gpjy> getMcPageList(int pageSize, String userName){
//		String sql="select * from "+table+" where jy=0 and mcsl>0 order by pay asc limit "+pageSize;
//		return this.jdbc.getList(sql, Gpjy.class, null);
		List<Gpjy> mcCache = getCacheList(MC_KEY);
		if(mcCache==null || mcCache.isEmpty()){
			return initMcCache(pageSize, userName);
		}
		return mcCache;
	}
	
	public IPage<Gpjy> getAdminMcPage(int pageIndex,int pageSize){
		String sql="select * from "+table+" where mcsl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public List<Gpjy> getMrPage(int pageSize, String userName){
//		String sql="select * from "+table+" where jy=0 and mysl>0 order by pay asc limit "+pageSize;
//		return this.jdbc.getList(sql, Gpjy.class, null);
		List<Gpjy> mrCache = getCacheList(MR_KEY);
		if(mrCache==null || mrCache.isEmpty()){
			return initMrCache(pageSize, userName);
		}
		return mrCache;
	}
	/**
	 * 此方法不需要使用缓存  因为只在系统回购时调用
	 * @param pageSize
	 * @param date
	 * @return
	 */
	public List<Gpjy> getMrPageForSystem(int pageSize,String date){
		String sql="select * from "+table+" where jy=0 and mysl>0 and abdate<'"+date+"'  order by id desc limit "+pageSize;
		return this.jdbc.getList(sql, Gpjy.class, null);
//		if(mrCache==null){
//			initMrCache(pageSize);
//		}
//		return mrCache;
	}
	
	/**
	 * 此方法不需要使用缓存  因为只在系统回购时调用
	 * @param pageSize
	 * @param date
	 * @return
	 */
	public List<Gpjy> getMrPageForSystemOrderByPay(int pageSize){
		String sql="select * from "+table+" where id in(select t.id from (select id from gpjy_index_mr order by pay desc,id asc limit "+pageSize+")t )";
		return this.jdbc.getList(sql, Gpjy.class, null);
//		if(mrCache==null){
//			initMrCache(pageSize);
//		}
//		return mrCache;
	}
	
	public IPage<Gpjy> getAdminMrPage(int pageIndex,int pageSize){
		String sql="select * from "+table+" where mysl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getAllPageList(String userName,int pageIndex,int pageSize){
		String sql="select * from "+table+" where username = ? and not ISNULL(cgdate) order by cgdate desc";
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
	
	public boolean updateBuySuccess(int id,String buyUser,String bz,int jyg,double price,double mysl){
		String sql = "update "+table+" set bz=?,cgdate=?,sysl=?,jy=1,dfuser=?,pay=?,mysl=? where id=? and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(bz);
		parameter.setObject(new Date());
		parameter.setInt(jyg);
		parameter.setString(buyUser);
		parameter.setDouble(price);
		parameter.setDouble(mysl);
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
	/**
	 * 返还收购一币的押金
	 * @param userName
	 * @param dfuser
	 * @param bz
	 * @param toDfuser
	 * @param cgdate
	 * @return
	 */
//	public boolean backBuyYbGpjy(String userName,String dfuser,String bz,String toDfuser,Date cgdate){
//		String sql = "update table set bz=?,dfuser=?,cgdate=?,newjy=0 where username=? and dfuser=? and newjy=1 limit 1";
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
	
	/**
	 * 得到卖出索引列表
	 * 
	 * */
	public List<GpjyIndexMc> getMcIndexList(){
		String sql = "select * from gpjy_index_mc order by pay asc ";
		return this.jdbc.getList(sql, GpjyIndexMc.class);
	}
	
	
	/**
	 * 得到买入索引列表
	 * 
	 * */
	public List<GpjyIndexMr> getMrIndexList(){
		String sql = "select * from gpjy_index_mr order by pay asc ";
		return this.jdbc.getList(sql, GpjyIndexMr.class);
	}

	/**
	 * 根据价格得到卖出索引列表
	 * 
	 * @param price 价格
	 * 
	 * @param pageIndex 
	 * 
	 * @param pageSize
	 * 
	 * */
	public IPage<GpjyIndexMc> getMcIndexList(double price, int pageIndex, int pageSize){
		String sql = "select * from gpjy_index_mc where pay=? order by pay desc,id asc";
		SqlParameter paramter = new SqlParameter();
		paramter.setDouble(price);
		return jdbc.getListPage(sql, GpjyIndexMc.class, paramter, pageSize, pageIndex);
	}
	
	
	/**
	 * 根据价格得到卖出索引列表
	 * 
	 * @param pageIndex 
	 * 
	 * @param pageSize
	 * 
	 * */
	public IPage<GpjyIndexMr> getMrIndexList(int pageIndex, int pageSize){
		String sql = "select * from gpjy_index_mr order by pay desc,id asc";
		return jdbc.getListPage(sql, GpjyIndexMr.class, null, pageSize, pageIndex);
	}

	/**
	 * 得到没有交易过的订单
	 * 
	 * @param orderId 订单id
	 * 
	 * */
	public Gpjy getNoJyById(int orderId) {
		String sql="select * from "+table+" where id=? and jy=0 limit 1";
		return this.jdbc.get(sql, Gpjy.class, SqlParameter.Instance().withInt(orderId));
	}

	/**
	 * 
	 * 修改卖出积分交易
	 * 
	 * @param id
	 * 
	 * @param buyUser	买入用户
	 * 
	 * @param saleNum	卖出数量
	 * 
	 * @param bz		备注
	 * 
	 * */
	public boolean updateSaleJf(Integer id, double saleNum) {
		String sql = "update "+table+" set mcsl=mcsl-?,jypay=CAST(mcsl*pay AS SIGNED INTEGER) where id=? and mcsl-?>0 and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setDouble(saleNum);
		parameter.setInt(id);
		parameter.setDouble(saleNum);
		boolean result =  this.jdbc.update(sql, parameter)>0;
		if(result){
			cleanCache();
		}
		return result;
	}
	
	/**
	 * 
	 * 修改买入积分交易
	 * 
	 * @param id
	 * 
	 * @param saleNum	买入数量
	 * 
	 * */
	public boolean updateBuyJf(Integer id, double buyNum,double needJb) {
		String sql = "update "+table+" set mysl=mysl-?,jypay=jypay-? where id=? and mysl-?>0 and jypay-?>0 and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setDouble(buyNum);
		parameter.setDouble(needJb);
		parameter.setInt(id);
		parameter.setDouble(buyNum);
		parameter.setDouble(needJb);
		boolean result =  this.jdbc.update(sql, parameter)>0;
		if(result){
			cleanCache();
		}
		return result;
	}

	/**
	 * 
	 * 得到买入列表
	 * 
	 * */
	public IPage<Gpjy> getMrPageList(String userName, int pageIndex, int pageSize) {
		String sql="select * from "+table+" where username = ? and jy=0 and mysl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}

	/**获得未成交的积分交易明细*/
	public IPage<Gpjy> getAllNoDealGpjyPageList(String userName, int pageIndex, int pageSize) {
		String sql="select * from "+table+" where username = ? and  ISNULL(cgdate) order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}
	
}
