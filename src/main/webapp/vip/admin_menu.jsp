<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<style>
.language a { display:block; float:left; color:#fff; font-family:"微软雅黑"; height:16px; line-height:16px; width:56px; text-align:center; margin-left:15px; border-radius:3px; margin-bottom:5px; margin-top:-5px; color:#fff; background:#8a97fb;}
</style>
<SCRIPT src="main/correctPNG.js"></SCRIPT>
<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="Home";
  }
}

</SCRIPT>

<SCRIPT src="main/leftNo.js"></SCRIPT>

<SCRIPT type=text/javascript src="main/jquery-1.2.6.min.js"></SCRIPT>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$("#wenzhang>dd>dl>dd").hide();
	$.each($("#wenzhang>dd>dl>dt"), function(){
		$(this).click(function(){
			$("#wenzhang>dd>dl>dd ").not($(this).next()).slideUp();
			$(this).next().slideToggle(500);
			//$(this).next().toggle();
		});
	});
});
</SCRIPT>
</head>

<DIV class=tips>
      <DIV id=main_left_main>
      	<div class="language">
        	<a href="/manager" target="_top">中文版</a>
            <a href="../eng/manager.asp" target="_top">English</a>
        </div>
	  <table border="0" width="170" id="table1" height="100">
		<tr>
			<td width="90" align="right"><span style="font-size: 10pt; font-family: 宋体">用户名：</span></td>
			<td><font color="#FF0000" size="2"><b><a target="main" href="userlist"><font color="#FF0000">${gcuser.username}</font></a></b></font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; font-family: 宋体">累计交易一币：</span></td>
			<td><font size="2">${gcuser.cbpay}</font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; font-family: 宋体">累计使用一币：</span></td>
			<td><font size="2">${gcuser.txpay}</font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; font-family: 宋体; ">当前可用一币：</span></td>
			<td><font color="#0000FF" size="2"><b>${gcuser.pay}</b></font></td>
		</tr>
		</table>
      <DL id=wenzhang>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">账户概览</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="datepay"><font color="#000000">累计奖金一币：</font><font color="#FF0000">${gcuser.dlpay}</font></a>     
            <LI><a target="main" href="datepay?lb=9"><font color="#000000">推广部分一币：</font><font color="#800000">${gcuser.jbpay}</font></a>
            <LI><a target="main" href="datepay?lb=1"><font color="#000000">平衡部分一币：</font><font color="#800000">${gcuser.jjpay}</font></a>
            <LI><a target="main" href="datepay?lb=8"><font color="#000000">辅导部分一币：</font><font color="#800000">${gcuser.jypay}</font></a>
            <LI><a target="main" href="datepay?lb=2"><font color="#000000">累计认购一币：</font><font color="#008000">${gcuser.rgpay}</font></a>
            <LI><a target="main" href="datepay?lb=3"><font color="#000000">累计卖出一币：</font><font color="#0000FF">${gcuser.mcpay}</font></a>
            <LI>剩余金币：<font color="#800080" size="2" face="宋体">${gcuser.jydb}</font>
            <LI>积分单价：<font color="#FF0000" size="2">${ajygj}</font>
            <LI>积分数量：<font color="#0000FF"><font size="2">${gcuser.jyg}</font></font>
            <LI>积分拆分次数：<font color="#800000"><font size="2">${gcuser.cfa}</font></font>
            <LI>积分拆分倍数：<font color="#008000"><font size="2">${gcuser.cfb}</font></font>
            </LI></UL></DD></DL>
          <DD>
          <DL>          
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">个人信息</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="gg">公告查看</a>
            <LI><a target="main" href="tgurl">游戏规则</a>
            <LI><a target="main" href="login2j?inputUrl=login2j.jsp" style="text-decoration: none">修改个人信息</a>
            <LI><a target="_blank" style="text-decoration: none; font-weight: 700" href="http://bbs.zgyce.com"><font color="#FF00FF">学习专区</font></a>
            <LI><a target="main" href="gcbf?lb=0">分红点总数：<font color="#FF0000">${gcuser.gdgc}</font></a>
            <LI><a target="main" href="gcbf?lb=1">累计分红：<font color="#008000">${gcuser.ljfh}</font></a>
            <LI><a target="main" href="http://yb.zgyce.com/sj_login.asp?sjname=${gcuser.username}"><font color="#0000FF">管理我的商店</font></a>
            <LI><a target="main" href="ybsf"><font color="#FF0000">商户管理系统</font></a>            
            <LI>查看增值服务
            <LI><a target="main" href="dldate" style="text-decoration: none">查看登录日志</a>
            <LI><a target="main" href="sfz.html" style="text-decoration: none">查看用户协议</a>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">业绩查询</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="sgks01?myup=${gcuser.username}" style="text-decoration: none">游戏业务</a>
            <LI>游戏级别：<font color="#0000FF">${gcuser.sjb}</font>
            <LI>报单币余额：<font color="#0000FF">${gcuser.sybdb}</font>
            <LI><a target="main" href="datepay">可开户一币：<font color="#0000FF">${gcuser.pay+guser.syep}</font></a>
            <LI><a target="main" href="vipup" style="text-decoration: none">联系团队服务中心</a>
            <LI><a target="main" href="bdbdate" style="text-decoration: none">报单币明细</a><c:if test="${gcuser.vip>0}">--<b><a target="main" href="bdbzz"><font size="2" color="#008000">转出</font></a></b></c:if>
            <LI>周封奖金：<font color="#0000FF">${fbpay}</font>
            <LI><font color="#FF0000">收益比例：<c:if test="${fbpay<1}">0</c:if><c:if test="${fbpay>=1}">${fbpay}</c:if></font>
            <LI><font color="#FF0000">目前收益：${mqfh}</font>
            <LI><a target="main" href="tgdown" style="text-decoration: none">我的客户</a>
            <LI><a target="main" href="regTheSame" style="text-decoration: none">添加同名账户</a>
            <LI><a target="main" href="tjz" style="text-decoration: none">同名账户转账</a>
            </LI></UL></DD></DL>
	    <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">一币理财</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="login2j?inputUrl=loginep.jsp" style="text-decoration: none"><font color="#FF0000">一币竞猜</font></a>
            <LI><a target="main" href="datepay" style="text-decoration: none">一币明细</a><c:if test="${gcuser.username=='300fhk'}">--<b><a target="main" href="jzpay.asp"><font size="2" color="#008000">商城退款</font></a></b></c:if>
            <LI><a target="main" href="ybcg" style="text-decoration: none"><font color="#0000FF">一币抢购</font></a>
            <LI><a target="main" href="login2j?inputUrl=login3j.jsp" style="text-decoration: none">一币卖出</a><c:if test="${gcuser.vip==2}">--<b><a target="main" href="vipjzpay"><font size="2" color="#008000">转出</font></a></b></c:if>
            <LI>当前信用星：<font color="#0000FF">${gcuser.cxt}</font>
            <LI><a target="main" href="login2j?inputUrl=login8j.jsp" style="text-decoration: none">一币交易市场</a>
            <LI><a target="main" href="login2j?inputUrl=loginmc.jsp" style="text-decoration: none">一币卖出明细</a>
            <LI><a target="main" href="login2j?inputUrl=loginmy.jsp" style="text-decoration: none">一币认购明细</a>
            <LI><a target="main" href="login2j?inputUrl=login5j.jsp" style="text-decoration: none">一币购金币卡</a>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">积分理财</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="vipgo" style="text-decoration: none">我要充值</a>
            <LI><a target="main" href="login2j?inputUrl=loginjf.jsp" style="text-decoration: none"><font color="#FF0000">积分竞猜</font></a>
            <LI><a target="main" href="oycg" style="text-decoration: none"><font color="#0000FF">积分抢购</font></a>
            <LI><a target="main" href="jfgame" style="text-decoration: none"><font color="#0000FF">积分游戏</font></a>
            <LI><a target="main" href="mysl" style="text-decoration: none">积分买入(求购)</a>
            <LI><a target="main" href="mcsl" style="text-decoration: none">积分卖出(出售)</a>
            <LI><a target="main" href="gpjy" style="text-decoration: none">积分交易明细</a>
            <LI><a target="main" href="gpjysc" style="text-decoration: none">积分交易市场</a>
            <LI>积分拆分次数：<font color="#800000"><font size="2">${gcuser.cfa}</font></font>
            <LI>积分拆分倍数：<font color="#008000"><font size="2">${gcuser.cfb}</font></font>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">消费管理</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="datepay"><font size="2" color="#008080">可用一币：</font><font size="2" color="#FF0000">${gcuser.pay}</font></a>
			<LI><a target="main" href="ybhfcj.asp">话费充值(100)</a>
			<LI><a target="main" href="http://yb.zgyce.com/index.asp?vipid=${gcuser.username}&vippa=${gcuser.password}"><font size="2" color="#008080">一币换购商品</font></a>
			<LI><a target="main" href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=${gcuser.username}"><font size="2" color="#008080">一币换购记录</font></a>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT>
			<a style="text-decoration: none; font-weight:700" target="_top" href="logout?type=1"><font size="2">退出系统</font></A></DT></DL>
		  </DD></DL></DIV></DIV>
<meta http-equiv=Refresh content="240; url=">