<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmsl.value==0) {      alert("<s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.2026567304'/>!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title><s:text name='vipjztojb2.jsp.jztojb2.jsp.-1978587226'/></title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<body bgcolor="#99CCFF">

<div align="center">
<table border="0" width="100%" id="table1" cellspacing="1" height="700">
	<tr>
		<td height="71">
		　</td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">
			<table border="0" width="81%" id="table3" cellspacing="1" height="98" bgcolor="#FFFFFF">
				<tr>
	<b>
			<td align="center" width="97%" bgcolor="#FFF4DF" height="33"><b><font color="#669933"><s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-735901424'/></font></td>
				</tr>
				<b>
				<tr>
					<td height="62">

<div align="center">

<table width="619" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="70">
  
  <tr>
    <td align="center" valign="top" width="615" style="color: #304618; font-size: 12px" bordercolor="#669933"> 
      <form method="POST" align="center" action="jztojb?status=2" name="Form" onSubmit="return checkdate()">
      <div align="center">
      <TABLE width="542" border=0 cellPadding=5 cellSpacing=1 id="table5" height="20">
  <TBODY>
    <TR class=content> 
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px" height="63">
		<p align="right"><b><font size="3" color="#FF0000"><s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.408193998'/>：</font></b></TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left" height="63">
		<b><font size="2" color="#0000FF">
		<c:if test="${gmmj==1}">10<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1554998638'/>）</c:if>
		<c:if test="${gmmj==5}">50<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1726773544'/>）</c:if>
		<c:if test="${gmmj==10}">100<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-356053146'/>）</c:if>
		<c:if test="${gmmj==30}">300<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1988509399'/>）</c:if>
		<c:if test="${gmmj==50}">500<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.674001644'/>）</c:if>
		<c:if test="${gmmj==100}">1000<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.530883694'/>）</c:if>
		</font></b></TD>
    </TR>
    <tr>
	<b>
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px" height="42">
		<p align="right" style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3"><s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.1570472502'/>：</font></b></TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left" height="42">  
              <p style="line-height: 200%; margin-top: 0; margin-bottom: 0">  
              <font size="3">  
              <select size="1" name="gmsl">
				<option value="0" selected>==<s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.-145398058'/>==</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				</select>
				</font>
				<font color="#FF0000" style="font-size: 11pt">** </font><b>
				<input type="hidden" name="mj" size="5" value="${gmmj}0" readonly></TD>
    </tr>
    <TR class=content><TD width="517" bgColor=#ffffff align="center" style="color: #304618; font-size: 12px" colspan="2"><b><p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><font size="2">提示：您的<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>-<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/><font color="#FF0000">${pay}</font></font></TD>
    </TR>
    <TR class=content> 
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px"></TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left"><b><INPUT class=normalButton type=submit value="提 交" name=submit2 style="font-size: 11pt"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">&nbsp; </font><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='vipjztojb3.jsp.jztojb3.jsp.326642469'/></font></a></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
					</div>
					</td>
				</tr>
			</table>
			</div>
		</td>
	</tr>
</table></div>
