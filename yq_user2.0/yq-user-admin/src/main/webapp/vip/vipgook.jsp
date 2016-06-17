<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="中国一川【①号】客服QQ：613697151"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="中国一川【②号】客服QQ：613697152"></c:set>
</c:if>

<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<table border="0" width="100%" id="table2" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
			<td align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</span></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">有任何事情请与我联系：<b><font color="#0000FF">${cz01}</font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题</font></td>
		</tr>
		</table>
<div align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right">　</p>
	<table border="1" width="100%" id="table1" style="border-collapse: collapse">
		<tr>
			<td>
<p align="left"><b><font size="5">您选择充值<font color="#0000FF">${cjpay}</font>元</font></b></p>
<p align="left"><b>（注：每次充值最低100元，并以100元的整数递增，如200，300，400，同时需要加尾数）</b></p>
<p align="left"><font style="font-size: 16pt" color="#FF0000" face="楷体"><b>(充值成功后显示在可用一币里，可自由购买金币卡、消费或升级开通双区业务)</b></font></p>
<p align="center"><font size="5"><b><a href="javascript:openwindow('/bank?dq=${gcuser.dqu}')" style="text-decoration: none">点这里查看汇款账号</a></b></font></p>
			</td>
		</tr>
	</table>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	　</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">请大家尽量提前充值，尽量不要都挤压在晚上8点至10点，所有充值升级事宜要在晚上11点20分前办理</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">晚上11点30分后要求充值的不能及时处理属于正常现象，谢谢理解！</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"></p>
	<p align="left">　</div> 
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">返回上一页</font></a></p>