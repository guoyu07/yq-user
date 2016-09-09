<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipsgks01.jsp.sgks01.jsp.1836756650'/>！');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipsgks01.jsp.sgks01.jsp.2073267590'/>！');history.go(-1);</script></c:if>
<HTML>
<title><s:text name='vipsgks01.jsp.sgks01.jsp.1183681516'/></title>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>
<BODY bgcolor="#FFFFFF" style="text-align: center" >
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI><a target="main" href="login2j" style="text-decoration: none"><s:text name='vipdatepay.jsp.datepay.jsp.616144510'/></A> </LI>
  <LI><a target="main" href="downtj.asp" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1003047816'/></A> </LI>
  <LI><a target="main" href="mzff.asp" style="text-decoration: none"><s:text name='vipdatepay.jsp.datepay.jsp.1097687684'/></A> </LI>
  <LI><A><s:text name='vipdatepay.jsp.datepay.jsp.860074668'/></A></LI>
  <LI><a style="text-decoration: none" target="_top" href="logout?type=1"><s:text name='vipdatepay.jsp.datepay.jsp.1119407294'/></A> </LI>
</UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location><s:text name='viploginep.jsp.loginep.jsp.-1860602679'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:center">
	<div align="center">
	<table border="0" width="65%" id="table2" height="100">
	<tr>
	<td colspan="4" align="center" height="25">
	<table border="0" width="100%" id="table3">
	<tr>
	<td align="center" width="42%"><p align="left"><span style="font-size: 11pt"><s:text name='vipsgks01.jsp.sgks01.jsp.13937927'/>：<b><font color="#FF0000">${myup}</font></b></span></td>
	<td align="center"><p align="left">　</td>
	<td align="center" width="35%"><p align="left"><span style="font-size: 11pt; font-weight:700"><a href="sgks01?bd=${bdid}&myup=${userName}"><font color="#008000"><s:text name='vipsgks01.jsp.sgks01.jsp.1119330385'/>：${userName}</font></a></span></td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2"><s:text name='vipsgks01.jsp.sgks01.jsp.1029202'/></font></b></td>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2"><s:text name='vipsgks01.jsp.sgks01.jsp.660102487'/></font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="25"><s:text name='vipsgks01.jsp.sgks01.jsp.766484'/></td>
			<td align="center" bgcolor="#FFFF97" height="25"><s:text name='vipsgks01.jsp.sgks01.jsp.687527'/></td>
			<td align="center" bgcolor="#FFDDBB" height="25"><s:text name='vipsgks01.jsp.sgks01.jsp.766484'/></td>
			<td align="center" bgcolor="#FFDDBB" height="25"><s:text name='vipsgks01.jsp.sgks01.jsp.687527'/></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="26"><font color="#FF0000">${sgxt.zaq}</font></td>
			<td align="center" bgcolor="#FFFF97" height="26"><font color="#FF0000">${sgxt.zbq}</font></td>
			<td align="center" bgcolor="#FFDDBB" height="26"><font color="#FF0000">${sgxt.aq}</font></td>
			<td align="center" bgcolor="#FFDDBB" height="26"><font color="#FF0000">${sgxt.bq}</font></td>
		</tr>
	</table>
	<form method="POST" action="sgks01" name="Form">
		<table border="0" width="65%" id="table5" height="30" bgcolor="#FFFFFF">
			<tr>
				<td width="80"><p align="center"><font size="2"><s:text name='vipdatepay.jsp.datepay.jsp.29623262'/>：</font></td>
				<td width="132"><input type="text" name="myup" size="15"></td>
				<td width="130"><input type="submit" value="<s:text name='vipsgks01.jsp.sgks01.jsp.-430336595'/>" name="B1"></td>
				<td><p align="left"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="3"><s:text name='vipdatepay.jsp.datepay.jsp.326654005'/></font></a></p></td>
			</tr>
		</table>
	</form>
	<table border="0" width="65%" id="table4" height="535">
		<tr>
			<td align="center" bgcolor="#E9FFD2" colspan="4"><b><font size="2" color="#008000">(${myup})</font><font size="2" color="#FF0000"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1917466217'/></font></b></td>
			<td align="center" bgcolor="#FFE888" colspan="4"><b><font size="2" color="#008000">(${myup})</font><font size="2" color="#FF0000"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.438864785'/></font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#E9FFD2"><b><s:text name='vipsgks01.jsp.sgks01.jsp.1017813'/></b></td>
			<td bgcolor="#E9FFD2"><b><s:text name='vipdatepay.jsp.datepay.jsp.29623262'/></b></td>
			<td bgcolor="#E9FFD2"><b><s:text name='vipsgks01.jsp.sgks01.jsp.769813'/></b></td>
			<td bgcolor="#E9FFD2"><b><s:text name='vipsgks01.jsp.sgks01.jsp.690856'/></b></td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.758126'/></b></td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.769813'/></b></td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.690856'/></b></td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.755711'/></b></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#E3E3E3"><b>1-1</b></td>
			<td width="143" bgcolor="#E3E3E3"><font size="2" >
			<c:if test="${!empty sgxt.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxt.auid}" style="text-decoration: none">${sgxt.auid}（${sgxta.sjb}）</a></c:if>
			<c:if test="${empty sgxt.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if></font></td>
			<td width="72" bgcolor="#E3E3E3"><font  size="2"><c:if test="${sgxta.zaq!=''}">${sgxta.zaq}</c:if></font></font></td>
			<td width="72" bgcolor="#E3E3E3"><font  size="2"><c:if test="${sgxta.zbq!=''}">${sgxta.zbq}</c:if></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>一</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z1}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y1}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#E3E3E3"><b>1-2</b></td>
			<td width="143" bgcolor="#E3E3E3"><font size="2" >
			<c:if test="${!empty sgxt.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxt.buid}" style="text-decoration: none">${sgxt.buid}（${sgxtb.sjb}）</a></c:if>
			<c:if test="${empty sgxt.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if></font></td>
			
			<td width="72" bgcolor="#E3E3E3"><font  size="2"><c:if test="${sgxtb.zaq!=''}">${sgxtb.zaq}</c:if></font></font></td>
			<td width="72" bgcolor="#E3E3E3"><font  size="2"><c:if test="${sgxtb.zbq!=''}">${sgxtb.zbq}</c:if></font></font></td>
			
			
			<td align="center" bgcolor="#FFF2BF"><b>二</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z2}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y2}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-1</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" >
			<c:if test="${!empty sgxta.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxta.auid}" style="text-decoration: none">${sgxta.auid}（${sgxtaa.sjb}）</a></c:if>
			<c:if test="${empty sgxta.auid}">
			    <c:if test="${not empty sgxta.username}"><a href="sgreg?bd=${bdid}&myup=${sgxta.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if>
			    <c:if test="${empty sgxta.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>
			
			<td width="72" bgcolor="#FFFFE1"><font  size="2"><c:if test="${sgxtaa.zaq!=''}">${sgxtaa.zaq}</c:if></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font  size="2"><c:if test="${sgxtaa.zbq!=''}">${sgxtaa.zbq}</c:if></font></font></td>
			
			
			<td align="center" bgcolor="#FFF2BF"><b>三</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z3}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y3}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-2</b></td>
			
			<td width="143" bgcolor="#FFFFE1"><font size="2" >
			<c:if test="${!empty sgxta.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxta.buid}" style="text-decoration: none">${sgxta.buid}（${sgxtab.sjb}）</a></c:if>
			<c:if test="${empty sgxta.buid}">
				<c:if test="${not empty sgxta.username}"><a href="sgreg?bd=${bdid}&myup=${sgxta.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if>
				<c:if test="${empty sgxta.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if>
			</font></td>
			<td width="72" bgcolor="#FFFFE1"><font  size="2"><c:if test="${sgxtab.zaq!=''}">${sgxtab.zaq}</c:if></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font  size="2"><c:if test="${sgxtab.zbq!=''}">${sgxtab.zbq}</c:if></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>四</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z4}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y4}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-3</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" >
			<c:if test="${!empty sgxta.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxta.auid}" style="text-decoration: none">${sgxta.auid}（${sgxtba.sjb}）</a></c:if>
			<c:if test="${empty sgxta.auid}">
			   <c:if test="${not empty sgxtb.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtb.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if>
			   <c:if test="${empty sgxtb.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			 </c:if></font></td>
			</font></td>
			<td width="72" bgcolor="#FFFFE1"><font  size="2"><c:if test="${sgxtba.zaq!=''}">${sgxtba.zaq}</c:if></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font  size="2"><c:if test="${sgxtba.zbq!=''}">${sgxtba.zbq}</c:if></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>五</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z5}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y5}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-4</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" >
			<c:if test="${!empty sgxtb.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtb.buid}" style="text-decoration: none">${sgxtb.buid}（${sgxtbb.sjb}）</a></c:if>
			<c:if test="${empty sgxtb.buid}">
			   <c:if test="${not empty sgxtb.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtb.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if>
			   <c:if test="${empty sgxtb.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>
			</font></td>
						
			<td width="72" bgcolor="#FFFFE1"><font  size="2"><c:if test="${sgxtbb.zaq!=''}">${sgxtbb.zaq}</c:if></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font  size="2"><c:if test="${sgxtbb.zbq!=''}">${sgxtbb.zbq}</c:if></font></font></td>
			
			
			<td align="center" bgcolor="#FFF2BF"><b>六</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z6}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y6}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-1</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" >
			<c:if test="${!empty sgxtaa.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtaa.auid}" style="text-decoration: none">${sgxtaa.auid}（${sgxtaaa.sjb}）</a></c:if>
			
			<c:if test="${empty sgxtaa.auid}">
			<c:if test="${not empty sgxtaa.username}">
			<a href="sgreg?bd=${bdid}&myup=${sgxtaa.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a>
			</c:if>
			<c:if test="${empty sgxtaa.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>
			</font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>七</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z7}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y7}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-2</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" >
			<c:if test="${!empty sgxtaa.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtaa.buid}" style="text-decoration: none">${sgxtaa.buid}（${sgxtaab.sjb}）</a></c:if>
			<c:if test="${empty sgxtaa.buid}">
			    <c:if test="${not empty sgxtaa.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtaa.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if>
			    <c:if test="${empty sgxtaa.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>
			</font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>八</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z8}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y8}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-3</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" >
			<c:if test="${!empty sgxtab.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtab.auid}" style="text-decoration: none">${sgxtab.auid}（${sgxtaba.sjb}）</a></c:if>
			<c:if test="${empty sgxtab.auid}">
			    <c:if test="${not empty sgxtab.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtab.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if>
			    <c:if test="${empty sgxtab.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>
			</font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>九</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z9}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y9}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-4</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" >
			<c:if test="${!empty sgxtab.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtab.buid}" style="text-decoration: none">${sgxtab.buid}（${sgxtabb.sjb}）</a></c:if>
			<c:if test="${empty sgxtab.buid}">
			    <c:if test="${not empty sgxtab.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtab.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a></c:if>
			    <c:if test="${empty sgxtab.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>
			</font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z10}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y10}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-5</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" >
			<c:if test="${!empty sgxtba.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtba.auid}" style="text-decoration: none">${sgxtba.auid}（${sgxtbaa.sjb}）</a></c:if>
			<c:if test="${empty sgxtba.auid}">
			   <c:if test="${not empty sgxtba.username}">
			   		<a href="sgreg?bd=${bdid}&myup=${sgxtba.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a>
			   </c:if>
			   <c:if test="${empty sgxtba.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.680671'/></b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z11}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y11}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-6</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" >
			<c:if test="${!empty sgxtba.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtba.buid}" style="text-decoration: none">${sgxtba.buid}（${sgxtbab.sjb}）</a></c:if>
			<c:if test="${empty sgxtba.buid}">
			   <c:if test="${not empty sgxtba.username}">
			   <a href="sgreg?bd=${bdid}&myup=${sgxtba.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a>
			   </c:if>
			   <c:if test="${empty sgxtba.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
            </c:if></font></td>			
			</font></td>
			
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.680811'/></b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z12}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y12}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-7</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" >
			<c:if test="${!empty sgxtbb.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtbb.auid}" style="text-decoration: none">${sgxtbb.auid}（${sgxtbba.sjb}）</a></c:if>
			<c:if test="${empty sgxtbb.auid}">
			    <c:if test="${not empty sgxtbb.username}">
			      <a href="sgreg?bd=${bdid}&myup=${sgxtbb.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a>
			    </c:if>
			    <c:if test="${empty sgxtbb.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>	
			</font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.680680'/></b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z13}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y13}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-8</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" >
			<c:if test="${!empty sgxtbb.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtbb.buid}" style="text-decoration: none">${sgxtbb.buid}（${sgxtbbb.sjb}）</a></c:if>
			<c:if test="${empty sgxtbb.buid}">
			    <c:if test="${not empty sgxtbb.username}">
			      <a href="sgreg?bd=${bdid}&myup=${sgxtbb.username}" style="text-decoration: none"><s:text name='vipsgks01.jsp.sgks01.jsp.1123809299'/></a>
			    </c:if>
			    <c:if test="${empty sgxtbb.username}"><s:text name='vipsgks01.jsp.sgks01.jsp.802378150'/></c:if>
			</c:if></font></td>	
			</font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.682938'/></b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z14}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y14}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="367" bgcolor="#E3E3E3" colspan="4"><p align="left"><font color="#0000FF"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1039881654'/></font></td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.680819'/></b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z15}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y15}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="367" bgcolor="#E3E3E3" colspan="4"><p align="left"><font color="#0000FF"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.2025953425'/></font><b><font size="2" color="#008000">(${myup})</font></b><font color="#0000FF"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.2025953425a'/></font></td>
			<td align="center" bgcolor="#FFF2BF"><b><s:text name='vipsgks01.jsp.sgks01.jsp.681548'/></b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z16}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y16}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
	</table>
	<p>　</div>
	<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4"><s:text name='vipdatepay.jsp.datepay.jsp.326654005'/></font></a></p>
</div></div>
</BODY>
</HTML>
