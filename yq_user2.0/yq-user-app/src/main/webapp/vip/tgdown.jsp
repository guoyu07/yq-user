<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title><s:text name='viptgdown.jsp.tgdown.jsp.1394802561'/></title>
</head>

<div align="center">
  <p align="left"><s:text name="viptgdown.jsp.tgdown.jsp.-284260618"></s:text></font></p>
  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25" background="images/admin_bg_1.gif"> 
      <p align="center"><font color="#000000" style="font-size: 14px"><strong><s:text name='viptgdown.jsp.tgdown.jsp.-1824243143'/></strong></font></td> 
  </tr> 
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#C3DAF9"><br> 

<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr>
          <td width="148" align="center" height="28" bgcolor="#C3DAF9"><font  color="#000000" style="font-size: 11pt"><strong><s:text name='vipdatepay.jsp.datepay.jsp.29623262'/></strong></font></td>
          <td width="168" align="center" height="28" bgcolor="#C3DAF9"><p><font  color="#000000" style="font-size: 11pt; font-weight:700">QQ</font></td>
          <td width="202" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" ><s:text name='viptgdown.jsp.tgdown.jsp.851482466'/></font></td>
          <td width="116" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" ><s:text name='viptgdown.jsp.tgdown.jsp.989728617'/></font></td>
          <td width="217" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" ><s:text name='viptgdown.jsp.tgdown.jsp.-738867994'/></font></td>
          <td width="148" align="center" height="28" bgcolor="#C3DAF9"><s:text name='viptgdown.jsp.tgdown.jsp.660492955'/></td>
          <td width="228" align="center" height="28" bgcolor="#C3DAF9"><font ><span style="font-size: 11pt; font-weight:700"><s:text name='viptgdown.jsp.tgdown.jsp.667120382'/></span></font></td>
          </tr>
          <s:iterator var="data" value="dataList">
          <tr> 
          <td height="23" width="148" align="center"><p><font color="#000000" size="2">${data.username}</font></td>
          <td valign="middle" align="left" width="168"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${data.qq}&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:${data.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></font></a><font size="2" color="#000000">${data.qq}</font></td>
          <td valign="middle" align="center" width="202"><font color="#000000" size="2">${data.regtime}</font></td>
          <td valign="middle" align="center" width="116"><b><font color="#FF0000" size="2">${data.cjtj}</font></b></td>
          <td valign="middle" align="center" width="217"><font color="#000000" size="2">${data.gmdate}</font></td>
          <td valign="middle" align="center" width="148"><c:if test="${data.sjb==0}">否</c:if><c:if test="${data.sjb!=0}">${data.sjb}单</c:if>
          <td valign="middle" align="center" width="228"><font size="2">${data.bddate}</font></td>
          </tr>
         </s:iterator>
            </table> 
</div> <aldtags:pageTag/>
</tr> 
</table> 
</div> 
</body> 
</html>
