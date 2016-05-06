<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<script language="JavaScript"> 
 function checkdate()  {

 if (Form.jcname.value=="") {      alert("请填入继承人姓名!");  Form.jcname.focus();    return false;    }
 if (Form.jcname.value.length<2) {      alert("继承人姓名至少为2个汉字!");   Form.jcname.focus();     return false;    } 
 if (Form.jcname.value.length>8) {      alert("继承人姓名至多为4个汉字!");   Form.jcname.focus();     return false;    }
 if (Form.jcuserid.value=="") {      alert("请填入继承人的身份证号码!");  Form.jcuserid.focus();      return false;    }
 if (Form.jcuserid.value.length<18) {      alert("继承人身份证号码至少为18位数!"); Form.jcuserid.focus();     return false;    } 
 if (Form.jcuserid.value.length>18) {      alert("继承人身份证号码至多为18位数!"); Form.jcuserid.focus();     return false;    }

  var data = $("#Form").serialize();
  $.post("updateuserjc?status=1", data, function(response) {
		if(response.erroCodeNum==0){//注册成功
			alert('继承人添加成功！');
			return false;
		}else if(response.erroCodeNum==1){
			alert('已经填写过，不能修改');
			return false;
		}else{
			alert('发生了错误.['+response.erroCodeNum+']');
			return false;
		}
	});
  return true;
 }  
</script>
<html>
<head>
<title>修改个人信息</title>
<link rel="stylesheet" type="text/css" href="css.css">
</head>
<body topmargin="5" leftmargin="5">
<div align="center">
  <form  METHOD="post" action="" name="Form" id="Form" onSubmit="return false">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="140">
      <tr>
        <td align="right" width="1105" height="30" style="border-left: 1px solid #C9D8AD" bgcolor="#C9D8AD" colspan="2"><p align="center"><b><font color="#0000FF">继承人一经填写将不能自行修改，请谨慎填写！</font></b></td>
      </tr>
      <tr>
        <td align="right" width="495" height="30" style="border-left: 1px solid #C9D8AD" bgcolor="#FFDDFF"><b>继承人姓名：</b></td>
        <td width="738" align="left" style="border-right: 1px solid #C9D8AD" bgcolor="#FFDDFF"><input type="text" maxlength=32 name="jcname" value="${gcuser.jcname}" size="16" <c:if test="${gcuser.jcname!=''}">readonly</c:if> ><font color="#FF0000"> **必须填写</font></td>
      </tr>
		<tr>
		<td align="right" width="495" height="31" style="border-left: 1px solid #C9D8AD" bgcolor="#FFDDFF"><b><font face="Arial">继承人身份证号码：</font></b></td>
        <td width="738" align="left" style="border-right: 1px solid #C9D8AD" bgcolor="#FFDDFF"><input type="text" maxlength=19 name="jcuserid" value="${gcuser.jcuserid}" size="22" <c:if test="${gcuser.jcuserid!=''}">readonly</c:if> ><font color="#FF0000"> **必须填写</font></td>
      </tr>
      <tr>
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD;" height="38" bgcolor="#FFFFDD"><div align="center"></div><div align="center"><input type="submit" name="submit" width="34" height="20" alt="提交" size="20" value="确定增加继承人" onClick="checkdate();" class="lkbtn" style="font-size: 12pt"></div></td>
      </tr>
    </table>
    </div>
</div>
</form>
</body>
</html>