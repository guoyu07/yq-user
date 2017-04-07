import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.testcore.ActionTest;
import com.sr178.module.utils.MD5Security;
import com.yq.agent.service.AgentService;
import com.yq.app.utils.MacShaUtils;
import com.yq.user.service.UserService;


public class AdminServiceTest extends ActionTest{
	public void testWay(){
//		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
//		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
//		adminService.man123();
//		adminService.resetZaqAndZbq();
//		adminService.resetUserDownInfo();
//		adminService.executeSynNameSql();
//		adminService.managequeren();
//		final UserService userService = ServiceCacheFactory.getService(UserService.class);
//		userService.saleYb("dogdog7788", "222222", 1000, "000000", "1111");
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
		
//		String appKey = "2k6bhoc8q4ecpjcnv9m1wb9bun55k5fu";
//		
//		String appId = 100+"";
//		String orderUserName = "300fhk";
//		String amount = "100";
//		String productOrder = "2254ss";
//		String productDesc = "测试订单";
//		String param = "";
//		String signStr = appId+orderUserName+amount+productOrder+productDesc+param;
//		String sign = MacShaUtils.doEncryptBase64(signStr, appKey);
//		int orderId =agentService.creatOrder(appId, orderUserName, amount, productOrder, productDesc, param, sign);
		
//		agentService.payOrder("15880805512", "965eb72c92a549dd", MD5Security.md5_16_Small("222222"), 9);
		
	}
}
