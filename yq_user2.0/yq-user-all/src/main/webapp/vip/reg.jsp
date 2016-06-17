<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('此用户名已有人使用！请更换！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('恭喜同姓名用户注册成功，请进行下一步的操作！');location.href='tgdown'</script></c:if>
<title>新用户注册登记</title>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script language="javascript" src="js/ajax.js"></script>

<script language="JavaScript"> 
function Check(){
	if ( Form.gguser.value==""){
		alert ("提示：用户名不能为空!！");
		Form.gguser.focus();
		return false;
	}
	 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("提示：\n\n您的用户名不符合规范，必须4-10个小写英文字母+数字！");
		Form.gguser.focus();
		return false;
	}
    var uName=document.Form.gguser.value;
    var ajaxobj = new Ajax();
    ajaxobj.url="checkreg?gguser="+uName;
    ajaxobj.callback=function(){
	    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
	    if(responseMsg.erroCodeNum!=0){
	    	alert("对不起，用户名："+uName+"，已经被注册了！");
		    return;
	    }else{
	    	alert("恭喜，您可以注册用户名："+uName);
	    	return;
	    }
    }
    ajaxobj.send();
}

function CheckIfEnglish( String )
{ 
    var Letters = "abcdefghijklmnopqrstuvwxyz0123456789";
     var i;
     var c;
      if(String.charAt( 0 )=='-')
	return false;
      if( String.charAt( String.length - 1 ) == '-' )
          return false;
     for( i = 0; i < String.length; i ++ )
     {
          c = String.charAt( i );
	  if (Letters.indexOf( c ) < 0)
	     return false;
     }
     return true;
}

 function checkdate()  {  
  if (Form.gguser.value=="") {      alert("用户名不能为空!"); Form.gguser.focus();     return false;    } 
  	        if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 12 || Form.gguser.value.length < 4) {
		alert("提示：\n\n您的用户名不符合规范，必须4-12个小写英文字母+数字！");
		Form.gguser.focus();
		return false;
	}
 
  if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    } 
return true;  }  
</script>
<body background="../image/regbg.gif">
<div align="center">
<form method="POST" action="regTheSame?status=1" name="Form" onSubmit="return checkdate()">
		<p style="margin-top: 0; margin-bottom: 0">　</p>
		<p style="margin-top: 0; margin-bottom: 0"><img border="0" src="../image/bg01.jpg" width="60%" height="79"></p>
		<table border="0" width="60%" id="table1" height="365" cellpadding="5" bgcolor="#FFFFFF">
			<tr>
				<td align="left" colspan="2">
				<table border="2" width="100%" id="table2" cellspacing="1" bordercolor="#FF0000" style="border-collapse: collapse" cellpadding="4">
					<tr>
						<td><p style="line-height: 150%"><font color="#FF0000">&nbsp;&nbsp; 此处注册为当前登录账户</font><font color="#0000FF">快捷添加同姓名新用户</font><font color="#FF0000">使用，仅需要自定义一个新用户名，其它资料与当前登录账户相同！&nbsp;</font><font color="#008000" size="2">如您需要注册不同姓名的新用户请到</font><a target="_top" href="reg"><img src="../images/a02.png"></a></td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">用户名：</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="gguser" size="15" maxlength="12" onKeyUp="value=value.replace(/[\W]/g,'')"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">一级密码：</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2">与当前登录账户相同</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">二级密码：</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2">与当前登录账户相同</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">姓名：</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2">${gcuser.name}</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">推荐人：</font></b></td>
			    <td width="66%"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#FF0000">${userName}</font></b></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">协议及声明：</font></b></td>
				<td width="66%"><font size="2" color="#FF0000">
				<span style="font-size: 11pt">
				<select size="1" name="sfz">
				<option selected value="0">==请选择是否同意协议及声明==</option>
				<option value="0">不同意！</option>
				<option value="1">同意协议及声明，自愿参与！</option>
				</select></span></font><font color="#FF0000" style="font-size: 11pt"> </font> 
				<font color="#008000" style="font-size: 11pt" size="2">&nbsp;</font><font color="#FF0000"><a href="javascript:openwindow('sfz.html')" style="text-decoration: none; font-weight: 700; "><font color="#008000" size="3">查看协议及声明</font></a></font></td>
			</tr>
		</table>
		<p style="margin-top: 0; margin-bottom: 0"></p>
		<p style="margin-top: 0; margin-bottom: 0">　</p>
		<p style="margin-top: 0; margin-bottom: 0"><input type="submit" value="提 交 注 册" name="submit" style="font-size: 12pt; font-weight: bold"></p>
		<p style="margin-top: 0; margin-bottom: 0" align="right"></p>
        </form>
<p style="margin-top: 0; margin-bottom: 0">　</div>