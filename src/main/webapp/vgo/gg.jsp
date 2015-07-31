<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${isHaveTxPayBuy==true}"><script language=javascript>alert('您有认购他人一币还没有付款，请尽快完成付款！');location.replace('../vip/epmyjl.asp');</script></c:if>
<c:if test="${isHaveTxPaySale==true}"><script language=javascript>alert('您的一币卖出已有他人收购并给您付款，请你尽快查收并及时确认，如有问题联系客服！');location.replace('../vip/epmcjl.asp');</script></c:if>
<c:if test="${dq=='0' or dq=='2' or dq=='7' or dq=='8'}">
<c:set var="cz01" value="中国一川【①号】客服QQ：613697151"></c:set>
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
</c:if>
<c:if test="${dq=='1' or dq=='3' or dq=='4' or dq=='5' or dq=='6'}">
<c:set var="cz01" value="中国一川【②号】客服QQ：613697152"></c:set>
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
</c:if>
<html>
<head>
<title>积分游戏平台--公告管理</title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script>
 //alert("提示：公司财务收款账号于2015年05月01日起有变更，付款请以变更后的为准，详情请查看公告！");
</script>
<body topmargin="5" leftmargin="5">
<div align="center">
      <div align="center">
      <table border="0" width="100%" id="table22" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
	<td align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">有任何事情请联系：<b><font color="#0000FF">${cz01}</font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题</font><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 11pt"><a href="javascript:openwindow('bank.asp?dq=${dq}')" style="text-decoration: none">本服务中心已配备指定的客服人员，专用的收款账号名字为“<b><font color="#FF0000">${cz02}</font></b>”--点击查看汇款账号</a></font></td>
		</tr>
	</table>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="楷体_GB2312" size="4"><a href="../enter/bmuser.asp?user=${gcuser.username}" style="text-decoration: none; font-weight: 700; background-color:#FFFF00"><font color="#FF0000">2015*缘聚暹罗-活动报名及进度查询</font></a></font></div>
<table border="0" width="100%" bordercolor="#006699" height="29">
    <tr>
      <td width="100%" height="25" bgcolor="#D0FFF0"> <p align="center" style="margin-top: 0; margin-bottom: 0"><font face="宋体"><b>管理员公告</b></font></td> 
  </tr>  <tr> 
	<p style="margin-top: 0; margin-bottom: 0">
	<font face="宋体" size="2"><br> 
	</font></p>
		<div align="center">
            
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="61">
            <tr> 
              <td width="68" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><strong><font face="宋体" style="font-size: 11pt">序号</font></strong></td>
              <td width="112" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><strong>发布人</strong></font></td>
              <td width="504" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>公 告 标 题</b></font></td>
              <td width="232" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>发布时间</b></font></td>
              <td width="100" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>操作</b></font></td>
              </tr>
              
	
	<s:iterator var="data" value="dgagList">
              <tr> 
                <td valign="middle" height="34" width="68" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" style="font-size: 11pt">${data.id}</font></td>
                <td valign="middle" width="112" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" style="font-size: 11pt">公司</font></td>
                <td valign="middle" align="center" width="504"><font color="#000000" face="宋体" style="font-size: 11pt">${data.ggbt}</font></td>
                <td valign="middle" align="center" width="232"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt">${data.ggdate}</font></td>
                <td valign="middle" align="center" width="100"><font color="#000000" face="宋体" style="font-size: 11pt"><p style="margin-top: 0; margin-bottom: 0"><a href="ggck?ck=${data.id}" style="text-decoration: none">查看</a>
	      </s:iterator>
	 </table> 
		  </div>
<font face="宋体" size="2">
	<aldtags:pageTag />

	</font></td> 
</tr> 
</table> 
</div> 
</body> 
</html>