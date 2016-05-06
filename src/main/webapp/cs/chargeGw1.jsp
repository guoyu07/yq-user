<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('改用户不存在[${user}]！');history.go(-1);</script></c:if>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.czy.value==0) {      alert("请写入操作员编号!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("请选择收到的充值金额!");      return false;    }
  if (Form.cjfs.value==0) {      alert("请选择充值方式!");      return false;    }
  return true;  }  
 </script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center">
<p style="margin-top: 0; margin-bottom: 0">　</p>
<p style="margin-top: 0; margin-bottom: 0"><font style="font-size: 20pt; font-weight: 700" color="#800000">您在操作的是给</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF">${user}</font><font style="font-size: 20pt; font-weight: 700" color="#008000"> 充值到奖金购物</font></p>

<table width="882" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111">  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="882"> 
      <form method="POST" align="center" action="chargeGw?user=${user}&status=1" name="Form" onSubmit="return checkdate()"><input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center"><TABLE width="646" border=0 cellPadding=5 cellSpacing=1 height="128">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="17" align="right" rowspan="4"><p style="margin-top: 0; margin-bottom: 0">　</TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right"><p style="margin-top: 0; margin-bottom: 0"><font face="黑体" size="4"><b>收到的充值金额：</b></font></TD>
      <TD width="406" bgColor=#ffffff><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="cjpay" size="18" maxlength="4">--<b><font color="#FF0000">本次为购物充值</font></b></TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right" height="31"><p style="margin-top: 0; margin-bottom: 0"><b><font face="黑体" size="4">充值方式：</font></b></TD>
      <TD width="406" bgColor=#ffffff height="31"><p style="margin-top: 0; margin-bottom: 0">  
              <select size="1" name="cjfs">
				<option selected value="0">==请选择充值方式==</option>
				<option value="工商银行">工商银行</option>
				<option value="农业银行">农业银行</option>
				<option value="建设银行">建设银行</option>
				<option value="支付宝">支付宝</option>
				<option value="财付通">财付通</option>
				<option value="其它">其它</option>
				</select></TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right" height="36"><p style="margin-top: 0; margin-bottom: 0"><b><font face="黑体" size="4">操作员编号：</font></b></TD>
      <TD width="406" bgColor=#ffffff height="36"><p style="margin-top: 0; margin-bottom: 0">  
        <input type="text" name="czy" size="15" value="${userName}" readonly><font color="#FF0000" size="3"> **&nbsp;&nbsp; </font> 
        <INPUT class=normalButton type=submit value="确 定" name=submit2 style="font-size: 12pt; font-weight:bold"></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=3 align=middle bgColor=#ffffff width="630" height="26"><p style="margin-top: 0; margin-bottom: 0"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
  </tr>
</table>
<p style="margin-top: 0; margin-bottom: 0"><b><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" src="bdbList?user=${user}"" border="0" frameborder="0"></iframe>
</div>
</body>
</html>