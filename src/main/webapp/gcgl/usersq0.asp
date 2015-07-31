<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<html><head><title>会员资料查看</title>
<style>
<!--
p{color:000000;FONT-FAMILY: "??"; font-size: 9pt ;line-height: 20px;}
p{color:000000;FONT-FAMILY: "宋体"; font-size: 9pt ;line-height: 18px;}
-->
</style>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">

</body>
</html>
<div align="center">
<font face="宋体" style="font-size: 11pt">
<%
userid=request("userid")
'Set rs_gl = Server.CreateObject("ADODB.Recordset") 
'sql_gl="select  * from sgxt where username = '"&userid&"'"
'rs_gl.open sql_gl,conn7,2,3
'rs_gl("aq")=0
'rs_gl("bq")=0
'rs_gl.update
%>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%></font><form name="form" METHOD="POST" action="jbusersave.asp?userid=<%=userid%>">
    <div align="center">
      <center>
    　<table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="359">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> <b><font style="font-size: 11pt">修改会员信息</font></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="29" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF">
		<b><font size="3">用户名：</font></b></td>
        <td width="62%" align="left" height="29" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF">
		<font color="#FF0000" size="3"><b><%=rs("username")%>&nbsp;&nbsp; </b> </font>
		<b><font size="3">推荐人：</font><font color="#000080" size="3"><%=rs("up")%></font></b></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">姓 名：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt"><%=trim(rs("name"))%> </font> </td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">开户行：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><select size="1" name="bank">
		<option selected><%=trim(rs("bank"))%></option>
		<option>财付通</option>
		<option>工商银行</option>
		<option>建设银行</option>
		<option>农业银行</option></select>-------------<%if rs("sjb")>0 then%><b>双区会员：<font color="#FF0000"><%=rs("sjb")%></font>单</b></span></font><%end if%></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">银行卡号：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=32 name="card" size="30" value="<%=trim(rs("card"))%>"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><b><font style="font-size: 11pt">Email</font></b><font style="font-size: 11pt">：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=64 name="email" value="<%=trim(rs("email"))%>" size="30"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font color="#FF0000" style="font-size: 11pt"><b>QQ：</b></font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=12 name="QQ" value="<%=trim(rs("qq"))%>" size="30" style="background-color: #E1FFF3"></span></font><font style="font-size: 11pt"></font></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">电话号码：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt">
		<input type="text" maxlength=12 name="QQ1" value="<%=trim(rs("call"))%>" size="30" style="padding:0; background-color: #FFFFFF; color:#0000FF"></span></font></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">地址：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=64 name="address" value="<%=trim(rs("addsheng"))%><%=trim(rs("addshi"))%><%=trim(rs("addqu"))%>" size="50"></span></font><font style="font-size: 11pt"></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">会员注册日期：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" name="regtime" size="30" value="<%=trim(rs("regtime"))%>" readonly></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">成为管理时间：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=20 name="dldate" value="<%=trim(rs("dldate"))%>" size="30" readonly>&nbsp;</span><b><font style="font-size: 11pt">管理设置</font></b></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#C9D8AD"><font style="font-size: 11pt">最近登录时间：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#C9D8AD"> <font face="宋体"><span style="font-size: 11pt">
		<input type="text" maxlength=20 name="dldate1" value="<%=trim(rs("logtime"))%>" size="30" readonly></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">级别：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> <font face="宋体"><span style="font-size: 11pt"><input type="text" name="jb" size="10" value="<%=trim(rs("jb"))%>" readonly><font color="#FF0000">&nbsp;</font></span></font><font color="#0000FF" style="font-size: 11pt">2省级管理 3市级管理 4区级管理 5合作商家</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">充值累计：</span></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" name="cjtj" size="15" value="<%=trim(rs("cjtj"))%>" >最近一次充值时间：<%=trim(rs("gmdate"))%></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">累计收入：</span></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" name="cbpay" size="15" value="<%=trim(rs("cbpay"))%>" readonly></span></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">余额：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" name="pay" size="15" value="<%=trim(rs("pay"))%>" readonly></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">已提现：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=6 name="txpay" value="<%=trim(rs("txpay"))%>" size="15"></span></font></td>
      </tr>
      <tr> 
       <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="22"> 
       <div align="center"><font face="黑体"><b>
		<a style="text-decoration: none" target="_blank" href="../vip/chkinidex2.asp?pa=<%=rs("password")%>&id=<%=rs("username")%>">
		<font color="#FF00FF" size="3">登录</font></a></b></font></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</div>
</form></font>
<p style="line-height: 100%; margin-top: 0; margin-bottom: 0">
　</p>
<p style="line-height: 100%; margin-top: 0; margin-bottom: 0">
　</p>
<p style="line-height: 100%; margin-top: 0; margin-bottom: 0">
　</p>

