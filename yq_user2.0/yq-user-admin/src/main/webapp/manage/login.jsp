<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:if test="${erroCodeNum==399}"><script language=javascript>alert('验证码不能为空！');</script></c:if>
<c:if test="${erroCodeNum==400}"><script language=javascript>alert('验证码过期,请点击刷新！');</script></c:if>
<c:if test="${erroCodeNum==401}"><script language=javascript>alert('验证码不正确！');</script></c:if>
<c:if test="${erroCodeNum==402}"><script language=javascript>alert('用户或者密码错误！');</script></c:if>
<c:if test="${erroCodeNum==405}"><script language=javascript>alert('功能性账户不提供此处登录！');</script></c:if>
<title>科宇科技</title>
<link href="${ctx}/styles/login.css" rel="stylesheet" type="text/css" />
<script language="javascript"  src="${jshome}/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
	//var ctx = "${ctx}";
	function submitResult(){
		if($("#userName").val()==""){
			alert("请输入用户名！");
			return false;
		}
		if($("#password").val()==""){
			alert("密码不能为空！");
			return false;
		}
		if($("#validCode").val()==""){
			alert("验证码不能为空！");
			return false;
		}
		document.getElementById("newForm").submit();
	}
	
	/* function keyDownSubmit(event){
		if(event.keyCode==13){
			if($("#userName").val()==""){
				alert("请输入用户名！");
				return false;
			}
			if($("#password").val()==""){
				alert("请输入密码！");
				return false;
			}
			document.getElementById("newForm").submit();
		}
	} */
</script>
</head>
<div class="login_body">
  <div id="container">
    <DIV id=main>
      <DIV id=right>
        <DIV class=login-frm>
        <form id="newForm"  method="post" name='newForm' action='houtailogin?status=1'>
          <table border="0">
            <tr>
              <td height="25">用户名<br /></td>
              <td><input type="text" name="adminUserName" id="j_username"  onkeydown="keyDownSubmit(event);"/></td>
              <td></td>
            </tr>
            <tr>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td></td>
            </tr>
            <tr>
              <td height="25">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
              <td><input type="password" name="passWord" id="j_password"  onkeydown="keyDownSubmit(event);"/></td>
              <td></td>
            </tr>
            <tr>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td></td>
            </tr>
            <tr>
              <td height="15">验证码</td>
              <td height="15"><input name="validCode" size="8"/></font></td>
              <td><font size="2px"><img src="/VerifyCode2.jsp" title="点击刷新" onclick="this.src='/VerifyCode2.jsp?'+Math.random()" /></font></td>
            </tr>
            <tr>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td></td>
            </tr>
            <tr>
              <td height="25">&nbsp;</td>
              <td><span class="ft">
                <input style=" background:url(${ctx}/images/login_v2/bgbtn.png) no-repeat; width:89px; height:29px; border:0px;" tabindex="4"  type="button" onclick="submitResult();"  style="border:0px; width:89px; height:29px;"/>
                </span></td>
                <td></td>
            </tr>
          </table>
          </form>
        </DIV>
      </DIV>
    </DIV>
  </div>
</div>
</body>
</html>
