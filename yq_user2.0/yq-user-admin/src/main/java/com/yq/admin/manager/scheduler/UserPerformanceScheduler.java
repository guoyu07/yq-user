package com.yq.admin.manager.scheduler;


import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.scheduler.SchedulerEntry;

public class UserPerformanceScheduler extends SchedulerEntry {

	@Override
	public void executeJob(JobExecutionContext arg0) throws JobExecutionException {
//		LogSystem.info("开始执行UserPerformanceScheduler"+new Date());
//		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
//		adminService.generatorTopReward(new Date());
//		LogSystem.info("结束执行UserPerformanceScheduler"+new Date());
	}

}
