package com.yq.user.bo;

import java.util.Date;

import com.yq.common.utils.DateUtils;
import com.yq.user.service.UserService;
   /**
    * gcuser 实体类
    */ 


public class Gcuser{
	private Integer id;
	private String username;
	private String up;
	private int jb;
	private int sjb;
	private int vip;
	private String vipname;
	private int vipljcjb;
	private int vipsycjb;
	private int vipcjcjb;
	private String vipuser;
	private String vipgh;
	private String vipnh;
	private String vipjh;
	private String vipcft;
	private String vipzfb;
	private int cbgc;
	private int jbpay;
	private int cbpay;
	private int pay;
	private int txpay;
	private int vippay;
	private int jjpay;
	private int fhpay;
	private int rgpay;
	private int mcpay;
	private int ljep;
	private int syep;
	private int cjtj;
	private int ljbdb;
	private int sybdb;
	private int payok;
	private Date txdate;
	private int jypay;
	private int ljsy;
	private int jjsy;
	private int sytx;
	private int dlpay;
	private int gdgc;
	private int stopgc;
	private int fhsy;
	private int ljfh;
	private int jyg;
	private int stopjyg;
	private Date jygdate;
	private int jygt1;
	private int jydb;
	private Date dbdate;
	private int dbt1;
	private int cfa;
	private double cfb;
	private int cfc;
	private String password;
	private String password3;
	private String name;
	private Integer dqu;
	private String add9dqu;
	private String addsheng;
	private String addshi;
	private String addqu;
	private int dqutj;
	private int dqupay;
	private int dqutx;
	private int shengtj;
	private int shengpay;
	private int shengtx;
	private int shitj;
	private int shipay;
	private int shitx;
	private int qutj;
	private int qupay;
	private int qutx;
	private String bank;
	private String card;
	private String call;
	private String email;
	private String qq;
	private String userid;
	private String fingerid;
	private int gwuid;
	private String jcname;
	private String jcuserid;
	private Date regtime;
	private Date logtime;
	private Date dldate;
	private Date dqdate;
	private Date gmdate;
	private Date bddate;
	private int ga;
	private int ganew;
	private String vipsq;
	private Date pwdate;
	private Date hfcjdate;
	private int hfcj;
	private int bz1;
	private int bz2;
	private int cxt;
	private Date cxdate;
	private int txlb;
	private int cbuser;
	
	private Date upgmdate;
	
	
	public void setUsername(String username){
	this.username=username;
	}
	public String getUsername(){
		return username;
	}
	public void setUp(String up){
	this.up=up;
	}
	public String getUp(){
		return up;
	}
	public void setJb(int jb){
	this.jb=jb;
	}
	public int getJb(){
		return jb;
	}
	public void setSjb(int sjb){
	this.sjb=sjb;
	}
	public int getSjb(){
		return sjb;
	}
	public void setVip(int vip){
	this.vip=vip;
	}
	public int getVip(){
		return vip;
	}
	public void setVipname(String vipname){
	this.vipname=vipname;
	}
	public String getVipname(){
		return vipname;
	}
	public void setCbgc(int cbgc){
	this.cbgc=cbgc;
	}
	public int getCbgc(){
		return cbgc;
	}
	public void setJbpay(int jbpay){
	this.jbpay=jbpay;
	}
	public int getJbpay(){
		return jbpay;
	}
	public void setCbpay(int cbpay){
	this.cbpay=cbpay;
	}
	public int getCbpay(){
		return cbpay;
	}
	public void setPay(int pay){
	this.pay=pay;
	}
	public int getPay(){
		return pay;
	}
	public void setTxpay(int txpay){
	this.txpay=txpay;
	}
	public int getTxpay(){
		return txpay;
	}
	public void setVippay(int vippay){
	this.vippay=vippay;
	}
	public int getVippay(){
		return vippay;
	}
	public void setJjpay(int jjpay){
	this.jjpay=jjpay;
	}
	public int getJjpay(){
		return jjpay;
	}
	public void setFhpay(int fhpay){
	this.fhpay=fhpay;
	}
	public int getFhpay(){
		return fhpay;
	}
	public void setRgpay(int rgpay){
	this.rgpay=rgpay;
	}
	public int getRgpay(){
		return rgpay;
	}
	public void setMcpay(int mcpay){
	this.mcpay=mcpay;
	}
	public int getMcpay(){
		return mcpay;
	}
	public void setLjep(int ljep){
	this.ljep=ljep;
	}
	public int getLjep(){
		return ljep;
	}
	public void setSyep(int syep){
	this.syep=syep;
	}
	public int getSyep(){
		return syep;
	}
	public void setCjtj(int cjtj){
	this.cjtj=cjtj;
	}
	public int getCjtj(){
		return cjtj;
	}
	public void setLjbdb(int ljbdb){
	this.ljbdb=ljbdb;
	}
	public int getLjbdb(){
		return ljbdb;
	}
	public void setSybdb(int sybdb){
	this.sybdb=sybdb;
	}
	public int getSybdb(){
		return sybdb;
	}
	public void setPayok(int payok){
	this.payok=payok;
	}
	public int getPayok(){
		return payok;
	}
	public void setTxdate(Date txdate){
	this.txdate=txdate;
	}
	public Date getTxdate(){
		return txdate;
	}
	public void setJypay(int jypay){
	this.jypay=jypay;
	}
	public int getJypay(){
		return jypay;
	}
	public void setLjsy(int ljsy){
	this.ljsy=ljsy;
	}
	public int getLjsy(){
		return ljsy;
	}
	public void setJjsy(int jjsy){
	this.jjsy=jjsy;
	}
	public int getJjsy(){
		return jjsy;
	}
	public void setSytx(int sytx){
	this.sytx=sytx;
	}
	public int getSytx(){
		return sytx;
	}
	public void setDlpay(int dlpay){
	this.dlpay=dlpay;
	}
	public int getDlpay(){
		return dlpay;
	}
	public void setGdgc(int gdgc){
	this.gdgc=gdgc;
	}
	public int getGdgc(){
		return gdgc;
	}
	public void setStopgc(int stopgc){
	this.stopgc=stopgc;
	}
	public int getStopgc(){
		return stopgc;
	}
	public void setFhsy(int fhsy){
	this.fhsy=fhsy;
	}
	public int getFhsy(){
		return fhsy;
	}
	public void setLjfh(int ljfh){
	this.ljfh=ljfh;
	}
	public int getLjfh(){
		return ljfh;
	}
	public void setJyg(int jyg){
	this.jyg=jyg;
	}
	public int getJyg(){
		return jyg;
	}
	public void setStopjyg(int stopjyg){
	this.stopjyg=stopjyg;
	}
	public int getStopjyg(){
		return stopjyg;
	}
	public void setJygdate(Date jygdate){
	this.jygdate=jygdate;
	}
	public Date getJygdate(){
		return jygdate;
	}
	public void setJygt1(int jygt1){
	this.jygt1=jygt1;
	}
	public int getJygt1(){
		return jygt1;
	}
	public void setJydb(int jydb){
	this.jydb=jydb;
	}
	public int getJydb(){
		return jydb;
	}
	public void setDbdate(Date dbdate){
	this.dbdate=dbdate;
	}
	public Date getDbdate(){
		return dbdate;
	}
	public void setDbt1(int dbt1){
	this.dbt1=dbt1;
	}
	public int getDbt1(){
		return dbt1;
	}
	public void setCfa(int cfa){
	this.cfa=cfa;
	}
	public int getCfa(){
		return cfa;
	}
	public void setCfb(double cfb){
	this.cfb=cfb;
	}
	public double getCfb(){
		return cfb;
	}
	public void setCfc(int cfc){
	this.cfc=cfc;
	}
	public int getCfc(){
		return cfc;
	}
	public void setPassword(String password){
	this.password=password;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword3(String password3){
	this.password3=password3;
	}
	public String getPassword3(){
		return password3;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	
	public Integer getDqu() {
		return dqu;
	}
	public void setDqu(Integer dqu) {
		this.dqu = dqu;
	}
	public void setAdd9dqu(String add9dqu){
	this.add9dqu=add9dqu;
	}
	public String getAdd9dqu(){
		return add9dqu;
	}
	public void setAddsheng(String addsheng){
	this.addsheng=addsheng;
	}
	public String getAddsheng(){
		return addsheng;
	}
	public void setAddshi(String addshi){
	this.addshi=addshi;
	}
	public String getAddshi(){
		return addshi;
	}
	public void setAddqu(String addqu){
	this.addqu=addqu;
	}
	public String getAddqu(){
		return addqu;
	}
	public void setDqutj(int dqutj){
	this.dqutj=dqutj;
	}
	public int getDqutj(){
		return dqutj;
	}
	public void setDqupay(int dqupay){
	this.dqupay=dqupay;
	}
	public int getDqupay(){
		return dqupay;
	}
	public void setDqutx(int dqutx){
	this.dqutx=dqutx;
	}
	public int getDqutx(){
		return dqutx;
	}
	public void setShengtj(int shengtj){
	this.shengtj=shengtj;
	}
	public int getShengtj(){
		return shengtj;
	}
	public void setShengpay(int shengpay){
	this.shengpay=shengpay;
	}
	public int getShengpay(){
		return shengpay;
	}
	public void setShengtx(int shengtx){
	this.shengtx=shengtx;
	}
	public int getShengtx(){
		return shengtx;
	}
	public void setShitj(int shitj){
	this.shitj=shitj;
	}
	public int getShitj(){
		return shitj;
	}
	public void setShipay(int shipay){
	this.shipay=shipay;
	}
	public int getShipay(){
		return shipay;
	}
	public void setShitx(int shitx){
	this.shitx=shitx;
	}
	public int getShitx(){
		return shitx;
	}
	public void setQutj(int qutj){
	this.qutj=qutj;
	}
	public int getQutj(){
		return qutj;
	}
	public void setQupay(int qupay){
	this.qupay=qupay;
	}
	public int getQupay(){
		return qupay;
	}
	public void setQutx(int qutx){
	this.qutx=qutx;
	}
	public int getQutx(){
		return qutx;
	}
	public void setBank(String bank){
	this.bank=bank;
	}
	public String getBank(){
		return bank;
	}
	public void setCard(String card){
	this.card=card;
	}
	public String getCard(){
		return card;
	}
	public void setCall(String call){
	this.call=call;
	}
	public String getCall(){
		return call;
	}
	public void setEmail(String email){
	this.email=email;
	}
	public String getEmail(){
		return email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public void setUserid(String userid){
	this.userid=userid;
	}
	public String getUserid(){
		return userid;
	}
	public void setFingerid(String fingerid){
	this.fingerid=fingerid;
	}
	public String getFingerid(){
		return fingerid;
	}
	public void setGwuid(int gwuid){
	this.gwuid=gwuid;
	}
	public int getGwuid(){
		return gwuid;
	}
	public void setJcname(String jcname){
	this.jcname=jcname;
	}
	public String getJcname(){
		return jcname;
	}
	public void setJcuserid(String jcuserid){
	this.jcuserid=jcuserid;
	}
	public String getJcuserid(){
		return jcuserid;
	}
	public void setRegtime(Date regtime){
	this.regtime=regtime;
	}
	public Date getRegtime(){
		return regtime;
	}
	public void setLogtime(Date logtime){
	this.logtime=logtime;
	}
	public Date getLogtime(){
		return logtime;
	}
	public void setDldate(Date dldate){
	this.dldate=dldate;
	}
	public Date getDldate(){
		return dldate;
	}
	public void setDqdate(Date dqdate){
	this.dqdate=dqdate;
	}
	public Date getDqdate(){
		return dqdate;
	}
	public void setGmdate(Date gmdate){
	this.gmdate=gmdate;
	}
	public Date getGmdate(){
		return gmdate;
	}
	public void setBddate(Date bddate){
	this.bddate=bddate;
	}
	public Date getBddate(){
		return bddate;
	}
	public void setGa(int ga){
	this.ga=ga;
	}
	public int getGa(){
		return ga;
	}
	public void setGanew(int ganew){
	this.ganew=ganew;
	}
	public int getGanew(){
		return ganew;
	}
	public void setVipsq(String vipsq){
	this.vipsq=vipsq;
	}
	public String getVipsq(){
		if(vipsq.equals(UserService.INIT_SMS_CODE)){
			return "252493618";//测试时用的短信码 
		}
		return vipsq;
	}
	public void setPwdate(Date pwdate){
	this.pwdate=pwdate;
	}
	public Date getPwdate(){
		return pwdate;
	}
	public void setHfcjdate(Date hfcjdate){
	this.hfcjdate=hfcjdate;
	}
	public Date getHfcjdate(){
		return hfcjdate;
	}
	public void setHfcj(int hfcj){
	this.hfcj=hfcj;
	}
	public int getHfcj(){
		return hfcj;
	}
	public void setBz1(int bz1){
	this.bz1=bz1;
	}
	public int getBz1(){
		return bz1;
	}
	public void setBz2(int bz2){
	this.bz2=bz2;
	}
	public int getBz2(){
		return bz2;
	}
	public void setCxt(int cxt){
	this.cxt=cxt;
	}
	public int getCxt(){
		return cxt;
	}
	public void setCxdate(Date cxdate){
	this.cxdate=cxdate;
	}
	public Date getCxdate(){
		return cxdate;
	}
	public void setTxlb(int txlb){
	this.txlb=txlb;
	}
	public int getTxlb(){
		return txlb;
	}
	public void setCbuser(int cbuser){
	this.cbuser=cbuser;
	}
	public int getCbuser(){
		return cbuser;
	}
	public String getSimpleCall(){
		int callLenght = call.length();
		String callLeft = call.substring(0, 3);
		String CallRight = call.substring(callLenght-3, callLenght);
		return callLeft+"*****"+CallRight;
	}
	
	public int getCtxDays(){
		if(cxdate!=null&&cxdate.getTime()>System.currentTimeMillis()){
			return DateUtils.getIntervalDays(new Date(),cxdate);
		}
		return 0;
	}
	public int getVipljcjb() {
		return vipljcjb;
	}
	public void setVipljcjb(int vipljcjb) {
		this.vipljcjb = vipljcjb;
	}
	public int getVipsycjb() {
		return vipsycjb;
	}
	public void setVipsycjb(int vipsycjb) {
		this.vipsycjb = vipsycjb;
	}
	public int getVipcjcjb() {
		return vipcjcjb;
	}
	public void setVipcjcjb(int vipcjcjb) {
		this.vipcjcjb = vipcjcjb;
	}
	public String getVipuser() {
		return vipuser;
	}
	public void setVipuser(String vipuser) {
		this.vipuser = vipuser;
	}
	public String getVipgh() {
		return vipgh;
	}
	public void setVipgh(String vipgh) {
		this.vipgh = vipgh;
	}
	public String getVipnh() {
		return vipnh;
	}
	public void setVipnh(String vipnh) {
		this.vipnh = vipnh;
	}
	public String getVipjh() {
		return vipjh;
	}
	public void setVipjh(String vipjh) {
		this.vipjh = vipjh;
	}
	public String getVipcft() {
		return vipcft;
	}
	public void setVipcft(String vipcft) {
		this.vipcft = vipcft;
	}
	public String getVipzfb() {
		return vipzfb;
	}
	public void setVipzfb(String vipzfb) {
		this.vipzfb = vipzfb;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getUpgmdate() {
		return upgmdate;
	}
	public void setUpgmdate(Date upgmdate) {
		this.upgmdate = upgmdate;
	}
	
}

