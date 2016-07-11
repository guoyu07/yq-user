<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<title>>修 改 积 分 单 价</title>
<p align="center">
		<strong>
		<font color="#000000">当 前 积 分 挂 牌 明 细</font></strong></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" > 
</font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="30">
            <tr> 
              <td width="105" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><strong style="font-weight: 400">用户名</strong></font>
              <td width="50" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><strong style="font-weight: 400">卖出</strong></font></td>
              <td width="55" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">剩余</font></td>
              <td width="111" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">挂牌时间</font></td>
              <td width="50" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2">操作</font></td>
              <td width="791" align="center" height="30" bgcolor="#FFE1FF"></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
              <td height="35" width="105" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">${userName}</font></td>
              <td valign="middle" width="50" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">${data.mcsl}</font></td>
              <td valign="middle" align="center" width="55"><font size="2">${data.sysl}</font></td>
              <td valign="middle" align="center" width="111"><font color="#000000" size="2">${data.abdate}</font></td>
			  <td align="center" width="50"><font size="2"><a href="qxyjg?qxid=${data.id}" style="text-decoration: none">
			  <c:if test="${data.newjy!=3}">撒销</c:if></a></font></td>
			  <td valign="top" align="center" width="791"><iframe name="I1" marginwidth="1" marginheight="1" height="25" width="100%" border="0" frameborder="0" src="diyjygj?sgid=${data.id}" align="center" scrolling="no"></iframe></td>
              </tr>
              </s:iterator>
            </table> 
</div><font  size="2"> <aldtags:pageTag/>
</font> 
</tr> 
</table> 
<font  size="2"> 
</div> </div>
</font>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700"  size="2">返回上一页</font></a></p>
<font  size="2">
</body>
</font>
<meta http-equiv=Refresh content="180; url=">
</html>