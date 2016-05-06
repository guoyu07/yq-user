<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('还没抢购完成，暂时不可以恢复，');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('恢复成功！');location.replace('cgcp');</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('发货录入成功！');location.replace('cgcp');</script></c:if>
<title>交易市场</title>
<p align="center">
<b>产品抢购记录</b></p>
<p align="center">
<b><a href="hfcg?cp=1" style="text-decoration: none">恢复派水杯</a></b></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="83">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="83" bgcolor="#D7FFE3">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
</font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
              <td width="55" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">编号</strong></font></td>
              <td width="101" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong>用户名</strong></font></td>
              <td width="206" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">产品名称</strong></font></td>
              <td width="171" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">成功时间</strong></font></td>
              <td width="73" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" face="宋体">产品总分</font></td>
              <td width="94" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">抢购人</strong></font></td>
              <td width="112" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">QQ</font></td>
              <td width="115" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#008000" size="2">电话</font></td>
              <td width="177" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">发货成功时间</font></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="35" width="55" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">${data.cgid}</font></td>
                <td width="101" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体">${data.cguser}</font></font></b></td>
                <td valign="middle" width="206" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">${data.cpmq}</font></td>
                <td valign="middle" align="center" width="171"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="宋体">${data.jydate}</font></td>
                <td valign="middle" align="center" width="73"><b><font color="#FF0000" size="2" face="宋体">${data.jyjf}</font></b></td>
                <td valign="middle" align="center" width="94"><font size="2" face="宋体">${data.jyname}</font></td>
                <td valign="middle" align="center" width="112"><font color="#000000" size="2" face="宋体">${data.jyqq}</font></td>
                <td valign="middle" align="center" width="115"><font size="2" face="宋体">${data.jycall}</font></td>
                <td valign="middle" align="center" width="177"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">
                <c:if test="${not empty data.fwdate}">${data.fwdate}</c:if><c:if test="${empty data.fwdate}"><a onClick="return confirm('提示：您确定发货成功了吗？ ')" href="fwdate?cgId=${data.cgid}" style="text-decoration: none">录入</a></c:if>
                </font></td>
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
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body>
</font>
</html>