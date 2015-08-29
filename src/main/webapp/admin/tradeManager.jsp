<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>交易市场</title>
<p align="center"><a href="jymc.asp" style="text-decoration: none">查看<font color="#FF0000">出售</font>信息</a>&nbsp;&nbsp;&nbsp;<a href="jymy.asp" style="text-decoration: none">查看<font color="#008000">求购</font>信息</a></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
       
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
</font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
                
              <td width="75" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#000000" size="2">
				<strong style="font-weight: 400">交易编号</strong></font></td>
                
              <td width="48" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong>类别</strong></font></td>
                
              <td width="73" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">出售数量</strong></font></td>
                
              <td width="72" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">求购数量</strong></font></td>
                
              <td width="50" align="center" height="30" bgcolor="#FFE1FF">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体">单价</font></td>
                
              <td width="68" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">交易额</strong></font></td>
                
              <td width="132" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="宋体">挂牌时间</font></td>
                
              <td width="101" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="宋体">发布方</font></td>
                
              <td width="125" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font face="黑体" color="#008000" style="font-size: 11pt; ">成交时间</font></td>
                
              <td width="105" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b><font face="黑体">对方</font></b></td>
                
              <td width="165" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font face="黑体">备注</font></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="35" width="75" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体">${data.id}</font></td>
                <td width="48" align="center" bgcolor="#FAF8E6"> 
                  <b><font size="2" color="#008000">
					<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font face="宋体">
					<c:if test="${data.mcsl>0}"></font></font><font face="宋体"><font color="#FF0000" size="2">出售</font><font size="2" color="#008000"></c:if>
					<c:if test="${data.mcsl<=0}">求购</c:if>
					</font></font></b></td>
                <td valign="middle" width="73" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体">${data.mcsl}</font></td>
                <td valign="middle" align="center" width="72"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#0000FF" size="2" face="宋体">${data.mysl}</font></td>
                <td valign="middle" align="center" width="50"><b>
				<font color="#FF0000" size="2" face="宋体">${data.pay}</font></b></td>
                <td valign="middle" align="center" width="68">
				<font size="2" face="宋体">${data.jypay}</font></td>
                <td valign="middle" align="center" width="132">
				<font color="#000000" size="2" face="宋体">${data.abdate}</font></td>
                <td valign="middle" align="center" width="101">
				<font size="2" face="宋体">${data.username}</font></td>
                <td valign="middle" align="center" width="125">
				<font face="黑体" color="#008000" size="2">${data.cgdate}</font></td>
                <td valign="middle" align="center" width="105">
				<font face="黑体" size="2"><b>${data.dfuser}</b></font></td>
                <td valign="middle" align="center" width="165">
				<font face="黑体" size="2">${data.bz}</font></td>
              </tr>
              </s:iterator>
            </table> 
</div><font face="宋体" size="2"><aldtags:pageTag/>
</font> 
</tr> 
</table> 
<font face="宋体" size="2"> 
</div> </div>
</font>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body>
</font>
<meta http-equiv=Refresh content="180; url=">
</html>