import java.util.HashMap;
import java.util.Map;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;

import cn.submsg.client.util.SubMsgSendUtils;



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
//		param.put("name", "邵");
//		param.put("numStr", "50000元(伍万圆整)");
//		param.put("userName", "sal1413a");
//		param.put("date", "2016/1/2");
//		SubMsgSendUtils.sendMessage("1526614929611", "sUb981", param);
//	}
	
}
