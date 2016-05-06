<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>交易市场</title>

<table border="0" cellspacing="0" width="100%" cellpadding="0" height="59">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="59" bgcolor="#F1F3DE">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
</font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="56">
            <tr> 
        <td width="46" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><strong style="font-weight: 400">期号</strong></font></td>
        <td width="148" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">结算时间</font></td>
        <td width="67" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">总单</strong></font></td>
        <td width="55" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">新单</strong></font></td>
        <td width="62" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">左区存</strong></font></td>
        <td width="61" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">右区存</strong></font></td>
        <td width="70" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2"> <strong style="font-weight: 400">本期拨出</strong></font></td>
        <td width="71" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2">总碰数</font></td>
        <td width="61" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">领导奖</strong></font></td>
		<td align="center" bgcolor="#ECECFF" width="103"><b><font size="2" color="#008000">全部</font></b></td>
		<td align="center" bgcolor="#ECECFF" width="92"><font size="2">奖金</font></td>
		<td align="center" bgcolor="#ECECFF" width="89"><font size="2">已提</font></td>
		<td align="center" bgcolor="#ECECFF" width="87"><font size="2">实提</font></td>
		<td align="center" bgcolor="#ECECFF" width="80"><font size="2">金币</font></td>
		<td align="center" bgcolor="#ECECFF" width="80"><font size="2">积分</font></td>
		<td align="center" bgcolor="#ECECFF" width="76"><font size="2">分红股</font></td>
		<td align="center" bgcolor="#ECECFF" width="70"><font size="2">总分红</font></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
        <td height="27" width="46" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">${data.sgid}</font></td>
        <td valign="middle" align="center" width="148"><font color="#000000" size="2">${data.jsdate}</font></td>
        <td valign="middle" width="67" align="center"><font size="2">${data.zd}</font></td>
        <td valign="middle" width="55" align="center"><font size="2">${data.nd}</font></td>
        <td valign="middle" width="62" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">${data.aq}</font></td>
        <td valign="middle" width="61" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">${data.bq}</font></td>
        <td valign="middle" align="center" width="70"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2">${data.zpay}</font></td>
        <td valign="middle" align="center" width="71"><b><font color="#FF0000" size="2">${data.abp}</font></b></td>
        <td valign="middle" align="center" width="61"><font size="2">${data.ldpay}</font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="103"><b><font color="#008000" size="2">${data.ljcb}</font></b></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="92"><font size="2">${data.ljpa}</font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="89"><font color="#800000" size="2">${data.ljtx}</font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="87"><font size="2">${data.ljztx}</font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="80"><font size="2">${data.ljdb}</font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="80"><font size="2">${data.ljyg}</font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="76"><font size="2">${data.ljfhg}</font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="70"><font size="2">${data.ljzfh}</font></td>
              </tr>
             </s:iterator>
            </table> 
</div><font face="宋体" size="2"> <aldtags:pageTag/>
</font> 
</tr> 
</table> 
<font face="宋体" size="2">
</body>
</font>
</html>