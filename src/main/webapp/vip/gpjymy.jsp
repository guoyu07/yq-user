<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>交易市场</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">

</head>
</body>
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="85" id="table1">
    <tr>
     <td width="100%" height="25"><p align="center"><p align="center"><strong><font color="#FF0000" size="5">求购信息</font></strong><p align="center"></td> 
  </tr>
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="62" bgcolor="#D7FFE3">
<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="58" id="table2">
          <tr> 
          <td width="200" align="center" height="30" bgcolor="#FFE1FF"><font color="#FF0000" size="2"><strong>求购数量</strong></font></td>
          <td width="160" align="center" height="30" bgcolor="#FFE1FF"><b><font size="2">单价</font></b></td>
          <td width="200" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2"><strong>交易额</strong></font></td>
          <td width="180" align="center" height="30" bgcolor="#FFE1FF"><b><font color="#000000" size="2">发布方</font></b></td>
          <td width="238" align="center" height="30" bgcolor="#FFE1FF"><b><font size="2">操作</font></b></td>
          </tr>
          <s:iterator var="data" value="dataList">
          <tr> 
          <td align="center" width="200" height="32"><b><font color="#0000FF" size="2">${data.mysl}</font></b></td>
          <td align="center" width="160" height="32"><b><font color="#FF0000" size="2">
           <c:if test="${data.pay<1}">0${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></font></b></td>
          <td align="center" width="200" height="32"><font size="2" color="#614039">${data.jypay}</font></td>
          <td align="center" width="180" height="32"><font size="2">${data.username}</font></td>
          <td align="center" width="238" height="32">
          <c:if test="${data.mysl>0}"><a onClick="return confirm('提示：您确定了吗？')" target="main" href="wymc?id=${data.id}&sl=${data.mysl}"><span style="font-size: 11pt; font-weight: 700"><font color="#008000">我要卖给</font></span></a></c:if>
          </td>
          </tr>
         </s:iterator>
            </table> 
</div><aldtags:pageTag/>
</tr> 
</table> 
</html>