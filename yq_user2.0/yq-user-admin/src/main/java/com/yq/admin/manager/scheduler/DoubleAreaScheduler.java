package com.yq.admin.manager.scheduler;

import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.scheduler.SchedulerEntry;
import com.yq.manager.service.AdminService;

public class DoubleAreaScheduler extends SchedulerEntry {

	@Override
	public void executeJob(JobExecutionContext jobExecutionContext) throws JobExecutionException {

		LogSystem.info("开始执行DoubleAreaScheduler"+new Date());
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		try {
			adminService.doubelAreaCount();
		} catch (Exception e) {
			if(e instanceof ServiceException){
				ServiceException se = (ServiceException)e;
				LogSystem.info("执行出错"+se.getMessage()+",code="+se.getCode());
			}else{
				LogSystem.error(e, "");
			}
		}
		LogSystem.info("结束执行DoubleAreaScheduler"+new Date());
	}

}
