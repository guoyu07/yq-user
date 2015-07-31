<%
if request.cookies("regid")="" or request.cookies("password")="" then
   session.timeout=10
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"logtgs.asp" 
   response.write "</script>" 
   response.end
else
   regid=request.cookies("regid")
end if
%>
<!--#include file="../shopmfh.asp"-->
<%
dluser=request("dl")
add=request("add")
dim sql
dim rs
sql="select * from cfuser where username = '"&regid&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn1,1,1
%>
<%
dim sql1
dim rs1
sql1="select * from cfuser where username = '"&dluser&"'" 
Set rs1= Server.CreateObject("ADODB.Recordset") 
rs1.open sql1,conn1,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmsl.value==0) {      alert("请选择你要购买的数量!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>【返还百分百】-后台管理系统</title>
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
		<p align="center">
	<span style="background-color: #FFFFFF">
	<font color="#008000" style="font-size: 20pt">您的用户名(推广商编号)为 </font><b>
	<font color="#FF0000" style="font-size: 20pt"><%=regid%> </font></b>
	</span><b><font style="font-size: 20pt"><%if rs("jb")=1 then%><font color="#FF0000">(合作商家)</font><%elseif rs("jb")=2 then%><font color="#008000">(省级代售点)</font><font color="#0000FF"><%elseif rs("jb")=3 then%></font><font color="#FF00FF">(市级代售点)</font><font color="#0000FF"><%elseif rs("jb")=4 then%></font><font color="#800000">(区级代售点)<%elseif rs("jb")=5 then%></font><font color="#000080">(镇级代售点)</font><font color="#0000FF"><%else%>(业务员)<%end if%></font></font></b></td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">
			<table border="0" width="78%" id="table3" cellspacing="0" height="396" bgcolor="#FFFFFF" cellpadding="0">
				<tr><b><td align="center" width="99%" bgcolor="#FFF4DF" height="28" colspan="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="left"><b><font color="#FF00FF">&nbsp;您当前所在区域是</font><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%><%=rs("addzhen")%></b></td>
				</tr>
				<tr><td align="center" width="66%" bgcolor="#FFF4DF" height="28"><p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">&nbsp;请您按以下方式联系我们的<b><font color="#FF0000"><%=add%></font></b>区域代售点</td>
					<td align="center" width="34%" bgcolor="#FFFFFF" height="28"><b><font color="#800000">提示：每张卡统一售价为10元一张</font></b></td>
				</tr>
				<tr><td align="center" width="99%" bgcolor="#EEEEEE" height="28" colspan="2"><p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>&nbsp;联系地址：<font color="#008000"><%=rs1("addsheng")%><%=rs1("addshi")%><%=rs1("addqu")%><%=rs1("addzhen")%><%=rs1("address")%></font></b></td>
				</tr>
				<tr><td height="28" colspan="2" bgcolor="#EEEEEE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>&nbsp;联系人：<font color="#0000FF"><%=rs1("name")%></font>&nbsp;&nbsp; 联系电话：</b><font color="#0000FF"><b><%=rs1("call")%></b></font><b>&nbsp; QQ：</b><font color="#0000FF"><b><%=rs1("qq")%></b></font></td>
				</tr>
				<tr><td height="28" colspan="2" bgcolor="#E1FFE1">&nbsp;公司实行统一管理，规范市场，请商家务必联系当地代售点购买卡！</td>
				</tr>
				<tr><td height="45" colspan="2">
<div align="center">
<table width="737" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="31">
  <tr>
    <td align="center" valign="top" width="733" style="color: #304618; font-size: 12px" bordercolor="#669933" height="40"> 
      <b> 
      <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="3"><font color="#800080">电子卡是在网上申购，申购后系统会生成一个消费编号、登录密码及防伪编码。</font></p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800080">实物卡只能在当地代售点处购买，卡上已印有消费编号、登录密码及防伪编码。</font></font></td>
    </tr>
  </table>
					</div>
					</td>
				</tr>
				<tr>
					<td height="423" colspan="2">
<table border="0" width="100%" id="table8" cellspacing="1" height="328">
	<tr>
		<b>
		<td height="87"><b>
<img border="0" src="images/tixing.jpg" width="148" height="85"></td>
		<td bgcolor="#ECFFEC" height="87"><b>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font size="4">该代售点目前实物卡库存仅为<font color="#FF00FF"><%=rs1("dlgmjl")%>张</font></font></p>
		</b>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font color="#FF0000">为了各合作商家的安全考虑，暂时不可以购买超过这个数值，同时要求代售点录入供货记录，录入记录以保证所购实物卡的真实性，望各商家和代售点配合。</font></td>
	</tr>
	<tr>
		<td colspan="2" height="238">
		<p align="center" style="margin-top: 0; margin-bottom: 0">
		<iframe name="I2" scrolling="no" align="center" border="0" frameborder="0" width="78%" height="210" marginwidth="1" marginheight="1" src="logdl.asp?dl=<%=dluser%>">
		</iframe>
		<p align="center" style="margin-top: 0; margin-bottom: 0"><b><font color="#FF0000">录入记录以保证所购实物卡的真实性，录入数量不能超过现有库存。</font></td>
	</tr>
</table>
					</td>
				</tr>
			</table>
    		</div>
		</td>
	</tr>
</table></div>