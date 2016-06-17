<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title>股 票 交 易 明 细</title>

<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<font color="#000000" face="宋体" size="2"><strong>股 票 交 易 明 细</strong></font></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2">
	<font face="宋体" size="2"><br> 
</font><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="143" align="center" height="28" bgcolor="#FFE1FF">
			<font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">会员名(发布方)</strong></font></td>
          <td width="116" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2"> <strong style="font-weight: 400">卖出数量</strong></font></td>
          <td width="144" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#FF0000" face="宋体" size="2">买入数量</font></td>
          <td width="151" align="center" height="28" bgcolor="#FFE1FF"><p>
			<font face="宋体" color="#000000" size="2">剩余数量</font></td>
          <td width="173" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">挂牌时间</font></td>
          <td width="155" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">交易额</font></td>
          <td width="123" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">状态</font></td>
          <td width="133" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">对方</font></td>
          <td width="234" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">成交时间</font></td>
          </tr>
        <s:iterator var="data" value="dataList">
          <tr> 
          <td height="23" width="143" align="center"><p>
			<font color="#000000" face="宋体" size="2">${data.username}</font></td>
          <td valign="middle" width="116" align="center"><p>
			<font color="#000000" face="宋体" size="2">${data.mcsl}</font></td>
          <td valign="middle" align="center" width="144">
			<font color="#FF0000" face="宋体" size="2">${data.mysl}</font></td>
          <td valign="middle" align="left" width="151"><p align="center">
			<font face="宋体" size="2">${data.sysl}</font></td>
          <td valign="middle" align="center" width="173">
			<font color="#000000" face="宋体" size="2">${data.abdate}</font></td>
          <td valign="middle" align="center" width="155">
			<font color="#FF0000" face="宋体" size="2">${data.jypay}</font></td>
          <td valign="middle" align="center" width="123"><p>
			<font color="#000000" face="宋体" size="2">${data.bz}</font></td>
          <td valign="middle" align="center" width="133">
			<font face="宋体" size="2">${data.dfuser}</font></td>
          <td valign="middle" align="center" width="234">
			<font color="#000000" face="宋体" size="2">${data.cgdate}</font></td>
          </tr>
          </s:iterator>
            </table> 
</div><font face="宋体" size="2">
<aldtags:pageTag para1="jylb" value1="${jylb}" para2="userid" value2="${userid}"/>
</font> 
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body> 
</font> 
</html>