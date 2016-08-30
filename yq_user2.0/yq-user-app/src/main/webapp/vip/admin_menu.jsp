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
			<td width="90" align="right"><span style="font-size: 10pt; "><s:text name='vipadmin_menu.jsp.admin_menu.jsp.29623262'/>：</span></td>
			<td><font color="#FF0000" size="2"><b><a target="main" href="userlist"><font color="#FF0000">${gcuser.username}</font></a></b></font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; "><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1927395202'/>：</span></td>
			<td><font size="2">${gcuser.cbpay}</font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; "><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1937629852'/>：</span></td>
			<td><font size="2">${gcuser.txpay}</font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; ; "><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1504881972'/>：</span></td>
			<td><font color="#0000FF" size="2"><b>${gcuser.pay}</b></font></td>
		</tr>
		</table>
      <DL id=wenzhang>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1101502999'/></font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="datepay"><font color="#000000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.2019724238'/>：</font><font color="#FF0000">${gcuser.dlpay}</font></a>     
            <LI><a target="main" href="datepay?lb=9"><font color="#000000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2060498186'/>：</font><font color="#800000">${gcuser.jbpay}</font></a>
            <LI><a target="main" href="datepay?lb=1"><font color="#000000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-256393235'/>：</font><font color="#800000">${gcuser.jjpay}</font></a>
            <LI><a target="main" href="datepay?lb=8"><font color="#000000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.994834486'/>：</font><font color="#800000">${gcuser.jypay}</font></a>
            <LI><a target="main" href="datepay?lb=2"><font color="#000000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1892736228'/>：</font><font color="#008000">${gcuser.rgpay}</font></a>
            <LI><a target="main" href="datepay?lb=3"><font color="#000000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1958259639'/>：</font><font color="#0000FF">${gcuser.mcpay}</font></a>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.649202784'/>：<font color="#800080" size="2" >${gcuser.jydb}</font>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.950786681'/>：<font color="#FF0000" size="2">${ajygj}</font>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.950947478'/>：<font color="#0000FF"><font size="2">${gcuser.jyg}</font></font>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1002641178'/>：<font color="#800000"><font size="2">${gcuser.cfa}</font></font>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1002856070'/>：<font color="#008000"><font size="2">${gcuser.cfb}</font></font>
            </LI></UL></DD></DL>
          <DD>
          <DL>          
          <DT><b><A class=hide href="javascript:void(0);"><font size="2"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.616144510'/></font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="gg"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.642555044'/></a>
            <LI><a target="main" href="tgurl"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.865821164'/></a>
            <LI><a target="main" href="login2j?inputUrl=login2j.jsp" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.471675913'/></a>
            <LI><a target="_blank" style="text-decoration: none; font-weight: 700" href="http://bbs.zgyce.com"><font color="#FF00FF">学习专区</font></a>
            <LI><a target="main" href="gcbf?lb=0"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1088456654'/>：<font color="#FF0000">${gcuser.gdgc}</font></a>
            <LI><a target="main" href="gcbf?lb=1"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.989746478'/>：<font color="#008000">${gcuser.ljfh}</font></a>
            <LI><a target="main" href="http://yb.zgyce.com/sj_login.asp?sjname=${gcuser.username}"><font color="#0000FF">管理我的商店</font></a>
            <LI><a target="main" href="ybsf"><font color="#FF0000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.626816442'/></font></a>            
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.16265688'/>
            <LI><a target="main" href="dldate" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.247726354'/></a>
            <LI><a target="main" href="sfz.html" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.238200148'/></a>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.627723500'/></font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="sgks01?myup=${gcuser.username}" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.865347806'/></a>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.865732987'/>：<font color="#0000FF">${gcuser.sjb}</font>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1788801323'/>：<font color="#0000FF">${gcuser.sybdb}</font>
            <LI><a target="main" href="datepay"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-881818137'/>：<font color="#0000FF">${gcuser.pay+guser.syep}</font></a>
            <LI><a target="main" href="vipup" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-993981874'/></a>
            <LI><a target="main" href="bdbdate" style="text-decoration: none">报单币明细</a><c:if test="${gcuser.vip>0}">--<b><a target="main" href="bdbzz"><font size="2" color="#008000">转出</font></a></b></c:if>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.667104660'/>：<font color="#0000FF">${fbpay}</font>
            <LI><font color="#FF0000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.801984907'/>：<c:if test="${fbpay<1}">0</c:if><c:if test="${fbpay>=1}">${fbpay}</c:if></font>
            <LI><font color="#FF0000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.928097715'/>：${mqfh}</font>
            <LI><a target="main" href="tgdown" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.777812136'/></a>
            <LI><a target="main" href="regTheSame" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1617148055'/></a>
            <LI><a target="main" href="tjz" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1302859212'/></a>
            </LI></UL></DD></DL>
	    <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.618950045'/></font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="login2j?inputUrl=loginep.jsp" style="text-decoration: none"><font color="#FF0000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.618997695'/></font></a>
            <LI><a target="main" href="datepay" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1470113791'/></a><c:if test="${gcuser.username=='300fhk'}">--<b><a target="main" href="jzpay.asp"><font size="2" color="#008000">商城退款</font></a></b></c:if>
            <LI><a target="main" href="ybcg" style="text-decoration: none"><font color="#0000FF"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.618812044'/></font></a>
			<LI><a target="main" href="login2j?inputUrl=login3j.jsp" style="text-decoration: none"><s:text name="viewyblc-sales.jsp.yblc-sales.jsp.618675493"></s:text></a><c:if test="${gcuser.vip==2}">--<b><a target="main" href="vipjzpay"><font size="2" color="#008000"><s:text name="vipadmin_menu.jsp.admin_menu.jsp.1246610827"></s:text></font></a></b></c:if>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1710120446'/>：<font color="#0000FF">${gcuser.cxt}</font>
            <LI><a target="main" href="login2j?inputUrl=login8j.jsp" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1811565864'/></a>
            <LI><a target="main" href="login2j?inputUrl=loginmc.jsp" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1842504285'/></a>
            <LI><a target="main" href="login2j?inputUrl=loginmy.jsp" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2008491582'/></a>
            <LI><a target="main" href="login2j?inputUrl=login5j.jsp" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></a>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.951062035'/></font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="vipgo" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.782396711'/></a>
            <LI><a target="main" href="login2j?inputUrl=loginjf.jsp" style="text-decoration: none"><font color="#FF0000"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.951109685'/></font></a>
            <LI><a target="main" href="oycg" style="text-decoration: none"><font color="#0000FF"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.950924034'/></font></a>
            <LI><a target="main" href="jfgame" style="text-decoration: none"><font color="#0000FF"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.951004942'/></font></a>
			<LI><a target="main" href="mysl" style="text-decoration: none"><s:text name="vipadmin_menu.jsp.admin_menu.jsp.-1561011545"></s:text></a>
            <LI><a target="main" href="mcsl" style="text-decoration: none"><s:text name="vipadmin_menu.jsp.admin_menu.jsp.-398700255"></s:text></a>
            <LI><a target="main" href="gpjy" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1151284962'/></a>
            <LI><a target="main" href="gpjysc" style="text-decoration: none"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1151358946'/></a>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1002641178'/>：<font color="#800000"><font size="2">${gcuser.cfa}</font></font>
            <LI><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1002856070'/>：<font color="#008000"><font size="2">${gcuser.cfb}</font></font>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.871093494'/></font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="datepay"><font size="2" color="#008080"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.669584602'/>：</font><font size="2" color="#FF0000">${gcuser.pay}</font></a>
			<LI><a target="main" href="ybhfcj.asp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1102075283'/>(100)</a>
			<LI><a target="main" href="http://yb.zgyce.com/index.asp?vipid=${gcuser.username}&vippa=${gcuser.password}"><font size="2" color="#008080">一币换购商品</font></a>
			<LI><a target="main" href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=${gcuser.username}"><font size="2" color="#008080">一币换购记录</font></a>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT>
			<a style="text-decoration: none; font-weight:700" target="_top" href="logout?type=1"><font size="2"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1119407294'/></font></A></DT></DL>
		  </DD></DL></DIV></DIV>
<meta http-equiv=Refresh content="240; url=">
