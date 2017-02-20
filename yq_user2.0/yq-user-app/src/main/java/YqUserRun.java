import java.util.HashMap;
import java.util.Map;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;

import com.sr178.module.sms.util.SubMailSendUtils;


public class YqUserRun {
	public static void main(String[] args) throws Exception {
		Server server = buildNormalServer(8087, "/");
		server.start();
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
	
	public static void smsSend(){
		Map<String,String> param = new HashMap<String,String>();
		param.put("code", "1234567");
		SubMailSendUtils.sendMessage("15919820372", "aGTtt3", param);
	}
}
