<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('还没有到结算时间！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('每天返还结算成功！');location.replace('backcountinput');</script></c:if>
<html>
<title>历史返本记录</title>
<div align="center">
	<b>
  	<p><c:if test="${count}"><a onClick="return confirm('提示：您确定了吗？ ')" href="backcount" style="text-decoration: none">执行返本计算</a></c:if></p>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#FFFFC1">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">历史记录按1倍算<font color="#FF00FF"><fmt:formatNumber value="${backCountBean.rs_zd*500}" pattern="0"/></font>&nbsp; 今天目前新<font color="#FF0000"><fmt:formatNumber value="${backCountBean.rs_nd*500}" pattern="0"/></font>个 ，本月（<font color="#FF0000"><fmt:formatNumber value="${backCountBean.rs_month*500}" pattern="0"/></font>）  ，上月（<font color="#FF0000"><fmt:formatNumber value="${backCountBean.rs_up_month*500}" pattern="0"/></font>）</span></b><span style="font-size: 11pt"></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr>        
     <td width="104" align="center" height="26" bgcolor="#E8E8FF"> 
	<b><font size="2" face="宋体">编号</font></b></td>                
     <td width="185" align="center" height="26" bgcolor="#E8E8FF"> 
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#800000" size="2">
				<strong>结算日期</strong></font></td>                
              <td width="291" align="center" height="26" bgcolor="#E8E8FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#800000" face="宋体" size="2"> <strong>新单(元)</strong></font></td>
              <td width="199" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000" face="宋体" size="2">累计需返</font></b></td>
              <td width="189" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="宋体" size="2">目前已返</font></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="24" width="104" align="center" bgcolor="#DFFFEF"><b>
				<font size="2" face="宋体">${data.tjid}</font></b></td>
                <td height="24" width="185" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#008000" face="宋体" size="2" style="font-weight: 700">${data.fhdate}</font></td>
                <td valign="middle" width="291" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2">${data.newd}</font></td>
                <td valign="middle" align="center" width="199" bgcolor="#DFFFEF"><font face="宋体" size="2"><fmt:formatNumber value="${data.zfh}" pattern="0"/></font></td>
                <td valign="middle" align="center" width="189" bgcolor="#DFFFEF"><font face="宋体" size="2"><fmt:formatNumber value="${data.mqfh}" pattern="0"/></font></td>
              </tr>
             </s:iterator>
            </table> 
</div><font size="2"> <aldtags:pageTag/>
</font>
</tr> 
</table> 
</div> 
</html>