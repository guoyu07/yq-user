<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>一币变化明细</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
</head>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <form method="POST" action="datepay2" name="Form" id="Form">
			<table border="0" width="100%" id="table1">
			    <tr><td><p align="center"><font color="#000000" face="楷体" size="5"><strong>[${vipName}]一 币 及充值币统计</strong></font></td></tr>
			</table>
		</form>
		</td>
  </tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2">
	<font face="宋体" size="2"><br></font>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">一币收入</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2">一币支出</font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2">剩余一币</font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="宋体">充值币收入</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">充值币支出</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">剩余充值币</font></td>
            </tr>
            <tr> 
             <td height="31" width="134" align="center"> <p><font color="#000000" size="2" face="宋体">${bean.inYb}</font></td>
             <td valign="middle" width="133" align="center"> <p><font color="#FF0000" size="2" face="宋体">${bean.outYb}</font></td>
             <td valign="middle" width="133" align="center"> <p><font color="#FF0000" size="2" face="宋体">${bean.nowYb}</font></td>
             <td valign="middle" width="133" align="center"> <p><font color="#FF0000" size="2" face="宋体">${bean.inCjb}</font></td>
             <td valign="middle" width="133" align="center"> <p><font color="#FF0000" size="2" face="宋体">${bean.outCjb}</font></td>
             <td valign="middle" width="133" align="center"> <p><font color="#FF0000" size="2" face="宋体">${bean.nowCjb}</font></td>
            </tr>
            </table> 
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
</html>