package com.yq.manager.scheduler;

import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.scheduler.SchedulerEntry;
import com.yq.manager.service.AdminService;

public class BackCountScheduler extends SchedulerEntry {

	@Override
	public void executeJob(JobExecutionContext arg0) throws JobExecutionException {
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.backCount(new Date());
	}

}
