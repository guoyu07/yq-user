package com.yq.admin.manager.scheduler;

import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.scheduler.SchedulerEntry;
import com.yq.cw.service.CwService;
import com.yq.manager.service.AdminService;

public class VipDownTempScheduler extends SchedulerEntry {

	@Override
	public void executeJob(JobExecutionContext arg0) throws JobExecutionException {
		LogSystem.info("开始执行VipDownTempScheduler"+new Date());
		CwService cwService = ServiceCacheFactory.getService(CwService.class);
		cwService.vipDownTempRun();
		LogSystem.info("结束执行VipDownTempScheduler"+new Date());
	}

}
