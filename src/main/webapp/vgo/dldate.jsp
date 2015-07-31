<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>登 录 记 录 明 细</strong></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
	<font face="宋体" style="font-size: 11pt"><br> 
</font><font face="宋体" style="font-size: 11pt"><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57" id="table1">
            <tr>
          <td width="230" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>员工编号</strong></font></td>
          <td width="374" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">最近登录时间</font></td>
          <td width="355" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">退出时间</font></td>
          <td width="350" align="center" height="29" bgcolor="#C3DAF9">ip地址</td>
          <td width="350" align="center" height="29" bgcolor="#C3DAF9">相关操作</td>
          </tr>
          <s:iterator var="data" value="dataList">
          <tr> 
          <td height="29" width="230" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" size="2">${gcuser.username}</font></td>
          <td valign="middle" align="center" width="374">${data.dldate}</td>
          <td valign="middle" align="center" width="355"><font size="2" face="宋体">${data.tcdate}</font></td>
          <td valign="middle" align="center" width="350">${data.dlip}</td>
          <td valign="middle" align="center" width="350">${data.dlfs}</td>
          </tr>
          </s:iterator>
            </table> 
</div><aldtags:pageTag/>
</font> 
</tr> 
</table> 
</div> 
</html>