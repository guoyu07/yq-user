package com.yq.admin.manager.scheduler;

import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.scheduler.SchedulerEntry;
import com.yq.manager.service.AdminService;

public class AppMoneypotScheduler extends SchedulerEntry{
	
	@Override
	public void executeJob(JobExecutionContext arg0) throws JobExecutionException {
//		LogSystem.info("开始执行钱罐请求"+new Date());
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.appbackjob();
//		LogSystem.info("结束执行钱罐请求"+new Date());
	}


}
