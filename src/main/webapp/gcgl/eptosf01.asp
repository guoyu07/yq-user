<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dim sql
dim rs
sql="select * from gcuser where username = '"&request("sfid")&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
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
  if (Form.gmsl.value==0) {      alert("请选择你要购买的数量!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>奖金购物</title>
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
			<table border="0" width="81%" id="table3" cellspacing="1" height="98" bgcolor="#FFFFFF">
				<tr>
	<b>
			<td align="center" width="97%" bgcolor="#FFF4DF" height="33">
	　</td>
				</tr>
				<b>
				<tr>
					<td height="62">

<div align="center">

<table width="619" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="70">
  
  <tr>
    <td align="center" valign="top" width="615" style="color: #304618; font-size: 12px" bordercolor="#669933"> 
      <form method="POST" align="center" action="eptosf02.asp?sfid=<%=request("sfid")%>" name="Form" onSubmit="return checkdate()">
      <div align="center">
      <TABLE width="542" border=0 cellPadding=5 cellSpacing=1 id="table5" height="20">
  <TBODY>
    <tr>
	<b>
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px" height="42">
		<p align="right" style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3">请选择要购买的产品：</font></b></TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left" height="42">  
              <p style="line-height: 200%; margin-top: 0; margin-bottom: 0">  
              <font size="3">  
              <select size="1" name="cpsl">
				<option value="0" selected>==请选择产品==</option>
				<option value="188">派水杯1个</option>
				<option value="376">派水杯2个</option>
				<option value="564">派水杯3个</option>
				<option value="752">派水杯4个</option>
				<option value="940">派水杯5个</option>
				<option value="1128">派水杯6个</option>
				<option value="1316">派水杯7个</option>
				<option value="1504">派水杯8个</option>
				<option value="1692">派水杯9个</option>
				<option value="1880">派水杯10个</option>
				</select>
				</font>
				<font color="#FF0000" style="font-size: 11pt">**</font></TD>
    </tr>
    <TR class=content> 
      <TD width="517" bgColor=#ffffff align="center" style="color: #304618; font-size: 12px" colspan="2">
	<b>
      	<p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><font size="2">提示：<font color="#000000"><%=request("sfid")%></font>的EP剩余<font color="#FF0000"><%=rs("pay")%></font>元</font></TD>
    </TR>
    <TR class=content> 
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		　</TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">  
    <b><INPUT class=normalButton type=submit value="提 交" name=submit2 style="font-size: 11pt"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">&nbsp; </font><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一步</font></a></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
					</div>
					</td>
				</tr>
			</table>
			</div>
		</td>
	</tr>
</table></div>