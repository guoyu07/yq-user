<!--#include file=../ct0618.asp-->
<!--#include file="../zqcjimg.asp"-->
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where id =2 "
rs.open sql,conn2,1,1
%>
<% 
sql_cb="select sum(cbpay) as ljcb from gcuser where jygt1<>2" 
Set rs_cb= Server.CreateObject("ADODB.Recordset") 
rs_cb.open sql_cb,conn2,1,1
%>
<% 
sql_pa="select sum(pay) as ljpa from gcuser where jygt1<>2" 
Set rs_pa= Server.CreateObject("ADODB.Recordset") 
rs_pa.open sql_pa,conn2,1,1
%>
<% 
sql_pal="select sum(pay) as ljpal from gcuser where id<10586 and jygt1<>2" 
Set rs_pal= Server.CreateObject("ADODB.Recordset") 
rs_pal.open sql_pal,conn2,1,1
%>
<% 
sql_tx="select sum(txpay) as ljtx from gcuser" 
Set rs_tx= Server.CreateObject("ADODB.Recordset") 
rs_tx.open sql_tx,conn2,1,1
%>
<% 
sql_db="select sum(jydb) as ljdb from gcuser where dbt1<>2 " 
Set rs_db= Server.CreateObject("ADODB.Recordset") 
rs_db.open sql_db,conn2,1,1
%>
<% 
sql_xt="select sum(jyg) as ljyg from gcuser where jygt1<>2" 
Set rs_xt= Server.CreateObject("ADODB.Recordset") 
rs_xt.open sql_xt,conn2,1,1
%>
<% 
sql_xtl="select sum(jyg) as ljygl from gcuser where id<10586 and jygt1<>2" 
Set rs_xtl= Server.CreateObject("ADODB.Recordset") 
rs_xtl.open sql_xtl,conn2,1,1
%>
<% 
sql_fhg="select sum(gdgc) as ljfhg from gcuser" 
Set rs_fhg= Server.CreateObject("ADODB.Recordset") 
rs_fhg.open sql_fhg,conn2,1,1
%>
<% 
sql_fhgl="select sum(gdgc) as ljfhgl from gcuser where id<10586" 
Set rs_fhgl= Server.CreateObject("ADODB.Recordset") 
rs_fhgl.open sql_fhgl,conn2,1,1
%>
<% 
sql_zfh="select sum(ljfh) as ljzfh from gcuser" 
Set rs_zfh= Server.CreateObject("ADODB.Recordset") 
rs_zfh.open sql_zfh,conn2,1,1
%>
<% 
sql_ztx="select sum(paynum) as ljztx from txpay" 
Set rs_ztx= Server.CreateObject("ADODB.Recordset") 
rs_ztx.open sql_ztx,conn1,1,1
%>
<% 
sqllj1="select sum(mcsl) as ljmc from gpjy" 
Set rslj1= Server.CreateObject("ADODB.Recordset") 
rslj1.open sqllj1,conn2,1,1
%>
<% 
sqllj2="select sum(mysl) as ljmy from gpjy" 
Set rslj2= Server.CreateObject("ADODB.Recordset") 
rslj2.open sqllj2,conn2,1,1
%>
<% 
sqljt1="select sum(mcsl) as jtmc from gpjy where DateDiff('d',date(),abdate)=0" 
Set rsjt1= Server.CreateObject("ADODB.Recordset") 
rsjt1.open sqljt1,conn2,1,1
%>
<% 
sqljt2="select sum(mysl) as jtmy from gpjy where DateDiff('d',date(),abdate)=0" 
Set rsjt2= Server.CreateObject("ADODB.Recordset") 
rsjt2.open sqljt2,conn2,1,1
%>
<% 
sqlzt1="select sum(mcsl) as ztmc from gpjy where DateDiff('d',date(),abdate)=-1" 
Set rszt1= Server.CreateObject("ADODB.Recordset") 
rszt1.open sqlzt1,conn2,1,1
%>
<% 
sqlzt2="select sum(mysl) as ztmy from gpjy where DateDiff('d',date(),abdate)=-1" 
Set rszt2= Server.CreateObject("ADODB.Recordset") 
rszt2.open sqlzt2,conn2,1,1
%>
<% 
sqlct1="select sum(mcsl) as ctmc from gpjy where DateDiff('d',date(),abdate)=-2" 
Set rsct1= Server.CreateObject("ADODB.Recordset") 
rsct1.open sqlct1,conn2,1,1
%>
<% 
sqlct2="select sum(mysl) as ctmy from gpjy where DateDiff('d',date(),abdate)=-2" 
Set rsct2= Server.CreateObject("ADODB.Recordset") 
rsct2.open sqlct2,conn2,1,1
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<title>统计全部数据</title>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>交易数据</b></p>
<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>当前总发行量：<font color="#008000"><%=rs("fsjygsl")%></font> 总成交量：<font color="#0000FF"><%=rs("jygsl")%></font> 剩余：<font color="#FF0000"><%=rs("syjygsl")%></font></b></p>
<table border="1" width="100%" id="table1" style="border-collapse: collapse" height="78">
	<tr>
		<td align="center" height="25" bgcolor="#ECECFF" width="1316" colspan="8"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><b>系统</b></font></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#ECECFF" width="140"><font size="2">全部</font></td>
		<td align="center" bgcolor="#ECECFF" width="158"><font size="2">奖金</font></td>
		<td align="center" bgcolor="#ECECFF" width="91"><font size="2">已提</font></td>
		<td align="center" bgcolor="#ECECFF" width="89"><font size="2">实提</font></td>
		<td align="center" bgcolor="#ECECFF" width="93"><font size="2">金币</font></td>
		<td align="center" bgcolor="#ECECFF" width="177"><font size="2">积分</font></td>
		<td align="center" bgcolor="#ECECFF" width="88"><font size="2">分红股</font></td>
		<td align="center" bgcolor="#ECECFF" width="110"><font size="2">总分红</font></td>
	</tr>
	<tr>
		<td align="center" height="28" bgcolor="#ECECFF" width="140"><b><font color="#008000" size="2"><%=rs_cb("ljcb")%></font></b></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="158"><font size="2"><%=rs_pa("ljpa")%>-<%=rs_pal("ljpal")%></font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="91"><font color="#800000" size="2"><%=rs_tx("ljtx")%></font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="89"><font size="2"><%=rs_ztx("ljztx")%></font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="93"><font size="2"><%=rs_db("ljdb")%></font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="177"><font size="2"><%=rs_xt("ljyg")%>-<%=rs_xtl("ljygl")%></font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="88"><font size="2"><%=rs_fhg("ljfhg")%>-<%=rs_fhgl("ljfhgl")%></font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="110"><font size="2"><%=rs_zfh("ljzfh")%></font></td>
	</tr>
</table>
<table border="1" width="100%" id="table2" style="border-collapse: collapse" height="78">
	<tr>
		<td align="center" colspan="2" height="25" bgcolor="#C8FFC8" width="313"><b><font size="2">累计</font></b></td>
		<td align="center" colspan="2" height="25" bgcolor="#FFEEFF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">今天</font></b></td>
		<td align="center" colspan="2" height="25" bgcolor="#BFE6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">昨天</font></b></td>
		<td align="center" colspan="2" height="25" bgcolor="#FFFFDD"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">前天</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#C8FFC8" width="95"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">卖出</font></b></td>
		<td align="center" bgcolor="#C8FFC8" width="171"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">买入</font></b></td>
		<td align="center" bgcolor="#FFEEFF" width="169"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">卖出</font></b></td>
		<td align="center" bgcolor="#FFEEFF" width="167"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">买入</font></b></td>
		<td align="center" bgcolor="#BFE6FF" width="175"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">卖出</font></b></td>
		<td align="center" bgcolor="#BFE6FF" width="173"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">买入</font></b></td>
		<td align="center" bgcolor="#FFFFDD" width="152"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">卖出</font></b></td>
		<td align="center" bgcolor="#FFFFDD" width="152"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">买入</font></b></td>
	</tr>
	<tr>
		<td align="center" height="28" bgcolor="#C8FFC8" width="95"><b><font size="2"><%=rslj1("ljmc")%></font></b></td>
		<td align="center" height="28" bgcolor="#C8FFC8" width="171"><b><font size="2"><%=rslj2("ljmy")%></font></b></td>
		<td align="center" height="28" bgcolor="#FFEEFF" width="169"><font color="#0000FF" size="2"><b><%=rsjt1("jtmc")%></b></font></td>
		<td align="center" height="28" bgcolor="#FFEEFF" width="167"><font color="#0000FF" size="2"><b><%=rsjt2("jtmy")%></b></font></td>
		<td align="center" height="28" bgcolor="#BFE6FF" width="175"><font color="#FF0000" size="2"><b><%=rszt1("ztmc")%></b></font></td>
		<td align="center" height="28" bgcolor="#BFE6FF" width="173"><font color="#FF0000" size="2"><b><%=rszt2("ztmy")%></b></font></td>
		<td align="center" height="28" bgcolor="#FFFFDD" width="152"><font color="#008000" size="2"><b><%=rsct1("ctmc")%></b></font></td>
		<td align="center" height="28" bgcolor="#FFFFDD" width="152"><font color="#008000" size="2"><b><%=rsct2("ctmy")%></b></font></td>
	</tr>
</table>
<form method="POST" name="form" target="I1" action="gpjy.asp"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<font color="#008000"><b>交易明细</b></font>&nbsp; 搜索：<select size="1" name="jylb">
<option selected value="0">==请选择交易类别==</option>
<option value="username">发布方</option>
<option value="dfuser">对方</option>
</select> <input type="text" name="userid" size="15">&nbsp;<input type="submit" value="提交搜索" name="B1"></p>
</form>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" align="center" src="gpjysc.asp"></iframe></p>