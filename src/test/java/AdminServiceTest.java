import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.testcore.DaoTest;
import com.yq.manager.service.AdminService;

public class AdminServiceTest extends DaoTest {

	public void testWay(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
//		adminService.man123();
		adminService.managequeren();
	}
}
