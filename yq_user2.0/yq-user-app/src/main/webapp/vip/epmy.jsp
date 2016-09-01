<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.1236241067'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.1091369424'/>！');location.replace('vipup?my=${userName}');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.-602746225'/>！');location.replace('vipup?my=${userName}');</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.532781718'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.-2082084233'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.-1471587826'/>！');location.replace('vipup?my=${userName}');</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.121840279'/>！');location.href='epjysc';</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.-1308925165'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.-1565930477'/>！');location.replace('epmyjl');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="<s:text name='vipepmy.jsp.epmy.jsp.642434221'/>QQ：613697151"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="<s:text name='vipepmy.jsp.epmy.jsp.643357742'/>QQ：613697152"></c:set>
</c:if>

<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
  function checkdate()  { 
  if (Form.epnm3.value=="") {      alert("<s:text name='vipepmy.jsp.epmy.jsp.-1989247238'/>!");      return false;    } 
  return true;  }  
 </script>
<p align="center">　</p>
<p align="center"><s:text name='vipepmy.jsp.epmy.jsp.-1234597066'/>！</p>
<p align="center">　</p>
<p align="center"><font size="6"><s:text name="vipepmy.jsp.epmy.jsp.-1710734480"></s:text>：<font color="#FF0000">${txpay.paynum}</font></font><b><font color="#FF00FF" size="5" face="楷体"><s:text name="vipepmy.jsp.epmy.jsp.-1710734480a"></s:text></font></b></p>
<p align="center"><b><font color="#800000" face="楷体" style="font-size: 20pt"><s:text name=""></s:text></font><font color="#000080" face="楷体" style="font-size: 20pt">${txpay.payusername}</font><font color="#800000" face="楷体" style="font-size: 20pt"><s:text name='pay'/>：</font><font color="#FF0000" face="楷体" style="font-size: 20pt">${txpay.paynum*0.9}</font><font face="楷体" style="font-size: 20pt"><s:text name="YUAN"></s:text></font></b></p>
<div align="center">
	<table border="0" width="80%" id="table1" cellspacing="1" bgcolor="#EFEFEF" height="135">
	<tr>
	<td><b><font color="#FF0000"><s:text name='vipepmy.jsp.epmy.jsp.-1694703455'/>：</font><font color="#0000FF">(<s:text name='vipepmy.jsp.epmy.jsp.-1694703455a'/>“</font><font color="#008000">${txpay.paybank}</font><font color="#0000FF">”)</font></b><p>
	<s:text name='vipepmy.jsp.epmy.jsp.-520616714'/>：<b><font color="#008000">${userName} </font></b><s:text name='vipepmy.jsp.epmy.jsp.-520616714a'/><b><font color="#FF0000">${txpay.paynum}</font></b><s:text name='vipepmy.jsp.epmy.jsp.-520616714b'/>！<p>
	<s:text name='vipepmy.jsp.epmy.jsp.768179352'/>“<font color="#FF0000"><s:text name='vipepmy.jsp.epmy.jsp.768179352a'/></font>”<s:text name='vipepmy.jsp.epmy.jsp.768179352b'/><font color="#0000FF">${txpay.payusername}</font><s:text name='vipepmy.jsp.epmy.jsp.768179352c'/><b><font color="#FF0000">${txpay.paynum*0.9}</font></b><s:text name='vipepmy.jsp.epmy.jsp.768179352d'/><font color="#0000FF">${txpay.payusername}</font><s:text name='vipepmy.jsp.epmy.jsp.768179352e'/><b><font color="#FF0000">${txpay.paynum*0.9}</font></b><s:text name='vipepmy.jsp.epmy.jsp.768179352f'/>！</td>
	</tr>
	</table>
<table border="0" width="80%" id="table2" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
			<td align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt"><s:text name='vipvipgook.jsp.vipgook.jsp.803273677'/>！</span></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt"><s:text name='vipvipgook.jsp.vipgook.jsp.-1069342756'/><b><font color="#0000FF">${cz01}</font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${qq}:41" alt="<s:text name='viewservice.jsp.service.jsp.488997268'/>" title="<s:text name='viewservice.jsp.service.jsp.488997268'/>"></a></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2"><s:text name='vipepmy.jsp.epmy.jsp.-1381859196'/></font></td>
		</tr>
		</table>
	</div>
<p align="center">　</p>
<form method="POST" action="epmy?ep=${ep}&status=1"  name="Form" onSubmit="return checkdate()">
	<div align="center">
		<table border="0" width="56%" id="table3">
			<tr>
				<td align="center"><p align="right"><span style="font-size: 11pt"><s:text name="vipepmy.jsp.epmy.jsp.-181528430"></s:text>：</span></td>
				<td align="center" width="160"><span style="font-size: 11pt"><input type="password" name="epnm3" size="20"></span></td>
				<td align="center" width="189"><input type="submit" value="<s:text name='vipepmy.jsp.epmy.jsp.941836283'/>" name="B1" style="font-size: 11pt; color: #0000FF; font-weight: bold; float:left"></a></td>
			</tr>
		</table>
	</div>
</form>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('<s:text name='vipepmy.jsp.epmy.jsp.-246306007'/>？ ')" href="epjysc"><font color="#008000"><s:text name='vipepmy.jsp.epmy.jsp.-246306007a'/></font></a></b></p>
<p align="center">　</p>
<script>
var secs = 60;  //6为倒计时秒数
for(i=0;i<=secs;i++) {
   window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
if(num == secs) {
	alert('<s:text name='vipepmy.jsp.epmy.jsp.1346915146'/>！');location.replace('epjysc');
}
else {
 printnr = secs-num;
 document.getElementById('sec').innerHTML = printnr;
}
}
</script>
