<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dldiy=request("dldiy")
%>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&dldiy&"'"
rs.open sql,conn2,1,1
%>
<title>管理员设置</title>
<style>
<!--
p{color:000000;FONT-FAMILY: "??"; font-size: 9pt ;line-height: 20px;}
p{color:000000;FONT-FAMILY: "宋体"; font-size: 9pt ;line-height: 18px;}
-->
</style>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">
<span style="font-size: 9pt">
</body>
</html>
</span>
<div align="center">
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.dldate.value=="") {      alert("还不是正式管理!");      return false;    } 
  if (Form.dqdate.value=="") {      alert("还不是正式管理!");      return false;    }  
  return true;  }  
 </script>
<form name="form" METHOD="POST" action="dlok.asp?dldiy=<%=dldiy%>">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="123">
      <tr bgcolor="#ffffdd"> 
      <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><span style="font-size: 11pt">管理员设置</span></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
      <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>会员号：</b></td>
      <td align="right" width="57%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p align="left"><font color="#FF0000"><%=dldiy%>&nbsp;&nbsp; 级别</font><b><font color="#0000FF"><%=rs("jb")%></font></b><font color="#FF0000">&nbsp;&nbsp; </font>1大区<font color="#FF0000">&nbsp; </font>2省 3市 4区/县</td>
      </tr>
      <tr bgcolor="#ffffdd"> 
      <td align="right" width="98%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2"><p align="center"><font size="2"><a style="text-decoration: none" onClick="return confirm('提示：您确定给 <%=dldiy%> 设置成为省级管理吗？ ')" href="dls2ok.asp?s2=<%=dldiy%>" >设置省级管理</a>&nbsp;&nbsp;<a style="text-decoration: none" onclick="return confirm('提示：您确定给 <%=dldiy%> 设置成为市级管理吗？ ')" href="dls3ok.asp?s3=<%=dldiy%>" ><font color="#FF00FF">设置市级管理</font></a>&nbsp;&nbsp;<a style="text-decoration: none" onclick="return confirm('提示：您确定给 <%=dldiy%> 设置成为区/县级管理吗？ ')" href="dlq4ok.asp?q4=<%=dldiy%>"><font color="#800000">设置区/县级管理</font></a>&nbsp;&nbsp;<a style="text-decoration: none" onclick="return confirm('提示：您确定给 <%=dldiy%> 设置成为大区级管理吗？ ')" href="dl9dok.asp?9d=<%=dldiy%>"><font color="#000000">设置大区级管理</font></a></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
       <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">正式管理级别：</td>
       <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><select size="1" name="jb">
		<option selected value="<%=rs("jb")%>"><%=rs("jb")%></option>
			<option value="0">撒消管理(0)</option>
			<option value="1">大区级管理(1)</option>
			<option value="2">省级管理(2)</option>
			<option value="3">市级管理(3)</option>
			<option value="4">区/县级管理(4)</option></select>&nbsp; 1大区<font color="#FF0000">&nbsp; </font>2省 3市 4区/县</td>
      </tr>
      <tr>
      <td align="right" width="41%" height="37" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">开始时间：</td>
      <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="text" name="dldate1" size="20" value="<%=rs("dldate")%>"></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">到期时间：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="text" name="dqdate" size="20" value="<%=rs("dqdate")%>"></td>
      </tr>
      <tr> 
      <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="33"><div align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" name="submit" width="34" height="20" alt="提交" size="20" value="确定修改" class="lkbtn"></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</div>