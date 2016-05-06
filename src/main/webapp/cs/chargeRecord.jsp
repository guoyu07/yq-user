<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${userName=='cfhkf01'}">
 <c:set var="cz01" value="中国一川【①号】客服QQ：613697151"></c:set>
 <c:set var="cz02" value="陈文娟"></c:set>
</c:if>
<c:if test="${userName=='cfhkf02'}">
 <c:set var="cz01" value="中国一川【②号】客服QQ：613697152"></c:set>
 <c:set var="cz02" value="陈文娟"></c:set>
</c:if>
<div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="145">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0; line-height:150%">
		<strong>
		<font color="#008000" style="font-size: 11pt" face="宋体">${cz01}</font><font color="#000000" style="font-size: 11pt" face="宋体"> 编号：</font><font color="#FF0000" style="font-size: 11pt" face="宋体">${userName}</font><font color="#000000" style="font-size: 11pt" face="宋体"> 充 值 记 录 明 细</font></strong><p align="center" style="margin-top: 0; margin-bottom: 0; line-height:150%">
		<strong>
		<font color="#FF00FF" face="宋体" size="2"> 提示：本服务中心收款名字为“</font><font color="#000080" face="宋体" size="2">${cz02}</font><font color="#FF00FF" face="宋体" size="2">”</font></strong><table border="1" width="100%" id="table2" style="border-collapse: collapse" height="30" bgcolor="#F0F3DC">
			<tr>
				<td align="center"><font size="2">今天：<font color="#FF0000">${stat.todaySum}</font></font></td>
				<td align="center"><font size="2">昨天：${stat.yesterdaySum}</font></td>
				<td align="center"><font size="2">前天：${stat.oldYesterdaySum}</font></td>
				<td align="center"><font size="2">累计：<font color="#FF0000">${stat.all}</font></font></td>
			</tr>
		</table>
		</td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="100" bgcolor="#C3DAF9">
	<font face="宋体" style="font-size: 11pt"><br> 
    <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="67" id="table1">
            <tr>
          <td width="169" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font face="宋体" color="#000000" size="2"><strong>用户名</strong></font></td>
          <td width="121" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" face="宋体" size="2"> <strong>最近充值</strong></font></td>
          <td width="122" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font face="宋体" color="#000000" style="font-weight:700" size="2">累计充值</font></td>
          <td width="200" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值时间</font></td>
          <td width="149" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值方式</font></td>
          <td width="129" align="center" height="34" bgcolor="#FFF7FF">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">操作员</font></td>
          <td width="225" align="center" height="34" bgcolor="#C3DAF9">
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">ip地址</td>
          </tr>
          <s:iterator var="data" value="dataList">
          <tr> 
          <td height="34" width="169" align="center">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" face="宋体" size="2">${data.cjuser}</font></td>
          <td valign="middle" width="121" align="center">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" face="宋体" size="2">${data.dqcj}</font></td>
          <td valign="middle" align="center" width="122">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font size="2" face="宋体">　${data.ljcj}</font></td>
          <td valign="middle" align="center" width="200">${data.qldate}</td>
          <td valign="middle" align="center" width="149">
			<font size="2" face="宋体">${data.cjfs}</font></td>
          <td valign="middle" align="center" width="129" bgcolor="#FFF7FF">${data.cz}</td>
          <td valign="middle" align="center" width="225">${data.ip}</td>
          </tr>
         </s:iterator>
            </table> 
</div><aldtags:pageTag/>
</font> 
</tr> 
</table> 
</div> 
</html>