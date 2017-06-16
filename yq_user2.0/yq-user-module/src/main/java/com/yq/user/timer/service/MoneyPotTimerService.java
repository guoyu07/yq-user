package com.yq.user.timer.service;
import java.util.Timer;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.plugin.IAppPlugin;
import com.yq.user.dao.MoneyPotLogDao;

public class MoneyPotTimerService implements IAppPlugin{
	
	@Autowired
	private MoneyPotLogDao moneyPotLogDao;

	@Override
	public void startup() throws Exception {
		LogSystem.info("初始化钱罐timer......");
		//MoneyPotLogDao task = new MoneyPotLogDao();
        //间隔：5秒
        long period = 1000 *5; 
        Timer timer = new Timer(); 
        timer.schedule(moneyPotLogDao, period, period);
	}

	@Override
	public void shutdown() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int cpOrder() {
		// TODO Auto-generated method stub
		return 0;
	}
		
	
	
}