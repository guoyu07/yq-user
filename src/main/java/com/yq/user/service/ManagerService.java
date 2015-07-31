package com.yq.user.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Dgag;
import com.yq.user.bo.Epkjdate;
import com.yq.user.bo.Fcxt;
import com.yq.user.dao.DgagDao;
import com.yq.user.dao.EpkjdateDao;
import com.yq.user.dao.FcxtDao;

public class ManagerService {
    @Autowired
	private DgagDao dgagDao;
    @Autowired
    private FcxtDao fcxtDao;
    @Autowired
    private EpkjdateDao epkjdateDao;
    /**
     * 获取公告列表
     * @param pageIndex
     * @param pageSize
     * @return
     */
	public IPage<Dgag> getDgagPageList(int pageIndex,int pageSize){
		return dgagDao.getPage(pageIndex, pageSize);
	}
	/**
	 * 获取公告信息
	 * @param id
	 * @return
	 */
	public Dgag getDgag(int id){
		return dgagDao.get(id);
	}
	/**
	 * 获取一个fcxt
	 * @param id
	 * @return
	 */
	public Fcxt getFcxtById(int id){
		return fcxtDao.get(id);
	}
	/**
	 * 竞猜
	 * @return
	 */
	public Epkjdate getEpkjdate(){
		return epkjdateDao.get();
	}
	/**
	 * 竞猜
	 * @return
	 */
	public Epkjdate getEpkjdateBz0(){
		return epkjdateDao.getBz0();
	}
	/**
	 * 更新竞猜押注池
	 * @return
	 */
	public boolean updateEpkjdateBz0(int dan,int shuang,int da,int xiao){
		return epkjdateDao.update(dan, shuang, da, xiao);
	}
	/**
	 * 以往开奖记录
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Epkjdate> getPageList(int pageIndex,int pageSize){
		return epkjdateDao.getPageList(pageIndex, pageSize);
	}
}
