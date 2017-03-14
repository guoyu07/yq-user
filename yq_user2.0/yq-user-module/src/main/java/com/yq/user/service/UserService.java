package com.yq.user.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.config.ConfigLoader;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.module.utils.JedisUtils;
import com.sr178.module.web.session.Session;
import com.yq.common.ProblemCode;
import com.yq.common.utils.BigDecimalUtil;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.Global;
import com.yq.common.utils.IDCardUtils;
import com.yq.common.utils.MD5Security;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.dao.AdminOperateLogDao;
import com.yq.manage.util.AdminGlobal;
import com.yq.manager.service.AdminService;
import com.yq.user.bean.UserBeanTemp;
import com.yq.user.bo.BabyInfo;
import com.yq.user.bo.Bdbdate;
import com.yq.user.bo.Cpuser;
import com.yq.user.bo.Datecj;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Ejbk;
import com.yq.user.bo.Epkjdate;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.GpjyIndexMc;
import com.yq.user.bo.GpjyIndexMr;
import com.yq.user.bo.Jbk10;
import com.yq.user.bo.Jbk100;
import com.yq.user.bo.Jbk300;
import com.yq.user.bo.Jbk50;
import com.yq.user.bo.Jbk500;
import com.yq.user.bo.Jfcp;
import com.yq.user.bo.Jfkjdate;
import com.yq.user.bo.MallOrder;
import com.yq.user.bo.Province;
import com.yq.user.bo.SameUserProperty;
import com.yq.user.bo.Sgxt;
import com.yq.user.bo.ShopBean;
import com.yq.user.bo.SysBiLog;
import com.yq.user.bo.Txifok;
import com.yq.user.bo.Txpay;
import com.yq.user.bo.TxpayIndex;
import com.yq.user.bo.UserExtinfo;
import com.yq.user.bo.UserProperty;
import com.yq.user.bo.UserScoresLog;
import com.yq.user.bo.UserScoresLogForExcel;
import com.yq.user.bo.Vipcjgl;
import com.yq.user.bo.YouMingxi;
import com.yq.user.bo.ZuoMingxi;
import com.yq.user.constant.BDBChangeType;
import com.yq.user.constant.GpjyChangeType;
import com.yq.user.constant.PasswordKey;
import com.yq.user.constant.ScoresChangeType;
import com.yq.user.constant.YbChangeType;
import com.yq.user.dao.BabyInfoDao;
import com.yq.user.dao.BdbDateDao;
import com.yq.user.dao.CpuserDao;
import com.yq.user.dao.DatePayDao;
import com.yq.user.dao.DatecjDao;
import com.yq.user.dao.DateipDao;
import com.yq.user.dao.EjbkDao;
import com.yq.user.dao.EptzbDao;
import com.yq.user.dao.FcxtDao;
import com.yq.user.dao.GcuserDao;
import com.yq.user.dao.GpjyDao;
import com.yq.user.dao.InterRegionCodeDao;
import com.yq.user.dao.JbkDao;
import com.yq.user.dao.JfcpDao;
import com.yq.user.dao.JftzbDao;
import com.yq.user.dao.MallOrderDao;
import com.yq.user.dao.ProvinceDao;
import com.yq.user.dao.SameUserPropertyDao;
import com.yq.user.dao.SgxtDao;
import com.yq.user.dao.SysBiLogDao;
import com.yq.user.dao.TduserDao;
import com.yq.user.dao.TxPayDao;
import com.yq.user.dao.TxifokDao;
import com.yq.user.dao.UserDailyGainLogDao;
import com.yq.user.dao.UserExtinfoDao;
import com.yq.user.dao.UserPropertyDao;
import com.yq.user.dao.UserScoresLogDao;
import com.yq.user.dao.VipcjglDao;
import com.yq.user.dao.VipxtgcDao;
import com.yq.user.dao.YouMingXiDao;
import com.yq.user.dao.ZuoMingxiDao;
import com.yq.user.utils.Ref;
import com.yq.user.utils._99douInterface;

import cn.submsg.client.util.SubMsgSendUtils;

public class UserService {
	
    @Autowired
	private GcuserDao gcuserDao;
    @Autowired
    private TduserDao tduserDao;
    @Autowired
    private ProvinceDao provinceDao;
    @Autowired
    private TxifokDao txifokDao;
    @Autowired
    private DateipDao dateipDao;
    @Autowired
    private ZuoMingxiDao zuoMingxiDao;
    @Autowired
    private YouMingXiDao youMingXiDao;
    @Autowired
    private SgxtDao sgxtDao;
    @Autowired
    private BdbDateDao bdbDateDao; 
    @Autowired
    private VipxtgcDao vipxtgcDao; 
    @Autowired
    private EptzbDao eptzbDao;
    @Autowired
    private LogService logService;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private JfcpDao jfcpDao;
    @Autowired
    private CpuserDao cpuserDao;
    @Autowired
    private TxPayDao txPayDao;
    @Autowired
    private DatePayDao datePayDao;
    @Autowired
    private GpjyDao gpjyDao;
    @Autowired
    private EjbkDao ejbkDao;
    @Autowired
    private DatecjDao datecjDao;
    @Autowired
    private JbkDao jdbDao;
    @Autowired
    private JftzbDao jftzbDao;
    @Autowired
    private FcxtDao fcxtDao;
    @Autowired
    private VipcjglDao vipcjglDao;
    @Autowired
    private BabyInfoDao babyInfoDao;
    @Autowired
    private UserDailyGainLogDao userDailyGainLogDao;
	@Autowired
	private UserExtinfoDao userExtinfoDao;
	@Autowired
	private UserScoresLogDao userScoresLogDao;
	@Autowired
	private MallOrderDao mallOrderDao;
	
	@Autowired
	private SysBiLogDao sysBiLogDao;
	@Autowired
	private InterRegionCodeDao interRegionCodeDao;
	@Autowired
	private UserPropertyDao userPropertyDao;
	@Autowired
	private SameUserPropertyDao sameUserPropertyDao;
	@Autowired
	private AdminOperateLogDao adminOperateLogDao;
	
	
	@Autowired
    private ExtendUserService proxySelf; 
	


	//用户id与UserMapper的映射map
//  	private Cache<String,Session> userSession = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(20000).build();
//  	
  	private static final String USER_SESSION_CACHE_PRE = "user_session_";
  	private static final int SESSION_EXPERI_SECONDS = 24*3600;
  	
  	public String generatorCacheKey(String sessionId){
  		return USER_SESSION_CACHE_PRE+sessionId;
  	}
  	
  	public Session getSession(String sessionId){
    	String key = generatorCacheKey(sessionId);
    	return JedisUtils.getObject(key, Session.class);
    }
    
    public void setSession(String sessionId,Session session){
    	String key = generatorCacheKey(sessionId);
    	JedisUtils.setObject(key, session);
    	JedisUtils.expireKey(key, SESSION_EXPERI_SECONDS);
    }
    
    public void delSession(String sessionId){
    	String key = generatorCacheKey(sessionId);
    	JedisUtils.delete(key);
    }
    
    /**
     * 查看是否登录了
     * @param sessionId
     * @return
     */
    public String isLogin(String sessionId){
    	Session userSessionBean = getSession(sessionId);
    	if(userSessionBean!=null){
    		return userSessionBean.getUserName();
    	}
    	return null;
    }
    
    
    public Session getUserSession(String sessionId){
    	return getSession(sessionId);
    }
    
    

    
	/**
	 * 登录
	 * @param sessionId
	 * @param userName
	 * @param pwd
	 * @return
	 */
    @ProblemCode
	public Gcuser login(String sessionId,String userName,String pwd,String ip){
    	/**
    	 * checkindex.asp中这段代码没看懂
    	 * Dim allName
			allName=ygid
			Call CalculateQ(allName,ygid)
			Function CalculateQ(allName,userName)
				set rs_Calculate = Server.CreateObject("ADODB.Recordset")
				sql_Calculate = "SELECT * FROM gcuser where username = '"&userName&"'"
				rs_Calculate.open sql_Calculate,conn2,1,1
				
				If rs_Calculate.eof Or rs_Calculate.bof Then
				rs_Calculate.close()
				'Response.write "没有数据<br>"
				Exit Function
				End If
				if rs_Calculate("username")=userName Then
				if rs_Calculate("vip")>0 Then
				allName=rs_Calculate("username")
				Exit Function
				End if
				Call CalculateQ(allName,rs_Calculate("up"))
			    rs_Calculate.close()
				Else
				rs_Calculate.close()
				'Response.write "错误的逻辑<br>"
				Exit Function'错误的逻辑
				End if
				
			End Function
			
						<%
			response.cookies("regid")=rs_login("username")
			response.cookies("password")=rs_login("password")
			ygid=request.cookies("regid")
			ygpa=request.cookies("password")
			rs_login("vipname")=allName
			rs_login("logtime")=Now()
			rs_login.update
			rs_login.close
			conn2.close
			set conn2=nothing
			response.redirect "/vgo/vipdl.asp?dl="&ygid&"&pa="&ygpa&""
			'response.redirect "manager.asp"
			%>
    	 */
    	userName = userName.toLowerCase();
		Gcuser gcUser = gcuserDao.getUser(userName);
		String md5pass = MD5Security.md5_16(pwd).toLowerCase();
		//登录成功
		if(gcUser!=null && gcUser.getPassword().equals(md5pass)){
			Session userSessionBean = new Session(gcUser.getUsername(), System.currentTimeMillis(),sessionId);
			this.setSession(sessionId, userSessionBean);
			gcuserDao.updateLoginTime(userName);
			this.addUserDateIpLog(userName, "登录", ip);
			return gcUser;
		}
		return null;
	}
    /**
     * 管理员登录
     * @param sessionId
     * @param id
     * @param pa
     * @param ip
     * @return
     */
    public Gcuser loginByManager(String sessionId,String id,String pa,String ip){
    	Gcuser gcUser = gcuserDao.getUser(id);
    	if(gcUser!=null && gcUser.getPassword().equals(pa)){
    		Session userSessionBean = new Session(gcUser.getUsername(), System.currentTimeMillis(),sessionId);
			this.setSession(sessionId, userSessionBean);
//			gcuserDao.updateLoginTime(id);
//			this.addUserDateIpLog(id, "登录", ip);
			return gcUser;
		}
		return null;
    }
	/**
	 * 同名账号切换
	 * @param loginUserName
	 * @param sessionId
	 */
    public void relogin(String loginUserName,String sessionId,String ip){
    	Session userSessionBean = this.getSession(sessionId);
    	this.delSession(sessionId);
    	Gcuser beforUser = gcuserDao.getUser(userSessionBean.getUserName());
    	Gcuser afterUser = gcuserDao.getUser(loginUserName);
    	if(beforUser==null||afterUser==null||!beforUser.getUserid().equals(afterUser.getUserid())||!beforUser.getName().equals(afterUser.getName())){
    		throw new ServiceException(3000, "权限不足");
    	}
    	
    	Session loginUserSessionBean = new Session(loginUserName, System.currentTimeMillis(),sessionId);
    	this.setSession(sessionId, loginUserSessionBean);
		gcuserDao.updateLoginTime(loginUserName);
		this.addUserDateIpLog(loginUserName, "登录", ip);
		//扫描重置vip名称
		try {
			resetVip(loginUserName);
		} catch (Exception e) {
			LogSystem.error(e, "重置vip名称出错!~~~");
		}
    }
    /**
     * 登出
     * @param sessionId
     * @return
     */
    public boolean logout(String sessionId){
    	Session userSessionBean = this.getSession(sessionId);
    	if(userSessionBean!=null){
        	this.delSession(sessionId);
        	return dateipDao.updateLogout(userSessionBean.getUserName());
    	}
        return true;
    }
    
    
    public int checkNameAndIdCardAndUpUser(String ggname,String gguserid,String upvip,int lan, int areaCode){
    	if(!Strings.isNullOrEmpty(upvip)&&getUserByUserName(upvip)==null){
			return 2;//推荐人不存在
		}
		if(lan==0&&!IDCardUtils.IDCardValidate(gguserid).equals("")){
			return 4;//身份证号码无效
		}
		if(isForbidNameOrID(ggname, gguserid)){
			return 5;//禁用账号
		}
		List<Gcuser> list = getUserByIdCard(gguserid);
		if(list!=null&&list.size()>0){
			return 3;// 该姓名["&request.Form("ggname")&"]及身份证号码["&Request.Form("gguserid")&"]已经被注册过，请您登录后在-[业务查询]下-[添加同名账户]！
		}
		
		if(areaCode==0||!interRegionCodeDao.isHasByRegioncode(areaCode)){
			return 8;
		}
		if(lan==1&&areaCode==86){
			return 10;//海外注册只能是非中国号码
		}
		
		return 0;
    }
	/**
	 * 注册
	 * @param gguser
	 * @param upvip
	 * @param ggname
	 * @param gguserid
	 * @param ggpa1
	 * @param ggpa3
	 * @param ggbank
	 * @param ggcard
	 * @param ggcall
	 * @param ggqq
	 * @param provinceName
	 * @param cityName
	 * @param areaName
	 * @return
	 */
	public int reg(String gguser,String upvip,String ggname,String gguserid,String ggpa1,String ggpa3,String ggbank,String ggcard,String ggcall,String ggqq,String provinceName,String cityName,String areaName,int lan, int areaCode){
		gguser = gguser.trim();
		ggname = ggname.trim();
		gguserid = gguserid.trim();
		if(!Strings.isNullOrEmpty(upvip)){
			upvip = upvip.trim();
		}
		
		if(getUserByUserName(gguser)!=null){
			return 1;//用户已存在
		}
		if (Strings.isNullOrEmpty(gguser)|| Strings.isNullOrEmpty(ggname)
				|| Strings.isNullOrEmpty(gguserid) || Strings.isNullOrEmpty(ggpa1) || Strings.isNullOrEmpty(ggpa3)
				|| Strings.isNullOrEmpty(ggbank) || Strings.isNullOrEmpty(ggcard) || Strings.isNullOrEmpty(ggcall)
				|| Strings.isNullOrEmpty(ggqq)) {
			return 1;//用户已存在
		}
		if(!Strings.isNullOrEmpty(upvip)&&getUserByUserName(upvip)==null){
			return 2;//推荐人不存在
		}
		List<Gcuser> list = getUserByIdCard(gguserid);
		if(list!=null&&list.size()>0){
			return 3;// 该姓名["&request.Form("ggname")&"]及身份证号码["&Request.Form("gguserid")&"]已经被注册过，请您登录后在-[业务查询]下-[添加同名账户]！
		}
		if(lan==0&&!IDCardUtils.IDCardValidate(gguserid).equals("")){
			return 4;//身份证号码无效
		}
		if(isForbidNameOrID(ggname, gguserid)){
			return 5;//禁用账号
		}
		
		if(lan==0){
			if(Strings.isNullOrEmpty(provinceName)||provinceName.equals("0")||Strings.isNullOrEmpty(cityName)||cityName.equals("0")||Strings.isNullOrEmpty(areaName)||areaName.equals("0")){
				return 6;//所在地区不全！请重新选择！
			}
		}else if(lan==1){
			if(areaCode==86){
				return 10;//海外注册只能是非中国手机号码
			}
			
			provinceName="国外";
			cityName="其他";
			areaName="其他";
		}
		Province province = provinceDao.getProvinceByB(provinceName);
		Gcuser user = new Gcuser();
		user.setUsername(gguser);
		user.setPassword(MD5Security.md5_16(ggpa1).toLowerCase());
		user.setPassword3(ggpa3);
		user.setName(ggname);
		user.setBank(ggbank);
		user.setCard(ggcard);
		user.setCall(ggcall);
		user.setQq(ggqq);
		user.setUp(upvip);
		user.setUserid(gguserid);
		user.setAddsheng(provinceName);
		user.setAddshi(cityName);
		user.setAddqu(areaName);
		user.setCxt(5);//信用初始为5
		user.setRegtime(new Date());
		if(lan!=0){
			user.setGwuid(1);
		}
		
		if(province!=null){
			user.setDqu(Integer.valueOf(province.getAreaNum()));
			user.setAdd9dqu(province.getAreaName());
		}

		if(areaCode==0||!interRegionCodeDao.isHasByRegioncode(areaCode)){
			return 9;//国际区域码不存在！请重新选择！
		}
		
		UserProperty userproperty = new UserProperty();
		userproperty.setRegion_code(areaCode);
		userproperty.setUsername(gguser);
		//增加玩家区域码
		userPropertyDao.insertUserProperty(userproperty);
		
		
		
		
		if(!gcuserDao.addUser(user)){
			return 7;//注册失败
		}
		//也不知道这是什么日志  反正先添加进去再说
		Txifok txifok = new Txifok();
		txifok.setUsername(gguser);
		txifok.setUp(upvip);
		txifok.setPassword3(ggpa3);
		txifok.setName(ggname);
		txifok.setCall(ggcall);
		txifokDao.add(txifok);
		
		
		
		
		return 0;
	}
	
	/**
	 * 注册同名账号
	 * @param newUserName
	 * @param oldUserName
	 */
	public void regTheSameUser(String newUserName,String oldUserName){
		newUserName = newUserName.trim();
		if(gcuserDao.getUser(newUserName)!=null){
			throw new ServiceException(1, "此用户名已有人使用！请更换！");
		}
		if(Strings.isNullOrEmpty(newUserName)){
			throw new ServiceException(1, "此用户名已有人使用！请更换！");
		}
		Gcuser oldUser = gcuserDao.getUser(oldUserName);
		
		Gcuser user = new Gcuser();
		user.setUsername(newUserName);
		user.setPassword(oldUser.getPassword());
		user.setPassword3(oldUser.getPassword3());
		user.setName(oldUser.getName());
		user.setBank(oldUser.getBank());
		user.setCard(oldUser.getCard());
		user.setCall(oldUser.getCall());
		user.setQq(oldUser.getQq());
		user.setUp(oldUserName);
		user.setUserid(oldUser.getUserid());
		user.setAddsheng(oldUser.getAddsheng());
		user.setAddshi(oldUser.getAddshi());
		user.setAddqu(oldUser.getAddqu());
		user.setRegtime(new Date());
		user.setAddqu(oldUser.getAddqu());
		user.setAdd9dqu(oldUser.getAdd9dqu());
		user.setPayok(oldUser.getPayok());
		
		gcuserDao.addUser(user);
		
		Txifok txifok = new Txifok();
		txifok.setUsername(newUserName);
		txifok.setUp(oldUserName);
		txifok.setPassword3(user.getPassword3());
		txifok.setName(user.getName());
		txifok.setCall(user.getCall());
		txifokDao.add(txifok);
		
		
		UserPropertyDao userPropertyDao=ServiceCacheFactory.getServiceCache().getService(UserPropertyDao.class);
		UserProperty userporperty = userPropertyDao.getPorpertyByName(oldUserName);
		UserProperty newuserporperty=new UserProperty();
		newuserporperty.setRegion_code(userporperty.getRegion_code());
		newuserporperty.setUsername(newUserName);
		if(userPropertyDao.isHasUserpropertyByName(newUserName)){
			throw new ServiceException(1, "此用户名已有人使用！请更换！");
		}
		userPropertyDao.insertUserProperty(newuserporperty);
		
		
	}
	
	/**
	 * 重置玩家密码
	 * @param userName 操作人
	 * @param name	   用户
	 * @param newPassWord1	重置后的密码
	 * @param newPassWord2	重置后的密码
	 * @param ip
	 * @return
	 */
	public String resetUserPass(String userName, String newPassWord1, String newPassWord2, String smsCode, String ip){
		Gcuser guser = gcuserDao.getUser(userName);
		if(guser==null){
			throw new ServiceException(1, "用户不存在!");
		}
		if(!smsCode.equals(guser.getVipsq())){
			throw new ServiceException(2, "验证码有误!");
		}
		if(Strings.isNullOrEmpty(newPassWord1) || Strings.isNullOrEmpty(newPassWord2)){
			throw new ServiceException(3, "有值为空!");
		}
		boolean result =  gcuserDao.resetUserPass(guser.getName(), guser.getUserid(), MD5Security.md5_16(newPassWord1));
		if(result){
			addUserDateIpLog(userName, "重置密码", ip);
		}
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
		return "success";
	}
	
	/**
	 * 更新用户信息
	 * @param userName
	 * @param idCard
	 * @param password
	 * @param password3
	 * @param ganew
	 * @param qq
	 * @param call
	 * @return
	 */
	public boolean updateUser(String userName,String name, String idCard, String password, String password3, int ganew, String qq,String  call,String ip){
		boolean result =  gcuserDao.updateUser(name, idCard, password, password3, ganew, qq, call);
		if(result){
			addUserDateIpLog(userName, "更新资料", ip);
		}
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
		return result;
	}
	
	
	/**
	 * 更新用户信息
	 * @param userName
	 * @param idCard
	 * @param password
	 * @param password3
	 * @param ganew
	 * @param qq
	 * @param call
	 * @return
	 */
	public boolean updateUser(String userName,String name, String idCard, String password,  String card, String bank,String  addsheng,String addshi,String addqu,String ip, int areaCode){
		boolean result =  gcuserDao.updateUser(name, idCard, password, card, bank, addsheng, addshi, addqu);
		if(result){
			addUserDateIpLog(userName, "更新资料", ip);
		}
		/*if(areaCode!=0&&interRegionCodeDao.isHasByRegioncode(areaCode)){
			userPropertyDao.updateUserAreaCodeByName(userName,areaCode);
		}*/
		return result;
	}
	
	
	public boolean updateUser(String userName,String jdName,String jcUserId){
		return gcuserDao.updateUser(userName, jdName, jcUserId);
	}
	/**
	 * 根据用户名获取用户信息
	 * @param userName
	 * @return
	 */
	public Gcuser getUserByUserName(String userName){
		return gcuserDao.getUser(userName);
	}
	
	/**
	 * 根据真实名称及身份证号码获取用户信息
	 * @param name
	 * @param idNum
	 * @return
	 */
	public List<Gcuser> getUserByIdCard(String idNum){
		return gcuserDao.getUserByIdCard(idNum);
	}
	/**
	 * 是否禁用账号
	 * @param name
	 * @param idNum
	 * @return
	 */
	public boolean isForbidNameOrID(String name,String idNum){
		if(tduserDao.get(name, idNum)!=null){
			return true;
		}
		return false;
	}
	/**
	 * 添加插入日志
	 * @param userName
	 * @param desc
	 * @param ip
	 * @return
	 */
	public boolean addUserDateIpLog(String userName,String desc,String ip){
		return dateipDao.addDateIpLog(userName, desc, ip);
	}
	
	/**
	 * 获取同名账户
	 * @param name
	 * @param idCard
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcuser> getTheSameNameUserPage(String name,String idCard,int pageIndex,int pageSize){
		return gcuserDao.getUserPage(name, idCard, pageIndex, pageSize);
	}
	/**
	 * 获取同名账户
	 * @param name
	 * @param idCard
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcuser> getTheSameNameUserPageByCondition(String userName,String name,String idCard,int pageIndex,int pageSize){
		return gcuserDao.getUserPageByCondition(userName,name, idCard, pageIndex, pageSize);
	}
	/**
	 * 改变yb
	 * @param username
	 * @param changeNum
	 * @param desc
	 * @param newzBz
	 * @param kjqi
	 * @param ration
	 * @param originType 一币产出或者消耗途径
	 * @return
	 */
	public boolean changeYb(String username,int changeNum,String desc,int newzBz,Integer kjqi,double ration, int originType){
		boolean result = false;
		if(changeNum<0){
			result = gcuserDao.reduceYb(username, changeNum*-1);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(username);
				Datepay datePay = new Datepay();
				datePay.setUsername(username);
				datePay.setJc(changeNum*-1);
				datePay.setPay(gcuser.getPay());
				datePay.setJydb(gcuser.getJydb());
				datePay.setRegid(desc);
				datePay.setNewbz(newzBz);
				if(kjqi!=null){
					datePay.setKjqi(kjqi);
				}
				datePay.setRation(ration);
				datePay.setAbdate(new Date());
				datePay.setOrigintype(originType);
				logService.addDatePay(datePay);
			}
			return result;
		}else if(changeNum>0){
			result = gcuserDao.addYb(username, changeNum);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(username);
				Datepay datePay = new Datepay();
				datePay.setUsername(gcuser.getUsername());
				datePay.setSyjz(changeNum);
				datePay.setPay(gcuser.getPay());
				datePay.setJydb(gcuser.getJydb());
				datePay.setRegid(desc);
				datePay.setNewbz(newzBz);
				datePay.setAbdate(new Date());
				datePay.setRation(ration);
				datePay.setOrigintype(originType);
				logService.addDatePay(datePay);
			}
			return result;
		}
		return true;
	}
	
	public boolean changeYbNotAddVipPay(String username,int changeNum,String desc,int newzBz,Integer kjqi,double ration, int originType){
		boolean result = false;
		if(changeNum<0){
			result = gcuserDao.reduceYbNotReduceVipPay(username, changeNum*-1);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(username);
				Datepay datePay = new Datepay();
				datePay.setUsername(username);
				datePay.setJc(changeNum*-1);
				datePay.setPay(gcuser.getPay());
				datePay.setJydb(gcuser.getJydb());
				datePay.setRegid(desc);
				datePay.setNewbz(newzBz);
				if(kjqi!=null){
					datePay.setKjqi(kjqi);
				}
				datePay.setRation(ration);
				datePay.setAbdate(new Date());
				datePay.setOrigintype(originType);
				logService.addDatePay(datePay);
			}
			return result;
		}else if(changeNum>0){
			result = gcuserDao.addYbNotAddVipPay(username, changeNum);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(username);
				Datepay datePay = new Datepay();
				datePay.setUsername(gcuser.getUsername());
				datePay.setSyjz(changeNum);
				datePay.setPay(gcuser.getPay());
				datePay.setJydb(gcuser.getJydb());
				datePay.setRegid(desc);
				datePay.setNewbz(newzBz);
				datePay.setAbdate(new Date());
				datePay.setRation(ration);
				datePay.setOrigintype(originType);
				logService.addDatePay(datePay);
			}
			return result;
		}
		return true;
	}
	/**
	 * 修改购物卷
	 * @param username
	 * @param changeNum
	 * @param changeType
	 * @param ration
	 * @param fromUser
	 * @param param
	 * @param orderId 订单id
	 * @return
	 */
	public boolean changeScores(String username,int changeNum,int changeType,double ration,String fromUser,String param,String orderId){
		if(changeNum>0){
			boolean result = gcuserDao.addScore(username, changeNum);
			if(result){
				UserScoresLog t = new UserScoresLog();
				t.setChangeNum(changeNum);
				t.setChangeType(changeType);
				t.setCreatedTime(new Date());
				Gcuser gcuser = gcuserDao.getUser(username);
				t.setNowNum(gcuser.getScores());
				t.setUserName(username);
				t.setRation(ration);
				t.setFromUser(fromUser);
				t.setParam(param);
				t.setOrderId(orderId);
				userScoresLogDao.add(t);
			}
			return result;
		}else{
			boolean result = gcuserDao.reduceScore(username, Math.abs(changeNum));
			if(result){
				UserScoresLog t = new UserScoresLog();
				t.setChangeNum(changeNum);
				t.setChangeType(changeType);
				t.setCreatedTime(new Date());
				Gcuser gcuser = gcuserDao.getUser(username);
				t.setNowNum(gcuser.getScores());
				t.setUserName(username);
				t.setRation(ration);
				t.setFromUser(fromUser);
				t.setParam(param);
				t.setOrderId(orderId);
				userScoresLogDao.add(t);
			}
			return result;
		}
	}
	
	/**
	 * 非安全的方法 可以为负数
	 * @param username
	 * @param changeNum
	 * @param desc
	 * @param newzBz
	 * @param kjqi
	 * @return
	 */
	public boolean changeYbCanFu(String username,int changeNum,String desc,int newzBz,Integer kjqi, String oparetor){
		boolean result = false;
		if(changeNum<0){
			result = gcuserDao.reduceYbCanFu(username, changeNum*-1);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(username);
				Datepay datePay = new Datepay();
				datePay.setUsername(username);
				datePay.setJc(changeNum*-1);
				datePay.setPay(gcuser.getPay());
				datePay.setJydb(gcuser.getJydb());
				datePay.setRegid("消费一币("+desc+")");
				datePay.setNewbz(newzBz);
				if(kjqi!=null){
					datePay.setKjqi(kjqi);
				}
				datePay.setAbdate(new Date());
				datePay.setOrigintype(YbChangeType.SYSTEM_CONSUMEYB);
				logService.addDatePay(datePay);
			}
			return result;
		}else if(changeNum>0){
			result = gcuserDao.addYb(username, changeNum);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(username);
				Datepay datePay = new Datepay();
				datePay.setUsername(gcuser.getUsername());
				datePay.setSyjz(changeNum);
				datePay.setPay(gcuser.getPay());
				datePay.setJydb(gcuser.getJydb());
				datePay.setRegid(desc);
				datePay.setNewbz(newzBz);
				datePay.setAbdate(new Date());
				datePay.setOrigintype(YbChangeType.SYSTEM_CONSUMEYB_ADD);
				logService.addDatePay(datePay);
			}
			return result;
		}
		return true;
	}
	
	public ZuoMingxi getZuoMingxi(String tjuser,String down){
		return zuoMingxiDao.get(tjuser, down);
	}
	public ZuoMingxi getZuoMingxi(String down){
		return zuoMingxiDao.get(down);
	}
	public YouMingxi getYouMingxi(String tjuser,String down){
		return youMingXiDao.get(tjuser, down);
	}
	
	public YouMingxi getYouMingxi(String down){
		return youMingXiDao.get(down);
	}
	
	public Sgxt getSgxt(String username){
		return sgxtDao.get(username);
	}
	
	public Sgxt getSgxtByAorBuid(String uid){
		return sgxtDao.getByAOrBuid(uid);
	}
	
	public int getSumSjb(String name,String idNum){
		return gcuserDao.getSumSjb(name, idNum);
	}
	
	/**
	 * 绑定用户
	 * @param userName  操作者用户id
	 * @param up        接点用户id
	 * @param bduser    被绑定用户id
	 * @param cjpay     绑定的业务类型
	 * @param pa1j      登录密码
	 * @param pa2j      二级密码
	 * @param idCardNum 验证码
	 * @param status    0 确认绑定   1提交绑定
	 * @return
	 */
    @Transactional
	public synchronized String bdReg(String userName,String up,String bduser,int cjpay,String pa1j,String pa2j,String idCardNum,int status){
    	if(Strings.isNullOrEmpty(up)||Strings.isNullOrEmpty(bduser)){
    		return null;
    	}
    	up = up.trim();
    	bduser = bduser.trim();
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		Fcxt fcxt = managerService.getFcxtById(2);
		if(fcxt!=null){
			Date date = fcxt.getJsdate();
			if(date!=null&&new Date().getTime()>date.getTime()){
				throw new ServiceException(1,"结算期间暂停开户，明天开放！");
//				super.setErroCodeNum(1);//alert('结算期间暂停开户，明天开放！');;history.go(-1);
//				return SUCCESS;
			}
			if(!Strings.isNullOrEmpty(fcxt.getCz05())&&fcxt.getCz05().equals("1")){
				throw new ServiceException(100,"报单功能暂时关闭！");
			}
		}
		if(cjpay<1000){
			throw new ServiceException(2,"选择报单金额错误，无法完成开户，请充值后再试！");
//			super.setErroCodeNum(2);//alert('选择报单金额错误，无法完成开户，请充值后再试！');history.go(-1);
//			return SUCCESS;
		}
		
		Gcuser operatorUser = gcuserDao.getUser(userName);
		
		if(!MD5Security.md5_16(pa1j).equals(operatorUser.getPassword())){
			throw new ServiceException(3,"登录密码错误，请检查输入是否正确！");
//			super.setErroCodeNum(3);//alert('登录密码错误，请检查输入是否正确！');history.go(-1);
//			return SUCCESS;
		}
		if(!pa2j.equals(operatorUser.getPassword3())){
			throw new ServiceException(4,"二级密码错误，请检查输入是否正确！");
//			super.setErroCodeNum(4);//alert('二级密码错误，请检查输入是否正确！');history.go(-1);
//			return SUCCESS;
		}
		if(operatorUser.getSjb()==0){
			throw new ServiceException(5,"此功能，需联系推荐人选择适合的位置升级！！");
//			super.setErroCodeNum(5);//alert('此功能，需联系推荐人选择适合的位置升级！！');history.go(-1);
//			return SUCCESS;
		}
		if(cjpay>9000 && operatorUser.getSybdb()<cjpay){
			throw new ServiceException(6,"报单币余额小于开户金额"+cjpay+"，无法完成开户，请充值后再试！");
//			super.setErroCodeNum(6);//alert('报单币余额小于开户金额"&cjpay&"，无法完成开户，请充值后再试！');history.go(-1);
//			return SUCCESS;			
		}
		
		if(cjpay<9000 && operatorUser.getPay()<cjpay){
			throw new ServiceException(7,"一币余额小于开户金额"+cjpay+"，无法完成开户，请充值后再试！");
//			super.setErroCodeNum(7);//alert('一币余额小于开户金额"&cjpay&"，无法完成开户，请充值后再试！');history.go(-1);
//			return SUCCESS;			
		}
		
		int callLenght = operatorUser.getCall().length();
		String callLeft = operatorUser.getCall().substring(0, 3);
		String CallRight = operatorUser.getCall().substring(callLenght-3, callLenght);
		String call = callLeft+"*****"+CallRight;
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
        Gcuser bdGUser = gcuserDao.getUser(bduser);
		Fcxt fcxt2 = managerService.getFcxtById(10);
        if(bdGUser==null){
        	throw new ServiceException(8,"要开户的用户名不存在，请检查输入是否正确！");
//			super.setErroCodeNum(8);//alert('要开户的用户名不存在，请检查输入是否正确！');history.go(-1);
//			return SUCCESS;		
        }else if(bdGUser.getRegtime().getTime()<fcxt2.getJsdate().getTime()){
        	throw new ServiceException(9,"系统调试中，请重新注册新的用户名进行操作或联系您的推荐人！");
//			super.setErroCodeNum(9);//alert('系统调试中，请重新注册新的用户名进行操作或联系您的推荐人！');history.go(-1);
//			return SUCCESS;		        	
        }
		
        
        if(cjpay>49980){
        	int sumSjb = userService.getSumSjb(bdGUser.getName(), bdGUser.getUserid());
        	if(sumSjb>298){
        		throw new ServiceException(10,"该姓名持有5万的账户已达到3个，不能再开设5万的账户！");
//    			super.setErroCodeNum(10);//alert('该姓名持有5万的账户已达到3个，不能再开设5万的账户！');history.go(-1);
//    			return SUCCESS;		 
        	}
        }
        
        if(userService.getZuoMingxi(bduser)!=null||userService.getYouMingxi(bduser)!=null){
        	throw new ServiceException(11,"开户人已安置好，不能重复，请检查输入是否正确！");
//			super.setErroCodeNum(11);//alert('开户人已安置好，不能重复，请检查输入是否正确！');history.go(-1);
//			return SUCCESS;		
        }
		

        if(userService.getSgxtByAorBuid(bduser)!=null){
        	throw new ServiceException(12,"开户人已安置好，不能重复，请检查输入是否正确！");
//			super.setErroCodeNum(12);//alert('开户人已安置好，不能重复，请检查输入是否正确！');history.go(-1);
//			return SUCCESS;	
        }else if(!bduser.equals(operatorUser.getUsername())&&!bdGUser.getUp().equals(operatorUser.getUsername())){
        	throw new ServiceException(13,"只能给自己的直接推荐的人开户！");
//			super.setErroCodeNum(13);//alert('只能给自己的直接推荐的人开户！');history.go(-1);
//			return SUCCESS;	
        }
//        Gcuser upUser =  gcuserDao.getUser(up);
//        if(!up.equals(operatorUser.getUsername())&&!upUser.getUp().equals(operatorUser.getUsername())){
//        	throw new ServiceException(13,"只能给自己的直接推荐的人开户！");
//        }
        
		Sgxt tuser = userService.getSgxt(up);
		if(tuser==null){
			throw new ServiceException(14,"接点人不存在，没法放置，请检查是否正确！");
//			super.setErroCodeNum(14);//alert('接点人不存在，没法放置，请检查是否正确！');history.go(-1);
//			return SUCCESS;
		}else{
			
			if(!Strings.isNullOrEmpty(tuser.getAuid())&&!Strings.isNullOrEmpty(tuser.getBuid())){
				throw new ServiceException(15,"接点人位置已被占用，请重新选择！");
//				super.setErroCodeNum(15);//alert('接点人位置已被占用，请重新选择！');history.go(-1);
//				return SUCCESS;
			}
		}
		if(!userName.equals(up)){
			if(zuoMingxiDao.get(userName, up)==null&&youMingXiDao.get(userName, up)==null){
				throw new ServiceException(17,"接点人必须在自己的团队下，请重新选择！");
			}
		}
		
		if(status!=0){//确认操作
			int zjjb=0;
			int sjb=0;
			int fd=0;
			int cfd=0;
			int scores = 0;
			String msg = cjpay+"元";
			if(cjpay==500){
				   zjjb=200;
						   sjb=1;
						   fd=2000;
						   cfd=20;
						   msg = msg+"(伍佰圆整)";	   
			}else if(cjpay==1000){
				   zjjb=450;
						   sjb=2;
						   fd=4000;
						   cfd=40		;
						   msg = msg+"(壹仟圆整)";	
			}else if(cjpay==2000){
				   zjjb=960;
						   sjb=4;
						   fd=8000;
						   cfd=60	;	
						   msg = msg+"(贰仟圆整)";
			}else if(cjpay==5000){
				   zjjb=2500;
						   sjb=10;
						   fd=20000;
						   cfd=80;		
						   msg = msg+"(伍仟圆整)";
			}else if(cjpay==10000){
				   zjjb=5000;
						   sjb=20;
						   fd=40000;
						   cfd=100	;
						   msg = msg+"(壹万圆整)";
						   scores = 300;
			}else if(cjpay==20000){
				   zjjb=11000;
						   sjb=40;
						   fd=80000;
						   cfd=150	;
						   msg = msg+"(贰万圆整)";
						   scores = 600;
			}else if(cjpay==50000){
				   zjjb=30000;
						   sjb=100;
						   fd=200000;
						   cfd=200	;	
						   msg = msg+"(伍万圆整)";
						   scores = 1500;
			}
			

			if(cjpay>=9000){//使用报单币开户
				if(!updateSybdb(userName, -cjpay, "给"+bduser+"开户"+cjpay, 0)){
					throw new ServiceException(6,"报单币余额小于开户金额"+cjpay+"，无法完成开户，请充值后再试！");
				}
			}else{
				if(idCardNum==null||!idCardNum.equals(operatorUser.getVipsq())){
					throw new ServiceException(16,"验证码错误，请检查输入是否正确！");
//						super.setErroCodeNum(16);//alert('验证码错误，请检查输入是否正确！');history.go(-1);
//						return SUCCESS;
				}
				gcuserDao.updateSmsCode(operatorUser.getUsername(), Global.INIT_SMS_CODE);
				if(!this.changeYb(userName, -cjpay, "给"+bduser+"开户"+cjpay, 0,null,0, YbChangeType.KAIHU_REDUCE)){
					throw new ServiceException(7,"一币余额小于开户金额"+cjpay+"，无法完成开户，请充值后再试！");
				}
			}
			//修改被绑定用户金币及单数
			gcuserDao.updateSjb(bduser, sjb);
			updateJB(bduser,zjjb,"消费"+cjpay+"送"+zjjb+"金币-"+userName+"");
//			if(this.isOpenScores()){
				if(scores>0){
					this.changeScores(bduser, scores,ScoresChangeType.SYSTEM_GIVE,0,"0","","");
				}
//			}
			if(Strings.isNullOrEmpty(tuser.getAuid())){
				if(!sgxtDao.updateAuid(tuser.getUsername(), bduser)){
					System.out.println("a接点人位置已被占用");
					throw new ServiceException(15,"接点人位置已被占用，请重新选择！");
				}
			}else{
				if(!sgxtDao.updateBuid(tuser.getUsername(), bduser)){
					System.out.println("b接点人位置已被占用");
					throw new ServiceException(15,"接点人位置已被占用，请重新选择！");
				}
			}
			
//			int jszfh=0;
			int jsnew = 0;
//			double fhbl = 0;
			if(sjb>10){
//			   jszfh=sjb*250;
			   jsnew=3;
//			   fhbl=0.005;
			}else{
//			   jszfh=0;
			   jsnew=0;
//			   fhbl=0;
			}
			
			Sgxt sgxt = new Sgxt();
			sgxt.setUsername(bduser);
			sgxt.setSjb(sjb);
			sgxt.setXxnew(jsnew);
			sgxt.setFdpay(fd);
			sgxt.setCfd(cfd);
			sgxt.setBddate(new Date());
			sgxtDao.add(sgxt);
			
			//操作人加10%的推荐钱
			int upPay = (int)(0.1*cjpay);
			gcuserDao.addOtherYb(userName,upPay);
			Gcuser upuser = gcuserDao.getUser(userName);
			Datepay datePay = new Datepay();
			datePay.setUsername(userName);
			datePay.setRegid("用户一"+bduser+"开户"+cjpay+"");
			datePay.setSyjz(upPay);
			datePay.setPay(upuser.getPay());
			datePay.setJydb(upuser.getJydb());
			datePay.setNewbz(9);
			datePay.setAbdate(new Date());
			datePay.setOrigintype(YbChangeType.KAIHU_ADD);
			logService.addDatePay(datePay);
			
			
			int zysjb = sgxt.getSjb();
			
			List<ZuoMingxi> zTList = Lists.newArrayList();
			List<YouMingxi> yTList = Lists.newArrayList();
			cupUser(bduser,bduser,1,zysjb,zTList,yTList);//建立团队关系
			if(zTList.size()>0){
				zuoMingxiDao.batchInsert(zTList);
			}
			if(yTList.size()>0){
				youMingXiDao.batchInsert(yTList);
			}
			
			
			List<ZuoMingxi> zList = zuoMingxiDao.getDownList(bduser);
			if(zList!=null&&!zList.isEmpty()){
				for(ZuoMingxi zuoMingxi:zList){
					int sjtjzb = zuoMingxiDao.getSumSjb(zuoMingxi.getTjuser(), zuoMingxi.getCount());//得到明细的sjb的总和
					if(sjtjzb>0){
						if(zuoMingxi.getCount()>0&&zuoMingxi.getCount()<=16){
							sgxtDao.updateZOrYfiled(zuoMingxi.getTjuser(), "z"+zuoMingxi.getCount(), sjtjzb);
						}
					}
				}
			}
			
			List<YouMingxi> yList = youMingXiDao.getDownList(bduser);
			if(yList!=null&&!yList.isEmpty()){
				for(YouMingxi youMingxi:yList){
					int sjtjzb = youMingXiDao.getSumSjb(youMingxi.getTjuser(), youMingxi.getCount());
					if(sjtjzb>0){
						if(youMingxi.getCount()>0&&youMingxi.getCount()<=16){
							sgxtDao.updateZOrYfiled(youMingxi.getTjuser(), "y"+youMingxi.getCount(), sjtjzb);
						}
					}
				}
			}
			List<Bdbdate> logList = Lists.newArrayList();
			CalculateQ(bduser,sjb,bduser,logList);
			bdbDateDao.batchInsert(logList);
			
			//发送通知短信
			this.sendBdSmsMsg(bduser, msg);
		}
		return call;
	}
	
    @Transactional
    public void cancleBd(String username){
    	Gcuser gcuser = gcuserDao.getUser(username);
    	if(gcuser==null){
    		throw new ServiceException(1,"用户不存在");
    	}
    	
    	int sjb = gcuser.getSjb();
		int scores = 0;
		int zjjb = 0;
    	if(sjb==20){
    		scores = 300;
    		zjjb=5000;
    	}else if(sjb==40){
    		scores = 600;
    		zjjb=11000;
    	}else if(sjb==100){
    		scores = 1500;
    		zjjb=30000;
    	}else{
    		throw new ServiceException(4,"报单数不支持退户，只支持 10000，20000，50000");
    	}
    	//清除用户报单所得的金币  如果金币被使用了  不支持退户
    	if(!this.updateJB(username, -zjjb, "退户减金币")){
    		throw new ServiceException(5,"金币不足，不允许退户");
    	}
    	//减购物券  如果购物券被用了 不支持退户
    	if(!this.changeScores(username, -scores,ScoresChangeType.SYSTEM_REDUCE,0,"0","","")){
    		throw new ServiceException(6,"购物券不足，不允许退户");
    	}
    	//减推荐奖励  如果推荐奖励减不成功  不支持退户
    	if(!this.changeYb(gcuser.getUp(), -(int)(sjb*500*0.1), username+"退户减推荐奖", 0,null,0, YbChangeType.SYSTEM_BACK_PRICE)){
    		throw new ServiceException(7,"推荐奖励没有减成功，不允许退户");
    	}
        //减上面左总和右总
    	//上层减结算区的左和右  有的层封顶了  就不需要减
    	List<ZuoMingxi> zupList = zuoMingxiDao.getDownList(username);
    	for(ZuoMingxi z:zupList){
    		sgxtDao.updateZaq(z.getTjuser(), -sjb);
    		int aq = getAddAqOrBqFromBdbdate(z.getTjuser(),username,sjb);
    		if(aq>0){
    			if(!sgxtDao.updateAq(z.getTjuser(), -aq)){
    				throw new ServiceException(9,"有玩家已经结算！无法退户,user="+z.getTjuser());
    			}
    		}
    		 Sgxt sgxtBd = sgxtDao.get(z.getTjuser());
			 Bdbdate bdbdate = new Bdbdate();
			 bdbdate.setZuser(sgxtBd.getUsername());
			 bdbdate.setZaq(sgxtBd.getZaq());
			 bdbdate.setZbq(sgxtBd.getZbq());
			 bdbdate.setAq(sgxtBd.getAq());
			 bdbdate.setBq(sgxtBd.getBq());
			 bdbdate.setBz(username+"退户，减左总数量:"+sjb+",减左结算区数量:"+aq);
			 bdbDateDao.add(bdbdate);
			 //恢复前16层统计数据
			 int sjtjzb = zuoMingxiDao.getSumSjb(z.getTjuser(), z.getCount());//得到明细的sjb的总和
			 if(sjtjzb>0){
				if(z.getCount()>0&&z.getCount()<=16){
						sgxtDao.updateZOrYfiled(z.getTjuser(), "z"+z.getCount(), sjtjzb-sjb);
					}
			}
    	}
    	
    	List<YouMingxi> yupList = youMingXiDao.getDownList(username);
    	for(YouMingxi y:yupList){
    		sgxtDao.updateZbq(y.getTjuser(), -sjb);
    		int bq = getAddAqOrBqFromBdbdate(y.getTjuser(),username,sjb);
    		if(bq>0){
    			if(!sgxtDao.updateBq(y.getTjuser(), -bq)){
    				throw new ServiceException(9,"有玩家已经结算！无法退户"+y.getTjuser());
    			}
    		}
   		     Sgxt sgxtBd = sgxtDao.get(y.getTjuser());
			 Bdbdate bdbdate = new Bdbdate();
			 bdbdate.setZuser(sgxtBd.getUsername());
			 bdbdate.setZaq(sgxtBd.getZaq());
			 bdbdate.setZbq(sgxtBd.getZbq());
			 bdbdate.setAq(sgxtBd.getAq());
			 bdbdate.setBq(sgxtBd.getBq());
			 bdbdate.setBz(username+"退户，减右总数量:"+sjb+",减右结算区数量:"+bq);
			 bdbDateDao.add(bdbdate);
			//恢复前16层统计数据
			 int sjtjzb = youMingXiDao.getSumSjb(y.getTjuser(), y.getCount());
			 if(sjtjzb>0){
				if(y.getCount()>0&&y.getCount()<=16){
						sgxtDao.updateZOrYfiled(y.getTjuser(), "y"+y.getCount(), sjtjzb-sjb);
				}
			 }
    	}
    	//清除点位表中所占的点位 如果下层已挂载了用户  不支持退户
    	//清理开户表sgxt中的记录
    	if(!sgxtDao.resetUserSgxtInfo(username)){
    		throw new ServiceException(8,"下面已挂载了用户，不能退户");
    	}
    	//清理zuo_mingxi和 you_mingxi中down为用户名的记录
    	zuoMingxiDao.deleteAllDown(username);
    	youMingXiDao.deleteAllDown(username);
    	//设置sjb为0
    	gcuserDao.updateSjb(username, 0);
    }
	/**
	 * 获取报单的时候加的结算区数量
	 * @param zuser
	 * @param bdbuser
	 * @return
	 */
    private int getAddAqOrBqFromBdbdate(String zuser,String bdbuser,int sjb){
    	Bdbdate bdbdate = bdbDateDao.getBdbdate(zuser, bdbuser);
    	int result = 0;
    	if(bdbdate!=null){
    		String[] array = bdbdate.getBz().split("-");
    		if(array.length==2){
    			try {
					result = Integer.valueOf(array[1]);
				} catch (Exception e) {
					LogSystem.info(zuser+"-with-"+bdbuser+"分析结果"+array[1]);
				}
    			if(result>0){
    				if(bdbdate.getBz().indexOf("层封顶超出")!=-1){
    					result = sjb - result;
    				}
    			}
    		}
    	}
    	return result;
    }
    
	public void CalculateQ(String userName,int sjb,String bduser,List<Bdbdate> logList){
		Sgxt sgxtBd = sgxtDao.getByAOrBuid(userName);
		if(sgxtBd==null){
			return;
		}
		if(sgxtBd.getAuid()!=null&&sgxtBd.getAuid().equals(userName)){
			sgxtDao.updateZaq(sgxtBd.getUsername(), sjb);
			ZuoMingxi zuo = zuoMingxiDao.get(sgxtBd.getUsername(), bduser);
			int dqzuo = zuoMingxiDao.getSumSjb(sgxtBd.getUsername(), zuo.getCount())-sjb;
			int zyzj = 0;
			if(dqzuo<sgxtBd.getCfd()){
				 zyzj = sgxtBd.getCfd()-dqzuo;
				 int addAmount = sjb;
				 if(addAmount>zyzj){
					 addAmount = zyzj;
				 }
				 sgxtDao.updateAq(sgxtBd.getUsername(), addAmount);
				 
				 sgxtBd = sgxtDao.get(sgxtBd.getUsername());
				 Bdbdate bdbdate = new Bdbdate();
				 bdbdate.setZuser(sgxtBd.getUsername());
				 bdbdate.setZaq(sgxtBd.getZaq());
				 bdbdate.setZbq(sgxtBd.getZbq());
				 bdbdate.setAq(sgxtBd.getAq());
				 bdbdate.setBq(sgxtBd.getBq());
				if(sjb>zyzj){
					 bdbdate.setBz("新单"+bduser+"("+sjb+")在第"+zuo.getCount()+"层(左边)层封顶超出-"+(sjb-zyzj));
				}else{
					 bdbdate.setBz("新单"+bduser+"("+sjb+")在第"+zuo.getCount()+"层(左边)增加可结算-"+sjb);
				}
//				bdbDateDao.add(bdbdate);
				logList.add(bdbdate);
			}else{
				 sgxtBd = sgxtDao.get(sgxtBd.getUsername());
				 Bdbdate bdbdate = new Bdbdate();
				 bdbdate.setZuser(sgxtBd.getUsername());
				 bdbdate.setZaq(sgxtBd.getZaq());
				 bdbdate.setZbq(sgxtBd.getZbq());
				 bdbdate.setAq(sgxtBd.getAq());
				 bdbdate.setBq(sgxtBd.getBq());
				 bdbdate.setBz("新单"+bduser+"("+sjb+")在第"+zuo.getCount()+"层(左边已有"+dqzuo+")已层封顶-无效单");
//				 bdbDateDao.add(bdbdate);
				 logList.add(bdbdate);
			}
			CalculateQ(sgxtBd.getUsername(),sjb,bduser,logList);
		}else if(sgxtBd.getBuid()!=null&&sgxtBd.getBuid().equals(userName)){
			sgxtDao.updateZbq(sgxtBd.getUsername(), sjb);
			YouMingxi you = youMingXiDao.get(sgxtBd.getUsername(), bduser);
			int dqyou = youMingXiDao.getSumSjb(sgxtBd.getUsername(), you.getCount())-sjb;
			if(dqyou<sgxtBd.getCfd()){
				int yyzj=sgxtBd.getCfd()-dqyou;
				int addAmount = sjb;
				if(sjb>yyzj){
					addAmount = yyzj;
				}
				sgxtDao.updateBq(sgxtBd.getUsername(), addAmount);
				
				 sgxtBd = sgxtDao.get(sgxtBd.getUsername());
				 Bdbdate bdbdate = new Bdbdate();
				 bdbdate.setZuser(sgxtBd.getUsername());
				 bdbdate.setZaq(sgxtBd.getZaq());
				 bdbdate.setZbq(sgxtBd.getZbq());
				 bdbdate.setAq(sgxtBd.getAq());
				 bdbdate.setBq(sgxtBd.getBq());
				 if(sjb>yyzj){
					 bdbdate.setBz("新单"+bduser+"("+sjb+")在第"+you.getCount()+"层(右边)层封顶超出-"+(sjb-yyzj));
				 }else{
					 bdbdate.setBz("新单"+bduser+"("+sjb+")在第"+you.getCount()+"层(右边)增加可结算-"+sjb);
				 }
//				 bdbDateDao.add(bdbdate);
				 logList.add(bdbdate);
			}else{
				 sgxtBd = sgxtDao.get(sgxtBd.getUsername());
				 Bdbdate bdbdate = new Bdbdate();
				 bdbdate.setZuser(sgxtBd.getUsername());
				 bdbdate.setZaq(sgxtBd.getZaq());
				 bdbdate.setZbq(sgxtBd.getZbq());
				 bdbdate.setAq(sgxtBd.getAq());
				 bdbdate.setBq(sgxtBd.getBq());
				 bdbdate.setBz("新单"+bduser+"("+sjb+")在第"+you.getCount()+"层(右边已有"+dqyou+")已层封顶-无效单");
//				 bdbDateDao.add(bdbdate);
				 logList.add(bdbdate);
			}
			CalculateQ(sgxtBd.getUsername(),sjb,bduser,logList);
		}
	}
	
	private void cupUser(String userName,String constantUp,int count,int sjb,List<ZuoMingxi> zList,List<YouMingxi> yList){
		Sgxt sgxtBd = sgxtDao.getByAOrBuid(userName);
		if(sgxtBd!=null){
			if(userName.equals(sgxtBd.getAuid())){
				ZuoMingxi zuoMingxi = new ZuoMingxi();
				zuoMingxi.setTjuser(sgxtBd.getUsername());
				zuoMingxi.setSjb(sjb);
				zuoMingxi.setDown(constantUp);
				zuoMingxi.setCount(count);
				//zuoMingxiDao.add(zuoMingxi);
				zList.add(zuoMingxi);
			}else{
				YouMingxi youMingxi = new YouMingxi();
				youMingxi.setCount(count);
				youMingxi.setDown(constantUp);
				youMingxi.setTjuser(sgxtBd.getUsername());
				youMingxi.setSjb(sjb);
//				youMingXiDao.add(youMingxi);
				yList.add(youMingxi);
			}
			count = count+1;
			cupUser(sgxtBd.getUsername(),constantUp,count,sjb,zList,yList);
		}
	}
	
	/**
	 * 更新报单币
	 * @param userName
	 * @param changeNum
	 * @param desc
	 * @return
	 */
	public boolean updateSybdb(String userName,int changeNum,String desc,int originType){
		if(changeNum>=0){
			boolean result = gcuserDao.addSybdb(userName, changeNum);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(userName);
				Bdbdate bdbdate = new Bdbdate();
				bdbdate.setZuser(userName);
				bdbdate.setBz(desc);
				bdbdate.setSy(changeNum);
				bdbdate.setSybdb(gcuser.getSybdb());
				bdbdate.setLjbdb(gcuser.getLjbdb());
				bdbdate.setOrigintype(originType);
				bdbDateDao.add(bdbdate);
			}
			return result;
		}else{
			changeNum = Math.abs(changeNum);
			boolean result = gcuserDao.reduceSybdb(userName, changeNum);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(userName);
				Bdbdate bdbdate = new Bdbdate();
				bdbdate.setZuser(userName);
				bdbdate.setBz(desc);
				bdbdate.setJc(changeNum);
				bdbdate.setSybdb(gcuser.getSybdb());
				bdbdate.setLjbdb(gcuser.getLjbdb());
				bdbdate.setOrigintype(originType);
				bdbDateDao.add(bdbdate);
			}
			return result;
		}
	}
	
	
	
	/**
	 * 更新金币
	 * @param userName
	 * @param sjb
	 * @param jydb
	 * @param desc
	 * @return
	 */
	public boolean updateJB(String userName,int jydb,String desc){
		boolean result = gcuserDao.updateJB(userName, jydb);
		if(result){
			Gcuser gcuser = gcuserDao.getUser(userName);
			Datepay datePay = new Datepay();
			datePay.setUsername(userName);
			datePay.setJyjz(jydb);
			datePay.setJydb(gcuser.getJydb());
			datePay.setRegid(desc);
			datePay.setPay(gcuser.getPay());
			datePay.setNewbz(0);
			datePay.setAbdate(new Date());
			logService.addDatePay(datePay);
		}
		return result;
	}
	
	/**
	 * 获取我们所有的下家
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcuser> getMyDownUserPage(String userName,int pageIndex,int pageSize){
		return gcuserDao.getMyDownUserPage(userName, pageIndex, pageSize);
	}
	
	/**
	 * 报单币转账
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	@Transactional
	public void trasferBdb(String fromUser,String toUser,int amount,String password3){
		Gcuser from = gcuserDao.getUser(fromUser);
		if(from.getVip()==0){
			throw new ServiceException(1, "vip用户才能玩这个功能！");
		}
		
		if(!from.getPassword3().equals(password3)){
			throw new ServiceException(2, "二级密码不正确");
		}
		
		Gcuser to = gcuserDao.getUser(toUser);
		if(to==null){
			throw new ServiceException(7, "接收的用户名不存在，请检查输入是否正确！");
		}
		
		if(fromUser.equals(toUser)){
			throw new ServiceException(3, "不能转给自己！");
		}
		if(!fromUser.equals("300fhk")){
			if(zuoMingxiDao.get(fromUser, toUser)==null&&youMingXiDao.get(fromUser, toUser)==null){
				throw new ServiceException(4, "只能转给自己团队的并已进入双区的玩家！");
			}
			//自己是大vip 则可以给其下的小vip转
			if(from.getVip()==2){
				if(to.getVip()==3){//对象是其下的小vip可以转  不做处理
					
				}else if(to.getVip()==2){//对象是其下的大vip 不能转
					throw new ServiceException(12, "该玩家是大vip！您不能转给他！");
				}else if(to.getVip()==0){//对象是其下的普通用户 则判断该用户的上级vip是否为他
					String vip = this.findMyUpVipName(toUser);
					//被转者如果为普通用户 如果其上级vip不是转出者 不可以转
					if(!vip.equals(fromUser)){
						throw new ServiceException(11, "该玩家的上级vip不是您！您不能转给他！");
					}
				}else{
					throw new ServiceException(13, to.getUsername()+"不可识别的vip标示"+to.getVip());
				}
			}else if(from.getVip()==3){//自己是小vip
				if(to.getVip()==2){//对象是大vip  无论隔几层都不能转
					throw new ServiceException(12, "该玩家是大vip！您不能转给他！");
				}else if(to.getVip()==3){
					throw new ServiceException(14, "您只是小vip！不能转给您团队下的小vip！");
				}else if(to.getVip()==0){
					String vip = this.findMyUpVipName(toUser);
					//被转者如果为普通用户 如果其上级vip不是转出者 不可以转
					if(!vip.equals(fromUser)){
						throw new ServiceException(11, "该玩家的上级vip不是您！您不能转给他！");
					}
				}else{
					throw new ServiceException(13, to.getUsername()+"不可识别的vip标示"+to.getVip());
				}
			}else{
				throw new ServiceException(10, "该功能vip才能使用！");
			}
		}
		
		if(amount<=0){
			throw new ServiceException(5, "转账金额不能小于0");
		}
		
		if(from.getSybdb()<amount){
			throw new ServiceException(6, "转出用户名报单币不能大于剩余报单币 "+from.getSybdb()+" ，谢谢！");
		}
		

		
		//减被转者的报单币
		if(!this.updateSybdb(fromUser, -amount, "转给-"+toUser,0)){
			throw new ServiceException(6, "转出用户名报单币不能大于剩余报单币 "+from.getSybdb()+" ，谢谢！");
		}
		
		this.updateSybdb(toUser, amount, "收到-服务中心"+fromUser.substring(0,2)+"***",0);
		
		vipxtgcDao.updateJcBdb(fromUser, DateUtils.getDate(new Date()), amount);
		
	}
	
	/**
	 * 报单币转账
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	@Transactional
	public void trasferBdbByAdmin(String fromUser,String toUser,int amount,String oppass,String remark, String oparetor){
		
		if(!this.getConfigPassword(PasswordKey.BDB_TRANSFER).equals(oppass)){
			throw new ServiceException(6, "操作密码不正确！");
		}
		Gcuser from = gcuserDao.getUser(fromUser);
		
		if(from==null){
			throw new ServiceException(5, "转出用户不存在！");
		}
		
		if(fromUser.equals(toUser)){
			throw new ServiceException(1, "不能转给自己！");
		}
		
		if(amount<=0){
			throw new ServiceException(2, "转账金额不能小于0");
		}
		
		if(from.getSybdb()<amount){
			throw new ServiceException(3, "转出用户名报单币不能大于剩余报单币 "+from.getSybdb()+" ，谢谢！");
		}
		Gcuser to = gcuserDao.getUser(toUser);
		if(to==null){
			throw new ServiceException(4, "接收的用户名不存在，请检查输入是否正确！");
		}
		 AdminOperateLog log= new AdminOperateLog(oparetor,"", new Date(), AdminGlobal.OP_BDBZZ,"转出用户："+fromUser+"转入用户："+toUser+"数量："+amount);
		 adminOperateLogDao.addLog(log);
		
		if("转错".equals(remark)){
			if(!this.updateSybdb(fromUser, -amount, "转给-"+toUser+"备注："+remark,BDBChangeType.BDB_ZUANCUO_SYSTEM_REDUCE)){
				throw new ServiceException(3, "转出用户名报单币不能大于剩余报单币 "+from.getSybdb()+" ，谢谢！");
			}
			
			this.updateSybdb(toUser, amount, "收到-"+fromUser+"备注："+remark,BDBChangeType.BDB_ZUANCUO_SYSTEM_ADD);
		}
		if("VIP充值错误转回".equals(remark)){
			if(!this.updateSybdb(fromUser, -amount, "转给-"+toUser+"备注："+remark,BDBChangeType.BDB_ZUANCUO_SYSTEM_VIPRECHARGE_REDUCE)){
				throw new ServiceException(3, "转出用户名报单币不能大于剩余报单币 "+from.getSybdb()+" ，谢谢！");
			}
			
			this.updateSybdb(toUser, amount, "收到-"+fromUser+"备注："+remark,BDBChangeType.BDB_ZUANCUO_SYSTEM_VIPRECHARGE_ADD);
			
		}
		if("宿舍押金".equals(remark)){
			if(!this.updateSybdb(fromUser, -amount, "转给-"+toUser+"备注："+remark,BDBChangeType.BDB_ZUANCUO_SYSTEM_DEPOSIT_REDUCE)){
				throw new ServiceException(3, "转出用户名报单币不能大于剩余报单币 "+from.getSybdb()+" ，谢谢！");
			}
			
			this.updateSybdb(toUser, amount, "收到-"+fromUser+"备注："+remark,BDBChangeType.BDB_ZUANCUO_SYSTEM_DEPOSIT_ADD);
		}
		
		
		
	}
	
	/**
	 * 报单币转账
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	@Transactional
	public void addBdbByAdmin(String toUser,int amount){
		if(amount<=0){
			throw new ServiceException(2, "转账金额不能小于0");
		}
		Gcuser to = gcuserDao.getUser(toUser);
		if(to==null){
			throw new ServiceException(4, "接收的用户名不存在，请检查输入是否正确！");
		}
		this.updateSybdb(toUser, amount, "收到-系统",0);
	}
	
	@Transactional
	public void trasferYbForPresent(String fromUser,String toUser,String pa,String pa3,int amount){
		Gcuser fUser = gcuserDao.getUser(fromUser);
		Gcuser tUser = gcuserDao.getUser(toUser);
		
		if(fUser==null){
			throw new ServiceException(5, "转出用户不存在！");
		}
		if(tUser==null){
			throw new ServiceException(6, "转入用户不存在！");
		}
		if(!fUser.getPassword().equals(MD5Security.md5_16(pa))){
			throw new ServiceException(1, "登录密码不正确！");
		}
		if(!fUser.getPassword3().equals(pa3)){
			throw new ServiceException(2, "二级密码不正确！");
		}
		if(amount<=0){
			throw new ServiceException(3, "捐助数量不能小于0");
		}
		if(amount<100){
			throw new ServiceException(4, "捐助数量最低为100！");
		}
		
		if(!this.changeYb(fromUser, -amount, "捐助", 14,null,0,YbChangeType.DONATEYB)){
			throw new ServiceException(100, "Yb不足");
		}
		
		if(!gcuserDao.addWhenOtherPersionBuyJbCard(toUser, amount)){
			throw new ServiceException(7, "添加失败！");
		}
		
		Datepay datePay = new Datepay();
		datePay.setUsername(toUser);
		datePay.setSyjz(amount);
		datePay.setPay(tUser.getPay()+amount);
		datePay.setJydb(tUser.getJydb());
		datePay.setRegid("收到捐助-"+fromUser);
		datePay.setNewbz(14);
		datePay.setAbdate(new Date());
		datePay.setOrigintype(YbChangeType.DONATEYB);
		logService.addDatePay(datePay);
		
	}
	
	
	
	/**
	 * 购物券转账
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	private void trasferScores(String fromUser,String toUser,int amount){
		if(!this.changeScores(fromUser,-amount,ScoresChangeType.THE_SAME_USER_TRANSFER_REDUCE,0,toUser,"","")){
			throw new ServiceException(101, "购物券不足");
		}
		this.changeScores(toUser, amount, ScoresChangeType.THE_SAME_USER_TRANSFER,0,fromUser,"","");
	}
	/**
	 * yb转账
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	private void trasferYb(String fromUser,String toUser,int amount){
		if(!this.changeYbNotAddVipPay(fromUser, -amount, "转给-"+toUser, 6,null,0,YbChangeType.ZHUANCHU_SAMENAME)){
			throw new ServiceException(100, "Yb不足");
		}
		this.changeYbNotAddVipPay(toUser, amount, "收到-"+fromUser, 6,null,0,YbChangeType.ZHUANRU_SAMENAME);
	}
	
	/**
	 * 批量同名账号转账
	 * @param fromUsers
	 * @param toUser
	 * @param password3
	 */
	@Transactional
	public void batchTrasferYb(List<String> fromUsers,String toUser,String password3){
		Gcuser gcuser = gcuserDao.getUser(toUser);
		if(!gcuser.getPassword3().equals(password3)){
			throw new ServiceException(1, "二级密码错误，请检查输入是否正确！");
		}
		if(gcuser.getPayok()==10){
			throw new ServiceException(2, "您好，您已申请的卖出尚未交易成功，暂时不能使用转账功能，谢谢！");
		}
		if(gcuser.getJygt1()==2 || gcuser.getDbt1()==2){
			throw new ServiceException(3, "操作错误，请检查输入是否正确！");
		}
		
		if(gcuser.getSjb()==0){
			throw new ServiceException(7, "非双区用户不能进行该操作！");
		}
		
		for(String fromUser: fromUsers){
			Gcuser user = gcuserDao.getUser(fromUser);
			if(user==null){
				throw new ServiceException(4, "用户不存在");
			}
			if(!gcuser.getName().equals(user.getName())||!gcuser.getUserid().trim().toLowerCase().equals(user.getUserid().trim().toLowerCase())){
				throw new ServiceException(5, "非同名用户,不能转,from name=["+user.getName()+"]，userid=["+user.getUserid().toLowerCase()+"],to name=["+gcuser.getName()+"],userId=["+gcuser.getUserid().toLowerCase()+"],名字判断=["+(gcuser.getName().equals(user.getName()))+"],身份证判断=["+(gcuser.getUserid().toLowerCase().equals(user.getUserid().toLowerCase()))+"]");
			}
			if(user.getPay()>0&&!fromUser.equals(toUser)){
				trasferYb(fromUser,toUser,user.getPay());
			}
		}
	}
	
	
	/**
	 * 批量转入报单币
	 * 
	 * @param fromUsers
	 * @param toUser
	 * @param password3
	 */
	@Transactional
	public void batchtrasferBdb(List<String> fromUsers,String toUser,String password3){
		Gcuser gcuser = gcuserDao.getUser(toUser);
		if(!gcuser.getPassword3().equals(password3)){
			throw new ServiceException(1, "二级密码错误，请检查输入是否正确！");
		}
		
		if(gcuser.getJygt1()==2 || gcuser.getDbt1()==2){
			throw new ServiceException(3, "操作错误，请检查输入是否正确！");
		}
		
		if(gcuser.getSjb()==0){
			throw new ServiceException(7, "非双区用户不能进行该操作！");
		}
		
		for(String fromUser: fromUsers){
			Gcuser user = gcuserDao.getUser(fromUser);
			if(user==null){
				throw new ServiceException(4, "用户不存在");
			}
			if(!gcuser.getName().equals(user.getName())||!gcuser.getUserid().trim().toLowerCase().equals(user.getUserid().trim().toLowerCase())){
				throw new ServiceException(5, "非同名用户,不能转,from name=["+user.getName()+"]，userid=["+user.getUserid().toLowerCase()+"],to name=["+gcuser.getName()+"],userId=["+gcuser.getUserid().toLowerCase()+"],名字判断=["+(gcuser.getName().equals(user.getName()))+"],身份证判断=["+(gcuser.getUserid().toLowerCase().equals(user.getUserid().toLowerCase()))+"]");
			}
			if(user.getSybdb()>0&&!fromUser.equals(toUser)){
				trasferBdb(fromUser,toUser,user.getSybdb());
			}
		}
	}
	
	
	/**
	 * 报单币转账
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	@Transactional
	public void trasferBdb(String fromUser,String toUser,int amount){
		Gcuser from = gcuserDao.getUser(fromUser);
		
		if(fromUser.equals(toUser)){
			throw new ServiceException(14, "不能转给自己！");
		}
		if(amount<=0){
			throw new ServiceException(13, "转账保单币小于0");
		}
		
		if(from.getSybdb()<amount){
			throw new ServiceException(6, "转出用户名报单币不能大于剩余报单币 "+from.getSybdb()+" ，谢谢！");
		}
		Gcuser to = gcuserDao.getUser(toUser);
		if(to==null){
			throw new ServiceException(12, "接收的用户名不存在，请检查输入是否正确！");
		}
		
		//减被转者的报单币
		if(!this.updateSybdb(fromUser, -amount, "批量转给-"+toUser,BDBChangeType.TRASFERBDB_REDUCE)){
			throw new ServiceException(11, "转出用户名报单币不能大于剩余报单币 "+from.getSybdb()+" ，谢谢！");
		}
		
		this.updateSybdb(toUser, amount, "批量获得-"+fromUser,BDBChangeType.TRASFERBDB_ADD);
		
		
	}
	
	
	@Transactional
	public void batchTrasferScores(List<String> fromUsers,String toUser,String password3){
		Gcuser gcuser = gcuserDao.getUser(toUser);
		if(!gcuser.getPassword3().equals(password3)){
			throw new ServiceException(1, "二级密码错误，请检查输入是否正确！");
		}
		if(gcuser.getPayok()==10){
			throw new ServiceException(2, "您好，您已申请的卖出尚未交易成功，暂时不能使用转账功能，谢谢！");
		}
		if(gcuser.getJygt1()==2 || gcuser.getDbt1()==2){
			throw new ServiceException(3, "操作错误，请检查输入是否正确！");
		}
		
		if(gcuser.getSjb()==0){
			throw new ServiceException(7, "非双区用户不能进行该操作！");
		}
		
		for(String fromUser: fromUsers){
			Gcuser user = gcuserDao.getUser(fromUser);
			if(user==null){
				throw new ServiceException(4, "用户不存在");
			}
			if(!gcuser.getName().equals(user.getName())||!gcuser.getUserid().trim().toLowerCase().equals(user.getUserid().trim().toLowerCase())){
				throw new ServiceException(5, "非同名用户,不能转,from name=["+user.getName()+"]，userid=["+user.getUserid().toLowerCase()+"],to name=["+gcuser.getName()+"],userId=["+gcuser.getUserid().toLowerCase()+"],名字判断=["+(gcuser.getName().equals(user.getName()))+"],身份证判断=["+(gcuser.getUserid().toLowerCase().equals(user.getUserid().toLowerCase()))+"]");
			}
			if(user.getScores()>0&&!fromUser.equals(toUser)){
				trasferScores(fromUser,toUser,user.getScores());
			}
		}
	}
	
	private static final String[] ARRAY_DESC = new String[]{"单","双 ","大","小"};
	public void guessYb(String userName,int type,int ybNum){
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser.getPay()==0 || gcuser.getPay()<10 || ybNum>gcuser.getPay()){
			throw new ServiceException(1,"一币不足");
		}
		Epkjdate epkjdate = managerService.getEpkjdateBz0();
		if(!this.changeYb(userName, -ybNum, "竞猜投注"+ARRAY_DESC[type-1], 0,epkjdate.getKid(),0,YbChangeType.GUESSBETTING)){
			throw new ServiceException(1,"一币不足");
		}
		//更新压注池子
		if(type==1){
			managerService.updateEpkjdateBz0(ybNum, 0, 0, 0);
		}else if(type==2){
			managerService.updateEpkjdateBz0(0, ybNum, 0, 0);
		}else if(type==3){
			managerService.updateEpkjdateBz0(0, 0, ybNum, 0);
		}else if(type==4){
			managerService.updateEpkjdateBz0(0, 0, 0, ybNum);
		}
		eptzbDao.updateSumGuessByType(userName, type, ybNum);
	}
	

	public void guessJf(String userName,int type,int jfNum){
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser.getJyg()==0 || gcuser.getJyg()<10 || jfNum>gcuser.getJyg()){
			throw new ServiceException(1,"操作错误，积分不足，请检查输入是否正确！");
		}
		Jfkjdate epkjdate = managerService.getJfkjdateBz0();
		
		if(!gcuserDao.updateJyg(userName, jfNum)){
			throw new ServiceException(1, "操作错误，积分不足，请检查输入是否正确！");
		}
		
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(userName);
		gpjy.setMcsl(Double.valueOf(jfNum));
		gpjy.setSysl(Double.valueOf(gcuser.getJyg()-jfNum));
		gpjy.setBz("竞猜投注-"+ARRAY_DESC[type-1]);
		gpjy.setKjqi(epkjdate.getKid());
		gpjy.setCgdate(new Date());
		gpjy.setJy(1);
		gpjy.setAbdate(new Date());
		gpjyDao.add(gpjy);
		
		//更新压注池子
		if(type==1){
			managerService.updateEpkjdateBz0(jfNum, 0, 0, 0);
		}else if(type==2){
			managerService.updateEpkjdateBz0(0, jfNum, 0, 0);
		}else if(type==3){
			managerService.updateEpkjdateBz0(0, 0, jfNum, 0);
		}else if(type==4){
			managerService.updateEpkjdateBz0(0, 0, 0, jfNum);
		}
		jftzbDao.updateSumGuessByType(userName, type, jfNum);
	}
	/**
	 * 一币抢购
	 */
	@Transactional
	public int yqQg(String userName,int goodsId,int buyNum,int price){
		if(buyNum<0||price<0){
			throw new ServiceException(1,"一币不足");
		}
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser.getPay()==0 ||  price*buyNum>gcuser.getPay()){
			throw new ServiceException(1,"一币不足");
		}
		boolean result = jfcpDao.update(goodsId, buyNum);
		if(!result){
			throw new ServiceException(2,"本轮该产品已成功被抢购，请稍候再试或联系客服进行下一轮抢购或选择其它产品！");
		}
		Jfcp jfcp =jfcpDao.get(goodsId);
		
		if(!this.changeYb(userName, -price*buyNum, "抢购-"+jfcp.getCpmq(), 0, null,0, YbChangeType.PRODUCTBUY)){
			throw new ServiceException(1,"一币不足");
		}
		
		if(jfcp.getDqep()==10||jfcp.getDqep()<21&&jfcp.getCglist()!=0){
			if(!jfcpDao.updateDqepAndCglist(goodsId, buyNum)){
				throw new ServiceException(3000,"未知错误");
			}
		}
		
		jfcp =jfcpDao.get(goodsId);
		
		if(jfcp.getDqep()==0||jfcp.getDqep()<0&&jfcp.getCglist()==0){
			Cpuser cpuser = new Cpuser();
			cpuser.setCguser(userName);
			cpuser.setCpmq("一币-"+jfcp.getCpmq());
			cpuser.setJydate(new Date());
			cpuser.setJyjf(jfcp.getZepsl());
			cpuser.setJyname(gcuser.getName());
			cpuser.setJyqq(gcuser.getQq());
			cpuser.setJycall(gcuser.getCall());
			cpuserDao.add(cpuser);
			
			Datepay datepay = new Datepay();
			datepay.setUsername(userName);
			datepay.setRegid("抢购成功"+jfcp.getCpmq());
			datepay.setPay(gcuser.getPay()-buyNum*price);
			datepay.setJydb(gcuser.getJydb());
			
			if(!jfcpDao.updateDqepOrCglistOrJysl(goodsId)){
				throw new ServiceException(3000,"未知错误");
			}
		}else{
			//throw new ServiceException(3,"您好，本次点击抢购还差一点点，还有"+jfcp.getDqep()+"就可以抢中，继续加油！！！");
			return jfcp.getDqep();
		}
		return -1;
	}
	
	/**
	 * 挂单出售一币
	 * @param userName
	 * @param password3
	 * @param saleNum
	 * @param smsCode
	 * @param ip
	 */
	
	//南京vip bjv168 下面的所有用户  只能体现奖金金额  不能体现其他
    private static String FORBIDDEN_USERS = "bjv168";
    private static String[] SKIL_USERS = new String[]{"lhj5578aa"};
    
    private static final long startLimitTime = DateUtils.StringToDate("2016-2-20 00:00:00", "yyyy-MM-dd HH:mm:ss").getTime();
    private static final long endLimitTime = DateUtils.StringToDate("2016-6-30 23:59:59", "yyyy-MM-dd HH:mm:ss").getTime();
	
    //以下身份证号码 也只能体现奖金金额  不能体现其他
    private String FORBIDDEN_ID_CARD = "";
	@Transactional
	public void saleYb(String userName,String password3,int saleNum,String smsCode,String ip){
		
		if(saleNum<100){
			throw new ServiceException(1,"发布一币数量有误，请检查输入是否正确！");
		}
		
		Gcuser gcuser = this.gcuserDao.getUser(userName);
		SameUserProperty sameUserProperty = sameUserPropertyDao.getSameUserProperty(gcuser.getName()+gcuser.getUserid());
		if(sameUserProperty!=null){
			if(sameUserProperty.getNoSureTimes()>4){
				throw new ServiceException(11,"由于您的账户多次没有确认提现，所以提现已经被关闭！");
			}
		}
		
		if(gcuser.getVip()!=0){
			throw new ServiceException(10, "VIP账户不可提现！");
		}
		
		int txqpay = gcuser.getPay();
		
		Fcxt fcxt = managerService.getFcxtById(10);
		
		if(saleNum>gcuser.getPay()){
			throw new ServiceException(2,"您好，您发布的一币数量不能大于您剩余一币 "+gcuser.getPay()+" ，谢谢！");	
		}
		
		
		
		if(saleNum>gcuser.getPay()-gcuser.getVippay() && gcuser.getRegtime().getTime()>fcxt.getJsdate().getTime()){
			throw new ServiceException(3,"您好，您有 "+gcuser.getVippay()+"-一币是[服务中心转入]或[游戏收益部分]，此额度不提供卖出，仅用于开户使用，谢谢！");
		}

		if(!password3.equals(gcuser.getPassword3())){
			throw new ServiceException(4,"您好，您二级密码不正确，请重新输入！");
		}
		
		if(gcuser.getGanew()!=0&&!gcuser.getVipsq().equals(smsCode)){
			throw new ServiceException(5,"您好，手机验证码不正确，请重新输入！");
		}
		
		if(saleNum<100){
			throw new ServiceException(6,"您好，您发布的一币数量不能小于100，谢谢！");
		}
		
		if(gcuser.isLimitTx()){
			throw new ServiceException(7,"您好，您已发布成功过，请耐心等待处理完成后再发布第二笔，或认购方已向您付款，请先确认收款再发布第二笔，谢谢！");
		}
		
		//商户账号不能卖出一币
        if(gcuser.getTxlb()==3||gcuser.getJb()==5){
            throw new ServiceException(8,"商户或商家账号不能卖出一币！");
		}
//        Sgxt sgxtUser = sgxtDao.get(userName);
//        if(sgxtUser==null){
//        	return;
//        }
        boolean isCanGetPrice = false;
        //南京vip 下面的用户   只能提现奖金部分  不能体现其他部分 及指定身份证号码
//		if(userName.equals(FORBIDDEN_USERS)||zuoMingxiDao.get(FORBIDDEN_USERS, userName)!=null||youMingXiDao.get(FORBIDDEN_USERS, userName)!=null){
//			boolean isSkip = false;
//			for(String skipUser:SKIL_USERS){
//				if(userName.equals(skipUser)){
//					isSkip = true;
//					break;
//				}
//			}
//			
//			if(sgxtUser.getBddate().getTime()<startLimitTime||sgxtUser.getBddate().getTime()>endLimitTime){
//				isSkip = true;
//			}
//			if(!isSkip){
//				isCanGetPrice = true;
//			}
//		}
		//某些身份证号码只能提现奖金部分
//		if(FORBIDDEN_ID_CARD.indexOf(gcuser.getUserid())!=-1){
//			isCanGetPrice = true;
//		}
		
		if(isCanGetPrice){
			int prizeYb = gcuser.getJbpay()+gcuser.getJjpay()+gcuser.getJypay();
			if(gcuser.getMcpay()+saleNum>prizeYb){
				throw new ServiceException(9, "您所属的vip， 只能提现奖金部分 ，不能卖出其他部分!奖金部分余额不足！");
			}
		}
        
        
        
		double tgpay9 = 0d;
		int tgpay09 = 0;
		if(saleNum<1000){
			tgpay9 = saleNum*0.85;
			tgpay09 = (int)tgpay9;
		}else{
			tgpay9 = saleNum*0.9;
			tgpay09 = (int)tgpay9;
		}
		
		if(!gcuserDao.saleYb(userName, saleNum)){
			throw new ServiceException(2,"您好，您发布的一币数量不能大于您剩余一币 "+gcuser.getPay()+" ，谢谢！");
		}
		
		gcuser = gcuserDao.getUser(userName);
		
		Datepay datePay = new Datepay();
		datePay.setUsername(userName);
		datePay.setJc(saleNum);
		datePay.setPay(gcuser.getPay());
		datePay.setJydb(gcuser.getJydb());
		datePay.setRegid("实收"+tgpay09);
		datePay.setNewbz(3);
		datePay.setTxbz(1); 
		datePay.setAbdate(new Date());
		datePay.setOrigintype(YbChangeType.YBSALE);
		int datePayId = logService.addDatePay(datePay);
		
//		int datePayId = logService.getLasterInsertId();
		
		Txpay txpay = txPayDao.get();
		int jypay = 1;
		if(txpay!=null){
			jypay = txpay.getPayid()+1;
		}
		
		
		Txpay txpay2 = new Txpay();
		txpay2.setPayusername(userName);
		txpay2.setCxt(gcuser.getCxt());
		txpay2.setPaynum(saleNum);
		txpay2.setPaynum9(tgpay09);
		txpay2.setPayname(gcuser.getName());
		txpay2.setPaybank(gcuser.getBank());
		txpay2.setPaycard(gcuser.getCard());
		txpay2.setPayonoff("尚未转账");
		txpay2.setBankbz(txqpay+"");
		txpay2.setBz(gcuser.getPay()+"");
		txpay2.setDqu(gcuser.getDqu());
		txpay2.setQlid(datePayId);
		txpay2.setPdid(11);
		txpay2.setJyid(jypay);
		txpay2.setVipname(gcuser.getVipname());
//		txpay2.setTxvip(gcuser.getTxlb());
		txpay2.setTxvip(Global.NOVERIFY);//默认需不要审核
		//比对原始姓名与当前提款的姓名
//		Txifok txifOk = txifokDao.get(userName);
//		if(txifOk!=null&&!Strings.isNullOrEmpty(txifOk.getName())&&txifOk.getName().equals(txpay2.getPayname())){
			UserExtinfo userExtinfo = userExtinfoDao.get(userName);
			//是否生审核过的
			if(userExtinfo!=null&&userExtinfo.getNeedVerify()==Global.NOVERIFY){
				txpay2.setTxvip(Global.VERIFY);
			}
//		}
		
		txpay2.setTxip(ip);
		int payid = txPayDao.add(txpay2);
		
		//添加索引
		TxpayIndex index = new TxpayIndex();
		index.setPayid(payid);
		index.setEp(txpay2.getEp());
		index.setTxvip(txpay2.getTxvip());
	    index.setCreatedTime(new Date());
		txPayDao.addTxIndex(index);
		
		
		gcuserDao.updatePayOk(gcuser.getName(), gcuser.getUserid(), 1);
		
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
	}
	/**
	 * 商城退款
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	public String getConfigPassword(String key){
		return ConfigLoader.getStringValue(key, "");
	}
	@Transactional
	public void mallBack(String fromUser,String toUser,String password3,int amount,String orderId,String yy,double ration){
		
        if(!password3.equals(getConfigPassword(PasswordKey.MALL_BACK_YB))){
			throw new ServiceException(1, "操作密码不正确！");
		}
		
		if(yy==null)yy="";
		
		String regId=null;
		String sct = "";
		if(!Strings.isNullOrEmpty(orderId)){
			regId = "退款-"+orderId;
			sct="(商城)";
			Datepay datepay = datePayDao.getDatepayByUserNameAndRegid(toUser, regId);
			if(datepay!=null){
				throw new ServiceException(2, "此订单号已经处理过，请不要重复！");
			}
		}else{
//			regId = "收到-"+fromUser.substring(0, 2)+"***"+"-"+yy;
			if(fromUser.equals("300fhk")){
				regId = "收到-300***"+"-"+yy;
			}else if(fromUser.equals("xtgc002")){
				regId = "收到-xtg***"+"-"+yy;
			}
			else{
				regId = "收到-"+fromUser+"-"+yy;
			}
		}
        Gcuser toGcUser = gcuserDao.getUser(toUser);
		
		if(toGcUser==null){
			throw new ServiceException(3, "转入的用户名不存在，请检查输入是否正确！");
		}
		
		if(fromUser.equals(toUser)){
			throw new ServiceException(4, "您好，不能转给自己，谢谢！");
		}
		
        if(amount<0 || amount==0){
        	throw new ServiceException(5,"您好，您转账一币不能小于零，谢谢！");
        }
        Gcuser gcuser = gcuserDao.getUser(fromUser);
		
		
		if(gcuser.getPay()<amount){
			throw new ServiceException(6, "您好，您转账一币不能大于您剩余一币 "+gcuser.getPay()+" ，谢谢！");
		}
		
		if(!this.changeYb(fromUser, -amount, "转给"+sct+"-"+toUser+"-"+yy, 13, null,ration, YbChangeType.MALLTUIKUAN)){
			throw new ServiceException(6, "您好，您转账一币不能大于您剩余一币 "+gcuser.getPay()+" ，谢谢！");
		}
		
		if(!this.changeYb(toUser, amount, regId, 6, null,ration,  YbChangeType.MALLHUANKUAN)){
			throw new ServiceException(3000, "未知错误！");
		}
	}
	
	
	/**
	 * 商城退购物券
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	
	@Transactional
	public void mallBackScores(String fromUser,String toUser,String password3,int amount,String orderId,String yy){
		if(!password3.equals(getConfigPassword(PasswordKey.MALL_BACK_SCORE))){
			throw new ServiceException(1, "操作密码不正确！");
		}
		if(yy==null)yy="";
        Gcuser toGcUser = gcuserDao.getUser(toUser);
		if(toGcUser==null){
			throw new ServiceException(3, "转入的用户名不存在，请检查输入是否正确！");
		}
		if(fromUser.equals(toUser)){
			throw new ServiceException(4, "您好，不能转给自己，谢谢！");
		}
		
        if(amount<0 || amount==0){
        	throw new ServiceException(5,"您好，您转账积分不能小于零，谢谢！");
        }
        Gcuser gcuser = gcuserDao.getUser(fromUser);
        
        if(gcuser.getTxlb()!=3){
        	throw new ServiceException(2, "转出的用户名不是新商城商家！");
        }
		
		if(gcuser.getScores()<amount){
			throw new ServiceException(6, "您好，您转账购物券不能大于您剩余的购物券 "+gcuser.getPay()+" ，谢谢！");
		}
		
		if(!this.changeScores(fromUser, -amount, ScoresChangeType.MALL_BACK_REDUCE, 0d, toUser, yy+"-"+orderId,orderId)){
			throw new ServiceException(6, "您好，您转账购物券不能大于您剩余购物券 "+gcuser.getPay()+" ，谢谢！");
		}
		if(!this.changeScores(toUser, amount, ScoresChangeType.MALL_BACK_ADD,0d, fromUser, yy+"-"+orderId,orderId)){
			throw new ServiceException(3000, "未知错误！");
		}
	}
	
	/**
	 * 设置为商户
	 * @param user
	 */
	public boolean setToMaller(String user,int txlb,String ip){
		boolean result = gcuserDao.updateUserTxlb(user, txlb);
		LogSystem.log("setToMaller==>user=【"+user+"】,txlb=【"+txlb+"】,time=["+new Date()+"],ip=["+ip+"],result=["+result+"]");
		return result;
	}
	/**
	 * 转账一币至谁的名下
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 */
	//转出折扣为0.9的vip用户名
	private static final String[] ration_0_9_user = new String[]{"qaz363363b","lyl5577a","qal999999a","cmj999999a","gyc363363a","csp5218a"};
	@Transactional
	public void trasferYbToOtherPersion(String fromUser,String toUser,String password3,int amount){
		if(!fromUser.equals("300fhk")&&!fromUser.equals("xtgc001")){//公司账号转不限制金额
	        if(amount<0 || amount==0 || amount >50000){
	        	throw new ServiceException(1,"您好，您转账一币不能小于零或超过50000，谢谢！");
	        }
		}
		if(amount<0){
			throw new ServiceException(1,"您好，您转账一币不能小于零或超过50000，谢谢！");
		}
		if(amount%100!=0){
			throw new ServiceException(2,"转账必须是100的倍整数如：100，200，300，400，500，1000，5000，请检查输入是否正确！");
		}
		if(fromUser.equals(toUser)){
			throw new ServiceException(3, "您好，不能转给自己，谢谢！");
		}
		Gcuser toGcUser = gcuserDao.getUser(toUser);
		Gcuser gcuser = gcuserDao.getUser(fromUser);
		
		if(toGcUser==null){
			throw new ServiceException(8, "转入的用户名不存在，请检查输入是否正确！");
		}
		
		if(!fromUser.equals("300fhk")&&!fromUser.equals("xtgc001")){
			if(zuoMingxiDao.get(fromUser, toUser)==null&&youMingXiDao.get(fromUser, toUser)==null){
				throw new ServiceException(4, "只能转给自己团队的并已进入双区的玩家！");
			}
			
			//自己是大vip 则可以给其下的小vip转
			if(gcuser.getVip()==2){
				if(toGcUser.getVip()==3){//对象是其下的小vip可以转  不做处理
					
				}else if(toGcUser.getVip()==2){//对象是其下的大vip 不能转
					throw new ServiceException(12, "该玩家是大vip！您不能转给他！");
				}else if(toGcUser.getVip()==0){//对象是其下的普通用户 则判断该用户的上级vip是否为他
					String vip = this.findMyUpVipName(toUser);
					//被转者如果为普通用户 如果其上级vip不是转出者 不可以转
					if(!vip.equals(fromUser)){
						throw new ServiceException(11, "该玩家的上级vip不是您！您不能转给他！");
					}
				}else{
					throw new ServiceException(13, toGcUser.getUsername()+"不可识别的vip标示"+toGcUser.getVip());
				}
			}else if(gcuser.getVip()==3){//自己是小vip
				if(toGcUser.getVip()==2){//对象是大vip  无论隔几层都不能转
					throw new ServiceException(12, "该玩家是大vip！您不能转给他！");
				}else if(toGcUser.getVip()==3){
					throw new ServiceException(14, "您只是小vip！不能转给您团队下的小vip！");
				}else if(toGcUser.getVip()==0){
					String vip = this.findMyUpVipName(toUser);
					//被转者如果为普通用户 如果其上级vip不是转出者 不可以转
					if(!vip.equals(fromUser)){
						throw new ServiceException(11, "该玩家的上级vip不是您！您不能转给他！");
					}
				}else{
					throw new ServiceException(13, toGcUser.getUsername()+"不可识别的vip标示"+toGcUser.getVip());
				}
			}else{
				throw new ServiceException(10, "该功能vip才能使用！");
			}
			
			
		}
		
		
		
		if(!gcuser.getPassword3().equals(password3)){
			throw new ServiceException(5, "二级密码不正确");
		}
		if(gcuser.getVip()==2){
			if(gcuser.getPay()<600000+amount){
				throw new ServiceException(6, "VIP玩家一币账户余额必须大于或等于600000！");
			}
		}else if(gcuser.getVip()==3){
			if(gcuser.getPay()<50000+amount){
				throw new ServiceException(9, "小VIP玩家一币账户余额必须大于或等于50000！");
			}
		}else{
			throw new ServiceException(10, "该功能vip才能使用！");
		}
		if(gcuser.getPay()<amount){
			throw new ServiceException(7, "您好，您转账一币不能大于您剩余一币 "+gcuser.getPay()+" ，谢谢！");
		}
		

		
//		if(!gcuserDao.transferReduceYb(fromUser, amount)){
//			throw new ServiceException(6, "您好，您转账一币不能大于您剩余一币 "+gcuser.getPay()+" ，谢谢！");
//		}
//		Datepay datePay = new Datepay();
//		datePay.setUsername(fromUser);
//		datePay.setJc(amount);
//		datePay.setPay(gcuser.getPay()-amount);
//		datePay.setJydb(gcuser.getJydb());
//		datePay.setRegid("转给-"+toUser);
//		datePay.setNewbz(0);
//		datePay.setAbdate(new Date());
//		
//		datePay.setRation(0.95);
//		
//		logService.addDatePay(datePay);
		
		double ration = 1;
		//如果转出目标用户不是vip  则折扣为1  否则为0.95(除开那些固定用户)
		if(toGcUser.getVip()!=0){
			ration = 0.95;
			for(int i=0;i<ration_0_9_user.length;i++){
				if(fromUser.equals(ration_0_9_user[i])){
					ration = 0.9;
					break;
				}
			}
		}
		
		if(!this.changeYb(fromUser, -amount, "转给-"+toUser, 0, null, ration, YbChangeType.ZHUANCHU)){
			throw new ServiceException(6, "您好，您转账一币不能大于您剩余一币 "+gcuser.getPay()+" ，谢谢！");
		}
		
		
		if(!this.changeYb(toUser, amount, "收到服务中心"+fromUser.substring(0, 2)+"***转入", 0, null,0.9,YbChangeType.ZHUANRU)){
			throw new ServiceException(3000, "未知错误！");
		}
		
		vipxtgcDao.updateJcYb(fromUser, DateUtils.getDate(new Date()), amount);
	}
	
	/**
	 * 获取一币交易列表
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Txpay> getMarkList(int pageSize){
		return txPayDao.getMarkList(pageSize);
	}
	/**
	 * 一币卖出明细
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Txpay> getTxpaySalesDetailsPage(String userName,int pageIndex,int pageSize){
		return txPayDao.getPageListSalesDetails(userName, pageIndex, pageSize);
	}
	
	/**
	 * 一币求购明细
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Txpay> getTxpayBuyDetailsPage(String userName,int pageIndex,int pageSize){
		return txPayDao.getPageListBuyDetails(userName, pageIndex, pageSize);
	}
	/**
	 * 撤销卖出一币
	 * @param userName
	 * @param payid
	 * @param ip
	 */
	@Transactional
	public void cancleYbSale(String userName,int payid,String ip){
		Txpay txpay = txPayDao.getByPayid(payid);
		if(txpay==null||!txpay.getPayusername().equals(userName)){
			throw new ServiceException(1, "该一币卖出方不是本人，请重新操作！");
		}
		
		if(txpay.getEp()>0 || txpay.getZftime()!=null || txpay.getKjygid()!=0){
			throw new ServiceException(2, "该一币交易进行中或已经由它人交易成功，暂时不能撤销，或稍后再试！");
		}
		if(datePayDao.updateByQlid(txpay.getQlid())){
			gcuserDao.backSaleYb(userName, txpay.getPaynum());
			Gcuser gcuser = gcuserDao.getUser(userName);
			Datepay datePay = new Datepay();
			datePay.setUsername(userName);
			datePay.setSyjz(txpay.getPaynum());
			datePay.setPay(gcuser.getPay());
			datePay.setJydb(gcuser.getJydb());
			datePay.setRegid("撤销卖出");
			datePay.setNewbz(3);
			datePay.setTxbz(1); 
			datePay.setAbdate(new Date());
			datePay.setOrigintype(YbChangeType.YBSALE_CANCLE);
			logService.addDatePay(datePay);
			
			if(!txPayDao.updateByPayid(payid, 0, new Date(), "已经转账", new Date(), "撤销", ip)){
				throw new ServiceException(3000, "未知错误");
			}
			//删除索引
			txPayDao.deleteIndex(payid);
			
			if(!gcuserDao.updatePayOk(gcuser.getName(), gcuser.getUserid(), 0)){
				throw new ServiceException(3000, "未知错误");
			}
		}else{
			throw new ServiceException(2, "该一币交易进行中或已经由它人交易成功，暂时不能撤销，或稍后再试！");
		}
	}
	
	/**
	 * 购买一币的前置检查
	 * @param userName
	 * @param payId
	 */
	public Txpay buyYbPre(String userName,int payId){
		Txpay txpay = txPayDao.getByPayid(payId);
		if(txpay==null){
			throw new ServiceException(1, "交易不存在，请重新操作！");
		}
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser.getSjb()==0){
			throw new ServiceException(2, "您好，您还不是双区玩家，暂时不能使用一币理财功能！");
		}
		
		if(gcuser.getSjb()<20){
			throw new ServiceException(3, "您好，您还没达到D套餐，暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！");
		}
		
		if(gcuser.getCxt()<4&&gcuser.getCxdate().getTime()>System.currentTimeMillis()){
			throw new ServiceException(4, "您好，您的诚信星为"+gcuser.getCxt()+"，离取消[限制认购]时间还有"+DateUtils.getIntervalDays(new Date(),gcuser.getCxdate())+"天，谢谢！");
		}
		
		if(userName.equals(txpay.getPayusername())){
			throw new ServiceException(5, "您好，不能认购自己的一币，请选择其它用户，谢谢！");
		}
//		if(gcuser.getJyg()<txpay.getPaynum()){
//			throw new ServiceException(6, "您好您，的积分数量不足"+txpay.getPaynum()+"（认购一币作为诚信金），暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！");
//		}
		return txpay;
	}
	
	public Txpay buyYb(String userName,int payId,String password3){
		Txpay txpay = buyYbPre(userName,payId);
		
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		if(!password3.equals(gcuser.getPassword3())){
			throw new ServiceException(8, "您好，您的二级密码不正确，请检查输入是否正确！");
		}
		
		
		if(!txPayDao.updateEpToBeSalesPre(payId,DateUtils.addHour(new Date(), 2),userName,txpay.getPaynum())){
			throw new ServiceException(7, "该一币交易进行中或已经由它人交易成功了，不能重复，请选择其它交易！");
		}
		
		txPayDao.updateIndexEp(payId, 1);
		
//		if(!gcuserDao.updateJyg(userName, txpay.getPaynum())){
//			throw new ServiceException(6, "您好您，的积分数量不足"+txpay.getPaynum()+"（认购一币作为诚信金），暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！");
//		}
//		
//		Gpjy gpjy = new Gpjy();
//		gpjy.setUsername(userName);
//		gpjy.setMcsl(Double.valueOf(txpay.getPaynum()));
//		gpjy.setSysl(Double.valueOf(gcuser.getJyg()-txpay.getPaynum()));
//		gpjy.setBz("冻结-认购一币-"+txpay.getPaynum()+"诚信金-"+txpay.getPayusername());
//		gpjy.setCgdate(new Date());
//		gpjy.setJy(1);
//		gpjy.setDfuser(payId+"");
//		gpjy.setNewjy(1);
//		gpjy.setAbdate(new Date());
//		
//		gpjyDao.add(gpjy);
		//发送短信
		try {
			sendYbSaleSmsMsg(txpay.getPayusername(), 0);
		} catch (Exception e) {
			LogSystem.error(e, "");
		}
		
		return txpay;
	}
	
	public Txpay getTxpayById(int payId){
		return txPayDao.getByPayid(payId);
	}
	/**
	 * 确认已打钱
	 * @param userName
	 * @param payId
	 */
	public void sureIGivedMoney(String userName,int payId){
		Txpay txpay = txPayDao.getByPayid(payId);
		if(!txpay.getDfuser().equals(userName)||txpay.getKjygid()==0){
			throw new ServiceException(1, "认购方出错，请检查输入是否正确！");
		}else{
			if(!txPayDao.updateEpToHavePay(payId, DateUtils.addDay(new Date(), 2))){
				throw new ServiceException(1, "认购方出错，请检查输入是否正确！");
			}
			txPayDao.updateIndexEp(payId, 2);
		}
		//发送短信通知
		sendYbSaleSmsMsg(txpay.getPayusername(), 1);
	}
	
//	private void backGpjyForBuyYb(Txpay txpay){
//		//返还押金
//		     Gpjy gpjy = gpjyDao.get(txpay.getDfuser(), txpay.getPayid()+"");
//		     boolean result = gpjyDao.backBuyYbGpjy(txpay.getDfuser(), txpay.getPayid()+"", "该笔押金已返还", gpjy.getDfuser()+"-"+txpay.getPayusername(), new Date());
//			 if(gpjy!=null&&gpjy.getNewjy()==1){//返还押金
//				if(!gcuserDao.updateJyg(userName, txpay.getPaynum())){
//					throw new ServiceException(6, "您好您，的积分数量不足"+txpay.getPaynum()+"（认购一币作为诚信金），暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！");
//				}
//				
//				Gpjy gpjy = new Gpjy();
//				gpjy.setUsername(userName);
//				gpjy.setMcsl(Double.valueOf(txpay.getPaynum()));
//				gpjy.setSysl(Double.valueOf(gcuser.getJyg()-txpay.getPaynum()));
//				gpjy.setBz("冻结-认购一币-"+txpay.getPaynum()+"诚信金-"+txpay.getPayusername());
//				gpjy.setCgdate(new Date());
//				gpjy.setJy(1);
//				gpjy.setDfuser(payId+"");
//				gpjy.setNewjy(1);
//				gpjy.setAbdate(new Date());
//				
//				gpjyDao.add(gpjy);	
//			}
//	}
	/**
	 * 确认已收到钱
	 * @param userName
	 * @param payId
	 * @param password3
	 * @param smsCode
	 */
	@Transactional
	public void sureIReceivedMoney(String userName,int payId,String password3,String smsCode,String ip){
		Txpay txpay = txPayDao.getByPayid(payId);
		System.out.println("txpay="+txpay.getPayusername());
		if(!txpay.getPayusername().equals(userName)){
			throw new ServiceException(1, "发布方出错，请检查输入是否正确！");
		}
		if(txpay.getEp()==0||txpay.getZftime()!=null){
			throw new ServiceException(2, "交易已完成！");
		}
		
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(!gcuser.getPassword3().equals(password3)){
			throw new ServiceException(3, "二级密码输入错误，请检查输入是否正确！");
		}
		if(!gcuser.getVipsq().equals(smsCode)){
			throw new ServiceException(4, "手机验证码输入错误，请检查输入是否正确！");
		}
		//重置短信码
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
		//更新订单状态
		if(!txPayDao.updateEpToHaveReceive(payId, ip)){
			throw new ServiceException(8888, "订单异常！");
		}
		//删除索引
		txPayDao.deleteIndex(payId);
		//给买方加一币
		gcuserDao.addYbForBuyInMark(txpay.getDfuser(), txpay.getPaynum());
		
		datePayDao.updateRegIdAndTxbzByQlid(txpay.getQlid(), "-"+txpay.getDfuser()+"-"+DateUtils.DateToString(new Date(), DateStyle.YYYY_MM_DD_HH_MM_SS));
		
		
		Gcuser dfuser = gcuserDao.getUser(txpay.getDfuser());
		Datepay datepay = new Datepay();
		datepay.setUsername(txpay.getDfuser());
		datepay.setRegid("认购一币-"+txpay.getPayusername()+"-"+txpay.getPaynum());
		datepay.setSyjz(txpay.getPaynum());
		datepay.setPay(dfuser.getPay());
		datepay.setJydb(dfuser.getJydb());
		datepay.setNewbz(2);
		if(txpay.getPaynum()<1000){
			datepay.setRation(0.85);
		}else{
			datepay.setRation(0.9);
		}
		datepay.setOrigintype(YbChangeType.RENGOUYB);
		datePayDao.addDatePay(datepay);
		//更新所有同名账户状态为已支付状态
		gcuserDao.updatePayOk(gcuser.getName(), gcuser.getUserid(), 0);
	}
	
	@Transactional
	public void sureIReceivedMoneyBySystem(int payId){
		Txpay txpay = txPayDao.getByPayid(payId);
		if(txpay.getEp()==0||txpay.getZftime()!=null){
			throw new ServiceException(2, "交易已完成！");
		}
		//更新订单状态
		if(!txPayDao.updateEpToHaveReceiveBySytstem(payId, "system")){
			throw new ServiceException(8888, "订单异常！");
		}
		//删除索引
		txPayDao.deleteIndex(payId);
		//给买方加一币
		gcuserDao.addYbForBuyInMark(txpay.getDfuser(), txpay.getPaynum());
		
		datePayDao.updateRegIdAndTxbzByQlid(txpay.getQlid(), "-"+txpay.getDfuser()+"-"+DateUtils.DateToString(new Date(), DateStyle.YYYY_MM_DD_HH_MM_SS));
		
		
		Gcuser dfuser = gcuserDao.getUser(txpay.getDfuser());
		Datepay datepay = new Datepay();
		datepay.setUsername(txpay.getDfuser());
		datepay.setRegid("认购一币-"+txpay.getPayusername()+"-"+txpay.getPaynum());
		datepay.setSyjz(txpay.getPaynum());
		datepay.setPay(dfuser.getPay());
		datepay.setJydb(dfuser.getJydb());
		datepay.setNewbz(2);
		
		if(txpay.getPaynum()<1000){
			datepay.setRation(0.85);
		}else{
			datepay.setRation(0.9);
		}
		datepay.setOrigintype(YbChangeType.RENGOUYB);
		datePayDao.addDatePay(datepay);
		//更新所有同名账户状态为已支付状态
//		Gcuser gcuser = gcuserDao.getUser(txpay.getPayusername());
//		gcuserDao.updatePayOk(gcuser.getName(), gcuser.getUserid(), 0);
	}
    /**
     * 购买金币卡
     * @param userName  用户名
     * @param mz        面值
     * @param gmsl      购买数量
     */
	
	private static final double[] rations = new double[]{0.1,0.03,0.01};
	private static final String[] descs = new String[]{"商家一","商家二","商家三"};
	
	@Transactional
	public void buyJb(String userName,int mz,int gmsl,String pa3){
		//需要的一币数量
		double needYbCountDouble = (double)mz*(double)gmsl*1.5;
		int needYbCount = (int)needYbCountDouble;
		//金币数量
		int jbCount = mz*gmsl;
		
		if(mz<=0||gmsl<=0){
			throw new ServiceException(2, "注意：您的一币不够本次发卡，请充值！");
		}
		
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		if(Strings.isNullOrEmpty(pa3)||!pa3.equals(gcuser.getPassword3())){
			throw new ServiceException(3, "二级密码不正确！");
		}
		
		if(gcuser.getPay()<needYbCount){
			throw new ServiceException(2, "注意：您的一币不够本次发卡，请充值！");
		}
		
		
		String d9 = gcuser.getAdd9dqu();
		String sheng = gcuser.getAddsheng();
		String shi = gcuser.getAddshi();
		String qu = gcuser.getAddqu();
		
		if(!this.changeYb(userName, -needYbCount, "一币余额购金币卡"+jbCount, 0, null,0, YbChangeType.BUYJBCARD)){
			throw new ServiceException(2, "注意：您的一币不够本次发卡，请充值！");
		}
		//更新gmdate
		gcuserDao.updateGmdate(userName, new Date());
		
		//更新3线上家
		Gcuser tempUser = gcuser;
		for(int i=0;i<rations.length;i++){
			if(tempUser!=null){
				updateUpJbAndYj(tempUser.getUp(), descs[i]+userName+"自助购卡"+jbCount, (int)(rations[i]*jbCount));
				tempUser = gcuserDao.getUser(tempUser.getUp());
			}
		}
		
		//区总上限
		Gcuser quUser = gcuserDao.getGcuserByQu(qu);
		if(quUser!=null){
			int addNum = (int)(0.01*jbCount);
			gcuserDao.updateQuPay(quUser.getUsername(),addNum);
			logService.addDlDate(quUser.getUsername(), addNum, quUser.getQupay()+addNum, "区内商家"+userName+"自助购卡"+jbCount);
		}
		//市
		Gcuser shiUser = gcuserDao.getGcuserByShi(shi);
		if(shiUser!=null){
			int addNum = (int)(0.005*jbCount);
			gcuserDao.updateShiPay(shiUser.getUsername(),addNum);
			logService.addDlDate(shiUser.getUsername(), addNum, shiUser.getShipay()+addNum, "市内商家"+userName+"自助购卡"+jbCount);
		}
		//省
		Gcuser shengUser = gcuserDao.getGcuserBySheng(sheng);
		if(shengUser!=null){
			int addNum = (int)(0.002*jbCount);
			gcuserDao.updateShengPay(shengUser.getUsername(), addNum);
			logService.addDlDate(shengUser.getUsername(), addNum, shengUser.getShengpay()+addNum, "省内商家"+userName+"自助购卡"+jbCount);
		}
		//大区
		Gcuser dquUser = gcuserDao.getGcuserByDqu9(d9);
		if(dquUser!=null){
			int addNum = (int)(0.001*jbCount);
			gcuserDao.update9QuPay(dquUser.getUsername(), addNum);
			logService.addDlDate(dquUser.getUsername(), addNum, dquUser.getDqupay()+addNum, "大区内商家"+userName+"自助购卡"+jbCount);
		}
		
		
//		lkjlDao.updatelksl(userName, gmsl);
		
		batchGeneratorEjbk(userName,gmsl,mz);
		
	}
	
	private static final char[] RANDOMCHAR = new char[]{'0','1','2','3','4','9','a','b','c','d','e','f','g','5','6','7','8','h','j','k','x','y','z','i'};
	private void batchGeneratorEjbk(String userName,int count,int value){
		value = value/10;
		List<Ejbk> list = Lists.newArrayList();
		for(int i=0;i<count;i++){
			Ejbk ejbk = new Ejbk();
			ejbk.setPdid(userName+""+RandomStringUtils.random(6,RANDOMCHAR));
			ejbk.setUp(userName);
			ejbk.setGpa(1);
			ejbk.setBf2(value);
			ejbk.setGmdate(new Date());
			list.add(ejbk);
		}
		ejbkDao.batchAdd(list);
	}
	/**
	 * 更新业绩
	 */
	private void updateUpJbAndYj(String upUserName,String desc,int count){
		gcuserDao.addWhenOtherPersionBuyJbCard(upUserName, count);
		Gcuser gcuser = gcuserDao.getUser(upUserName);
		Datepay datePay = new Datepay();
		datePay.setUsername(upUserName);
		datePay.setRegid(desc);
		datePay.setSyjz(count);
		datePay.setPay(gcuser.getPay());
		datePay.setJydb(gcuser.getJydb());
		datePay.setAbdate(new Date());
		if(desc.indexOf("激活金币卡")!=-1){
			datePay.setOrigintype(YbChangeType.ACTIVITYJBCARD);
		}else if(desc.indexOf("自助购卡")!=-1){
			datePay.setOrigintype(YbChangeType.SELFHELPBYCARD);
		}
		logService.addDatePay(datePay);
	}
	/**
	 * 查询用户金币卡列表
	 * @param upUserName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Ejbk> getEjbkPageList(String upUserName,int pageIndex,int pageSize){
		return ejbkDao.getPageList(upUserName, pageIndex, pageSize);
	}
	/**
	 * 获取单张金币卡
	 * @param pdid
	 * @return
	 */
	public Ejbk getEjbk(String pdid){
		return ejbkDao.get(pdid);
	}
	/**
	 * 更新密码
	 * @param pdid
	 * @param pdpamd5
	 * @param fwidmd5
	 * @return
	 */
	public Ejbk updateEjbk(String pdid,String userName,String pdpa,String fwid){
		Ejbk ejbk = ejbkDao.get(pdid);
		if(!ejbk.getUp().equals(userName)){
			throw new ServiceException(3000, "不是自己的金币卡，不能修复激活码！~");
		}
		String pdpamd5 = MD5Security.md5_16(pdpa).toUpperCase(); 
		String fwidmd5 = MD5Security.md5_16(fwid).toUpperCase();
		if(ejbkDao.update(pdid, pdpamd5, fwidmd5)){
			return ejbkDao.get(pdid);
		}
		return null;
	}
	/**
	 * 激活金币卡
	 * @param userName
	 * @param pdid
	 * @param pdpa
	 * @param fwid
	 * @param ip
	 */
	@Transactional
	public void activedGoldCard(String userName,String pdid,String pdpa,String fwid,String ip){
		String pdpamd5 = MD5Security.md5_16(pdpa).toUpperCase(); 
		String fwidmd5 = MD5Security.md5_16(fwid).toUpperCase();
		
		Ejbk ejbk = ejbkDao.get(pdid);
		String gmuser = "";
		Date gmdate= null;
		if(ejbk==null){
			Jbk10 jbk10 = jdbDao.getJbk10(pdid);
			if(jbk10!=null){
				if(!pdpamd5.equals(jbk10.getPdpamd5())){
					throw new ServiceException(1, "你的 登录密码 不正确，请重新输入！");
				}
				if(!fwidmd5.equals(jbk10.getFwidmd5())){
					throw new ServiceException(2, "你的 防伪编码 不正确，请重新输入！");
				}
				int cjpay=   10;
				vipgwly(userName, pdid, pdpamd5, fwidmd5, gmuser, gmdate, cjpay, ip);
				if(!jdbDao.deleteJbk10(pdid)){
					throw new ServiceException(3, "你的 消费编号 不正确或已激活过，请查正后重新输入！");
				}
			}else{
				Jbk50 jbk50 = jdbDao.getJbk50(pdid);
				if(jbk50!=null){
					if(!pdpamd5.equals(jbk50.getPdpamd5())){
						throw new ServiceException(1, "你的 登录密码 不正确，请重新输入！");
					}
					if(!fwidmd5.equals(jbk50.getFwidmd5())){
						throw new ServiceException(2, "你的 防伪编码 不正确，请重新输入！");
					}
					
					int cjpay=   50;
					vipgwly(userName, pdid, pdpamd5, fwidmd5, gmuser, gmdate, cjpay, ip);
					if(!jdbDao.deleteJbk50(pdid)){
						throw new ServiceException(3, "你的 消费编号 不正确或已激活过，请查正后重新输入！");
					}
				}else{
					Jbk100 jbk100 = jdbDao.getJbk100(pdid);
					if(jbk100!=null){
						if(!pdpamd5.equals(jbk100.getPdpamd5())){
							throw new ServiceException(1, "你的 登录密码 不正确，请重新输入！");
						}
						if(!fwidmd5.equals(jbk100.getFwidmd5())){
							throw new ServiceException(2, "你的 防伪编码 不正确，请重新输入！");
						}
						int cjpay=   100;
						vipgwly(userName, pdid, pdpamd5, fwidmd5, gmuser, gmdate, cjpay, ip);
						if(!jdbDao.deleteJbk100(pdid)){
							throw new ServiceException(3, "你的 消费编号 不正确或已激活过，请查正后重新输入！");
						}
					}else{
						Jbk300 jbk300 = jdbDao.getJbk300(pdid);
						if(jbk300!=null){
							if(!pdpamd5.equals(jbk300.getPdpamd5())){
								throw new ServiceException(1, "你的 登录密码 不正确，请重新输入！");
							}
							if(!fwidmd5.equals(jbk300.getFwidmd5())){
								throw new ServiceException(2, "你的 防伪编码 不正确，请重新输入！");
							}
							int cjpay=   300;
							vipgwly(userName, pdid, pdpamd5, fwidmd5, gmuser, gmdate, cjpay, ip);
							if(!jdbDao.deleteJbk300(pdid)){
								throw new ServiceException(3, "你的 消费编号 不正确或已激活过，请查正后重新输入！");
							}
						}else{
							Jbk500 jbk500 = jdbDao.getJbk500(pdid);
							if(jbk500!=null){
								if(!pdpamd5.equals(jbk500.getPdpamd5())){
									throw new ServiceException(1, "你的 登录密码 不正确，请重新输入！");
								}
								if(!fwidmd5.equals(jbk500.getFwidmd5())){
									throw new ServiceException(2, "你的 防伪编码 不正确，请重新输入！");
								}
								int cjpay=   500;
								vipgwly(userName, pdid, pdpamd5, fwidmd5, gmuser, gmdate, cjpay, ip);
								if(!jdbDao.deleteJbk500(pdid)){
									throw new ServiceException(3, "你的 消费编号 不正确或已激活过，请查正后重新输入！");
								}
							}else{
								throw new ServiceException(3, "你的 消费编号 不正确或已激活过，请查正后重新输入！");
							}
						}
					}
				}
			}
			
		}else{
				if(!pdpamd5.equals(ejbk.getPdpamd5())){
					throw new ServiceException(1, "你的 登录密码 不正确，请重新输入！");
				}
				if(!fwidmd5.equals(ejbk.getFwidmd5())){
					throw new ServiceException(2, "你的 防伪编码 不正确，请重新输入！");
				}
				gmuser=  ejbk.getUp();
				gmdate=    ejbk.getGmdate();
				int cjpay=      ejbk.getBf2()*10;
				vipgwly(userName, pdid, pdpamd5, fwidmd5, gmuser, gmdate, cjpay, ip);
				if(!ejbkDao.delete(pdid)){
					throw new ServiceException(3, "你的 消费编号 不正确或已激活过，请查正后重新输入！");
				}
		}
	}
	
	private void vipgwly(String userName,String pdid,String pdpa,String fwid,String gmuser,Date gmdate,int cjpay,String ip){
//		double zjgc = 0;
//		if(cjpay<1000){
//		   zjgc=0;
//		}else if(cjpay>999 && cjpay<2000){
//		   zjgc=cjpay*0.01;
//		}else if(cjpay>1999 && cjpay<3000){
//		   zjgc=cjpay*0.02;
//		}else if(cjpay>2999 && cjpay<4000){
//		   zjgc=cjpay*0.03;
//		}else if(cjpay>3999 && cjpay<5000){
//			zjgc=cjpay*0.04;
//		}else if(cjpay>4999 && cjpay<6000){
//			zjgc=cjpay*0.05;
//		}else if(cjpay>5999 && cjpay<7000){
//			zjgc=cjpay*0.06;
//		}else if(cjpay>6999 && cjpay<8000){
//			zjgc=cjpay*0.07;
//		}else if(cjpay>7999 && cjpay<9000){
//			zjgc=cjpay*0.08;
//		}else if(cjpay>8999 && cjpay<10000){
//			zjgc=cjpay*0.09;
//		}else if(cjpay>9999){
//			zjgc=cjpay*0.1;
//		}
		Datecj datecj = datecjDao.get(userName);
		int cjtj = 0;
		if(datecj!=null){
			cjtj = datecj.getLjcj();
		}
		Datecj datecjTemp = new Datecj();
		datecjTemp.setCjuser(userName);
		datecjTemp.setDqcj(cjpay);
		datecjTemp.setLjcj(cjtj);
		datecjTemp.setCjfs(pdid);
		datecjTemp.setCjdate(gmdate);
		datecjTemp.setBz(gmuser);
		datecjTemp.setIp(ip);
		datecjDao.add(datecjTemp);
		
		Gcuser user = gcuserDao.getUser(userName);
		int count = (int)(cjpay*0.03);
		
		updateUpJbAndYj(user.getUp(), "用户一"+userName+"激活金币卡"+cjpay, count);
		gcuserDao.addOnlyJB(userName, cjpay);
		user = gcuserDao.getUser(userName);
		Datepay datePay = new Datepay();
		datePay.setUsername(userName);
		datePay.setRegid("激活金币卡"+cjpay);
		datePay.setPay(user.getPay());
		datePay.setJydb(user.getJydb());
		datePay.setJyjz(cjpay);
		datePay.setAbdate(new Date());
		logService.addDatePay(datePay);
	}
	/**
	 * 积分竞猜
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gpjy> getGpjyPage(String userName,int pageIndex,int pageSize){
		return gpjyDao.getPageList(userName, pageIndex, pageSize);
	}
	
	
	public Gpjy getGpjyByjyId(int jyid){
		return gpjyDao.getByJyId(jyid);
	}
	
	public Gpjy getGpjyById(int id){
		return gpjyDao.getById(id);
	}
	
	
	@Transactional
	public int jfQg(String userName,int goodsId){
		checkJfIsOpen();
		Gcuser user = gcuserDao.getUser(userName);
		int cost = 1;
		int buyNum = 1;
		if(user.getJyg()<10||user.getJyg()<cost){
			throw new ServiceException(1, "您好，积分不足，暂时不能参与，谢谢！");
		}
		
		boolean result = jfcpDao.updateJf(goodsId, buyNum);
		if(!result){
			throw new ServiceException(2,"本轮该产品已成功被抢购，请稍候再试或联系客服进行下一轮抢购或选择其它产品！");
		}
		Jfcp jfcp =jfcpDao.get(goodsId);
		
		if(!gcuserDao.updateJyg(userName, cost)){
			throw new ServiceException(1, "您好，积分不足，暂时不能参与，谢谢！");
		}
		user = gcuserDao.getUser(userName);
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(userName);
		gpjy.setMcsl(Double.valueOf(cost));
		gpjy.setSysl(Double.valueOf(user.getJyg()));
		gpjy.setBz("抢购-"+jfcp.getCpmq());
		gpjy.setCgdate(new Date());
		gpjy.setJy(1);
		gpjy.setAbdate(new Date());
		gpjyDao.add(gpjy);
		
		if(jfcp.getDqjf()==10||jfcp.getDqjf()<21&&jfcp.getCglist()!=0){
			if(!jfcpDao.updateDqjfAndCglist(goodsId, buyNum)){
				throw new ServiceException(3000,"未知错误");
			}
		}
		
		jfcp =jfcpDao.get(goodsId);
		
		if(jfcp.getDqjf()==0||jfcp.getDqjf()<0&&jfcp.getCglist()==0){
			Cpuser cpuser = new Cpuser();
			cpuser.setCguser(userName);
			cpuser.setCpmq("jf-"+jfcp.getCpmq());
			cpuser.setJydate(new Date());
			cpuser.setJyjf(jfcp.getZjfsl());
			cpuser.setJyname(user.getName());
			cpuser.setJyqq(user.getQq());
			cpuser.setJycall(user.getCall());
			cpuserDao.add(cpuser);
			
			Gpjy gpjy2 = new Gpjy();
			gpjy.setUsername(userName);
			gpjy.setSysl(Double.valueOf(user.getJyg()));
			gpjy.setBz("抢购成功-"+jfcp.getCpmq());
			gpjy.setCgdate(new Date());
			gpjy.setJy(1);
			gpjyDao.add(gpjy2);
			
			if(!jfcpDao.updateDqjfOrCglistOrJysl(goodsId)){
				throw new ServiceException(3000,"未知错误");
			}
			return -1;
		}else{
			//throw new ServiceException(3,"您好，本次点击抢购还差一点点，还有"+jfcp.getDqep()+"就可以抢中，继续加油！！！");
			return jfcp.getDqjf();
		}
	}
	/**
	 * 金币购买积分 
	 * @param userName
	 * @param buyNum
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public void buyJf(String userName,int buyNum){
		checkJfIsOpen();
		
		Fcxt fcxt = managerService.getFcxtById(2); //查詢當前價格
		int needJb = (int)(Math.ceil(BigDecimalUtil.multiply(fcxt.getJygj(), buyNum)));
		
		if(needJb<=0){
			throw new ServiceException(2,"操作错误，金币不足，请检查输入是否正确！");
		}
		
		if (!enoughUserItem(userName, "金币", needJb)) {
			throw new ServiceException(2, "操作错误，金币不足，请检查输入是否正确！");
		}
		
		if(buyNum<5){
			throw new ServiceException(7,"买入数量至少为5个积分！");
		}
		if(buyNum>3000){
			throw new ServiceException(8,"单笔买入数量不能超过3000个积分！");
		}
		

		//自动积分买入

		double price = managerService.getCurrentyPrice();//得到當前價格
		
		int buycount = buyNum;
		Collection<GpjyIndexMc> tempList = null;
		IPage<GpjyIndexMc> page = null;
		for (int i = 0; i < 3; i++) {
			page= gpjyDao.getMcIndexList(price, i, 100);
	    	if(page!=null){
	    		tempList = page.getData();
	    		if(buycount==0){
					break;
				}
	    		if(tempList!=null&&tempList.size()>0){
	    			for (GpjyIndexMc gpjyIndexMc : tempList) {
	    				int orderId = gpjyIndexMc.getId();
	    				int buynum = (int) gpjyIndexMc.getMcsl();
	    				Gpjy gpjy = gpjyDao.getNoJyById(orderId);//查询没有交易完成的订单
	    				if(gpjy==null){
	    					continue;
	    				}
	    				if(userName.equals(gpjy.getUsername())){//不能购买自己的
	    					continue;
	    				}
	    				if(buycount==0){
	    					break;
	    				}
	    				try{
		    				//如果买入的数量大于卖出的数量,需要完结卖出订单，否则完结卖出订单，同时做相关的业务逻辑处理
		    				if(buycount>=buynum){
		    						//完结卖出订单结算
		    						buycount = proxySelf.automrJf(userName,gpjy,buycount);
		    					
		    				}else{
			    					// 减掉卖出订单数量，同时做相关的修改
			    					buycount = proxySelf.changemrJf(userName,gpjy,buycount);
		    				}
		    			}catch(ServiceException e){
		    				
						}
	    				
	    			}
	    			
	    		}else{
					break;
				}
				
			}else{
				break;
			}
		 }
		
		if(buycount<=0){
			return;
		}
		
		int needJb1 = (int)(Math.ceil(BigDecimalUtil.multiply(fcxt.getJygj(),buycount)));
		
		if(!useUserItem(userName, "金币", needJb1)){
			throw new ServiceException(2,"操作错误，金币不足，请检查输入是否正确！");
		}
		
		
//		List<Gpjy> list = this.getMcPageList(10);
//		if(list!=null&&list.size()>0){
//			for(Gpjy gpjy:list){
//				if(gcuser.getJydb()*1.0d>=gpjy.getJypay()){
//					throw new ServiceException(1,"交易市场已有积分在出售中，请按需求点击 [我要买入] ！");
//				}
//			}
//		}

		
		
		
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		Datepay datePay = new Datepay();
		datePay.setUsername(userName);
		datePay.setRegid("买入挂牌中");
		datePay.setDbjc(needJb1);
		datePay.setPay(gcuser.getPay());
		datePay.setJydb(gcuser.getJydb());
		datePay.setAbdate(new Date());
		int id = logService.addDatePay(datePay);
		
//		int id = logService.getLasterInsertId();
		
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(userName);
		gpjy.setMysl(Double.valueOf(buycount));
		gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
		gpjy.setPay(0d);//此处设置价格为0
		gpjy.setBz("买入挂牌中");
		gpjy.setJypay(Double.valueOf(needJb1));
		gpjy.setJyid(id);
		gpjy.setAbdate(new Date());
		gpjyDao.add(gpjy);
		 
	}
	
	/**
	 * 取消购买积分
	 * @param userName
	 * @param orderId
	 * @param pa3
	 */
	@Transactional
	public void cancelBuyJf(String userName,int orderId,String pa3){
		checkJfIsOpen();
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		if(!pa3.equals(gcuser.getPassword3())){
			throw new ServiceException(1,"二级密码不正确");
		}
		
		
		Gpjy gpjy1 = gpjyDao.getByJyId(orderId);
		
		if(gpjy1.getNewjy()==100){
			throw new ServiceException(3,"系统代买不能撤销！");
		}
		
		if(!gpjy1.getUsername().equals(userName)){
			throw new ServiceException(3000,"非法操作");
		}
		
		if(!gpjyDao.delete(orderId,gpjy1.getId())){
			throw new ServiceException(2,"该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！");
		}
		
		gpjyDao.deleteIndex(gpjy1.getId());
		
		
		datePayDao.updateRegIdToCancel(orderId,"已撤销");
//		Datepay datepay = datePayDao.getById(orderId);
		//返还金币
		gcuserDao.addOnlyJB(userName,gpjy1.getJypay().intValue());
		
		gcuser = gcuserDao.getUser(userName);
		Datepay datePay = new Datepay();
		datePay.setUsername(userName);
		datePay.setRegid("撤销求购积分");
		datePay.setJyjz(gpjy1.getJypay().intValue());
		datePay.setJydb(gcuser.getJydb());
		datePay.setPay(gcuser.getPay());
		datePay.setNewbz(0);
		datePay.setAbdate(new Date());
		logService.addDatePay(datePay);
	}
	public IPage<Gpjy> getAllGpjyPageList(String userName,int pageIndex,int pageSize){
		return gpjyDao.getAllPageList(userName, pageIndex, pageSize);
	}
	
	public IPage<Gpjy> getAllGpjyDetailsPageList(String userName,int pageIndex,int pageSize){
		return gpjyDao.getUserPageDetailsList(userName, pageIndex, pageSize);
	}
	
	/**
	 * 得到买入列表
	 * 
	 * */
	public IPage<Gpjy> getMrPageList(String userName,int pageIndex,int pageSize){
		return gpjyDao.getMrPageList(userName, pageIndex, pageSize);
	}
	
	public List<Gpjy> getMrPageList(int pageSize, String userName){
		
		List<Gpjy> result =  gpjyDao.getMrPage(pageSize, userName);
//		//DEBUG
//		if(result==null){
//			LogSystem.warn("求购信息的列表为null");
//		}
//		
//		if(result!=null&&result.size()==0){
//			LogSystem.warn("求购信息的列表不为Null,但其数量为0");
//		}
		Fcxt fcxt = managerService.getFcxtById(2);
		double price = fcxt.getJygj();
		if(result!=null&&result.size()>0){
			for(Gpjy gpjy:result){
				if(gpjy.getNewjy()!=GpjyChangeType.BUY_BY_SYSTEM){
					gpjy.setPay(price);
					gpjy.setMysl(Double.valueOf(gpjy.countNum(price)));
				}
			}
		}
		return result;
	}
	
	public List<Gpjy> getMcPageList(int pageSize, String userName){
		return gpjyDao.getMcPageList(pageSize, userName);
	}
	/**
	 * 卖出积分
	 * @param userName
	 * @param price
	 * @param saleNum
	 * @param passwrod3
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public void saleJf(String userName,double price,int saleNum,String passwrod3){
		checkSaleJf(userName,price,saleNum,passwrod3);
		checkJfIsOpen();
		
		
		
		
//		if(!gcuserDao.increaseStopjyg(userName,20)){
//			throw new ServiceException(8,"您好，为了提供更公平公证的交易规则，累计挂牌最高20笔，待交易完成后才可以继续发布，谢谢！");
//		}
		
		int needJb = (int)(Math.ceil(BigDecimalUtil.multiply(price,saleNum)));
		
		if(needJb<=0){
			throw new ServiceException(9,"您好，您卖出数量不能大于您剩余数量  ，谢谢！");
		}

		int saleCount = saleNum;
		// 自动积分卖出功能 开始
		double currentPrice = managerService.getCurrentyPrice(); //查詢當前價格
		if(currentPrice==price){//如果卖出价格与当前价格不等，直接创建新的交易订单
			//得到当前价格的买入列表
			int salenum1 = 0;
			Collection<GpjyIndexMr> tempList = null;
			IPage<GpjyIndexMr> page = null;
			for (int i = 0; i < 3; i++) {
				//1、得到相同所有单价的买入积分列表
				page = gpjyDao.getMrIndexList(i, 100);
				
				if(page!=null){
					tempList = page.getData();
					if(tempList!=null&&tempList.size()>0){
						if(saleCount==0){
							break ;
						}
						for (GpjyIndexMr gpjyIndexMr : tempList) {
							int orderId = gpjyIndexMr.getId();
							Gpjy gpjy = gpjyDao.getNoJyById(orderId);
							if(null==gpjy){
								continue;
							}
							if(userName.equals(gpjy.getUsername())){//自己不能卖给自己
								continue;
							}
							if(saleCount==0){
								break ;
							}
							// 重置数量和价格
							if(gpjy.getNewjy()!=GpjyChangeType.BUY_BY_SYSTEM){
								gpjy.setPay(price);
								gpjy.setMysl(Double.valueOf(gpjy.countNum(price)));
								salenum1 =  (int) (gpjy.getJypay()/currentPrice);
							}else{
								salenum1 =  (int) gpjyIndexMr.getMysl();
							}
							if(salenum1<=0){
								break;
							}
							try{
								//如果卖出的数量大于买入的数量,需要完结买入订单，否则完结卖出订单（此次交易），同时做相关的业务逻辑处理
								if(saleCount>=salenum1){
										//直接完结买入订单
										saleCount = proxySelf.automcJf(userName,gpjy,saleCount );
										
									
								}else{
										//修改订单
										saleCount = proxySelf.changemcJf(userName,gpjy,saleCount);
								}
							}catch(RuntimeException e){
							}
							
						}
						
					}else{
						break;
					}
					
				}else{
					break;
				}
			}
		
			}
		
		
		saleNum = saleCount;
		
		
		if(saleNum<=0){
			return;
		}
		
		//扣除积分
		if (!useUserItem(userName, "积分", saleNum)) {
			throw new ServiceException(9,"您好，您卖出数量不能大于您剩余数量  ，谢谢！");
		}
		
		
		int needJb1 = (int)(Math.ceil(BigDecimalUtil.multiply(price,saleNum)));
		
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		//余下挂单处理
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(userName);
		gpjy.setMcsl(Double.valueOf(saleNum));
		gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
		gpjy.setPay(price);
		gpjy.setBz("卖出挂牌中");
		gpjy.setJypay(Double.valueOf(needJb1));
		gpjy.setAbdate(new Date());
		gpjyDao.add(gpjy);
		
	}

	

	/**
	 * 检查条件
	 * @param userName
	 * @param price
	 * @param saleNum
	 * @param passwrod3
	 */
	public void checkSaleJf(String userName,double price,int saleNum,String passwrod3){
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(saleNum>3000){
			throw new ServiceException(11,"积分单笔卖出数量不能超过3000！");
		}
		
		if(gcuser.getBddate()!=null&&gcuser.getJyg()<50000&&DateUtils.getIntervalDays( new Date(),gcuser.getBddate())<100){
			throw new ServiceException(1,"未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！");
		}
		
		Sgxt sgxt = sgxtDao.get(userName);
		if(sgxt!=null){
			if(sgxt.getMqfh()>0&&sgxt.getMqfh()<sgxt.getZfh()&&sgxt.getXxnew()>0&&gcuser.getJyg()<50000){
				throw new ServiceException(2,"游戏收益未完成，积分暂时停止卖出交易，收益完成后自动开放！");
			}
			
			if(DateUtils.getIntervalDays(sgxt.getBddate(), new Date())==0){
				throw new ServiceException(3,"请于开户后第二天再进行卖出操作，谢谢！");
			}
		}
		if(Strings.isNullOrEmpty(passwrod3)){
			throw new ServiceException(4,"二级密码不正确");
		}
		if(!passwrod3.equals("-1")&&!passwrod3.equals(gcuser.getPassword3())){
			throw new ServiceException(4,"二级密码不正确");
		}
		
		Fcxt fcxt = managerService.getFcxtById(2);
		if(price<fcxt.getZdj()){
			throw new ServiceException(5,"卖出单价不能小于"+fcxt.getZdj()+" ！");
		}
		if(price > fcxt.getJygj()+0.03){
			throw new ServiceException(6,"卖出单价不能大于 "+(fcxt.getJygj()+0.03)+" 哦！");
		}
		
		if(saleNum<10){
			throw new ServiceException(7,"您好，您卖出数量不能小于10，谢谢！");
		}
//		if(gcuser.getStopjyg()>19){
//			throw new ServiceException(8,"您好，为了提供更公平公证的交易规则，累计挂牌最高20笔，待交易完成后才可以继续发布，谢谢！");
//		}
		
		if(!enoughUserItem(gcuser, "积分", (double) saleNum)){
			throw new ServiceException(9,"您好，您卖出数量不能大于您剩余数量 "+gcuser.getJyg()+" ，谢谢！");
		}
		
//		if(gcuser.getJygt1()==0){
//			List<Gpjy> list = this.getMrPageList(10);
//			if(list!=null&&list.size()>0){
//				for(Gpjy gpjy:list){
//					if(gcuser.getJyg()*1.0d>=gpjy.getMysl()){
//						throw new ServiceException(10,"交易市场已有求购信息，请按需求点击 [我要卖给] ！");
//					}
//				}
//			}
//		}
	}
	
	private void checkJfIsOpen(){
		if(AdminService.isClose){
			throw new ServiceException(1860,"系统已关闭！请稍后再操作！");
		}
	}
	/**
	 * 取消出售积分
	 * @param userName
	 * @param orderId
	 * @param pa3
	 */
	@Transactional
	public void cancelSale(String userName,int orderId,String pa3){
		throw new ServiceException(3000,"非法操作");
//		Gcuser gcuser = gcuserDao.getUser(userName);
//		checkJfIsOpen();
//		if(!pa3.equals(gcuser.getPassword3())){
//			throw new ServiceException(1,"二级密码不正确");
//		}
//		
//		Gpjy gpjy1 = gpjyDao.getById(orderId);
//		double mcsl=gpjy1.getMcsl();
//		
//		if(!gpjy1.getUsername().equals(userName)||gpjy1.getNewjy()==3){
//			throw new ServiceException(3000,"非法操作");
//		}
//		
//		if(!gcuserDao.updateJyg(userName, -(int)mcsl)){
//			throw new ServiceException(3000,"更新积分失败");
//		}
//		
//		if(!gcuserDao.resetStopjyg(userName)){
//			throw new ServiceException(3000,"更新失败");
//		}
//		
//		if(!gpjyDao.updateJy(1, orderId)){
//			throw new ServiceException(2,"该积分交易进行中或已经由它人交易成功了，不能撒消，请选择其它交易！");
//		}
//		
//		if(!gpjyDao.updateBz(orderId, "已撒单")){
//			throw new ServiceException(3000,"更新失败");
//		}
//		
//		if(!gpjyDao.updateCgdate(orderId)){
//			throw new ServiceException(3000,"更新失败");
//		}
//		
//		if(!gpjyDao.updateDqdate(orderId)){
//			throw new ServiceException(3000,"更新失败");
//		}
//		
//		gpjyDao.deleteIndex(orderId);
//		
//		gcuser = gcuserDao.getUser(userName);
//		
//		Gpjy gpjy = new Gpjy();
//		gpjy.setUsername(userName);
//		gpjy.setMysl(mcsl);
//		gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
//		gpjy.setBz("撒单成功");
//		gpjy.setCgdate(new Date());
//		gpjy.setJy(1);
//		gpjyDao.add(gpjy);
	}
	
	
	/**
	 * 修改出售价格
	 * @param userName
	 * @param id
	 * @param price
	 */
	public void editGpjy(String userName,int id,double price,String pa3){
		checkJfIsOpen();
	    Gcuser gcuser = gcuserDao.getUser(userName);
		
		if(!pa3.equals(gcuser.getPassword3())){
			throw new ServiceException(1,"二级密码不正确");
		}
		
		Gpjy gpjy1 = gpjyDao.getById(id);
		
		if(!gpjy1.getUsername().equals(userName)){
			throw new ServiceException(3000,"非法操作");
		}
		
		Fcxt fcxt = managerService.getFcxtById(2);
		
		if(price<fcxt.getZdj()){
			throw new ServiceException(4,"卖出单价不能小于"+fcxt.getZdj()+" ！");
		}
		
		if(price>gpjy1.getPay()){
			throw new ServiceException(2,"修改卖出单价不能大于原来的定价");
		}
		
		if(!gpjyDao.updatePayAndJyPay(id, price,(int)(Math.ceil(BigDecimalUtil.multiply(price,gpjy1.getMcsl()))))){
			throw new ServiceException(3,"该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！");
		}
		gpjyDao.updateIndexPay(id, price);
	}
	
	
	/**
	 * 买入积分
	 * @param userName
	 * @param id 买入积分订单id
	 */
	@Transactional
	public void mrJf(String userName,int id){
//		checkJfIsOpen();
		Gcuser gcuser = gcuserDao.getUser(userName);
		Gpjy gpjy1 = gpjyDao.getById(id);

		if (!enoughUserItem(gcuser, "金币", gpjy1.getJypay())) {
			throw new ServiceException(1, "您好，金币余额不能小于零，谢谢！");
		}

		if (!useUserItem(userName, "金币", gpjy1.getJypay().intValue())) {
			throw new ServiceException(1, "您好，金币余额不能小于零，谢谢！");
		}

		
		if (!giveUserItem(userName, "积分", gpjy1.getMcsl().intValue())) {
			throw new ServiceException(3000, "未知错误");
		}

		if (!gpjyDao.updateSaleSuccess(id, userName, "卖出成功",gpjy1.getMcsl())) {
			gpjyDao.cleanCache(id);
			throw new ServiceException(2, "该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！");
		}
		
		gpjyDao.deleteIndex(id);

		gcuser = gcuserDao.getUser(userName);
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(userName);
		gpjy.setMysl(gpjy1.getMcsl());
		gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
		gpjy.setPay(gpjy1.getPay());
		gpjy.setJypay(gpjy1.getJypay());
		gpjy.setBz("买入成功");
		gpjy.setCgdate(new Date());
		gpjy.setJy(1);
		gpjy.setDfuser(gpjy1.getUsername());
		gpjyDao.add(gpjy);

		String mcdj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();

		Datepay datePay1 = new Datepay();
		datePay1.setUsername(userName);
		datePay1.setDbjc(gpjy1.getJypay().intValue());
		datePay1.setPay(gcuser.getPay());
		datePay1.setJydb(gcuser.getJydb());
		datePay1.setRegid("买入" + gpjy1.getUsername() + "-积分" + gpjy1.getMcsl() + "-单价" + mcdj);
		datePay1.setAbdate(new Date());
		logService.addDatePay(datePay1);

		double dqpay92 = (0.9 * gpjy1.getJypay());
		int dqpay = (int) (dqpay92 * 1 + 0.1);
		double mc70a = 0.7 * dqpay;
		int mc70 = (int) (mc70a * 1 + 0.1);
		double mc30a = 0.3 * dqpay;
		int mc30 = (int) (mc30a * 1 + 0.1);

		
		giveUserItem(gpjy1.getUsername(), "一币", mc70);
		giveUserItem(gpjy1.getUsername(), "金币", mc30);
		gcuserDao.reduceStopjyg(gpjy1.getUsername());

		Gcuser gcuser2 = gcuserDao.getUser(gpjy1.getUsername());
		Datepay datePay2 = new Datepay();
		datePay2.setUsername(gpjy1.getUsername());
		datePay2.setSyjz(mc70);
		datePay2.setPay(gcuser2.getPay());
		datePay2.setJydb(gcuser2.getJydb());
		datePay2.setJyjz(mc30);
		datePay2.setRegid("卖出" + gpjy1.getMcsl() + "积分单价" + mcdj + "到" + userName);
		datePay2.setAbdate(new Date());
		datePay2.setOrigintype(YbChangeType.JF_SELL);
		logService.addDatePay(datePay2);

		fcxtDao.update(2,gpjy1.getMcsl().intValue());
		 
	}
	
	
	/**
	 * 自动买入积分（正常流程）
	 * @param userName
	 * @param gpjy 买入积分订单
	 * @return 
	 */
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor=ServiceException.class) 
	public int automrJf(String userName,Gpjy gpjy1, int buycount){
		
		Gcuser gcuser = gcuserDao.getUser(userName);
		int id= gpjy1.getId();
		
		//扣除玩家金币
		if (!useUserItem(userName, "金币", gpjy1.getJypay().intValue())) {
			throw new ServiceException(2,"金币不足，请检查输入是否正确！");
		}

		//获得积分
		if (!giveUserItem(userName, "积分", gpjy1.getMcsl().intValue())) {
			throw new ServiceException(3000, "未知错误");
		}

		if (!gpjyDao.updateSaleSuccess(id, userName, "卖出成功",gpjy1.getMcsl())) {
			gpjyDao.cleanCache(id);
			throw new ServiceException(3000, "未知错误");
		}
		
		
		gpjyDao.deleteIndex(id);

		gcuser = gcuserDao.getUser(userName);
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(userName);
		gpjy.setMysl(gpjy1.getMcsl());
		gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
		gpjy.setPay(gpjy1.getPay());
		gpjy.setJypay(gpjy1.getJypay());
		gpjy.setBz("买入成功");
		gpjy.setCgdate(new Date());
		gpjy.setJy(1);
		gpjy.setDfuser(gpjy1.getUsername());
		gpjyDao.add(gpjy);

		String mcdj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();

		Datepay datePay1 = new Datepay();
		datePay1.setUsername(userName);
		datePay1.setDbjc(gpjy1.getJypay().intValue());
		datePay1.setPay(gcuser.getPay());
		datePay1.setJydb(gcuser.getJydb());
		datePay1.setRegid("买入" + gpjy1.getUsername() + "-积分" + gpjy1.getMcsl() + "-单价" + mcdj);
		datePay1.setAbdate(new Date());
		logService.addDatePay(datePay1);

		double dqpay92 = (0.9 * gpjy1.getJypay());
		int dqpay = (int) (dqpay92 * 1 + 0.1);
		double mc70a = 0.7 * dqpay;
		int mc70 = (int) (mc70a * 1 + 0.1);
		double mc30a = 0.3 * dqpay;
		int mc30 = (int) (mc30a * 1 + 0.1);

		if (!giveUserItem(gpjy1.getUsername(),"一币", mc70)){
			throw new ServiceException(3000, "未知错误");
		};
		if(!giveUserItem(gpjy1.getUsername(),"金币", mc30)){
			throw new ServiceException(3000, "未知错误");
		};
		if(!gcuserDao.reduceStopjyg(gpjy1.getUsername())){
			throw new ServiceException(3000, "未知错误");
		};

		Gcuser gcuser2 = gcuserDao.getUser(gpjy1.getUsername());
		Datepay datePay2 = new Datepay();
		datePay2.setUsername(gpjy1.getUsername());
		datePay2.setSyjz(mc70);
		datePay2.setPay(gcuser2.getPay());
		datePay2.setJydb(gcuser2.getJydb());
		datePay2.setJyjz(mc30);
		datePay2.setRegid("卖出" + gpjy1.getMcsl() + "积分单价" + mcdj + "到" + userName);
		datePay2.setAbdate(new Date());
		datePay2.setOrigintype(YbChangeType.JF_SELL);
		logService.addDatePay(datePay2);

		fcxtDao.update(2,gpjy1.getMcsl().intValue());
		
		return buycount - gpjy1.getMcsl().intValue();
		 
	}

	/**
	 * 賣出積分
	 * @param userName
	 * @param id
	 */
	@Transactional
	public void mcJf(String userName,int id,String pa3){
//		checkJfIsOpen();
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		if(!gcuser.getName().equals("公司")&&!gcuser.getPassword3().equals(pa3)){
			throw new ServiceException(4,"二级密码不正确！");
		}
		
		
		
		Gpjy gpjy1 = gpjyDao.getById(id);
		
		//重置数量和价格
		Fcxt fcxt = managerService.getFcxtById(2);
		double price = fcxt.getJygj();
		if(gpjy1.getNewjy()!=GpjyChangeType.BUY_BY_SYSTEM){
			gpjy1.setPay(price);
			gpjy1.setMysl(Double.valueOf(gpjy1.countNum(price)));
		}
		
		double dqpay92 = (0.9 * gpjy1.getJypay());
		int dqpay = (int) (dqpay92 * 1 + 0.1);
		double mc70a = 0.7 * dqpay;
		int mc70 = (int) (mc70a * 1 + 0.1);
		double mc30a = 0.3 * dqpay;
		int mc30 = (int) (mc30a * 1 + 0.1);

		if (!enoughUserItem(gcuser, "积分", gpjy1.getMysl())) {
			throw new ServiceException(1,
					"您好，本次交易积分数量大于您剩余交易积分数量 " + gcuser.getJyg() + " ，暂时不能交易，本次交易需要 " + gpjy1.getMysl() + " 积分，谢谢！");
		}

		if (!useUserItem(userName, "积分", gpjy1.getMysl().intValue())) {
			throw new ServiceException(1,
					"您好，本次交易积分数量大于您剩余交易积分数量 " + gcuser.getJyg() + " ，暂时不能交易，本次交易需要 " + gpjy1.getMysl() + " 积分，谢谢！");
		}

		giveUserItem(userName, "一币", mc70);
		giveUserItem(userName, "金币", mc30);
		
		giveUserItem(gpjy1.getUsername(), "积分", gpjy1.getMysl().intValue());
        Gcuser dfuser = gcuserDao.getUser(gpjy1.getUsername());
		if (!gpjyDao.updateBuySuccess(id, userName, "买入成功",dfuser.getJyg(),gpjy1.getPay(),gpjy1.getMysl(),gpjy1.getJypay())) {
			gpjyDao.cleanCache(id);
			throw new ServiceException(2, "该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！");
		}
		gpjyDao.deleteIndex(id);
		
		if(gcuser.getBddate()!=null&&gcuser.getJyg()<50000&&DateUtils.getIntervalDays( new Date(),gcuser.getBddate())<100){
			throw new ServiceException(3,"未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！");
		}

		gcuser = gcuserDao.getUser(userName);
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(userName);
		gpjy.setMcsl(gpjy1.getMysl());
		gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
		gpjy.setPay(gpjy1.getPay());
		gpjy.setJypay(gpjy1.getJypay());
		gpjy.setAbdate(gpjy1.getAbdate());
		gpjy.setBz("卖出成功");
		gpjy.setCgdate(new Date());
		gpjy.setJy(1);
		gpjy.setDfuser(gpjy1.getUsername());
		gpjyDao.add(gpjy);

		String mydj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();

		Datepay datePay1 = new Datepay();
		datePay1.setUsername(userName);
		datePay1.setSyjz(mc70);
		datePay1.setPay(gcuser.getPay());
		datePay1.setJydb(gcuser.getJydb());
		datePay1.setJyjz(mc30);
		datePay1.setRegid("卖出" + gpjy1.getMysl() + "积分单价" + mydj + "到" + gpjy1.getUsername());
		datePay1.setAbdate(new Date());
		datePay1.setOrigintype(YbChangeType.JF_SELL);
		logService.addDatePay(datePay1);
		String d = DateUtils.DateToString(gpjy1.getCgdate(), DateStyle.YYYY_MM_DD_HH_MM_SS);
		String dStr = d==null?"":d;
		logService.updateRegId(gpjy1.getJyid(), dStr+"支出成功到" + userName + "-积分" + gpjy1.getMysl() + "-单价" + mydj);
		fcxtDao.update(2, gpjy1.getMysl().intValue());
			 
	}
	
//    private String shpa;
//	
//	private int sfpay;
//	
//	private String pay10;
//	//需要支付的一币数目
//	private int ybpay;
//	//支付的用户名
//	private String user;
//	//密码
//	private String pa01;
//    //用户二级密码	
//	private String pa02;
//	//手机校验码
//	private String sfcode;
	
	@Transactional
	public void transferYbToShop(String userName,String shpa,int sfpay,String pay10,int ybpay,String user,String pa01,String pa02,String sfcode){
		
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		if(gcuser.getJb()!=5){
//			super.setErroCodeNum(1);//alert('非商户用户名，请联系管理员！');
//			return SUCCESS;
			throw new ServiceException(1, "");
		}
		
		if(Strings.isNullOrEmpty(shpa)||!shpa.equals(gcuser.getPassword3())){
//			super.setErroCodeNum(2);//alert('输入的商户二级密码不正确，请检查输入是否正确！');
//			return SUCCESS;
			throw new ServiceException(2, "");
		}
		
		if(ybpay<=0){
//			super.setErroCodeNum(3);//alert('订单信息有误，请重新提交！');
//			return SUCCESS;
			throw new ServiceException(3, "");
		}
		
		Gcuser beReduceUser = gcuserDao.getUser(user);
		if(beReduceUser==null){
//			super.setErroCodeNum(4);//alert('输入的用户名不存在，请检查输入是否正确！');
//			return SUCCESS;
			throw new ServiceException(4, "");
		}
		
		if(Strings.isNullOrEmpty(pa01)||!MD5Security.md5_16(pa01).equals(beReduceUser.getPassword())){
//			super.setErroCodeNum(5);//alert('输入的登录密码不正确，请检查输入是否正确！');
//			return SUCCESS;
			throw new ServiceException(5, "");
		}
		
		if(Strings.isNullOrEmpty(pa02)||!pa02.equals(beReduceUser.getPassword3())){
//			super.setErroCodeNum(6);//alert('输入的二级密码不正确，请检查输入是否正确！');
//			return SUCCESS;
			throw new ServiceException(6, "");
		}
		
		if(beReduceUser.getPay()<ybpay){
//			super.setErroCodeNum(7);//alert('您的一币余额不足，请检查输入是否正确！');
//			return SUCCESS;
			throw new ServiceException(7, "");
		}
		
		if(!beReduceUser.getVipsq().equals(sfcode)){
//			super.setErroCodeNum(8);//alert('您好，手机验证码不正确，请重新输入！');
//			return SUCCESS;
			throw new ServiceException(8, "");
		}
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
		//减一币
		if(!this.changeYb(user, -ybpay,gcuser.getName(),12,null,0, YbChangeType.SHANGHUUSE)){
//			super.setErroCodeNum(7);//alert('您的一币余额不足，请检查输入是否正确！');
//			return SUCCESS;
			throw new ServiceException(7, "");
		}
		//加一币
		if(!this.changeYb(gcuser.getUsername(), ybpay,gcuser.getName()+"-"+beReduceUser.getName(),5,null,0,YbChangeType.SHANGHUHUODE)){
//			super.setErroCodeNum(9);//alert('未知错误');
//			return SUCCESS;
			throw new ServiceException(9, "");
		}
	}
	/**
	 * 发送短信验证马
	 */
	private static final char[] chars = new char[]{'0','1','2','3','4','5','6','7','8','9'};
	public void sendSmsMsg(String userName){
		Gcuser gcuser = gcuserDao.getUser(userName);
		UserProperty p = userPropertyDao.getPorpertyByName(userName);
		if(p!=null&&p.getRegion_code()!=86){
			LogSystem.warn("因为是国外号码，不发送通知短信"+userName);
			return;
		}
		Map<String,String> param = new HashMap<String,String>();
		String randomString = RandomStringUtils.random(6, chars);
		param.put("code", randomString);
		if(gcuserDao.updateSmsCode(userName, randomString)){
			    try {
			    	if(!SubMsgSendUtils.sendMessage(gcuser.getCall(), "aGTtt3", param)){
			    		throw new ServiceException(3000, "发送短信发生错误,更新错误");
			    	}
				} catch (Exception e) {
					LogSystem.error(e, "发送短信发生错误，phone="+gcuser.getCall()+",userName="+gcuser.getUsername()+"");
					throw new ServiceException(3000, "发送短信发生错误，phone="+gcuser.getCall()+",userName="+gcuser.getUsername()+",");
				}
				
		}else{
			throw new ServiceException(3000, "发送短信发生错误,更新错误");
		}
	}
	                                                       
//	private static final String[] smsCode = new String[]{"WKkt32","BlQ9X","R630D1"};
	private static final String[] smsCode = new String[]{"T2j2u8","O4hH6w","5X0S2l"};
	public void sendYbSaleSmsMsg(String userName,int code){
		Gcuser gcuser = gcuserDao.getUser(userName);
		UserProperty p = userPropertyDao.getPorpertyByName(userName);
		if(p!=null&&p.getRegion_code()!=86){
			LogSystem.warn("因为是国外号码，不发送通知短信"+userName);
			return;
		}
			    try {
			    	Map<String,String> param = new HashMap<String,String>();
			    	param.put("userName", userName);
			    	if(!SubMsgSendUtils.sendMessage(gcuser.getCall(), smsCode[code], param)){
			    		throw new ServiceException(3000, "发送短信发生错误,更新错误");
			    	}
				} catch (Exception e) {
					LogSystem.error(e, "发送短信发生错误，phone="+gcuser.getCall()+",userName="+gcuser.getUsername()+"");
					throw new ServiceException(3000, "发送短信发生错误，phone="+gcuser.getCall()+",userName="+gcuser.getUsername()+",");
				}
	}
	/**
	 * 开户后进行短信通知
	 * @param userName
	 * @param numStr
	 */
	public void sendBdSmsMsg(String userName,String numStr){
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser==null){
			LogSystem.warn("发送短信时用户找不到,="+userName);
			return;
		}
		UserProperty p = userPropertyDao.getPorpertyByName(userName);
		if(p!=null&&p.getRegion_code()!=86){
			LogSystem.warn("因为是国外号码，不发送通知短信"+userName);
			return;
		}
		String name = "";
		if(!Strings.isNullOrEmpty(gcuser.getName())){
			name = gcuser.getName().substring(0, 1);
		}
		String date = DateUtils.DateToString(new Date(), DateStyle.YYYY_MM_DD_EN);
		Map<String,String> param = new HashMap<String,String>();
		param.put("name", name);
		param.put("numStr", numStr);
		param.put("userName", userName);
		param.put("date", date);
			    try {
			    	if(!SubMsgSendUtils.sendMessage(gcuser.getCall(), "sUb981",param)){
//			    		throw new ServiceException(3000, "发送短信发生错误,更新错误");
			    		LogSystem.warn("发送短信发生错误,更新错误"+userName+",call="+gcuser.getCall());
			    	}
				} catch (Exception e) {
					LogSystem.error(e, "发送短信发生错误，phone="+gcuser.getCall()+",userName="+gcuser.getUsername()+"");
//					throw new ServiceException(3000, "发送短信发生错误，phone="+gcuser.getCall()+",userName="+gcuser.getUsername()+",");
				}
	}
	
	/**
	 * 短信模板2
	 * @param userName
	 * @param op  777不用发送到玩家手机上
	 */        //                            0      1       2     3      4        5     6      7       8      9        10      11      12		13		14			15
	private String[] OP_STR = new String[]{"更新资料","修改资料","开户","卖一币","确认收款","卖积分","购金币","商城消费","换购","话费的充值","票务消费","商户消费","活动报名","重置密码","账号绑定","设置或修改支付密码"};
	public void sendSmsMsg(String userName,int op){
		Gcuser gcuser = gcuserDao.getUser(userName);
		String randomString = RandomStringUtils.random(6, chars);
		UserProperty p = userPropertyDao.getPorpertyByName(userName);
		if(p==null||p.getRegion_code()==86){
			Map<String,String> param = new HashMap<String,String>();
			param.put("code", randomString);
			param.put("userName", userName);
			param.put("op", OP_STR.length>op?OP_STR[op]:"");
			if(gcuserDao.updateSmsCode(userName, randomString)){
					if(op==777){
						return ;
					}
				    try {
				    	if(!SubMsgSendUtils.sendMessage(gcuser.getCall(), "NFgnN3", param)){
				    		throw new ServiceException(3000, "发送短信发生错误,更新错误");
				    	}
					} catch (Exception e) {
						LogSystem.error(e, "发送短信发生错误，phone="+gcuser.getCall()+",userName="+gcuser.getUsername()+"");
						throw new ServiceException(3000, "发送短信发生错误，phone="+gcuser.getCall()+",userName="+gcuser.getUsername()+",");
					}
					
			}else{
				throw new ServiceException(3000, "发送短信发生错误,更新错误");
			}
		}else{
            Map<String,String> param = new HashMap<String,String>();
			param.put("code", randomString);
			if(gcuserDao.updateSmsCode(userName, randomString)){
				if(op==777){
					return ;
				}
				    try {
				    	if(!SubMsgSendUtils.sendInternationalMessage(p.getRegion_code()+"", gcuser.getCall(), "742m76", param)){
				    		throw new ServiceException(3000, "发送短信发生错误,更新错误");
				    	}
					} catch (Exception e) {
						LogSystem.error(e, "发送短信发生错误，phone="+p.getRegion_code()+gcuser.getCall()+",userName="+gcuser.getUsername()+"");
						throw new ServiceException(3000, "发送短信发生错误，phone="+p.getRegion_code()+gcuser.getCall()+",userName="+gcuser.getUsername()+",");
					}
					
			}else{
				throw new ServiceException(3000, "发送短信发生错误,更新错误");
			}
		}
	}
	
	
	/**
	 * 查询所有玩家分页列表
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcuser> getUserPageList(int pageIndex,int pageSize){
		return gcuserDao.getPageList(pageIndex, pageSize);
	}
	
	public IPage<Sgxt> getSgxtPageList(int pageIndex,int pageSize){
		return sgxtDao.getPageList(pageIndex, pageSize);
	}
	
	public IPage<Vipcjgl> getVipcjbPageList(String userName,int pageIndex,int pageSize){
		return vipcjglDao.getPageList(pageIndex, pageSize, "order by cjid desc", new SqlParamBean("vipuser", userName));
	}
	

	public IPage<Vipcjgl> getVipcjbPageList(String userName,int pageIndex,int pageSize,String startTime,String endTime){
		return vipcjglDao.getVipcjglPageList(userName, startTime, endTime, pageSize, pageIndex);
	}
	
	
	public List<Vipcjgl> getVipcjbList(String userName,String startTime,String endTime){
		return vipcjglDao.getVipcjglList(userName, startTime, endTime);
	}
	/**
	 * vip用户给下属充值
	 * @param fromUser
	 * @param toUser
	 * @param amount
	 * @param password
	 */
	@Transactional
	public void vipCj(String fromUserName,String toUserName,int amount,String password){
		if(zuoMingxiDao.get(fromUserName, toUserName)==null&&youMingXiDao.get(fromUserName, toUserName)==null){
			throw new ServiceException(1, "用户名输入错误或不属于自己团队的玩家，请检查后再试！");
		}
        if(!password.equals("xyhk655ss")){
			throw new ServiceException(2, "充值密码不正确！");
		}
        if(amount<0){
        	throw new ServiceException(3, "该用户名不存在，请检查输入是否正确！");
        }
		Gcuser toUser = gcuserDao.getUser(toUserName);
		if(toUser==null){
			throw new ServiceException(3, "该用户名不存在，请检查输入是否正确！");
		}
		if(toUser.getGmdate()!=null&&toUser.getGmdate().getTime()+2*60*1000>System.currentTimeMillis()){
			throw new ServiceException(4, "两分钟内只能充值一次，请稍后再试！");
		}
		Gcuser fromUser = gcuserDao.getUser(fromUserName);
		if(fromUser.getVipcjcjb()<amount){
			throw new ServiceException(5, "您的充值币小于"+amount+"，无法完成充值，请联系管理员！！");
		}
		if(toUser.getPay()<9*amount){
			throw new ServiceException(6, "本次充值"+amount+"可一币小于"+9*amount+"，请先补充一币！");
		}
		
		if(!gcuserDao.reduceVipcjcjb(fromUserName, amount)){
			throw new ServiceException(5, "您的充值币小于"+amount+"，无法完成充值，请联系管理员！！");
		}
		gcuserDao.updateCjtj(toUserName, amount);
		
		Vipcjgl vipcjgl = new Vipcjgl();
		vipcjgl.setCjuser(toUserName);
		vipcjgl.setCjjo(amount);
		vipcjgl.setSycjb(fromUser.getVipcjcjb()-amount);
		vipcjgl.setVipuser(fromUserName);
		vipcjgl.setBz("充值");
		vipcjgl.setCjdate(new Date());
		vipcjglDao.add(vipcjgl);
		
		if(!this.changeYb(toUserName, -9*amount, "转为报单币v", 0, null,0,YbChangeType.VIPDOWNRECHARGE)){
			throw new ServiceException(6, "本次充值"+amount+"可一币小于"+9*amount+"，请先补充一币！");
		}
		this.updateSybdb(toUserName, amount*10, "充值"+amount+"与一币"+9*amount+"生效v",0);
	}
	/**
	 * 获取一币支付订单信息
	 * @param userName
	 * @param regId
	 * @return
	 */
	public Datepay getHgybOrder(String userName,String regId){
		return datePayDao.getDatepayByUserNameAndRegid(userName, regId);
	}
	/**
	 * yb支付
	 * @param userName
	 * @param ybsl
	 * @param fee
	 * @param gwuser
	 * @param hgcode
	 * @param pa3
	 * @param gwno
	 * @param gwid
	 */
	@Transactional
	public void hgybOk(String userName,int ybsl,int fee,String gwuser,String hgcode,String pa3,String gwno,String gwid){
		if(!userName.equals(gwuser)){
			throw new ServiceException(1, "您好，该订单不是当前登录用户名提交，请重新登录，谢谢！");
		}
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser.getPay()<ybsl||ybsl<=0){
			throw new ServiceException(2, "一币不够！");
		}
		Datepay datepay = getHgybOrder(userName, "换购-"+gwno);
		if(datepay!=null){
			throw new ServiceException(3, "订单已处理 ！");
		}
		if(!gcuser.getPassword3().equals(pa3)){
			throw new ServiceException(4, "您好，二级密码不正确，请重新输入！");
		}
		if(!hgcode.equals(gcuser.getVipsq())){
			throw new ServiceException(5, "手机验证码不正确");
		}
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
		if(!this.changeYb(userName, -ybsl, "换购-"+gwno, 4, null,0,YbChangeType.HUANGOU)){
			throw new ServiceException(2, "一币不够！");
		}
	}
	/**
	 * 商城回调
	 * @param ybsl
	 * @param fee
	 * @param sjuser
	 * @param gwno
	 * @param gwid
	 */
	public void hgybSh(int ybsl,int fee,String sjuser,String gwno,String gwid){
		ybsl = (int)(ybsl*0.98);
		if(ybsl<=0){
			throw new ServiceException(6, "订单信息有误，请重新提交！");
		}
		Gcuser gcuser = gcuserDao.getUser(sjuser);
		if(gcuser==null){
			throw new ServiceException(7, "商家用户名不存在，请检查后再试！");
		}
		this.changeYb(sjuser, ybsl, "商品交易-"+gwno, 5, null,0,YbChangeType.MALLHUODE);
	}
	/**
	 * 新商城支付通道
	 * @param gwpay
	 * @param pa01
	 * @param pid
	 * @param ybf
	 * @param user
	 * @param order
	 * @param pa02
	 */
	private static final String SALE_RATION_USER = "zxz888";//卖家收税的账户
	private static final String BUY_RATION_USER = "300fhk";//买家收税的账户
	private static final String SHOPP_USER = "zxz888a";//实际到账账户
	@Transactional
	public String ybpay(int ybsl,String pa01,int pid,String ybf,String user,String order, String pa02,String hgcode,int scores,String ybstr){
		
		if(ybsl<=0&&scores<=0){
			throw new ServiceException(2, "订单信息有误，请重新提交！");
		}
		
		if(ybsl<0||scores<0){
			throw new ServiceException(2, "订单信息有误，请重新提交！");
		}
		
		String paylb;
		List<ShopBean> list = null;
		if(pid==1){
			 paylb="购物-"+order;
             list = this.countPay(ybstr);
		}else{
			   paylb="充值-"+order;
		}
		Gcuser gcuser = gcuserDao.getUser(user);
		if(gcuser==null){
			throw new ServiceException(3, "输入的用户名不存在，请检查输入是否正确！");
		}
		if(!MD5Security.md5_16(pa01).equals(gcuser.getPassword())){
			throw new ServiceException(4, "输入的登录密码不正确，请检查输入是否正确！");
		}
		if(!gcuser.getPassword3().equals(pa02)){
			throw new ServiceException(5, "输入的二级密码不正确，请检查输入是否正确！");
		}
		if(gcuser.getPay()<ybsl){
			throw new ServiceException(6, "您的一币余额不足，请检查输入是否正确！");
		}
		if(!hgcode.equals(gcuser.getVipsq())){
			throw new ServiceException(7, "手机验证码不正确");
		}
		if(scores>0){
			//判断是否重复处理订单
			UserScoresLog log = userScoresLogDao.get(new SqlParamBean("user_name", user),new SqlParamBean("and", "param", order));
			if(log!=null){
				throw new ServiceException(1, "订单重复提交！order="+order+",username="+user);
			}
			if(!this.changeScores(user, -scores,ScoresChangeType.MALL_BUY,0,"0",order,order)){
				throw new ServiceException(9, "您的购物卷余额不足，请检查输入是否正确！");
			}
		}
		if(ybsl>0){
			if(!this.changeYb(user, -ybsl, paylb, 10, null,0,YbChangeType.MALLPAY)){
				throw new ServiceException(6, "您的一币余额不足，请检查输入是否正确！");
			}
		}
		gcuserDao.updateSmsCode(user, Global.INIT_SMS_CODE);
		
		//处理给商户加一币和购物卷
		StringBuffer resultStr = new StringBuffer();
		int tempScores = scores;
		int i=0;
		if(pid==1&&list!=null){//给商家加购物券或
			for(ShopBean shopBean:list){
				
				Gcuser shop = gcuserDao.getUser(shopBean.getShopper());
				if(shop==null||shop.getTxlb()!=3){
					throw new ServiceException(10, "商家不是商户--》"+shopBean.getShopper()); 
				}
				
				int addScores = 0;
				int addYb = 0;
                if(shopBean.getScoresValue()>0){
					if(tempScores>=shopBean.getScoresValue()){//可分配的购物券大于等于需要减的购物卷
						addScores = shopBean.getScoresValue();  //直接加相应数量的购物券
						tempScores = tempScores - shopBean.getScoresValue();//可分配的购物券减少
						addYb = shopBean.getYbValue();//加相应多的一币数量
					}else{//可分配的购物券  小于需要加的购物券 
						addScores = tempScores;//加完可分配的购物券
						
						addYb = shopBean.getYbValue()+shopBean.getScoresValue()-tempScores;//需要加的一币等于  需要加的一币+购物券折算成的一币
						tempScores = 0;//可分配的购物券已用完
					}
				}else{
					addYb = shopBean.getYbValue();
					addScores = 0;
				}
                
                
                int orderYb = 0;
                int orderScores = 0;
                if(addScores>0){
                	//分为2部分  zxz888收税   zxz888a收大头
                	int rationScoresNum = (int)(addScores*0.02);//缴纳的税收额
                	int otherScoresNum = addScores;//成本购物券
                	
                	if(rationScoresNum>0){
	                	if(!this.changeScores(BUY_RATION_USER, rationScoresNum,ScoresChangeType.MALL_RATION_ADD,0,user,"购物"+shopBean.getShopperOrder(),shopBean.getShopperOrder())){
	                		throw new ServiceException(3000, "商户不存在"+BUY_RATION_USER);
	                	}
                	}
                	
                	if(otherScoresNum>0){
                		//如果商户是zxz888那么直接进该商家账户  不进入中转站
                		if(shopBean.getShopper().equals("zxz888")){
                			if(!this.changeScores("zxz888", otherScoresNum,ScoresChangeType.MALL_SALE,0,user,"购物"+shopBean.getShopperOrder(),shopBean.getShopperOrder())){
                        		throw new ServiceException(3000, "商户不存在"+SHOPP_USER);
                        	}
                		}else{
                			if(!this.changeScores(SHOPP_USER, otherScoresNum,ScoresChangeType.MALL_TEMP_ADD,0,user,"购物"+shopBean.getShopperOrder(),shopBean.getShopperOrder())){
                        		throw new ServiceException(3000, "商户不存在"+SHOPP_USER);
                        	}
                		}
                	}
                	
                	orderScores = otherScoresNum;
//        			if(!this.changeScores(shopBean.getShopper(), addScores,ScoresChangeType.MALL_SALE,0,user,order)){
//        				throw new ServiceException(3000, "商户不存在"+shopBean.getShopper());
//        			}
        		}
        		if(addYb>0){
                	int buyRationYbNum = (int)(addYb*0.02);//买家缴纳的税收
                	int otherYbNum = addYb - buyRationYbNum;//成本一币  买家税已从买家账户扣了  则不用再从卖家所得中获取了
        			
        			if(!this.changeYb(BUY_RATION_USER, buyRationYbNum, "购物"+shopBean.getShopperOrder()+"-买家手续费", YbChangeType.MALL_BUY_RATION, null,0,YbChangeType.MALL_BUY_TAX_300FHK)){
    				   throw new ServiceException(3000, "商户不存在"+BUY_RATION_USER);
    			    }
        			//如果商户是zxz888那么直接进该商家账户  不进入中转站
        			if(shopBean.getShopper().equals("zxz888")){
        				if(!this.changeYb(shopBean.getShopper(), addYb, shopBean.getShopperOrder()+"-商场卖出商品", YbChangeType.SHOP_SALE_ADD_SELF, null,0, YbChangeType.SHOP_SALE_ADD_SELF)){
        					   throw new ServiceException(3000, "商户不存在"+shopBean.getShopper());
        				  }
        				orderYb  = addYb;
        			}else{
	        			if(!this.changeYb(SALE_RATION_USER, buyRationYbNum, "购物"+shopBean.getShopperOrder()+"-卖家手续费", YbChangeType.MALL_SALE_RATION, null,0,YbChangeType.MALL_ZXZ888)){
	     				   throw new ServiceException(3000, "商户不存在"+SALE_RATION_USER);
	     			    }
	        			if(!this.changeYb(SHOPP_USER, otherYbNum, "购物"+shopBean.getShopperOrder()+"-临时存放", YbChangeType.SHOP_TEMP, null,0,YbChangeType.MALL_ZXZ888A)){
	      				   throw new ServiceException(3000, "商户不存在"+SHOPP_USER);
	      			    }
	//        			if(!this.changeYb(shopBean.getShopper(), addYb, paylb, 101, null,0)){
	//        				throw new ServiceException(3000, "商户不存在"+shopBean.getShopper());
	//        			}
	        			orderYb = otherYbNum;
        			}
        			
        		}
        		
        		MallOrder mallOrder = new MallOrder(shopBean.getShopperOrder(), shopBean.getShopper(), orderYb, orderScores, 0, new Date());
        		if(shopBean.getShopper().equals("zxz888")){
        			mallOrder.setStatus(1);
        			mallOrder.setUpdatedTime(new Date());
        		}
        		mallOrderDao.add(mallOrder);
                if(i==0){
                	resultStr.append(shopBean.getShopperOrder()+":"+addScores+":"+addYb);
                }else{
                	resultStr.append("|"+shopBean.getShopperOrder()+":"+addScores+":"+addYb);
                }
				i++;
				
			}
		}
		return resultStr.toString();
	}
	
	@Transactional
	public void dealMallOrder(String orders){
		if(Strings.isNullOrEmpty(orders)){
			throw new ServiceException(3000,"订单号为空");
		}
		
		String[] orderArray = orders.split(":");
		for(String order:orderArray){
			MallOrder mallOrder = mallOrderDao.get(new SqlParamBean("order_id", order));
			if(mallOrder!=null&&mallOrder.getStatus()==0){
				if(!mallOrderDao.updateToSuccess(mallOrder.getOrderId())){
					throw new ServiceException(1, "不存在的订单号,或重复处理！"+mallOrder.getOrderId());
				}
				if(mallOrder.getOrderYb()>0){
        			if(!this.changeYb(SHOPP_USER, -mallOrder.getOrderYb(), mallOrder.getOrderId()+"-卖出商品付款给商家-"+mallOrder.getOrderUser(), YbChangeType.SHOP_TEMP_REDUCE, null,0,YbChangeType.MALL_ZXZ888A_USE)){
       				   throw new ServiceException(3000, "商户不存在"+SHOPP_USER);
       			    }
					if(!this.changeYb(mallOrder.getOrderUser(), mallOrder.getOrderYb(), mallOrder.getOrderId()+"-商场卖出商品", YbChangeType.SHOP_SALE_ADD, null,0,YbChangeType.MALL_SALEHUODE)){
		   				   throw new ServiceException(3000, "商户不存在"+mallOrder.getOrderUser());
		   			}
				}
				
				if(mallOrder.getOrderScores()>0){
					if(!this.changeScores(SHOPP_USER, -mallOrder.getOrderScores(),ScoresChangeType.MALL_TEMP_ADD_REDUCE,0,mallOrder.getOrderUser(),mallOrder.getOrderId(),mallOrder.getOrderId())){
                		throw new ServiceException(3000, "商户不存在"+SHOPP_USER);
                	}
					if(!this.changeScores(mallOrder.getOrderUser(),mallOrder.getOrderScores(),ScoresChangeType.MALL_SALE,0,SHOPP_USER,mallOrder.getOrderId(),mallOrder.getOrderId())){
                		throw new ServiceException(3000, "商户不存在"+mallOrder.getOrderUser());
                	}
				}
			}else{
//				 throw new ServiceException(1, "不存在的订单号,或重复处理！"+mallOrder.getOrderId());
			}
		}
	}
	/**
	 * 商城支付字符串
	 * @param ybstr
	 * @return
	 */
   public List<ShopBean> countPay(String ybstr){
	   List<ShopBean>  result = Lists.newArrayList();
	   String[] strArray = ybstr.split("\\|");
		 for(String strtemp:strArray){
			 String[] tempArray = strtemp.split(":");
			 if(tempArray.length!=4){
				 throw new ServiceException(100, "订单信息有误，请重新提交！");
			 }
			 ShopBean tempShopper = new ShopBean();
			 tempShopper.setShopperOrder(tempArray[0]);
			 tempShopper.setShopper(tempArray[1]);
			 tempShopper.setScoresValue(Integer.valueOf(tempArray[2]));
			 tempShopper.setYbValue(Integer.valueOf(tempArray[3]));
			 result.add(tempShopper);
		 }
		 return result;
	}
	
	/**
	 * 机票支付通道
	 * @param gwpay
	 * @param pa01
	 * @param pid
	 * @param ybf
	 * @param user
	 * @param order
	 * @param pa02
	 */
	@Transactional
	public int kypwe(double gwpay,String pa01,int pid,String ybf,String user,String order, String pa02,String hgcode){
		int ybsl = (int)(gwpay*1.02);
		if(ybsl<=0){
			throw new ServiceException(2, "订单信息有误，请重新提交！");
		}
		String paylb;
		if(pid==1){
			 paylb="票务支付-"+order;
		}	else{
			   paylb="票务充值-"+order;
		}
		Gcuser gcuser = gcuserDao.getUser(user);
		if(gcuser==null){
			throw new ServiceException(3, "输入的用户名不存在，请检查输入是否正确！");
		}
		if(!MD5Security.md5_16(pa01).equals(gcuser.getPassword())){
			throw new ServiceException(4, "输入的登录密码不正确，请检查输入是否正确！");
		}
		if(!gcuser.getPassword3().equals(pa02)){
			throw new ServiceException(5, "输入的二级密码不正确，请检查输入是否正确！");
		}
		if(gcuser.getPay()<ybsl){
			throw new ServiceException(6, "您的一币余额不足，请检查输入是否正确！");
		}
		if(!hgcode.equals(gcuser.getVipsq())){
			throw new ServiceException(7, "手机验证码不正确");
		}
		int day = 0;
//		if(gcuser.getPwdate()!=null&&gcuser.getPwdate().getTime()>new Date().getTime()){
//			day = DateUtils.getIntervalDays(gcuser.getPwdate(), new Date());
//			throw new ServiceException(8, "您好，测试期间同一姓名及证件号30天内仅提供一次消费（不论金额大小），请于"+day+"天后再来，谢谢！");
//		}
		
		int year = DateUtils.getYear(new Date());
		int month = DateUtils.getMonth(new Date())+1;
		
		String date = year+"-"+month+"-01";
		int amount = userDailyGainLogDao.getUserDailyGain(user, 1, date);
		if(amount+ybsl>10000){
			throw new ServiceException(8, "您好，每月机票消费不能超过1w，请下月再购买！");
		}
		
		if(!this.changeYb(user, -ybsl, paylb, 11, null,0,YbChangeType.BUYTICKET)){
			throw new ServiceException(6, "您的一币余额不足，请检查输入是否正确！");
		}
//		Date date = gcuser.getPwdate();
//		if(date==null){
//            date = new Date();
//		}
//		gcuserDao.updatePwdate(gcuser.getUserid(), gcuser.getName(), DateUtils.addDay(date, 30));
		
		//机票支付的一币转到公司账户上
		Gcuser companeyUser = gcuserDao.getUser("kssl888");
		if(companeyUser!=null){
			this.changeYb(companeyUser.getUsername(), ybsl, paylb+"---"+user, 11, null, 0, YbChangeType.BUYTICKETGETYB);
		}
		userDailyGainLogDao.addUserDailyGain(user, 1, ybsl, date);
		gcuserDao.updateSmsCode(user, Global.INIT_SMS_CODE);
		return day;
	}
	
	public String ybts(String userName,String states){
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser!=null){
			int txlb = 0;
			String result = "";
			if(states.equals("0")){
				txlb = 3;
				result = "已审核成功";
			}else if(states.equals("1")){
				txlb = 0;
				result = "未审核";
			}
			gcuserDao.updateTxlb(userName, txlb);
			return result;
		}
		return "error,can not find username="+userName;
	}
	
	@Autowired
	private ThreadPoolTaskExecutor taskExecuter;
	
	@Transactional
	public void telCharge(final String userName,final String call,String pa3,String smdCode,final String ip){
		final int amount = 100;
		int yb = 110;
		Fcxt fcxt = fcxtDao.get(12);
		if(fcxt!=null&&fcxt.getPayadd()<1){
			throw new ServiceException(1, "您好，今天的名额已用完，请于明天再试，谢谢！");
		}
		if(Strings.isNullOrEmpty(call)){
			throw new ServiceException(6,"手机号码不符合规则！");
		}
		if(!isMobile(call)){
			throw new ServiceException(6,"手机号码不符合规则！");
		}
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser!=null){
			if(gcuser.getHfcjdate()!=null&&gcuser.getHfcjdate().getTime()>System.currentTimeMillis()){
				throw new ServiceException(2, "您好，测试期间同一姓名及证件号30天内仅提供一次充值，请于"+DateUtils.getIntervalDays(gcuser.getHfcjdate(), new Date())+"天后再来，谢谢！");
			}
			if(gcuser.getPay()<yb){
				throw new ServiceException(3,"您好，一币不足110，暂时不能充值，谢谢！");
			}
			if(!gcuser.getPassword3().equals(pa3)){
				throw new ServiceException(4,"您好，您输入的二级密码不正确，请重新输入！");
			}
			if(!smdCode.equals(gcuser.getVipsq())){
				throw new ServiceException(5,"您好，您输入的手机验证码不正确，请重新输入！");
			}
		}else{
			throw new ServiceException(3000, "用户不存在！");
		}
		
		
		
		if(this.changeYb(userName, -yb, "话费-"+call, 7, null,0d,YbChangeType.RECHARGEHUAFEI)&&gcuserDao.updateUserHfCz(gcuser.getName(), gcuser.getUserid(), DateUtils.addDay(new Date(), 31))){
			taskExecuter.execute(new Runnable() {
				@Override
				public void run() {
					if(!callRemoteCharge(call,amount,ip,userName)){
						//重试一次
						if(!callRemoteCharge(call,amount,ip,userName)){
							//再重试一次
							if(!callRemoteCharge(call,amount,ip,userName)){
								//再重试一次
								LogSystem.warn("用户充值话费开始,用户名【"+userName+"】"+"，充值手机号【"+call+"】"+",金额【"+amount+"】,ip【"+ip+"】,充值话费失败！");
							}
						}
					}
				}
			});
		}else{
			throw new ServiceException(2, "您好，测试期间同一姓名及证件号30天内仅提供一次充值，谢谢！");
		}
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
	}
	
	
	/**
	 * 手机号验证
	 * 
	 * @param  str
	 * @return 验证通过返回true
	 */
	public static boolean isMobile(String str) { 
		Pattern p = null;
		Matcher m = null;
		boolean b = false; 
		p = Pattern.compile("^[1][0-9][0-9]{9}$"); // 验证手机号
		m = p.matcher(str);
		b = m.matches(); 
		return b;
	}
	
	public boolean callRemoteCharge(String call,int amount,String ip,String userName){
		LogSystem.info("用户充值话费开始,用户名【"+userName+"】"+"，充值手机号【"+call+"】"+",金额【"+amount+"】,ip【"+ip+"】");
		_99douInterface _99dou = new _99douInterface();
		String out_trade_id = userName+"-"+DateUtils.DateToString(new Date(),DateStyle.YY_MM_EN);
		String account = call;
		String account_info = "";
		int quantity=1;
		String value = amount+"";
		String client_ip = ip;
		int expired_mini = 5;
		Ref<String> msg = new Ref<String>();
		int result = -1;
        try {
        	result =_99dou.Huafei(out_trade_id, account, account_info, quantity, value, client_ip, expired_mini, msg);
		} catch (Exception e) {
			LogSystem.error(e, "");
//			throw new ServiceException(100, "充值话费失败！稍后再试");
		}
        LogSystem.info("话费充值返回 :"+result+" 消息:"+msg);
        if(result==0){//成功
        	return true;
        }
        return false;
	}
	//诚信检查
	public void checkCxt(){
		List<Txpay> listNoGiveMoney = txPayDao.getAllNoGiveMoneyRecord();
		if(listNoGiveMoney!=null&&listNoGiveMoney.size()>0){
			for(Txpay txpay:listNoGiveMoney){
//				Gpjy gpjy = gpjyDao.get(txpay.getDfuser(), txpay.getPayid()+"");
//				if(gpjy!=null){
				try {
					Gcuser user = gcuserDao.getUser(txpay.getDfuser());
					if(user==null){
						continue;
					}
					int addCxdateDay = getAddCxdateDay(user.getCxt());
					//vip不扣诚信
					if(user.getVip()==0){
						gcuserDao.updateCxtAndCxtDate(user.getUsername(), 1, addCxdateDay);
						Datepay datePay = new Datepay();
						datePay.setUsername(user.getUsername());
						datePay.setPay(user.getPay());
						datePay.setJydb(user.getJydb());
						datePay.setRegid("超时未付款-并扣一诚信星-余"+(user.getCxt()-1)+"-"+txpay.getPayid()+"-"+txpay.getPayusername());
						datePay.setNewbz(20);
						datePay.setAbdate(new Date());
						logService.addDatePay(datePay);
					}
					LogSystem.log("超时未付款，重置订单:"+txpay);
					txPayDao.resetOrder(txpay.getPayid());
					
					txPayDao.updateIndexEp(txpay.getPayid(), 0);
					sendYbSaleSmsMsg(txpay.getPayusername(), 2);
//					if(gpjy!=null&&gpjy.getNewjy()==1){
//					   gpjyDao.backBuyYbGpjy(txpay.getDfuser(), txpay.getPayid()+"", "超时未付款-并扣一诚信星-余"+(user.getCxt()-1), gpjy.getDfuser()+"-"+txpay.getPayusername(), new Date());
//					}
				} catch (Exception e) {
					LogSystem.error(e, "发生错误");
				}
//				}
			}
		}
		//2日后没有确认的  扣星
		List<Txpay> listNoSureReceiveMoney = txPayDao.getAllNoSureReceiveMoneyRecord();
		//List<Txpay> listNoSureReceiveMoney = txPayDao.getAllNoSureReceiveMoneyRecord1();
		if(listNoSureReceiveMoney!=null&&listNoSureReceiveMoney.size()>0){
			for(Txpay txpay:listNoSureReceiveMoney){
				try {
					Gcuser user = gcuserDao.getUser(txpay.getPayusername());
					if(user==null){
						continue;
					}
					int addCxdateDay = getAddCxdateDay(user.getCxt());
					//vip不扣诚信
					if (user.getVip() == 0) {
						gcuserDao.updateCxtAndCxtDate(user.getUsername(), 1, addCxdateDay);

						Datepay datePay = new Datepay();
						datePay.setUsername(user.getUsername());
						datePay.setPay(user.getPay());
						datePay.setJydb(user.getJydb());
						datePay.setRegid("确认收款超时-并扣一诚信星-余" + (user.getCxt() - 1) + "-" + txpay.getPayid() + "-"
								+ txpay.getDfuser());
						datePay.setNewbz(20);
						datePay.setAbdate(new Date());
						logService.addDatePay(datePay);
					}
					txPayDao.updateClip(txpay.getPayid());
					String nameUserId = user.getName()+user.getUserid();
					SameUserProperty sameUserProperty=sameUserPropertyDao.getSameUserProperty(nameUserId);
					if(sameUserProperty!=null){
						sameUserPropertyDao.addNoSureTimes(nameUserId);
					}else{
						SameUserProperty newsameuserproperty = new SameUserProperty();
						newsameuserproperty.setNameUserid(nameUserId);
						newsameuserproperty.setNoSureTimes(1);
						newsameuserproperty.setLastDate(new Date());
						sameUserPropertyDao.insertSameUserProperty(newsameuserproperty);
					}
					
				} catch (Exception e) {
					LogSystem.error(e, "发生错误");
				}
			}
		}
		
		//5日后 没有确认就 自动确认
		List<Txpay> listNoSureReceiveMoneyAfter5Days = txPayDao.getAllNoSureReceiveMoneyRecordAfter5Days();
		if(listNoSureReceiveMoneyAfter5Days!=null&&listNoSureReceiveMoneyAfter5Days.size()>0){
			for(Txpay txpay:listNoSureReceiveMoneyAfter5Days){
				try {
					//系统自己确认
					this.sureIReceivedMoneyBySystem(txpay.getPayid());
				} catch (Exception e) {
					LogSystem.error(e, "发生错误");
				}
			}
		}
		
		
	}
	
	private int getAddCxdateDay(int cxt){
		int addCxdate = 0;
		if(cxt-1==3){
			addCxdate=7;
		}else if(cxt-1==2){
			addCxdate=14;
		}else if(cxt-1==1){
			addCxdate = 21;
		}else if(cxt-1<1){
			addCxdate = 60;
		}
		return addCxdate;
	}
	
	public void resetVip(String userName){
		Sgxt sgxt = sgxtDao.get(userName);
		if(sgxt==null){
			gcuserDao.updateVipName(userName, "xtgc001");
		}else{
			String vipName = findMyUpVipName(userName);
			
//			if(vipName.equals("syf66669a")){//此vip账号下的所有账号都改成2
//				Gcuser gcuser = gcuserDao.getUser(userName);
//				Date date = DateUtils.StringToDate("2016-04-21",DateStyle.YYYY_MM_DD);
//				if(gcuser.getPayok()==0&&gcuser.getRegtime().getTime()>date.getTime()){
//					gcuserDao.updatePayOk(gcuser.getName(), gcuser.getUserid(), 2);
//				}
//			}
			
			gcuserDao.updateVipName(userName, vipName);
			sgxtDao.updateVipUser(userName, vipName);
		}
	}
	
	public String findMyUpVipName(String userName) {
		Sgxt sgxtBd = sgxtDao.getByAOrBuid(userName);
		if (sgxtBd != null) {
			if (sgxtBd.getVip() == 1) {
				return sgxtBd.getUsername();
			} else {
				return findMyUpVipName(sgxtBd.getUsername());
			}
		}
		return "xtgc001";
	}
	/**
	 * 寻找大vip
	 * @param userName
	 * @return
	 */
	public String findMyBigUpVipName(String userName) {
		Sgxt sgxtBd = sgxtDao.getByAOrBuid(userName);
		if (sgxtBd != null) {
			if (sgxtBd.getVip() == 1) {
				Gcuser gcuser = gcuserDao.getUser(sgxtBd.getUsername());
				if(gcuser.getVip()==2){
					return gcuser.getUsername();
				}else{
					return findMyBigUpVipName(sgxtBd.getUsername());
				}
			} else {
				return findMyBigUpVipName(sgxtBd.getUsername());
			}
		}
		return "xtgc001";
	}
	
	public Gcuser findMyBigUpVip(String userName) {
		Sgxt sgxtBd = sgxtDao.getByAOrBuid(userName);
		if (sgxtBd != null) {
			if (sgxtBd.getVip() == 1) {
				Gcuser gcuser = gcuserDao.getUser(sgxtBd.getUsername());
				if(gcuser.getVip()==2){
					return gcuser;
				}else{
					return findMyBigUpVip(sgxtBd.getUsername());
				}
			} else {
				return findMyBigUpVip(sgxtBd.getUsername());
			}
		}
		return gcuserDao.getUser("xtgc001");
	}
	
	
	@Transactional
	public void addBabyInfo(String userName,String babyName, int babyAge, String babySex, String dadyName,
			int dadyAge, String dadyCall, String momName, int momAge, String momCall, String address, String details,String pa3,String smsCode){
		if(Strings.isNullOrEmpty(babyName)||Strings.isNullOrEmpty(babySex)||Strings.isNullOrEmpty(dadyName)||Strings.isNullOrEmpty(dadyCall)||Strings.isNullOrEmpty(momName)||Strings.isNullOrEmpty(momCall)||Strings.isNullOrEmpty(address)||Strings.isNullOrEmpty(details)){
			throw new ServiceException(4, "参数不完整！");
		}
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(!gcuser.getPassword3().equals(pa3)){
			throw new ServiceException(2, "二级密码不正确");
		}
		if(!gcuser.getVipsq().equals(smsCode)){
			throw new ServiceException(3, "手机验证码不正确");
		}
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
		if(!this.changeYb(userName, -23800, "口才训练营报名", 0, null,0, YbChangeType.TRAIN_ELOQUENCE)){
			throw new ServiceException(1, "一币不足");
		}
		BabyInfo babyInfo = new BabyInfo(userName, gcuser.getName(), babyName, babyAge, babySex, dadyName, dadyAge, dadyCall, momName, momAge, momCall, address, details, 0, "", null, "", "", new Date());
		if(!babyInfoDao.add(babyInfo)){
			throw new ServiceException(3000, "数据库插入数据失败");
		}
	}
	
	public IPage<BabyInfo> getBabyInfoPage(String param,Integer status,String startTime,String endTime,int pageIndex,int pageSize){
		return babyInfoDao.getPage(param, status,pageIndex, pageSize, startTime, endTime);
	}
	
	public List<BabyInfo> getBabyInfoList(String param,Integer status,String startTime,String endTime){
		return babyInfoDao.getList(param, status, startTime, endTime);
	}
	
	public BabyInfo getOneBabyInfo(int id){
		return babyInfoDao.getBabyInfo(id);
	}
	/**
	 * 删除
	 * @param id
	 * @param deleteName
	 * @return
	 */
	public boolean deleteBabyInfo(int id,String deleteName){
		BabyInfo baby =  babyInfoDao.getBabyInfo(id);
		if(baby!=null&&baby.getStatus()==0){
			baby.setStatus(1);
			baby.setDeleteName(deleteName);
			baby.setEditTime(new Date());
			return babyInfoDao.update(baby);
		}
		return false;
	}
	/**
	 * 恢复
	 * @param id
	 * @param recoverName
	 * @return
	 */
	public boolean recoverBabyInfo(int id,String recoverName){
		BabyInfo baby =  babyInfoDao.getBabyInfo(id);
		if(baby!=null&&baby.getStatus()==1){
			baby.setStatus(0);
			baby.setRecoverName(recoverName);
			baby.setEditTime(new Date());
			return babyInfoDao.update(baby);
		}
		return false;
	}
	/**
	 * 更新信息
	 * @param id
	 * @param editName
	 * @param babyName
	 * @param babyAge
	 * @param babySex
	 * @param dadyName
	 * @param dadyAge
	 * @param dadyCall
	 * @param momName
	 * @param momAge
	 * @param momCall
	 * @param address
	 * @param details
	 * @return
	 */
	public boolean updateBabyInfo(int id,String editName,String babyName, int babyAge, String babySex, String dadyName,
			int dadyAge, String dadyCall, String momName, int momAge, String momCall, String address, String details){
		if(Strings.isNullOrEmpty(babyName)||Strings.isNullOrEmpty(babySex)||Strings.isNullOrEmpty(dadyName)||Strings.isNullOrEmpty(dadyCall)||Strings.isNullOrEmpty(momName)||Strings.isNullOrEmpty(momCall)||Strings.isNullOrEmpty(address)||Strings.isNullOrEmpty(details)){
			throw new ServiceException(1, "参数不完整！");
		}
		BabyInfo baby =  babyInfoDao.getBabyInfo(id);
		if(baby!=null){
			baby.setEditName(editName);
			baby.setEditTime(new Date());
			baby.setBabyName(babyName);
			baby.setBabyAge(babyAge);
			baby.setBabySex(babySex);
			baby.setDadyName(dadyName);
			baby.setDadyAge(dadyAge);
			baby.setDadyCall(dadyCall);
			baby.setMomAge(momAge);
			baby.setMomCall(momCall);
			baby.setMomName(momName);
			baby.setAddress(address);
			baby.setDetails(details);
			return babyInfoDao.update(baby);
		}
		return false;
	}
	private static final long OPEN_TIME = DateUtils.StringToDate("2016-05-07 09:17:00", DateStyle.YYYY_MM_DD_HH_MM_SS).getTime();
	public boolean isOpenScores(){
		if(new Date().getTime()>OPEN_TIME){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 查询购物券日志
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<UserScoresLogForExcel> getUserScoresLogPage(String userName,int pageIndex,int pageSize,String startTime,String endTime){
		
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			startTime = startTime+" 00:00:00";
			endTime = endTime + " 23:59:59";
		}
		return userScoresLogDao.getPageListByUserNameAndTime(userName, startTime, endTime, pageIndex, pageSize);
	}
	
   public List<UserScoresLogForExcel> getUserScoresLogList(String userName,String startTime,String endTime){
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			startTime = startTime+" 00:00:00";
			endTime = endTime + " 23:59:59";
		}
		return userScoresLogDao.getListByUserNameAndTime(userName, startTime, endTime);
	}

   /**
	 * 更新玩家资料
	 * @param userName		账户
	 * @param secondPassword 二级密码
	 * @param newSecondPassword1 新二级密码
	 * @param card			银行卡号
	 * @param idCard		身份证号
	 * @param bank			收款银行
	 * @param smsCode		验证码
	 * @param provinceName	开户行
	 * @param passowrd		登录密码
	 * @param remoteAddr	ip
	 * @param areaCode		手机国际区域码
	 * @return
	 */
public String updateUser(String userName, String newSecondPassword1, String newSecondPassword2, String secondPassword,
			String card, String idCard, String bank, String smsCode, String provinceName, String provinceName2,
			String cityName, String areaName, String newPassWord1, String newPassWord2, String remoteAddr, int areaCode) {
	    Gcuser guser = gcuserDao.getUser(userName);
		if(guser==null){
			throw new ServiceException(1, "用户不存在!");
		}
		
		if(Strings.isNullOrEmpty(smsCode)|| !smsCode.equals(guser.getVipsq())){
			throw new ServiceException(2, "您填入的手机验证码不正确!");
		}
		
		if(Strings.isNullOrEmpty(secondPassword)||!secondPassword.equals(guser.getPassword3())){
			throw new ServiceException(3, "您填入的二级密码不正确!");
		}
		
		if(Strings.isNullOrEmpty(idCard)||!idCard.equals(guser.getUserid())){
			throw new ServiceException(4, "您填入的身份证号码不正确！");
		}		
		
		boolean result = gcuserDao.updateUser(guser.getName(), newSecondPassword1, card, idCard, bank, smsCode, provinceName, cityName, areaName, newPassWord1);
		if(result){
			addUserDateIpLog(userName, "更新资料", remoteAddr);
		}
		/*if(areaCode!=0&&interRegionCodeDao.isHasByRegioncode(areaCode)){
			userPropertyDao.updateUserAreaCodeByName(userName,areaCode);
		}
*/
		
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
		
		return "success";
	
   }

   
   
   /**
	 * 判断玩家物品是否足够
	 * 
	 *@param  gcuser 用户
	 *
	 *@param  item  玩家物品（一币（参数可以为："yibi","一币","pay"），金币（参数可以为："jinbi","金币","jydb"），积分（参数可以为："jifen","积分","jyg"）等）
	 *
	 *@param  number 物品数量
	 * 
	 * */
	public boolean enoughUserItem(Gcuser gcuser, String item, Double number) {
		
		if(item.equals("yibi") || item.equals("一币") || item.equals("pay")){
			if(gcuser.getPay() >= number){
				return true;
			}
		}else if(item.equals("jinbi") || item.equals("金币") || item.equals("jydb")){
			if(gcuser.getJydb() >= number){
				return true;
			}
		}else if(item.equals("jifen") || item.equals("积分") || item.equals("jyg")){
			if(gcuser.getJyg() >= number){
				return true;
			}
		}
		return false;
	}
	
	
	/**
	 * 判断玩家物品是否足够
	 * 
	 *@param  userName 用户名
	 *
	 *@param  item  玩家物品（一币（参数可以为："yibi","一币","pay"），金币（参数可以为："jinbi","金币","jydb"），积分（参数可以为："jifen","积分","jyg"）等）
	 *
	 *@param  number 物品数量
	 * 
	 * */
	private boolean enoughUserItem(String userName, String item, int number) {
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(item.equals("yibi") || item.equals("一币") || item.equals("pay")){
			if(gcuser.getPay() >= number){
				return true;
			}
		}else if(item.equals("jinbi") || item.equals("金币") || item.equals("jydb")){
			if(gcuser.getJydb() >= number){
				return true;
			}
		}else if(item.equals("jifen") || item.equals("积分") || item.equals("jyg")){
			if(gcuser.getJyg() >= number){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 
	 * 使用玩家物品（对于玩家一币，金币，积分等扣除）
	 * 
	 *@param  userName 用户名
	 *
	 *@param  item  玩家物品（一币（参数可以为："yibi","一币","pay"），金币（参数可以为："jinbi","金币","jydb"），积分（参数可以为："jifen","积分","jyg"）等）
	 *
	 *@param  number 物品数量
	 *
	 * */
	
	public boolean useUserItem(String userName, String item, int number) {
		if(item.equals("yibi") || item.equals("一币") || item.equals("pay")){
			return  gcuserDao.reduceYb(userName, number);
		}else if(item.equals("jinbi") || item.equals("金币") || item.equals("jydb")){
			return  gcuserDao.reduceOnlyJB(userName, number);
		}else if(item.equals("jifen") || item.equals("积分") || item.equals("jyg")){
			return  gcuserDao.updateJyg(userName, number);
		}
		return false;
	}
	
	/**
	 * 
	 * 玩家获得物品（对于玩家一币，金币，积分等获得）
	 * 
	 *@param  userName 用户名
	 *
	 *@param  item  玩家物品（一币（参数可以为："yibi","一币","pay"），金币（参数可以为："jinbi","金币","jydb"），积分（参数可以为："jifen","积分","jyg"）等）
	 *
	 *@param  number 物品数量(大于0的数)
	 *
	 * */
	
	public boolean giveUserItem(String userName, String item, int number) {
		if(item.equals("yibi") || item.equals("一币") || item.equals("pay")){
			return gcuserDao.addWhenOtherPersionBuyJbCard(userName, number);
		}else if(item.equals("jinbi") || item.equals("金币") || item.equals("jydb")){
			return gcuserDao.addOnlyJB(userName, number);
		}else if(item.equals("jifen") || item.equals("积分") || item.equals("jyg")){
			return gcuserDao.updateJyg(userName, -number);
		}
		return false;
	}

	
	/**获得未成交的积分交易明细*/
	public IPage<Gpjy> getAllNoDealGpjyPageList(String userName, int pageIndex, int pageSize) {
		return gpjyDao.getAllNoDealGpjyPageList(userName, pageIndex, pageSize);
	}

	
	/**
	 * 
	 * 验证玩家参数信息
	 * 
	 * @param map key表示玩家属性，value表示界面传过来的值 
	 * 
	 * @param userName 
	 * 
	 * */
	public void checkUserInfo(String userName, Map<String, String> map) {
		
		Gcuser guser = gcuserDao.getUser(userName);
		if(guser==null){
			throw new ServiceException(1, "用户不存在！");
		}
		
		 for (String key : map.keySet()) {
			  if(key.equals("call")){
				  if(!guser.getCall().equals(map.get(key))){
					  throw new ServiceException(2, "输入的手机号与预留手机号不一致！");
				  }
			  }
			  if(key.equals("userName")){
				  if(!guser.getUsername().equals(map.get(key))){
					  throw new ServiceException(3, "用户名不一样！");
				  }
			  }
			  if(key.equals("passWord")){
				  if(!guser.getPassword().equals(map.get(key))){
					  throw new ServiceException(4, "密码错误！");
				  }
			  }
			  if(key.equals("secondPassWord")){
				  if(!guser.getPassword3().equals(map.get(key))){
					  throw new ServiceException(5, "二级密码错误！");
				  }
			  }
		 }
		
	}

   @Transactional
   public void chargeBdbByBigVip(String userName,String pa3,String toUser){
	   
	   int czb = 5000;
	   int byBdb = 22200;
	   int yb = 22800;
	   
	   int addBdb = 50000;
	   
	   Gcuser gcuser = gcuserDao.getUser(userName);
	   if(gcuser.getVip()!=2){
		   throw new ServiceException(1,"大vip才能使用这个功能！");
	   }
	   Gcuser to = null;
	   if(!userName.equals(toUser)){
		   to = gcuserDao.getUser(toUser);
		   if(to==null){
			   throw new ServiceException(2,"被充值用户不存在！");
		   }
		   if(to.getVip()!=3){
			   throw new ServiceException(3,"被充值用户必须是小vip！");
		   }
			if(zuoMingxiDao.get(userName, toUser)==null&&youMingXiDao.get(userName, toUser)==null){
				throw new ServiceException(4,"充值用户必须是您团队下的！");
			}
		}else{
			to = gcuser;
		}
	   
	   if(gcuser.getVipcjcjb()<czb){
		   throw new ServiceException(5,"充值币不足！");
	   }
	   
	   if(gcuser.getSyep()<byBdb){
		   throw new ServiceException(6,"备用报单币不足！");
	   }
	   
	   if(to.getPay()<yb){
		   throw new ServiceException(7,"被充值用户的一币不足！");
	   }
	   
	   if(!gcuser.getPassword3().equals(pa3)){
			throw new ServiceException(8, "二级密码不正确");
		}
	  
	   if(!gcuserDao.reduceVipcjcjb(userName, czb)){
		   throw new ServiceException(5,"充值币不足！");
	   }else{
			Vipcjgl vipcjgl = new Vipcjgl();
			vipcjgl.setCjuser(toUser);
			vipcjgl.setCjjo(czb);
			vipcjgl.setSycjb(gcuser.getVipcjcjb()-czb);
			vipcjgl.setVipuser(userName);
			vipcjgl.setBz("给"+toUser+"充值"+addBdb+"报单币");
			vipcjgl.setCjdate(new Date());
			vipcjglDao.add(vipcjgl);
	   }
	   
	   if(!gcuserDao.reduceSyep(userName, byBdb)){
		   throw new ServiceException(6,"备用报单币不足！");
	   }else{
			SysBiLog sysBi=new SysBiLog();
			sysBi.setUsername(userName);
			sysBi.setCurrentamount(gcuser.getSyep()-byBdb);
			sysBi.setRechargedate(new Date());
			sysBi.setAmount(-byBdb);
			sysBi.setOperator(toUser);
			sysBiLogDao.add(sysBi);
	   }
	   
	   if(!this.changeYb(toUser, -yb, userName+"-"+czb+"充值币-"+byBdb+"备用报单币-"+yb+"一币转"+addBdb+"报单币", YbChangeType.TRANSFER_TO_BDB, null, 0,YbChangeType.VIP_RECHARGEBAODANBI)){
		   throw new ServiceException(7,"一币不足！");
	   }
	   //加报单币
	   this.updateSybdb(toUser, addBdb, userName+"-"+czb+"-充值币-"+byBdb+"备用报单币-"+yb+"一币转"+addBdb+"报单币",0);
   }

	
	/**
	 * 获得玩家订单信息状态
	 * @param user
	 * @param pa01
	 * @param order
	 * @param pa02
	 * @param sign
	 * @return
	 */
	public Map<Integer,String> getUserMallOrderStatus(String user, String pa01, String order, String pa02,String sign) {
		Map<Integer,String> map=new ConcurrentHashMap<>();
		MallOrder mallOrder = mallOrderDao.get(new SqlParamBean("order_id", order));
		if(mallOrder==null){
			 map.put(2, "订单号不存在");
			 return map;
		}
		
		if(sign==null){
			 map.put(4, "签名不能为空");
			 return map;
		}
		String signStr= order+"yc$shop@Sfie68";
		String mySign;
		try {
			mySign = MD5Security.code(signStr,32).toLowerCase();
			 if(!sign.equals(mySign)){
				 map=new HashMap<>();
				 LogSystem.warn("md5校验失败，收到的key=["+signStr+"],md5后的值为["+mySign+"],收到的sing=["+sign+"]");
				 map.put(3, "签名无效");
				 return map;
			 }
		} catch (Exception e) {
			 LogSystem.error(e, "md5加密失败");
			 map.put(3, "签名无效");
			 return map;
		 }
		
		map.put(mallOrder.getStatus(), "成功");
		return map;
	}

	/**
	 * 查看玩家是否含有此订单id
	 * @param username
	 * @param orderId
	 * @return
	 */
	public boolean isHasMallorderByorder(String username, String orderId) {
		if(!mallOrderDao.isHasMallorderByorder(username,orderId)){
			throw new ServiceException(1,"用户订单不存在！");
		}else{
			return true;
		}
	}

	public List<UserScoresLog> getUserScoresLogByMallOrderList(String userName, String orderId) {
		return userScoresLogDao.getUserScoresLogByMallOrderList(userName, orderId);
	}

	public List<UserBeanTemp> getUserNameList(String userName) {
		Gcuser gcuser= gcuserDao.getUser(userName);
		List<Gcuser> list= gcuserDao.getList(gcuser.getName(), gcuser.getUserid());
		List<UserBeanTemp> result= new ArrayList<>();
		for (Gcuser gcuser2 : list) {
			UserBeanTemp bean= new UserBeanTemp();
			bean.setUsername(gcuser2.getUsername());
			bean.setLevel(gcuser2.getSjb());
			result.add(bean);
		}
		return result;
	}
}
