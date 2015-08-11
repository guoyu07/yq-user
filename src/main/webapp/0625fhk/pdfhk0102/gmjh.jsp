<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title>显示购卡记录</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<LINK href="adminstyle.css" type=text/css rel=StyleSheet>
</head>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
</SCRIPT>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.pdid.value=="") {      alert("消费编号不能为空!");      return false;    } 
  if (Form.pdpa.value=="") {      alert("登录密码不能为空!");      return false;    }  
  if (Form.fwid.value=="") {      alert("防伪编码不能为空!");    return false;    } 
  if (Form.sfz.value==0) {      alert("请您认真查看消费者协议，只有同意后才可以继续!");      return false;    }
  return true;  }  
</script>

<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<body style="text-align: center">
<div align="center">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
    <td width="100%" height="35" bgcolor="#FFE1FF"><p align="center" style="margin-top: 0; margin-bottom: 0; line-height:150%"><span style="background-color: #FFFFFF"><font size="4" color="#008000">您的用户名为 </font><font size="4"><b><font color="#FF0000">${userName}</font></b></font></span></p></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84">
	<div align="center">
<table width="834" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table15">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="830" style="color: #304618; font-size: 12px"> 
      <form method="POST" align="center" action="activedGoldCard" name="Form" onSubmit="return checkdate()">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="503" border=0 cellPadding=3 id="table16" height="164">
  <TBODY>
    <TR class=content> 
      <TD width="177" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="29"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="3" color="#000000">消费编号：</font></b></TD>
      <TD width="311" bgColor=#ffffff style="color: #304618; font-size: 12px" height="29"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2"><span style="font-size: 9pt"><font size="3"><input type="text" maxlength="20" name="pdid" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><input type="hidden" name="jbk" size="10" value="${userName}" readonly></font></span></font></TD>
    </TR>
    <TR class=content> 
      <TD width="177" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="28"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="3" color="#000000">登录密码：</font></b></TD>
      <TD width="311" bgColor=#ffffff style="color: #304618; font-size: 12px" height="28">  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2"><span style="font-size: 9pt"><font size="3"><input type="text" maxlength=15 name="pdpa" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></font></span></font></TD>
    </TR>
    <TR class=content> 
      <TD width="177" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="29"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="3" color="#000000">防伪编码：</font></b></TD>
      <TD width="311" bgColor=#ffffff style="color: #304618; font-size: 12px" height="29"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2"><span style="font-size: 9pt"><font size="3"><input type="text" maxlength=15 name="fwid" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" ></font></span></font></TD>
    </TR>
    <TR class=content> 
    <TD width="495" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" colspan="2" height="53">
	<table border="0" width="82%" id="table17" cellspacing="0" cellpadding="0" height="37">
	<tr>
	<td><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" color="#FF0000"><select size="1" name="sfz">
		<option selected value="0">==请选择是否同意消费者协议==</option>
		<option value="0">不同意，我不要参与，我要把卡丢了...</option>
		<option value="1">同意协议，我已经买到自己想要的产品！</option>
		</select>
		<a href="javascript:openwindow('/sfz.html')" style="text-decoration: none; font-weight: 700"><font color="#008000" size="3">查看消费者协议</font></a></font></td>
		</tr>
		</table>
		</TD>
    </TR>
    <TR class=content> 
      <TD width="495" bgColor=#ffffff align="center" style="color: #304618; font-size: 12px" colspan="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="确 定" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
</p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="60">
            <tr>
              <td width="205" align="center" height="25" bgcolor="#F9F4E8"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="Arial" color="#800000"><strong>消费编号</strong></font></td>
              <td width="115" align="center" height="25" bgcolor="#F9F4E8"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000"> <strong>金币面值</strong></font></td>
              <td width="182" align="center" height="25" bgcolor="#F9F4E8"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000"> <strong>生成时间</strong></font></td>
              <td width="400" align="center" height="25" bgcolor="#F9F4E8"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000">该卡目前状态</font></b></td>
              <td width="332" align="center" height="25" bgcolor="#F9F4E8" colspan="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000">操作</font></b></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="45" width="205" align="center" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000" size="2" style="font-weight: 700">${data.pdid}</font></td>
                <td valign="middle" width="115" align="center" bgcolor="#E8E8FF"><font color="#FF0000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">${data.bf2}0</font></td>
                <td valign="middle" width="182" align="center" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">${data.gmdate}</font></td>
                <td valign="middle" align="center" width="400" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2">还没有激活，请通知客户尽快激活以便购买积分增值。</font></td>
                <td valign="middle" align="center" width="272" bgcolor="#E8E8FF"><font color="#000000" size="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
                <c:if test="${data.gpa>1}"></font><font color="#FF0000" size="2"><a href="glfhk?id=${data.pdid}" style="text-decoration: none">已查看过密码，需要重置或激活</a></font><font color="#000000" size="2"></c:if>
                <c:if test="${data.gpa<=1}"></font><font color="#000000"><a href="glfhk?id=${data.pdid}" style="text-decoration: none; font-weight: 700"><font color="#008000" size="2">重置(查看)该卡密码或激活</font></a></font><font color="#000000" size="2"></c:if>
                </font></td>
                <td valign="middle" align="center" width="61" bgcolor="#E8E8FF">　</td>
              </tr>
             </s:iterator>
</table> 
</div> <aldtags:pageTag/>
</tr> 
</table> 
</div> 
</body> 
</html>