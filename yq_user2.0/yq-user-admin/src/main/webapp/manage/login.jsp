<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:if test="${erroCodeNum==399}"><script language=javascript>alert('验证码不能为空！');</script></c:if>
<c:if test="${erroCodeNum==400}"><script language=javascript>alert('验证码过期,请点击刷新！');</script></c:if>
<c:if test="${erroCodeNum==401}"><script language=javascript>alert('验证码不正确！');</script></c:if>
<c:if test="${erroCodeNum==402}"><script language=javascript>alert('管理员账号或者密码错误！');</script></c:if>
<c:if test="${erroCodeNum==405}"><script language=javascript>alert('功能性账户不提供此处登录！');</script></c:if>
<c:if test="${erroCodeNum==406}"><script language=javascript>alert('短信验证码不能为空！');</script></c:if>
<c:if test="${erroCodeNum==407}"><script language=javascript>alert('短信验证码错误！');</script></c:if>
<%-- <c:if test="${erroCodeNum==3001}"><script language=javascript>alert('管理员不存在！');</script></c:if> --%>
<title>科宇科技</title>
<link href="${ctx}/styles/login.css" rel="stylesheet" type="text/css" />
<script language="javascript"  src="${jshome}/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
	//var ctx = "${ctx}";
	function submitResult(){
		if($("#j_username").val()==""){
			alert("请输入管理员账号！");
			return false;
		}
		if($("#j_password").val()==""){
			alert("密码不能为空！");
			return false;
		}
		if($("#smsCode").val()==""){
			alert("验证码不能为空！");
			return false;
		}
		if($("#validCode").val()==""){
			alert("验证码不能为空！");
			return false;
		}
		document.getElementById("newForm").submit();
	}
	
	function checkdate()  {
		if($("#j_username").val()==""){
			alert("请输入管理员账号！");
			return false;
		}
		    $("#btn").attr("disabled","disabled");
			var data = $("#newForm").serialize();
			$.post("/sms4?op=0", data, function(response) {
				$("#btn").removeAttr("disabled");
				if(response.erroCodeNum == 200){
					alert("手机验证码发送成功");
				}else{
					if (response.erroCodeNum == 3001) {
					      alert("管理员不存在!");
					      return false;
					    }
					if (response.erroCodeNum == 3002) {
					      alert("管理员手机号不存在，请联系超级管理员！");
					      return false;
					    }
					if (response.erroCodeNum == 3003) {
					      alert("验证码已发送，请勿频繁发送！");
					      return false;
					    }
				    if (response.erroCodeNum != 0) {
				      alert("手机验证码发送失败");
				      return false;
				    }
				}
				
			});
			return true;
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
        <form id="newForm"  method="post" name='newForm' action='houtailoginmanager?status=1'>
          <table border="0">
            <tr>
              <td height="25">用户名<br /></td>
              <td><input style="width: 100px;" type="text" name="adminUserName" id="j_username"  onkeydown="keyDownSubmit(event);"/></td>
              <td></td>
            </tr>
            <tr>
              <td height="25">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
              <td><input style="width: 100px;" type="password" name="passWord" id="j_password"  onkeydown="keyDownSubmit(event);"/></td>
              <td></td>
            </tr>
           <!--  <tr>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td></td>
            </tr> -->
            <tr>
              <td height="15">短信验证码</td>
              <td height="15"><input  style="width: 100px;" type="text" name="smsCode" id="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"></input></td>
              <td><input style="width: 45px;" id="btn" type="button" onclick="checkdate()" value="发送" ></input></td>
            </tr>
            <!--  <tr>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td></td>
            </tr> -->
            <tr>
              <td height="15">验证码</td>
              <td height="15"><input style="width: 100px;" name="validCode" id="validCode" size="8"/></font></td>
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
