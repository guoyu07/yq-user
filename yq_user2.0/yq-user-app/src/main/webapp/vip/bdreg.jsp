<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.1610007112'/>）！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.-1396378774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.-394660049'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.1923400400'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.1060799146'/>！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1996562206'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1380597198'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.-1649708849'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.-1817862406'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.153703061'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.1554447127'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.1554447127'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.-131078147'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.-1541818965'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==15}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.1917340790'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==16}"><script language=javascript>alert('<s:text name='vipbdreg.jsp.bdreg.jsp.1463370214'/>！');history.go(-1);</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<script type="text/javascript" src="images/jquery.min.js"></script>
<script src="/scripts/sms.js"></script>
<script language="JavaScript">
 function checkdate()  { 
  
		$("#btn").attr("disabled","disabled");
		var data = $("#Form").serialize();
		$.post("/sms?op=2", data, function(response) {
			$("#btn").removeAttr("disabled");
			if (response.erroCodeNum!=0) { alert("<s:text name='vipbdreg.jsp.bdreg.jsp.1886666017'/>"); return false; }
			settime($("#btn"));
			alert("<s:text name='vipbdreg.jsp.bdreg.jsp.1886721436'/>");
		});
	return false;
}  

function checkdate1()  {  
  if (Form.ceid.value=="") {   alert("<s:text name='vipbdreg.jsp.bdreg.jsp.-352812950'/>");  Form.ceid.focus();   return false;    }
  return true;
} 
</script>

<div align="center">
<p>　</p>
<p>　</p>
<p><font face="黑体" size="6" color="#FF0000"><s:text name="vipbdreg.jsp.bdreg.jsp.1863505436"></s:text></font></p>
	<form method="POST" action="bdreg?status=1" name="Form" id="Form" >
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<input type="hidden" name="cjpay" size="10" value="${cjpay}" readonly><input type="hidden" name="remark" size="8" value="3" readonly><input type="hidden" name="user" size="10" value="${userName}" readonly>
	<table border="0" width="52%" id="table1" height="220" cellspacing="1">
		<tr>
			<td align="right" width="42%"><s:text name='vipbdreg.jsp.bdreg.jsp.473018246'/>：</td>
			<td width="56%" colspan="2"><font color="#000080"><b><input type="hidden" name="up" size="10" value="${up}" readonly>${up}</b></font></td>
		</tr>
		<tr>
			<td align="right" width="42%"><s:text name='vipbdreg.jsp.bdreg.jsp.1763852615'/>：</td>
			<td width="56%" colspan="2"><font color="#FF0000"><b><input type="hidden" name="bduser" size="10" value="${bduser}" readonly>${bduser}</b></font></td>
		</tr>
		<tr>
			<td align="right" width="42%"><s:text name='vipbdreg.jsp.bdreg.jsp.1123565209'/>：</td>
			<td width="56%" colspan="2"><font color="#008000"><b>${cjpay}</b></font><input type="hidden" name="pa1j" size="8" value="${pa1j}"><input type="hidden" name="pa2j" size="8" value="${pa2j}"></td>
		</tr>
		<c:if test="${cjpay<9000}">
		<tr>
			<td align="right" width="42%"><s:text name='vipbdreg.jsp.bdreg.jsp.-1539312043'/>：</td>
			<td width="56%" colspan="2">${call}</td>
		</tr>
		<tr>
			<td align="right" width="42%" height="34"><s:text name='vipbdreg.jsp.bdreg.jsp.-1704827075'/>：</td>
			<td width="15%" height="34"><input type="text" name="ceid" size="8"></td>
			<td width="40%" height="34"><input id="btn" type="button" onclick="checkdate()" value="<s:text name='vipbdreg.jsp.bdreg.jsp.1753968781'/>" name="B2"></td>
		</tr>
		<tr>
			<td align="right" width="98%" colspan="3" height="27"><p align="center"><b><font color="#FF0000" size="2"><s:text name='vipbdreg.jsp.bdreg.jsp.1192144953'/>！</font></b></td>
		</tr>
       </c:if>
		<tr>
			<td align="right" colspan="3" bgcolor="#EAEAEA" height="31"><p align="center"><span style="font-size: 11pt"><font color="#800000"><s:text name="vipbdreg.jsp.bdreg.jsp.-808057141"></s:text></font><font color="#0000FF">${cjpay}</font></span></td>
		</tr>
	</table>
		<p><input type="submit" value="<s:text name='vipbdreg.jsp.bdreg.jsp.-1719272165'/>" name="B1" onClick="{if(confirm('<s:text name='vipbdreg.jsp.bdreg.jsp.-1719272165a'/>?')){this.style.visibility='hidden';return true;}return false;}" style="font-size: 14pt; color: #0000FF; font-weight: bold"></p>
</form>
<p align="center"> </p>
<p align="center"><b><font color="#FF0000"><s:text name='vipbdreg.jsp.bdreg.jsp.-2118781725'/>！</p>
<p align="center"> </p>
</div>
<script type="text/javascript">
btnStatus($("#btn"));
</script>
