<!--#include file=../ct0618.asp-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file=../mq0618.asp-->
<%
user=request("userid")
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from gcuser where username ='"&user&"'"
rs.open sql,conn2,1,1
%>
<% 
sql_ztx="select sum(paynum) as ljztx from txpay where payusername = '" &user& "'" 
Set rs_ztx= Server.CreateObject("ADODB.Recordset") 
rs_ztx.open sql_ztx,conn1,1,1
%>
<%
set rsf=server.createobject("adodb.recordset")
sqlf="select * from sgxt where username = '" &user& "'"
rsf.open sqlf,conn7,1,1
if not rsf.eof then
amqfh=rsf("mqfh")
azfh=rsf("zfh")
end if
%>
<html>
<head>
<title>协议用户</title>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">
</body>
</html>
<div align="center">
<form name="form" METHOD="POST" action="syidtxok.asp?userid=<%=user%>">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="243">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> <b><font style="font-size: 11pt">修改会员信息</font></b></td>
      </tr>
		<tr>
        <td align="right" width="40%" height="29" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font size="3">用户名：</font></td>
        <td width="58%" align="left" height="29" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font color="#FF0000" size="3"><b><%=rs("username")%>--</b></font><font size="3">余额：</font><font color="#0000FF" size="3"><%=rs("pay")%></font></td>
      </tr>
      <tr>
        <td align="right" width="40%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">姓 名：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt"><%=rs("name")%>--单数<font color="#FF0000"><%=rs("sjb")*500%></font></font></td>
      </tr>
		<tr>
        <td align="right" width="40%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">累计提现：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><%=rs_ztx("ljztx")%></td>
      </tr>
      <tr>
        <td align="right" width="40%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">目前返还：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><%=amqfh%>--总返<b><font color="#008000"><%=azfh%></font></b></td>
      </tr>
      <tr> 
        <td align="right" width="40%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt; font-weight:700">修改返还：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=32 name="pdid" size="10" value="<%=rs("fhpay")%>"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="40%" height="31" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt; font-weight:700">不可卖：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=32 name="vpay" size="10" value="<%=rs("vippay")%>"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="40%" height="31" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">操作密码：</td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="password" name="pa02" size="20"></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="40%" height="31" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">　</td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="submit" value="提 交 修 改" name="B1" style="font-weight: bold; font-size:10pt"></span></font></td>
      </tr>
      </table>
      </center>
    </div>
</div>