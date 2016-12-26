import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;



public class YqUserAdminRun {
	public static void main(String[] args) throws Exception {
		Server server = buildNormalServer(8082, "/");
		server.start();
//		smsSend();
	}
	/**
	 * 创建用于正常运行调试的Jetty Server, 以src/main/webapp为Web应用目录.
	 */
	public static Server buildNormalServer(int port, String contextPath) {
		Server server = new Server(port);
		WebAppContext webContext = new WebAppContext("src/main/webapp", contextPath);
		webContext.setClassLoader(Thread.currentThread().getContextClassLoader());
		server.setHandler(webContext);
		server.setStopAtShutdown(true);
		return server;
	}
	
//	public static void smsSend(){
//		Map<String,String> param = new HashMap<String,String>();
//		param.put("name", "刘");
//		param.put("numStr", "20000元(贰万圆整)");
//		param.put("userName", "ljy5656a");
//		param.put("date", "2016/12/15");
//		SubMsgSendUtils.sendMessage("13620623424", "sUb981", param);
//	}
	
}
