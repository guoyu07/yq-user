package com.yq.admin.manager.scheduler;

import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.scheduler.SchedulerEntry;
import com.yq.user.service.UserService;
/**
 * 诚信检查
 * @author ThinkPad User
 *
 */
public class CxtCheckScheduler extends SchedulerEntry {

	@Override
	public void executeJob(JobExecutionContext arg0) throws JobExecutionException {
		  LogSystem.info("开始执行CxtCheckScheduler"+new Date());
          UserService userService = ServiceCacheFactory.getService(UserService.class);
          userService.checkCxt();
          LogSystem.info("结束执行CxtCheckScheduler"+new Date());
	}

}
