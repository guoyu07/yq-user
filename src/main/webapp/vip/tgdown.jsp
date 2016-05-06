<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>显示推广信息</title>
</head>

<div align="center">
  <p align="left">如有问题请第一时间联系我（推荐人）：QQ：<font color="#FF0000">${up.qq}</font><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${up.qq}&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:${up.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></font></a><font color="#FF0000"></font> 手机：<font color="#FF0000">${up.call}</font><font color="#0000FF"> ${upName}先生/小姐</font></p>
  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25" background="images/admin_bg_1.gif"> 
      <p align="center"><font color="#000000" style="font-size: 14px"><strong>直 接 推 广 记 录 明 细</strong></font></td> 
  </tr> 
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#C3DAF9"><br> 

<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr>
          <td width="148" align="center" height="28" bgcolor="#C3DAF9"><font face="宋体" color="#000000" style="font-size: 11pt"><strong>用户名</strong></font></td>
          <td width="168" align="center" height="28" bgcolor="#C3DAF9"><p><font face="宋体" color="#000000" style="font-size: 11pt; font-weight:700">QQ</font></td>
          <td width="202" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" face="宋体">注册时间</font></td>
          <td width="116" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" face="宋体">累计充值</font></td>
          <td width="217" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" face="宋体">最近充值时间</font></td>
          <td width="148" align="center" height="28" bgcolor="#C3DAF9">双区玩家</td>
          <td width="228" align="center" height="28" bgcolor="#C3DAF9"><font face="宋体"><span style="font-size: 11pt; font-weight:700">升级时间</span></font></td>
          </tr>
          <s:iterator var="data" value="dataList">
          <tr> 
          <td height="23" width="148" align="center"><p><font color="#000000" size="2">${data.username}</font></td>
          <td valign="middle" align="left" width="168"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${data.qq}&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:${data.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></font></a><font size="2" color="#000000">${data.qq}</font></td>
          <td valign="middle" align="center" width="202"><font color="#000000" size="2">${data.regtime}</font></td>
          <td valign="middle" align="center" width="116"><b><font color="#FF0000" size="2">${data.cjtj}</font></b></td>
          <td valign="middle" align="center" width="217"><font color="#000000" size="2">${data.gmdate}</font></td>
          <td valign="middle" align="center" width="148"><c:if test="${data.sjb==0}">否</c:if><c:if test="${data.sjb!=0}">${data.sjb}单</c:if>
          <td valign="middle" align="center" width="228"><font size="2">${data.bddate}</font></td>
          </tr>
         </s:iterator>
            </table> 
</div> <aldtags:pageTag/>
</tr> 
</table> 
</div> 
</body> 
</html>