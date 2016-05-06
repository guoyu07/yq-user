<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!--#include file="../ct0618.asp"-->
<html>
<title>历史转户记录</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
</head>
<table border="0" width="1242" id="table1" cellspacing="0" cellpadding="0">
	<tr>
		<td width="918"><form method="POST" action="" name="form1">用户名：<input type="text" name="suser" size="20"><input type="hidden" name="cjpa" size="20" value="${suser}"> <input type="submit" value="搜索" name="B2"></form></td>
	</tr>
	</table>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="1" width="100%" height="28">
    <tr>
      <td width="100%" height="26"><p align="center"><font color="#000000" face="楷体" size="5"><strong>已转户过的名单</strong></font></td> 
  </tr>
</table>
	<font face="宋体" size="2">
</font>    
          <table width="100%" border="1" height="60" style="border-collapse: collapse">
            <tr> 
              <td align="center" bgcolor="#C0C0C0"><b>编号</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>用户名</b></td>
              <td align="center" bgcolor="#C0C0C0"><font color="#008080"><b>改前姓名</b></font></td>
              <td align="center" bgcolor="#C0C0C0"><b>改后姓名</b></td>
              <td align="center" bgcolor="#C0C0C0"><font color="#008080"><b>改前身份证</b></font></td>
              <td align="center" bgcolor="#C0C0C0"><b>改后身份证</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>手机</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>QQ</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>操作时间</b></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
              <td align="center" height="30">${data.id}</td>
              <td align="center" height="30">${data.tduser}</td>
              <td align="center" height="30"><font color="#06FFFF">${data.gainame}</font></td>
              <td align="center" height="30">${data.tdname}</td>
              <td align="center" height="30"><font color="#06FFFF">${data.gaiuserid}</font></td>
              <td align="center" height="30">${data.tduserid}</td>
              <td align="center" height="30">${data.tdcall}</td>
              <td align="center" height="30">${data.tdqq}</td>
              <td align="center" height="30">${data.tddate}</td>
              </tr>
             </s:iterator>
     </table> 
</div><font face="宋体" size="2"> <aldtags:pageTag para1="suser" value1="${suser}"/>
</font>
</body></html>