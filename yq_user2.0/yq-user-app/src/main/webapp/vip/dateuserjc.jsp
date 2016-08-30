<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<script language="JavaScript"> 
 function checkdate()  {

 if (Form.jcname.value=="") {      alert("<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.-849491093'/>!");  Form.jcname.focus();    return false;    }
 if (Form.jcname.value.length<2) {      alert("<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.1970552070'/>!");   Form.jcname.focus();     return false;    } 
 if (Form.jcname.value.length>8) {      alert("<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.1715922523'/>!");   Form.jcname.focus();     return false;    }
 if (Form.jcuserid.value=="") {      alert("<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.1596209606'/>!");  Form.jcuserid.focus();      return false;    }
 if (Form.jcuserid.value.length<18) {      alert("<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.-1560156081'/>!"); Form.jcuserid.focus();     return false;    } 
 if (Form.jcuserid.value.length>18) {      alert("<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.-1814845210'/>!"); Form.jcuserid.focus();     return false;    }

  var data = $("#Form").serialize();
  $.post("updateuserjc?status=1", data, function(response) {
		if(response.erroCodeNum==0){//注册成功
			alert('<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.-1456138858'/>！');
			return false;
		}else if(response.erroCodeNum==1){
			alert('<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.-26097813'/>');
			return false;
		}else{
			alert('<s:text name='vipdateuserjc.jsp.dateuserjc.jsp.-745085746'/>.['+response.erroCodeNum+']');
			return false;
		}
	});
  return true;
 }  
</script>
<html>
<head>
<title>修改<s:text name='vipadmin_menu.jsp.admin_menu.jsp.616144510'/></title>
<link rel="stylesheet" type="text/css" href="css.css">
</head>
<body topmargin="5" leftmargin="5">
<div align="center">
  <form  METHOD="post" action="" name="Form" id="Form" onSubmit="return false">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="140">
      <tr>
        <td align="right" width="1105" height="30" style="border-left: 1px solid #C9D8AD" bgcolor="#C9D8AD" colspan="2"><p align="center"><b><font color="#0000FF"><s:text name='vipdateuserjc.jsp.dateuserjc.jsp.-2147423581'/>！</font></b></td>
      </tr>
      <tr>
        <td align="right" width="495" height="30" style="border-left: 1px solid #C9D8AD" bgcolor="#FFDDFF"><b><s:text name='vipdateuserjc.jsp.dateuserjc.jsp.708938076'/>：</b></td>
        <td width="738" align="left" style="border-right: 1px solid #C9D8AD" bgcolor="#FFDDFF"><input type="text" maxlength=32 name="jcname" value="${gcuser.jcname}" size="16" <c:if test="${gcuser.jcname!=''}">readonly</c:if> ><font color="#FF0000"> **必须填写</font></td>
      </tr>
		<tr>
		<td align="right" width="495" height="31" style="border-left: 1px solid #C9D8AD" bgcolor="#FFDDFF"><b><font face="Arial"><s:text name='vipdateuserjc.jsp.dateuserjc.jsp.1224987511'/>：</font></b></td>
        <td width="738" align="left" style="border-right: 1px solid #C9D8AD" bgcolor="#FFDDFF"><input type="text" maxlength=19 name="jcuserid" value="${gcuser.jcuserid}" size="22" <c:if test="${gcuser.jcuserid!=''}">readonly</c:if> ><font color="#FF0000"> **必须填写</font></td>
      </tr>
      <tr>
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD;" height="38" bgcolor="#FFFFDD"><div align="center"></div><div align="center"><input type="submit" name="submit" width="34" height="20" alt="<s:text name='vipsgreg.jsp.sgreg.jsp.812244'/>" size="20" value="确定增加继承人" onClick="checkdate();" class="lkbtn" style="font-size: 12pt"></div></td>
      </tr>
    </table>
    </div>
</div>
</form>
</body>
</html>
