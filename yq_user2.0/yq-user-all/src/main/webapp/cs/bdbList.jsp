<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>充 值 记 录 明 细</strong></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
	<font face="宋体" style="font-size: 11pt"><br> 
</font><font face="宋体" style="font-size: 11pt"><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57" id="table1">
            <tr>
          <td width="154" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>用户名</strong></font></td>
          <td width="91" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong>最近充值</strong></font></td>
          <td width="105" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" style="font-weight:700" size="2">累计充值</font></td>
          <td width="203" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值时间</font></td>
          <td width="198" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值方式</font></td>
          <td width="124" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原购买者</font></td>
          <td width="229" align="center" height="29" bgcolor="#C3DAF9">ip地址</td>
          </tr>
          <s:iterator var="data" value="dataList">
          <tr> 
          <td height="29" width="154" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.cjuser}</font></td>
          <td valign="middle" width="91" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.dqcj}</font></td>
          <td valign="middle" align="center" width="105"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">　${data.ljcj}</font></td>
          <td valign="middle" align="center" width="203">${data.qldate}</td>
          <td valign="middle" align="center" width="198">
			<font size="2" face="宋体">${data.cjfs}</font></td>
          <td valign="middle" align="center" width="124">${data.bz}</td>
          <td valign="middle" align="center" width="229">${data.ip}</td>
          </tr>
        </s:iterator>
            </table> 
</div><aldtags:pageTag para1="user" value1="${user}"/>
</font> 
</tr> 
</table> 
</div> 
</html>