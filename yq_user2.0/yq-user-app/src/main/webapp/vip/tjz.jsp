<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viptjz.jsp.tjz.jsp.1923400400'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viptjz.jsp.tjz.jsp.1141572332'/>！');location.replace('epmcjl');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viptjz.jsp.tjz.jsp.-830018135'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-898207976'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.529929694'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viptjz.jsp.tjz.jsp.174913287'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viptjz.jsp.tjz.jsp.1396615689'/>！');location.href='tjz'</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('<s:text name='viptjz.jsp.tjz.jsp.1639887174'/>');history.go(-1);</script></c:if>
<html>
<title><s:text name='viptjz.jsp.tjz.jsp.-48484697'/></title>
</head>
<script language = "JavaScript"> 
//<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.682913'/><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/>    
function CheckAll(form) {
 for (var i=0;i<form.elements.length;i++) {
 var e = form.elements[i];
 if (e.name != 'chkall') e.checked = form.chkall.checked;
 }
 }
</script>

<body topmargin="0">
<form method="POST" action="tjz?status=1" name="form">
<input type="hidden" name="dcuser" size="15" value="${userName}" readonly>
<div align="center"><b>
	<table border="0" cellspacing="1" width="100%" cellpadding="0" height="90" id="table1">
  <tr> 
<td width="87%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="90"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>
<font  size="4"><s:text name='viptjz.jsp.tjz.jsp.-48484697'/></font></b><font size="2" >
</font></p>
	<div align="center">
        <table border="1" cellspacing="1" width="100%" height="66" bordercolor="#C0C0C0" style="border-collapse: collapse" id="table2">
     <tr>        
     <td width="318" align="center" height="32"><b><s:text name='viptjz.jsp.tjz.jsp.1163076'/></b></td>                
     <td width="318" align="center" height="32"><b><font color="#FF0000" ><s:text name='reg.jsp.reg.jsp.29623262'/></font></b></td>                
     <td width="416" align="center" height="32"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font  color="#FF0000"><strong><s:text name='reg.jsp.reg.jsp.734362'/></strong></font></td><b>                
     <td width="476" align="center" height="32"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" > <strong><s:text name='viptjz.jsp.tjz.jsp.669584602'/></strong></font></td>
        </tr>
     <s:iterator var="data" value="dataList">
        <tr> 
      <td height="32" width="318" align="center"><input type="checkbox" name="fromUsers" value="${data.username}"></td>
      <td height="32" width="318" align="center"><font ><b>${data.username}</b></td>
      <td height="32" width="416" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font  style="font-weight: 700">${data.name}</font></td>
      <td valign="middle" width="476" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font ><input type="hidden" name="tpay" size="10" value="${data.pay}" readonly>${data.pay}</font></b></td>
      </tr>
   </s:iterator>
  </table> 
</div><font size="2" ><aldtags:pageTag/>
</font>
</tr> 
</table>
</div>
</b>
<table border="0" width="100%" id="table3" cellspacing="0" cellpadding="0" height="40">
	<tr>
		<td width="258" height="8">  </td>
		<td width="32%" height="8">  </td>
		<td width="47%" height="8"></td>
	</tr>
	<tr>
		<td width="258" bgcolor="#E5EAC2"><p align="center"><input type='checkbox' name=chkall onclick='CheckAll(this.form)'><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.682913'/></td>
		<td colspan="2" bgcolor="#E5EAC2"><p align="left"><s:text name='viptjz.jsp.tjz.jsp.571440148'/>：<b><font color="#FF0000">${userName}</font></b></td>
	</tr>
</table>
</form>
</html>
