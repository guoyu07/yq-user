<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('二级密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('您好，您已申请的卖出尚未交易成功，暂时不能使用转账功能，谢谢！');location.replace('epmcjl');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('操作错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('选中了不存在的用户');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('非同名用户,不能转');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您至少选择一个需要转账的用户名，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('您已成功批量转账！');location.href='tjz'</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('被转用户一币发生了改变');history.go(-1);</script></c:if>
<html>
<title>同姓名账户批量转账</title>
</head>
<script language = "JavaScript"> 
//全选操作    
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
<font face="宋体" size="4">同姓名账户批量转账</font></b><font size="2" face="宋体">
</font></p>
	<div align="center">
        <table border="1" cellspacing="1" width="100%" height="66" bordercolor="#C0C0C0" style="border-collapse: collapse" id="table2">
     <tr>        
     <td width="318" align="center" height="32"><b>选中</b></td>                
     <td width="318" align="center" height="32"><b><font color="#FF0000" face="宋体">用户名</font></b></td>                
     <td width="416" align="center" height="32"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#FF0000"><strong>姓名</strong></font></td><b>                
     <td width="476" align="center" height="32"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" face="宋体"> <strong>可用一币</strong></font></td>
        </tr>
     <s:iterator var="data" value="dataList">
        <tr> 
      <td height="32" width="318" align="center"><input type="checkbox" name="fromUsers" value="${data.username}"></td>
      <td height="32" width="318" align="center"><font face="宋体"><b>${data.username}</b></td>
      <td height="32" width="416" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-weight: 700">${data.name}</font></td>
      <td valign="middle" width="476" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="宋体"><input type="hidden" name="tpay" size="10" value="${data.pay}" readonly>${data.pay}</font></b></td>
      </tr>
   </s:iterator>
  </table> 
</div><font size="2" face="宋体"><aldtags:pageTag/>
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
		<td width="258" bgcolor="#E5EAC2"><p align="center"><input type='checkbox' name=chkall onclick='CheckAll(this.form)'>全选</td>
		<td colspan="2" bgcolor="#E5EAC2"><p align="left">二级密码：<input type="password" name="pa2j" size="15"> <input type="submit" value="批量提交转至" name="B1" onClick="{if(confirm('一经转账的一币不再提供卖出，确定了吗?')){this.style.visibility='hidden';return true;}return false;}">当前登录的用户名：<b><font color="#FF0000">${userName}</font></b></td>
	</tr>
</table>
</form>
</html>