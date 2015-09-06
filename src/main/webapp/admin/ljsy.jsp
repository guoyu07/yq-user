<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>玩家收益记录</title>
<div align="center">
	<b>
  <table border="1" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#C0C0C0" style="border-collapse: collapse">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体">（累计收入：<font color="#0000FF">${gcfhBean.totalIn}</font>&nbsp;累计支出：<font color="#0000FF">${gcfhBean.totalOut}</font>）<font color="#008000">（今天收入：</font><font color="#FF0000">${gcfhBean.todayIn}</font><font color="#008000">&nbsp;今天支出：</font><font color="#FF0000">${gcfhBean.todayOut}</font><font color="#008000">）</font>（昨天收入：<font color="#FF00FF">${gcfhBean.yesterdayIn}</font>&nbsp;昨天支出：<font color="#FF00FF">${gcfhBean.yeaterdayOut}</font>）</font></b><font face="宋体" size="2"></font></p>
	<div align="center">    
    <table border="1" cellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse" cellpadding="0" height="57">
        <tr>        
     <td width="163" align="center" height="26" bgcolor="#E5EAC2"><b><font size="2" face="宋体">用户名</font></b></td>                
     <td width="187" align="center" height="26" bgcolor="#E5EAC2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#800000" size="2"><strong>收益变化</strong></font></td>                
     <td width="179" align="center" height="26" bgcolor="#E5EAC2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>累计收益</strong></font></td>
     <td width="283" align="center" height="26" bgcolor="#E5EAC2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000" face="宋体" size="2">发生时间</font></b></td>
     <td width="419" align="center" height="26" bgcolor="#E5EAC2"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2">备注</font></td>
       </tr>
      <s:iterator var="data" value="dataList">
        <tr> 
      <td height="32" width="163" align="center" bgcolor="#FFFFFF"><b><font size="2" face="宋体">${data.userid}</font></b></td>
      <td height="32" width="187" align="center" bgcolor="#FFFFFF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2" style="font-weight: 700">${data.syfh}</font></td>
      <td valign="middle" width="179" align="center" bgcolor="#FFFFFF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="宋体" size="2">${data.ljfhtj}</font></b></td>
      <td valign="middle" align="center" width="283" bgcolor="#FFFFFF"><font face="宋体" size="2"><b>${data.abdate}</b></font></td>
      <td valign="middle" align="center" width="419" bgcolor="#FFFFFF"><font face="宋体" size="2"><b>${data.bz}</b></font></td>
         </tr>
      </s:iterator>
       </table> 
</div><font size="2" face="宋体"> <aldtags:pageTag/>
</font>
</tr> 
</table> 
</div> 
</html>