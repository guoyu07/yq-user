<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<SCRIPT type=text/javascript src="/main/jquery-1.2.6.min.js"></SCRIPT>
<SCRIPT type=text/javascript>
function checkdate()  {  
	  if (Form.password3.value=="") {   alert("二级密码不能为空");  Form.password3.focus();   return false;    }
	  var data = $("#Form").serialize();
	  $.post("login2j?status=1", data, function(response) {
		    var responseMsg = response;
			if(responseMsg.erroCodeNum==0){//注册成功
				//执行跳转
				location.replace('gmjh');
				return;
			}else{
				alert('二级密码输入错误！请重新输入');
				Form.password3.focus();
				return;
			}
		});
	  return true;
	}
</SCRIPT>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>
				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1" style="height:190px;">
					<div class="content-title">
						<span>一币购买金币卡</span>
					</div>
					<div class="content-form">				 
						<p class="jjgz">
						</p>
					</div>
				</div>
				<div class="content-box2 mt10"  style="height:310px;">
					<form class="form form4" method="POST" action="" name="Form" id="Form" onSubmit="return false">
							<p><label>用户名：</label><input type="text" value="${userName}" readonly></p>
							<p><label>二级密码：</label><input name="password3" size=12 type="password"></p>
							<p><label></label><button class="but1" type="submit" value=" 登陆管理 " name="login" onClick="checkdate();">同 意 规 则</button></p>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>