package com.yq.manage.bean;

/**
 * @author 作者: HuHua
 * @version 2016年12月17日
 * 类说明 
 */
public class GameChild {
		private int 			  id;
	    private int        gameServer;
	    private String            gameName;
	    private String            gameIp;
	    private Integer           gamePort;
	    private Integer           gameHotPort;
	    private String            gameArea;
	    private String            ftpIp;
	    private Integer           ftpPort;
	    private String            ftpName;
	    private String            ftpPwd;
	    private String            ftpUrl;
	    private String            ftpHotUrl;
	    private String            ftpStatus;
	    private String            codeArea;
	    private String            serverId;
	    private String            httpPort;
	    private String            groupName;
	    private String            ipdIp;
	    private int               ipdPort;
	    
	    public GameChild(){
	    	
	    }
	    
	    public GameChild(int id, int gameServer, String gameName, String gameIp, String serverId){
	    	this.id = id;
			this.gameServer = gameServer;
			this.gameName = gameName;
			this.gameIp = gameIp;
			this.serverId = serverId;
	    }
		public GameChild(int id, int gameServer, String gameName, String gameIp, Integer gamePort,
				Integer gameHotPort, String gameArea, String ftpIp, Integer ftpPort, String ftpName, String ftpPwd,
				String ftpUrl, String ftpHotUrl, String ftpStatus, String codeArea, String serverId, String httpPort,
				String groupName, String ipdIp, int ipdPort) {
			super();
			this.id = id;
			this.gameServer = gameServer;
			this.gameName = gameName;
			this.gameIp = gameIp;
			this.gamePort = gamePort;
			this.gameHotPort = gameHotPort;
			this.gameArea = gameArea;
			this.ftpIp = ftpIp;
			this.ftpPort = ftpPort;
			this.ftpName = ftpName;
			this.ftpPwd = ftpPwd;
			this.ftpUrl = ftpUrl;
			this.ftpHotUrl = ftpHotUrl;
			this.ftpStatus = ftpStatus;
			this.codeArea = codeArea;
			this.serverId = serverId;
			this.httpPort = httpPort;
			this.groupName = groupName;
			this.ipdIp = ipdIp;
			this.ipdPort = ipdPort;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public int getGameServer() {
			return gameServer;
		}

		public void setGameServer(int gameServer) {
			this.gameServer = gameServer;
		}

		public String getGameName() {
			return gameName;
		}
		public void setGameName(String gameName) {
			this.gameName = gameName;
		}
		public String getGameIp() {
			return gameIp;
		}
		public void setGameIp(String gameIp) {
			this.gameIp = gameIp;
		}
		public Integer getGamePort() {
			return gamePort;
		}
		public void setGamePort(Integer gamePort) {
			this.gamePort = gamePort;
		}
		public Integer getGameHotPort() {
			return gameHotPort;
		}
		public void setGameHotPort(Integer gameHotPort) {
			this.gameHotPort = gameHotPort;
		}
		public String getGameArea() {
			return gameArea;
		}
		public void setGameArea(String gameArea) {
			this.gameArea = gameArea;
		}
		public String getFtpIp() {
			return ftpIp;
		}
		public void setFtpIp(String ftpIp) {
			this.ftpIp = ftpIp;
		}
		public Integer getFtpPort() {
			return ftpPort;
		}
		public void setFtpPort(Integer ftpPort) {
			this.ftpPort = ftpPort;
		}
		public String getFtpName() {
			return ftpName;
		}
		public void setFtpName(String ftpName) {
			this.ftpName = ftpName;
		}
		public String getFtpPwd() {
			return ftpPwd;
		}
		public void setFtpPwd(String ftpPwd) {
			this.ftpPwd = ftpPwd;
		}
		public String getFtpUrl() {
			return ftpUrl;
		}
		public void setFtpUrl(String ftpUrl) {
			this.ftpUrl = ftpUrl;
		}
		public String getFtpHotUrl() {
			return ftpHotUrl;
		}
		public void setFtpHotUrl(String ftpHotUrl) {
			this.ftpHotUrl = ftpHotUrl;
		}
		public String getFtpStatus() {
			return ftpStatus;
		}
		public void setFtpStatus(String ftpStatus) {
			this.ftpStatus = ftpStatus;
		}
		public String getCodeArea() {
			return codeArea;
		}
		public void setCodeArea(String codeArea) {
			this.codeArea = codeArea;
		}
		public String getServerId() {
			return serverId;
		}
		public void setServerId(String serverId) {
			this.serverId = serverId;
		}
		public String getHttpPort() {
			return httpPort;
		}
		public void setHttpPort(String httpPort) {
			this.httpPort = httpPort;
		}
		public String getGroupName() {
			return groupName;
		}
		public void setGroupName(String groupName) {
			this.groupName = groupName;
		}
		public String getIpdIp() {
			return ipdIp;
		}
		public void setIpdIp(String ipdIp) {
			this.ipdIp = ipdIp;
		}
		public int getIpdPort() {
			return ipdPort;
		}
		public void setIpdPort(int ipdPort) {
			this.ipdPort = ipdPort;
		}
	    
	    

}
