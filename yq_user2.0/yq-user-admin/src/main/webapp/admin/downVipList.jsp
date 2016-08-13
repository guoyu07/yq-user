<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<html>
<head>
<title>显示用户信息</title>
</head>

<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
		<div align="center">
		<font color="blue" style="font-size: 70px"><strong>全 部 小vip</strong></font>
            <table border="1" cellspacing="0" width="100%" bgcolor="#F6F6EC" style="border-collapse: collapse" cellpadding="0" height="59">
              	<tr bgcolor="#7bb5de"> 
	                <td width="105" align="center" height="23" bgcolor="#D9E6FF"> 
	                  <div align="center"><b><font color="red" face="宋体">vip用户</font></b></div>
	                </td>
              	</tr>
              	<s:iterator var="data" value="vipDownTempList">
              	<tr bgcolor="#7bb5de"> 
	                <td style="border-bottom: 1px solid #C9D8AD" width="118" align="center" bgcolor="#D9E6FF"> 
	                  <p align="center">
						${data.downVip}
					  </p>
					</td>
				</tr>
				</s:iterator>
		     </table>
		  </div>	
</body>
</html>
