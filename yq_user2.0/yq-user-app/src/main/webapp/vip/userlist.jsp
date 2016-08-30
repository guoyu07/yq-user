<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title><s:text name='vipuserlist.jsp.userlist.jsp.-897491465'/></title>
</head>

<body topmargin="0">
<div align="center"><b>
	<table border="0" cellspacing="1" width="100%" cellpadding="0" height="90">
  <tr> 
<td width="87%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="90" bgcolor="#808000"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>
<font  size="4"><s:text name='vipuserlist.jsp.userlist.jsp.-897491465'/></font></b><font size="2" >
</font></p>
	<div align="center">    
        <table border="1" cellspacing="1" width="100%" height="60" bgcolor="#000000" bordercolor="#C0C0C0" style="border-collapse: collapse">
     <tr>        
     <td width="231" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><b><font color="#FF0000" ><s:text name='vipupuser.jsp.upuser.jsp.29623262'/></font></b></td>                
     <td width="144" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font  color="#FF0000"><strong><s:text name='vipuserga.jsp.userga.jsp.734362'/></strong></font></td><b>                
     <td width="146" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" > <strong><s:text name='vipuserlist.jsp.userlist.jsp.865732987'/></strong></font></b></td>
     <td width="159" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" > <strong><s:text name='vipuserlist.jsp.userlist.jsp.669584602'/></strong></font></td>
     <td width="204" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" > <strong><s:text name='vipuserlist.jsp.userlist.jsp.950947478'/></strong></font></td>
     <td width="159" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" > <strong><s:text name='vipuserlist.jsp.userlist.jsp.670122793'/></strong></font></td>
     <td width="326" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" > <strong><s:text name='vipuserlist.jsp.userlist.jsp.851482466'/></strong></font></b></td>
     <td width="326" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" > <strong><s:text name='vipuserlist.jsp.userlist.jsp.749527093'/></strong></font></b></td>
        </tr>
     <s:iterator var="data" value="dataList">
        <tr> 
      <td height="22" width="231" align="center"><font  color="#FFFFFF"><a target="_top" href="chuserlist.asp" style="text-decoration: none"><b><font color="#FFFFFF">${data.username}<c:if test="${data.username==gcuser.username}"></font></b><font color="#FF00FF">(当前)</font><b><font color="#FFFFFF"></c:if></font></b></a></font></td>
      <td height="22" width="144" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FFFFFF"  style="font-weight: 700">${data.name}</font></td>
      <td valign="middle" width="146" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" >${data.sjb}</font></b></td>
      <td valign="middle" width="159" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" >${data.pay}</font></b></td>
      <td valign="middle" width="204" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" >${data.jyg}</font></b></td>
      <td valign="middle" width="159" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" >${data.jydb}</font></b></td>
      <td valign="middle" width="326" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" >${data.regtime}</font></b></td>
      <td valign="middle" width="326" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" >${data.bddate}</font></b></td>
      </tr>
     </s:iterator>
  </table> 
</div><font size="2" >
<aldtags:pageTag />
</font>
</tr> 
</table> 
</div> 
</html>
