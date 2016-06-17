<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>历史充值记录</title>
<div align="center">
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#EEFFEE">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">代理/商家<font color="#FF0000">${dl}</font>历史充值记录</span></b><span style="font-size: 11pt"></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr>        
     <td width="104" align="center" height="26" bgcolor="#E8E8FF"> 
	<b><font size="2">编号</font></b></td>                
     <td width="130" align="center" height="26" bgcolor="#E8E8FF"> 
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#800000" size="2">
				<strong>充值代理/商家</strong></font></td>                
              <td width="300" align="center" height="26" bgcolor="#E8E8FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#800000" face="宋体" size="2"> <strong>充值时间</strong></font></td>
              <td width="164" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000" face="宋体" size="2">充值金额</font></b></td>
              <td width="145" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000" face="宋体" size="2">充后余额</font></b></td>
              <td width="132" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#FF0000" face="宋体" size="2">备注</font></b></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="24" width="104" align="center" bgcolor="#F4F7E6"><b>
				<font size="2" face="宋体">${data.id}</font></b></td>
                <td height="24" width="130" align="center" bgcolor="#F4F7E6"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#008000" face="宋体" size="2" style="font-weight: 700">${data.username}</font></td>
                <td valign="middle" width="300" align="center" bgcolor="#F4F7E6"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2">${data.date}</font></td>
                <td valign="middle" align="center" width="164" bgcolor="#F4F7E6">
				<b>
				<font face="宋体" size="2" color="#FF0000">${data.syjz}</font></b></td>
                <td valign="middle" align="center" width="145" bgcolor="#F4F7E6">
				<font face="宋体" size="2">${data.pay}</font></td>
                <td valign="middle" align="center" width="132" bgcolor="#F4F7E6">${data.regid}</td>
              </tr>
              </s:iterator>
            </table> 
</div><font size="2"> 
<aldtags:pageTag/>
</font>
</tr> 
</table> 
</div> 
</body> 
</html>