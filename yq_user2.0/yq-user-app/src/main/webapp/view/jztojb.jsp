<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1616194221'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('电子卡发放及业绩更新<s:text name='reg1.jsp.reg1.jsp.799375'/>！');location.href='datepay'</script></c:if>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmmj.value==0) {      alert("<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.640107298'/>!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>转金币卡</title>
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
			<table border="0" width="81%" id="table3" cellspacing="1" height="133" bgcolor="#FFFFFF">
			<tr>
			<td align="center" width="97%" bgcolor="#FFF4DF" height="33"><b><font color="#669933"><s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-735901424'/></font></td>
				</tr>
				<b>
				<tr>
					<td height="97">

<div align="center">

<table width="636" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="136">
  
  <tr>
    <td align="center" valign="top" width="632" style="color: #304618; font-size: 12px" bordercolor="#669933"> 
      <form method="POST" align="center" action="jztojb?status=1" name="Form" onSubmit="return checkdate()">
      <div align="center">
      <TABLE width="610" border=0 cellPadding=5 cellSpacing=1 id="table5" height="52">
  <TBODY>
    <TR class=content> 
      <TD width="266" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		<p align="right" style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3" color="#FF0000"><s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1898581836'/>：</font></b></TD>
      <TD width="321" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">  
              <p style="line-height: 200%; margin-top: 0; margin-bottom: 0">  
              <font size="3">  
              <select size="1" name="gmmj">
				<option value="0" selected>==<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-697677804'/>==</option>
				<option value="1">10<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1554998638'/>）</option>
				<option value="5">50<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1726773544'/>）</option>
				<option value="10">100<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-356053146'/>）</option>
				<option value="30">300<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1988509399'/>）</option>
				<option value="50">500<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.674001644'/>）</option>
				<option value="100">1000<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.530883694'/>）</option>
				</select>
				</font>
				<font color="#FF0000" style="font-size: 11pt">** </font><b>&nbsp;<INPUT class=normalButton type=submit value="<s:text name='submit'/>" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
		<p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><font size="2"><s:text name='vipjztojb.jsp.jztojb.jsp.890004381'/><font color="#FF0000">${pay}</font></font><p style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<font style="font-size: 11pt"><s:text name='vipjztojb.jsp.jztojb.jsp.186706464'/></font><p style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<font style="font-size: 11pt"><s:text name='vipjztojb.jsp.jztojb.jsp.17234952'/>！</font></div>
</form>
    </td>
    </tr>
</table>
					</div>
					</td>
				</tr>
			</table>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0">　</p>
<p><a href="javascript:history.back();" style="text-decoration: none"><font color="#000000" style="font-weight: 700" size="6"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>

		</div>
		</td>
	</tr>
</table></div>
