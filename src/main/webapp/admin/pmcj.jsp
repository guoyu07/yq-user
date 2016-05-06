<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
 <c:if test="${erroCodeNum==1}"><script language=javascript>alert('该会员不存在或已经是双区会员，不需要重复报单，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('操作员不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('恭喜开通成功，奖金业绩已更新。。。！');location.href='pmmlt?user=${id}'</script></c:if>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.czy.value==0) {      alert("请写入操作员编号!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("请选择收到的充值金额!");      return false;    }
  return true;  }  
 </script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center">
<p style="margin-top: 0; margin-bottom: 0">　</p>
<p style="margin-top: 0; margin-bottom: 0">
<font style="font-size: 20pt; font-weight: 700" color="#800000">您在操作的是给</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF">${id}</font><font style="font-size: 20pt; font-weight: 700" color="#800000">充值</font></p>

<table width="882" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="882"> 
      <form method="POST" align="center" action="/admin/pmcj?id=${id}&status=1" name="Form" onSubmit="return checkdate()">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="646" border=0 cellPadding=5 cellSpacing=1 height="128">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="17" align="right" rowspan="4">
		<p style="margin-top: 0; margin-bottom: 0">　</TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right">
		<p style="margin-top: 0; margin-bottom: 0">
		<font face="黑体" size="4"><b>收到的充值金额：</b></font></TD>
      <TD width="406" bgColor=#ffffff>  
              <p style="margin-top: 0; margin-bottom: 0">  
              <select size="1" name="cjpay">
				<option selected value="0">==请选择收到的充值金额==</option>
				<option value="500">500</option>
				<option value="1000">1000</option>
				<option value="2000">2000</option>
				<option value="5000">5000</option>
				<option value="10000">10000</option>
				<option value="20000">20000</option>
				<option value="50000">50000</option>
				</select></TD>
    </TR>
    
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right" height="36">
		<p style="margin-top: 0; margin-bottom: 0">
		<b>
		<font face="黑体" size="4">操作员编号：</font></b></TD>
      <TD width="406" bgColor=#ffffff height="36">  
              <p style="margin-top: 0; margin-bottom: 0">  
              <input type="text" name="czy" size="15" value="${czy}"><font color="#FF0000" size="3"> 
				**&nbsp;&nbsp; </font> 
              <INPUT class=normalButton type=submit value="确 定" name=submit2 style="font-size: 12pt; font-weight:bold"></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=3 align=middle bgColor=#ffffff width="630" height="26"> 
              <p style="margin-top: 0; margin-bottom: 0"> 
              <a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-size: 12pt; font-weight: 700">
				返回上一页</font></a></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
<p style="margin-top: 0; margin-bottom: 0">　</div>
</body>
</html>