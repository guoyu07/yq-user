<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
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
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp"%>

				<%@ include file="/view/grxx.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1 new5-box">
					<div class="content-title">
						<span>继承人资料</span>
						<p class="r-link">
							<a href="userga">个人资料</a>|
							<a href="#" class="hover">继承人资料</a>
						</p>
					</div>
					<div class="content-form">				 
						<p style="color: red; padding-bottom: 40px;">继承人一经填写将不能自行修改，请谨慎填写！</p>
						<form class="form" METHOD="post" action="" name="Form" id="Form" onSubmit="return false">
							<p><label>继承人姓名：</label><input type="text" maxlength=32 name="jcname" value="${gcuser.jcname}" size="16" <c:if test="${not empty gcuser.jcname}">readonly</c:if> ></p>
							<p><label>继承人身份证号码：</label><input type="text" maxlength=19 name="jcuserid" value="${gcuser.jcuserid}" size="22" <c:if test="${not empty gcuser.jcuserid}">readonly</c:if> ></p>
							<p><label></label><button class="but1" onClick="checkdate();">确 定 增 加</button></p>
					</form>
					</div>
					<div class="new5-right">
						<h3>公司相关资料</h3>
                        <p><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc">《积分游戏平台用户名转让申请书》</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>