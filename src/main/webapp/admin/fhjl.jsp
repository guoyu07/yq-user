<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>历史分红记录</title>

<div align="center">
	<b>
  	<p><a onClick="return confirm('提示：您确定了吗？ ')" href="/admin/jsfh" style="text-decoration: none">执行昨天计算</a></p>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#FFFFC1">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">历史分红记录&nbsp; 今天目前新增激活股权<font color="#FF0000">${sumPdlj}</font>个<font color="#FF0000"></font></span></b><span style="font-size: 11pt"></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr>        
     <td width="65" align="center" height="26" bgcolor="#E8E8FF"> 
	<b><font size="2" face="宋体">编号</font></b></td>                
     <td width="129" align="center" height="26" bgcolor="#E8E8FF"> 
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#800000" size="2">
				<strong>结算日期</strong></font></td>                
              <td width="113" align="center" height="26" bgcolor="#E8E8FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#800000" face="宋体" size="2"> <strong>盈利额(元)</strong></font></td>
              <td width="119" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000" face="宋体" size="2">参与股权(个)</font></b></td>
              <td width="97" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="宋体" size="2">双区会员</font></td>
              <td width="99" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="宋体" size="2">普通会员</font></td>
              <td width="87" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="宋体" size="2">统计昨天</font></td>
              <td width="107" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#FF0000" face="宋体" size="2">统计目前</font></b></td>
              <td width="282" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b><font color="#800000" face="宋体" size="2">状态</font></b></td>
              </tr>
             <s:iterator var="data" value="dataList">
              <tr> 
                <td height="24" width="65" align="center" bgcolor="#DFFFEF"><b>
				<font size="2" face="宋体">${data.id}</font></b></td>
                <td height="24" width="129" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#008000" face="宋体" size="2" style="font-weight: 700">${data.abdate}</font></td>
                <td valign="middle" width="113" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2">${data.zly}</font></td>
                <td valign="middle" align="center" width="119" bgcolor="#DFFFEF"><font face="宋体" size="2">${data.fhk}</font></td>
                <td valign="middle" align="center" width="97" bgcolor="#DFFFEF"><font face="宋体" size="2">
                <c:if test="${data.vipfhpay<1}">0${data.vipfhpay}</c:if><c:if test="${data.vipfhpay>=1}">${data.vipfhpay}</c:if></font></td>
                <td valign="middle" align="center" width="99" bgcolor="#DFFFEF"><font face="宋体" size="2">
                <c:if test="${data.fhpay<1}">0${data.fhpay}</c:if><c:if test="${data.fhpay>=1}">${data.fhpay}</c:if></font></td>
                <td valign="middle" align="center" width="87" bgcolor="#DFFFEF">
				<font face="宋体" size="2">${data.tjjt}</font></td>
                <td valign="middle" align="center" width="107" bgcolor="#DFFFEF">
				<font face="宋体" size="2">${data.tjmq}</font></td>
                <td valign="middle" align="center" width="282" bgcolor="#DFFFEF">
				<font face="宋体" size="2" color="#0000FF">
				<c:if test="${data.bz>1}">发放成功</c:if>
				<c:if test="${data.bz==0}"><a onClick="return confirm('提示：您确定了吗？ ')" href="/admin/sendfh?pdid=${data.id}&type=2" style="text-decoration: none">双区会员分红</a></c:if>
				<c:if test="${data.bz==1}"><a onClick="return confirm('提示：您确定了吗？ ')" href="/admin/sendfh?pdid=${data.id}&type=1" style="text-decoration: none">普通会员分红</a></c:if>
				</font></td>
              </tr>
              </s:iterator>
            </table> 
</div><font size="2"><aldtags:pageTag/>
</font>
</tr> 
</table> 
</div> 
</html>