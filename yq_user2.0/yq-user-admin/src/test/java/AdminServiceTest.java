import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.testcore.ActionTest;
import com.sr178.game.framework.testcore.DaoTest;
import com.sr178.game.framework.testcore.ServiceTest;
import com.yq.common.utils.UrlRequestUtils.Mode;
import com.yq.cw.service.CwService;
import com.yq.manager.service.AdminService;
import com.yq.user.bean.CallBackMsgBean;
import com.yq.user.scheduler.SendChargeMsgScheduler;
import com.yq.user.service.UserService;

public class AdminServiceTest extends DaoTest{

	public void testWay(){
//		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
//		adminService.generatorStatData();
//		adminService.resetCfb();
//		adminService.managequeren();
//		adminService.man123();
//		adminService.resetZaqAndZbq();
//		adminService.resetUserDownInfo();
//		adminService.executeSynNameSql();
//		adminService.managequeren();
//		final UserService userService = ServiceCacheFactory.getService(UserService.class);
//		userService.sendYbSaleSmsMsg("dogdog7788", 0);
//		userService.sendYbSaleSmsMsg("dogdog7788", 1);
//		userService.sendYbSaleSmsMsg("dogdog7788", 2);
//		
//		
//		new Thread(new Runnable() {
//			
//			@Override
//			public void run() {
//				userService.bdReg("xtgc002", "zyl666a4", "dogdog7788", 10000, "123456", "222222", "252493618", 1);
//				LogSystem.info("第一个线程弄好了");
//			}
//		}).start();;
//		
//		
//		new Thread(new Runnable() {
//			
//			@Override
//			public void run() {
//				userService.bdReg("xtgc002", "zyl666a4", "dogdog7788", 10000, "123456", "222222", "252493618", 1);
//				LogSystem.info("第二个线程弄好了");
//			}
//		}).start();;
//		
//		try {
//			Thread.currentThread().sleep(1000000);
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
		
//		userService.bdReg("xtgc002", "zyl666a4", "dogdog7788", 10000, "123456", "222222", "252493618", 1);
		
//		adminService.jfdm();
//		Performance performance = adminService.getUserFiveStepPerformance("xtgc002");
//		System.out.println(performance.getHtmlScript());
//		adminService.shareMoney();
//		performance.print();
//		System.out.println("over");
		
//		adminService.generatorTopReward(new Date());
//		adminService.resetUserZaqAndZbq("fxj881");
//		adminService.managequeren();
//		adminService.resetZaqAndZbq();
//		adminService.resetUserDownInfo();
//		adminService.shareMoney();
//		String KYPW_URL = "http://www.kypwb.com/interface/YiBiPayReturnNotify?act=payment&op=returnyibi&paycode=success";
//		CallBackMsgBean bean1 = new CallBackMsgBean(KYPW_URL, null, Mode.GET, "err");
//		CallBackMsgBean bean2 = new CallBackMsgBean(KYPW_URL, null, Mode.GET, "ok");
//		CallBackMsgBean bean3 = new CallBackMsgBean(KYPW_URL, null, Mode.GET, "err");
//		CallBackMsgBean bean4 = new CallBackMsgBean(KYPW_URL, null, Mode.GET, "ok");
//		CallBackMsgBean bean5 = new CallBackMsgBean(KYPW_URL, null, Mode.GET, "err");
//		CallBackMsgBean bean6 = new CallBackMsgBean(KYPW_URL, null, Mode.GET, "ok");
//		
//		SendChargeMsgScheduler.addMsg(bean1);
//		SendChargeMsgScheduler.addMsg(bean2);
//		SendChargeMsgScheduler.addMsg(bean3);
//		SendChargeMsgScheduler.addMsg(bean4);
//		SendChargeMsgScheduler.addMsg(bean5);
//		SendChargeMsgScheduler.addMsg(bean6);
//		
//		try {
//			Thread.currentThread().sleep(100000000l);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		CwService cwService = ServiceCacheFactory.getService(CwService.class);
//		cwService.vipDownTempRun();
	}
}
