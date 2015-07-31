<!--#include file="../ct0618.asp"-->
<!--#include file="../vip/cfvip.asp"-->
<%
glry=request("glycj")
glnm=request("glnm")
kfglnm=md5(glnm)
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where ncjud ='"&glry&"'and adminusername ='"&kfglnm&"'"
rs.open sql,conn2,1,1
if  rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该用户不存在或密码不正确，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
Session("cjlog")=rs("ncjud")
end if
%>
<html>
<title>会员搜索</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border="1" height="72" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">会员搜索</font></b></td>
    </tr>
    <tr>
      <td height="48" align="center" bgcolor="#C3DAF9">
		<form name="form" method="POST" action="cjgl02.asp?gl=<%=glry%>">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 9pt">&nbsp;<input type="text" name="cfhy" size="20"> <input type="submit" name="Submit" value="搜索">&nbsp;&nbsp;&nbsp; </span>
		<b>&nbsp; <a href="cjbdgw.asp" style="text-decoration: none">返回登录</a></b></p>
		</form></td>
    </tr>
  </table>
</div>
<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<iframe name="I1" width="100%" align="center" border="0" frameborder="0" src="../vgo/czkf.asp?kf=<%=glry%>" marginwidth="1" marginheight="1" height="100%"></iframe></p>
</body> 
</html>