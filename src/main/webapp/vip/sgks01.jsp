<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('升级双区玩家成功！');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('用户名输入错误或不属于自己团队的玩家，请检查后再试！');history.go(-1);</script></c:if>
<HTML>
<title>游戏业务-查询</title>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>
<BODY bgcolor="#FFFFFF" style="text-align: center" >
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI><a target="main" href="login2j" style="text-decoration: none">个人信息</A> </LI>
  <LI><a target="main" href="downtj.asp" style="text-decoration: none">网络查询</A> </LI>
  <LI><a target="main" href="mzff.asp" style="text-decoration: none">财务管理</A> </LI>
  <LI><A>消息管理</A></LI>
  <LI><a style="text-decoration: none" target="_top" href="logout?type=1">退出系统</A> </LI>
</UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:center">
	<div align="center">
	<table border="0" width="65%" id="table2" height="100">
	<tr>
	<td colspan="4" align="center" height="25">
	<table border="0" width="100%" id="table3">
	<tr>
	<td align="center" width="42%"><p align="left"><span style="font-size: 11pt">当前查询用户名：<b><font color="#FF0000">${myup}</font></b></span></td>
	<td align="center"><p align="left">　</td>
	<td align="center" width="35%"><p align="left"><span style="font-size: 11pt; font-weight:700"><a href="sgks01?bd=${bdid}&myup=${userName}"><font color="#008000">返回自己：${userName}</font></a></span></td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2">累计</font></b></td>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2">即将结算</font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="25">左区</td>
			<td align="center" bgcolor="#FFFF97" height="25">右区</td>
			<td align="center" bgcolor="#FFDDBB" height="25">左区</td>
			<td align="center" bgcolor="#FFDDBB" height="25">右区</td>
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
				<td width="80"><p align="center"><font size="2">用户名：</font></td>
				<td width="132"><input type="text" name="myup" size="15"></td>
				<td width="130"><input type="submit" value="查找接点人" name="B1"></td>
				<td><p align="left"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="3">返回上一页</font></a></p></td>
			</tr>
		</table>
	</form>
	<table border="0" width="65%" id="table4" height="535">
		<tr>
			<td align="center" bgcolor="#E9FFD2" colspan="4"><b><font size="2" color="#008000">(${myup})</font><font size="2" color="#FF0000">当前3层内分布情况</font></b></td>
			<td align="center" bgcolor="#FFE888" colspan="4"><b><font size="2" color="#008000">(${myup})</font><font size="2" color="#FF0000">当前十六层内层封顶情况</font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#E9FFD2"><b>系数</b></td>
			<td bgcolor="#E9FFD2"><b>用户名</b></td>
			<td bgcolor="#E9FFD2"><b>左总</b></td>
			<td bgcolor="#E9FFD2"><b>右总</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>层数</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>左总</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>右总</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>层封</b></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#E3E3E3"><b>1-1</b></td>
			<td width="143" bgcolor="#E3E3E3"><font size="2" face="宋体">
			<c:if test="${!empty sgxt.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxt.auid}" style="text-decoration: none">${sgxt.auid}（${sgxta.sjb}）</a></c:if>
			<c:if test="${empty sgxt.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><c:if test="${sgxta.zaq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxta.zaq}</font></b><font size="2"></c:if></font></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><c:if test="${sgxta.zbq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxta.zbq}</font></b><font size="2"></c:if></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>一</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z1}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y1}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#E3E3E3"><b>1-2</b></td>
			<td width="143" bgcolor="#E3E3E3"><font size="2" face="宋体">
			<c:if test="${!empty sgxt.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxt.buid}" style="text-decoration: none">${sgxt.buid}（${sgxtb.sjb}）</a></c:if>
			<c:if test="${empty sgxt.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
			
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><c:if test="${sgxtb.zaq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtb.zaq}</font></b><font size="2"></c:if></font></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><c:if test="${sgxtb.zbq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtb.zbq}</font></b><font size="2"></c:if></font></font></td>
			
			
			<td align="center" bgcolor="#FFF2BF"><b>二</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z2}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y2}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-1</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体">
			<c:if test="${!empty sgxta.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxta.auid}" style="text-decoration: none">${sgxta.auid}（${sgxtaa.sjb}）</a></c:if>
			<c:if test="${empty sgxta.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
			
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><c:if test="${sgxtaa.zaq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtaa.zaq}</font></b><font size="2"></c:if></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><c:if test="${sgxtaa.zbq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtaa.zbq}</font></b><font size="2"></c:if></font></font></td>
			
			
			<td align="center" bgcolor="#FFF2BF"><b>三</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z3}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y3}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-2</b></td>
			
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体">
			<c:if test="${!empty sgxta.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxta.buid}" style="text-decoration: none">${sgxta.buid}（${sgxtab.sjb}）</a></c:if>
			<c:if test="${empty sgxta.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if>
			</font></td>
			
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><c:if test="${sgxtab.zaq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtab.zaq}</font></b><font size="2"></c:if></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><c:if test="${sgxtab.zbq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtab.zbq}</font></b><font size="2"></c:if></font></font></td>
			
			<td align="center" bgcolor="#FFF2BF"><b>四</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z4}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y4}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-3</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体">
			<c:if test="${!empty sgxta.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxta.auid}" style="text-decoration: none">${sgxta.auid}（${sgxtba.sjb}）</a></c:if>
			<c:if test="${empty sgxta.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
			</font></td>

			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><c:if test="${sgxtba.zaq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtba.zaq}</font></b><font size="2"></c:if></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><c:if test="${sgxtba.zbq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtba.zbq}</font></b><font size="2"></c:if></font></font></td>
			
			
			<td align="center" bgcolor="#FFF2BF"><b>五</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z5}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y5}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-4</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体">
			<c:if test="${!empty sgxtb.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtb.buid}" style="text-decoration: none">${sgxtb.buid}（${sgxtbb.sjb}）</a></c:if>
			<c:if test="${empty sgxtb.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
			</font></td>
						
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><c:if test="${sgxtbb.zaq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtbb.zaq}</font></b><font size="2"></c:if></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><c:if test="${sgxtbb.zbq!=''}"></font><font face="宋体"><b><font size="2" color="#FF0000">${sgxtbb.zbq}</font></b><font size="2"></c:if></font></font></td>
			
			
			<td align="center" bgcolor="#FFF2BF"><b>六</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z6}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y6}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-1</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体">
			<c:if test="${!empty sgxtaa.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtaa.auid}" style="text-decoration: none">${sgxtaa.auid}（${sgxtaaa.sjb}）</a></c:if>
			<c:if test="${empty sgxtaa.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
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
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体">
			<c:if test="${!empty sgxtaa.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtaa.buid}" style="text-decoration: none">${sgxtaa.buid}（${sgxtaab.sjb}）</a></c:if>
			<c:if test="${empty sgxtaa.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
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
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体">
			<c:if test="${!empty sgxtab.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtab.auid}" style="text-decoration: none">${sgxtab.auid}（${sgxtaba.sjb}）</a></c:if>
			<c:if test="${empty sgxtab.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
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
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体">
			<c:if test="${!empty sgxtab.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtab.buid}" style="text-decoration: none">${sgxtab.buid}（${sgxtabb.sjb}）</a></c:if>
			<c:if test="${empty sgxtab.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
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
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体">
			<c:if test="${!empty sgxtba.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtba.auid}" style="text-decoration: none">${sgxtba.auid}（${sgxtbaa.sjb}）</a></c:if>
			<c:if test="${empty sgxtba.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十一</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z11}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y11}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-6</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体">
			<c:if test="${!empty sgxtba.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtba.buid}" style="text-decoration: none">${sgxtba.buid}（${sgxtbab.sjb}）</a></c:if>
			<c:if test="${empty sgxtba.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>			
			</font></td>
			
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十二</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z12}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y12}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-7</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体">
			<c:if test="${!empty sgxtbb.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtbb.auid}" style="text-decoration: none">${sgxtbb.auid}（${sgxtbba.sjb}）</a></c:if>
			<c:if test="${empty sgxtbb.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>	
			</font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十三</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z13}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y13}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-8</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体">
			<c:if test="${!empty sgxtbb.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtbb.buid}" style="text-decoration: none">${sgxtbb.buid}（${sgxtbbb.sjb}）</a></c:if>
			<c:if test="${empty sgxtbb.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></font></td>	
			</font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十四</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z14}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y14}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="367" bgcolor="#E3E3E3" colspan="4"><p align="left"><font color="#0000FF">当前3层内的左总与右总指的是该用户名网络下全部累计总单数</font></td>
			<td align="center" bgcolor="#FFF2BF"><b>十五</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z15}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y15}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
		<tr>
			<td align="center" width="367" bgcolor="#E3E3E3" colspan="4"><p align="left"><font color="#0000FF">当前16层内指的是</font><b><font size="2" color="#008000">(${myup})</font></b><font color="#0000FF">各层左与右目前的总单数</font></td>
			<td align="center" bgcolor="#FFF2BF"><b>十六</b></td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.z16}</td>
			<td align="center" bgcolor="#FFF2BF">${sgxt.y16}</td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000">${sgxt.cfd}</font></td>
		</tr>
	</table>
	<p>　</div>
	<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">返回上一页</font></a></p>
</div></div>
</BODY>
</HTML>