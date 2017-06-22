package com.yq.vip.bean;

import java.util.Date;

public class ModifyUserLog {
	private String username;		//用户名
	private String password3;		//二级密码				
	private String card;			//银行卡号
	private String bank; 			//银行
	private String name;			
	private String call; 
	private String email; 
	private String qq; 
	private String userid; 
	private int payok; 
	private String jcname; 
	private String jcuserid; 
	private String md5password;
	private Date pwdate;				
	private int cxt;
	private int areacode;		//国际编码
	
	private String oldusername;		//用户名
	private String oldpassword3;	//二级密码				
	private String oldcard;			//银行卡号
	private String oldbank; 		//银行
	private String oldname;			
	private String oldcall; 
	private String oldemail; 
	private String oldqq; 
	private String olduserid; 
	private int oldpayok; 
	private String oldjcname; 
	private String oldjcuserid; 
	private String oldmd5password;
	private Date oldpwdate;			
	private int oldcxt;
	private int oldareacode;	
	private Date operatedate;		//操作日期
	private String operator;			//操作人
	public ModifyUserLog(){
		
	}
	
	public ModifyUserLog(String username, String password3, String card, String bank, String name, String call,
			String email, String qq, String userid, int payok, String jcname, String jcuserid, String md5password,
			Date pwdate, int cxt, int areacode, String oldusername, String oldpassword3, String oldcard,
			String oldbank, String oldname, String oldcall, String oldemail, String oldqq, String olduserid,
			int oldpayok, String oldjcname, String oldjcuserid, String oldmd5password, Date oldpwdate, int oldcxt,
			int oldareacode, Date operatedate, String operator) {
		super();
		this.username = username;
		this.password3 = password3;
		this.card = card;
		this.bank = bank;
		this.name = name;
		this.call = call;
		this.email = email;
		this.qq = qq;
		this.userid = userid;
		this.payok = payok;
		this.jcname = jcname;
		this.jcuserid = jcuserid;
		this.md5password = md5password;
		this.pwdate = pwdate;
		this.cxt = cxt;
		this.areacode = areacode;
		this.oldusername = oldusername;
		this.oldpassword3 = oldpassword3;
		this.oldcard = oldcard;
		this.oldbank = oldbank;
		this.oldname = oldname;
		this.oldcall = oldcall;
		this.oldemail = oldemail;
		this.oldqq = oldqq;
		this.olduserid = olduserid;
		this.oldpayok = oldpayok;
		this.oldjcname = oldjcname;
		this.oldjcuserid = oldjcuserid;
		this.oldmd5password = oldmd5password;
		this.oldpwdate = oldpwdate;
		this.oldcxt = oldcxt;
		this.oldareacode = oldareacode;
		this.operatedate = operatedate;
		this.operator = operator;
	}

	
	
	public String getOldusername() {
		return oldusername;
	}

	public void setOldusername(String oldusername) {
		this.oldusername = oldusername;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword3() {
		return password3;
	}
	public void setPassword3(String password3) {
		this.password3 = password3;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	
	public int getPayok() {
		return payok;
	}

	public void setPayok(int payok) {
		this.payok = payok;
	}

	public void setOldpayok(int oldpayok) {
		this.oldpayok = oldpayok;
	}

	public String getJcname() {
		return jcname;
	}
	public void setJcname(String jcname) {
		this.jcname = jcname;
	}
	public String getJcuserid() {
		return jcuserid;
	}
	public void setJcuserid(String jcuserid) {
		this.jcuserid = jcuserid;
	}
	public Date getPwdate() {
		return pwdate;
	}
	public void setPwdate(Date pwdate) {
		this.pwdate = pwdate;
	}
	
	public String getOldpassword3() {
		return oldpassword3;
	}
	public void setOldpassword3(String oldpassword3) {
		this.oldpassword3 = oldpassword3;
	}
	public String getOldcard() {
		return oldcard;
	}
	public void setOldcard(String oldcard) {
		this.oldcard = oldcard;
	}
	public String getOldbank() {
		return oldbank;
	}
	public void setOldbank(String oldbank) {
		this.oldbank = oldbank;
	}
	public String getOldname() {
		return oldname;
	}
	public void setOldname(String oldname) {
		this.oldname = oldname;
	}
	public String getOldcall() {
		return oldcall;
	}
	public void setOldcall(String oldcall) {
		this.oldcall = oldcall;
	}
	public String getOldemail() {
		return oldemail;
	}
	public void setOldemail(String oldemail) {
		this.oldemail = oldemail;
	}
	public String getOldqq() {
		return oldqq;
	}
	public void setOldqq(String oldqq) {
		this.oldqq = oldqq;
	}
	public String getOldjcname() {
		return oldjcname;
	}
	public void setOldjcname(String oldjcname) {
		this.oldjcname = oldjcname;
	}
	public String getOldjcuserid() {
		return oldjcuserid;
	}
	public void setOldjcuserid(String oldjcuserid) {
		this.oldjcuserid = oldjcuserid;
	}
	public Date getOldpwdate() {
		return oldpwdate;
	}
	public void setOldpwdate(Date oldpwdate) {
		this.oldpwdate = oldpwdate;
	}
	
	public int getCxt() {
		return cxt;
	}

	public void setCxt(int cxt) {
		this.cxt = cxt;
	}

	public int getOldcxt() {
		return oldcxt;
	}

	public void setOldcxt(int oldcxt) {
		this.oldcxt = oldcxt;
	}

	public int getOldpayok() {
		return oldpayok;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getMd5password() {
		return md5password;
	}

	public void setMd5password(String md5password) {
		this.md5password = md5password;
	}

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public String getOlduserid() {
		return olduserid;
	}

	public void setOlduserid(String olduserid) {
		this.olduserid = olduserid;
	}

	public String getOldmd5password() {
		return oldmd5password;
	}

	public void setOldmd5password(String oldmd5password) {
		this.oldmd5password = oldmd5password;
	}

	public int getOldareacode() {
		return oldareacode;
	}

	public void setOldareacode(int oldareacode) {
		this.oldareacode = oldareacode;
	}

	public Date getOperatedate() {
		return operatedate;
	}
	public void setOperatedate(Date operatedate) {
		this.operatedate = operatedate;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}
	

}
