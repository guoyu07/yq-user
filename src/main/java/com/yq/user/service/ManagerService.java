package com.yq.user.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.user.bo.Dgag;
import com.yq.user.bo.Epkjdate;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Jfkjdate;
import com.yq.user.dao.DgagDao;
import com.yq.user.dao.EpkjdateDao;
import com.yq.user.dao.FcxtDao;
import com.yq.user.dao.JfkjdateDao;

public class ManagerService {
    @Autowired
	private DgagDao dgagDao;
    @Autowired
    private FcxtDao fcxtDao;
    @Autowired
    private EpkjdateDao epkjdateDao;
    @Autowired
    private JfkjdateDao jfkjdateDao;
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
	/**
	 * 获取积分竞猜当前配置
	 * @return
	 */
	public Jfkjdate getJfkjdate(){
		return jfkjdateDao.get();
	}
	/**
	 * 积分日志列表
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Jfkjdate> getJfkjdatePage(int pageIndex,int pageSize){
		return jfkjdateDao.getPageList(pageIndex, pageSize);
	}

	/**
	 * 竞猜
	 * @return
	 */
	public Jfkjdate getJfkjdateBz0(){
		return jfkjdateDao.getBz0();
	}
	
	/**
	 * 更新竞猜押注池
	 * @return
	 */
	public boolean updateJfkjdateBz0(int dan,int shuang,int da,int xiao){
		return jfkjdateDao.update(dan, shuang, da, xiao);
	}
	/**
	 * 添加公告
	 * @param title
	 * @param content
	 */
	public void addNotice(String title,String content){
		Dgag dgag = new Dgag();
		dgag.setGgbt(title);
		dgag.setGgny(content);
		dgag.setGgdate(new Date());
		dgagDao.add(dgag);
	}
	/**
	 * 修改公告
	 * @param title
	 * @param content
	 */
	public boolean editNotice(int id,String title,String content,String ggdate){
		Date ggdateO = DateUtils.StringToDate(ggdate,DateStyle.YYYY_MM_DD_HH_MM_SS);
		return dgagDao.update(id, title, content, ggdateO);
	}
	
}
