import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.testcore.DaoTest;
import com.yq.manager.service.AdminService;

public class AdminServiceTest extends DaoTest {

	public void testWay(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
//		adminService.man123();
//		adminService.resetZaqAndZbq();
//		adminService.resetUserDownInfo();
//		adminService.executeSynNameSql();
//		adminService.managequeren();
//		final UserService userService = ServiceCacheFactory.getService(UserService.class);
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
	}
}
