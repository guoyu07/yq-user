<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("pay")<15 then
   response.write"<script>alert('注意：您的一币小于15，请充值！');history.go(-1);</script>"
   response.end
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
response.cookies("lktojb")="1200"
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmmj.value==0) {      alert("请选择你要购买的金币卡面值!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>一币转金币卡</title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<body bgcolor="#99CCFF">

<div align="center">
<table border="0" width="100%" id="table1" cellspacing="1" height="700">
	<tr>
		<td height="71">
		　</td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">
			<table border="0" width="81%" id="table3" cellspacing="1" height="133" bgcolor="#FFFFFF">
			<tr>
			<td align="center" width="97%" bgcolor="#FFF4DF" height="33"><b><font color="#669933">一币-购金币卡</font></td>
				</tr>
				<b>
				<tr>
					<td height="97">

<div align="center">

<table width="636" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="136">
  
  <tr>
    <td align="center" valign="top" width="632" style="color: #304618; font-size: 12px" bordercolor="#669933"> 
      <form method="POST" align="center" action="jztojb2.asp" name="Form" onSubmit="return checkdate()">
      <div align="center">
      <TABLE width="610" border=0 cellPadding=5 cellSpacing=1 id="table5" height="52">
  <TBODY>
    <TR class=content> 
      <TD width="266" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		<p align="right" style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3" color="#FF0000">请选择要购买的金币卡面值：</font></b></TD>
      <TD width="321" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">  
              <p style="line-height: 200%; margin-top: 0; margin-bottom: 0">  
              <font size="3">  
              <select size="1" name="gmmj">
				<option value="0" selected>==请选择金币卡面值==</option>
				<option value="1">10金币（15一币/张）</option>
				<option value="5">50金币（75一币/张）</option>
				<option value="10">100金币（150一币/张）</option>
				<option value="30">300金币（450一币/张）</option>
				<option value="50">500金币（750一币/张）</option>
				<option value="100">1000金币（1500一币/张）</option>
				</select>
				</font>
				<font color="#FF0000" style="font-size: 11pt">** </font><b>&nbsp;<INPUT class=normalButton type=submit value="提 交" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
		<p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><font size="2">提示：您的一币剩余<font color="#FF0000"><%=rs("pay")%></font></font><p style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<font style="font-size: 11pt">按<font color="#FF0000">15-一币-买10金币</font>的比例，成功后显示相应金币卡</font><p style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<font style="font-size: 11pt">再到<font color="#0000FF"><b>积分理财</b></font>下<font color="#0000FF"><b>我要充值</b></font>-激活或复制赠送即可！</font></div>
</form>
    </td>
    </tr>
</table>
					</div>
					</td>
				</tr>
			</table>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0">　</p>
<p><a href="javascript:history.back();" style="text-decoration: none"><font color="#000000" style="font-weight: 700" size="6">返回上一页</font></a></p>

		</div>
		</td>
	</tr>
</table></div>