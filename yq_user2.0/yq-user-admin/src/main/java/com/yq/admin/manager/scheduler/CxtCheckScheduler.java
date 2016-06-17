package com.yq.admin.manager.scheduler;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.context.ServiceCacheFactory;
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
          UserService userService = ServiceCacheFactory.getService(UserService.class);
          userService.checkCxt();
	}

}
