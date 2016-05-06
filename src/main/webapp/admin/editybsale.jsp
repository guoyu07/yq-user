<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('操作密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('修改成功！');location.href="editYbSale?user=${user}";</script></c:if>
<html>
<head>
<title>协议用户</title>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">
</body>
</html>
<div align="center">
<form name="form" METHOD="POST" action="editYbSale?status=1&user=${user}">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="243">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> <b><font style="font-size: 11pt">修改会员信息</font></b></td>
      </tr>
		<tr>
        <td align="right" width="40%" height="29" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font size="3">用户名：</font></td>
        <td width="58%" align="left" height="29" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font color="#FF0000" size="3"><b>${gcuser.username}--</b></font><font size="3">余额：</font><font color="#0000FF" size="3">${gcuser.pay}</font></td>
      </tr>
      <tr>
        <td align="right" width="40%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">姓 名：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">${gcuser.name}--单数<font color="#FF0000">${gcuser.sjb*500}</font></font></td>
      </tr>
		<tr>
        <td align="right" width="40%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">累计提现：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">${rs_ztx}</td>
      </tr>
      <tr>
        <td align="right" width="40%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">目前返还：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">${sgxt.mqfh}--总返<b><font color="#008000">${sgxt.zfh}</font></b></td>
      </tr>
      <tr> 
        <td align="right" width="40%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt; font-weight:700">修改返还：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=32 name="fhpay" size="10" value="${gcuser.fhpay}" /></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="40%" height="31" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt; font-weight:700">不可卖：</font></td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=32 name="vippay" size="10" value="${gcuser.vippay}" /></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="40%" height="31" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">操作密码：</td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="password" name="opPass" size="20"></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="40%" height="31" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">　</td>
        <td width="58%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="submit" value="提 交 修 改" name="B1" style="font-weight: bold; font-size:10pt"></span></font></td>
      </tr>
      </table>
      <p align="center">
<a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
      </center>
    </div>
</div>