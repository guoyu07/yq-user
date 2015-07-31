<!--#include file="../ctshop.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dqu=rs("dqu")
if dqu="0" or dqu="7" or dqu="2" or dqu="8" then
   cz01="中国一川【①号】客服QQ：613697151"
   qq=613697151
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="中国一川【②号】客服QQ：613697152"
   qq=613697152
end if
%>
<p align="center"><b><font size="7" color="#008000">积分抢购专区</font></b></p>
<p align="center"><span style="font-size: 11pt">有任何事情请联系：<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a><b><font size="2" color="#FF0000">&nbsp;重要提示：抢购没有100%的抢中，请量力而行！</font></b></p>
<p align="center"><b><font color="#008000">说明：</font><font size="2" color="#0000FF">每抢购一次仅需“1”积分，点击图片进行抢购，将有机会免费获得，抢中后请马上联系客服提交您的收货地址，详情请咨询。</font></b></p>
<table border="1" width="100%" id="table9" cellpadding="2" height="260" bordercolor="#FF00FF">
	<tr>
		<td align="center"><iframe name="I61" src="jdcp01.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I62" src="jdcp02.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I63" src="jdcp03.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I64" src="jdcp04.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table10" cellpadding="2" height="260" bordercolor="#FFFF00">
	<tr>
		<td align="center"><iframe name="I69" src="jdcp05.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I70" src="jdcp06.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I71" src="jdcp07.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I72" src="jdcp13.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table4" cellpadding="2" height="260" bordercolor="#FF00FF">
	<tr>
		<td align="center"><iframe name="I21" src="nz01.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I22" src="nz02.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I23" src="fjcp01.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I24" src="fjcp02.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table1" cellpadding="2" height="260" bordercolor="#FFFF00">
	<tr>
		<td align="center"><iframe name="I1" src="ydcj100.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I2" src="fjcp07.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I3" src="K-burj.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I4" src="cpbhpsb.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table2" cellpadding="2" height="260" bordercolor="#FF00FF">
	<tr>
		<td align="center"><iframe name="I5" src="cprt.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I6" src="cpdy.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I7" src="cpsf.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I8" src="ehcall.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table3" cellpadding="2" height="260" bordercolor="#FFFF00">
	<tr>
		<td align="center"><iframe name="I13" src="fjcp03.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I14" src="nz03.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I15" src="nz04.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I16" src="fjcp04.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table5" cellpadding="2" height="260" bordercolor="#008000">
	<tr>
		<td align="center"><iframe name="I29" src="cpzp.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I30" src="nz05.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I31" src="nz06.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I32" src="fjcp05.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table6" cellpadding="2" height="260" bordercolor="#FFFF00">
	<tr>
		<td align="center"><iframe name="I37" src="cpcy.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I38" src="nz07.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I39" src="nz08.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I40" src="fjcp06.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table7" cellpadding="2" height="260" bordercolor="#0000FF">
	<tr>
		<td align="center"><iframe name="I45" src="jdcp09.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I46" src="jdcp10.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I47" src="jdcp11.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I48" src="jdcp12.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
    </table>
<table border="1" width="100%" id="table8" cellpadding="2" height="260" bordercolor="#0000FF">
	<tr>
		<td align="center"><iframe name="I53" src="nz12.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I54" src="nz09.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I55" src="nz10.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I56" src="nz11.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
    <p align="center"><b><font color="#008000">说明：</font><font size="2" color="#0000FF">每抢购一次仅需“1”积分，点击图片进行抢购，将有机会免费获得，抢中后请马上联系客服提交您的收货地址，详情请咨询。</font></b></p>
	<p>　</p>
