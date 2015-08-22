<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司--积分游戏、消费增值平台、员工内部薪酬结算、办公、游戏理财及娱乐休闲平台！</title>
	<link rel="stylesheet" href="/css/common.css" /> 
</head>
<script src="/scripts/jquery.js"></script>
<script src="/scripts/common.js"></script>
<script language="javascript" src="/js/ajax.js"></script>
<SCRIPT type=text/javascript>
		    function checkdate(){
			  if (Form.ygid.value=="") {      alert("请写入您的用户名!");      return false;    } 
			  if (Form.pa.value=="") {      alert("请写入登录密码!");      return false;    }
			  if (Form.validcode.value=="") {      alert("请写入验证码!");      return false;    }
			 // if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    }
			  return true;  
			}  
		    function logins(){
		    	if (Form.ygid.value=="") {      alert("请写入您的用户名!");      return false;    } 
		    	if (Form.pa.value=="") {      alert("请写入登录密码!");      return false;    }
		    	if (Form.validcode.value=="") {      alert("请写入验证码!");      return false;    }
		    	//if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    }
			    var ajaxobj = new Ajax();
			    ajaxobj.url="/login?adminName="+Form.ygid.value+"&adminPassword="+Form.pa.value+"&randString="+Form.validcode.value;
			    ajaxobj.callback=function(){
				    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
				    if(responseMsg.erroCodeNum!=0){
				    	if(responseMsg.erroCodeNum==1){
				    		alert("验证码过期");
				    	}else if(responseMsg.erroCodeNum==2){
				    		alert("验证码错误");
				    	}else if(responseMsg.erroCodeNum==3){
				    		alert("用户名或密码错误");
				    	}else if(responseMsg.erroCodeNum==4){
				    		location.href='/updateuser';
				    	}
					    return;
				    }else{
				    	location.href='/manager';
				    }
			    }
			    ajaxobj.send();
		    }
    	</SCRIPT>
<body>
	<div class="denglu">
	    <div>
		<div class="d-header">
			<p class="dh-logo"><img src="/images/dlogo.jpg" title="中国一川（澳门）国际有限公司" /></p>
			<p class="dh-title">用户管理中心</p>
			<p class="dh-link"><a href="#">[<span>公司官网</span>]</a></p>
			<p class="dh-links"><a href="">中文</a>|<a href="">English</a></p>
		</div>
		<div class="d-nav">
			<ul>
				<li><a href="http://p.zgyce.com">棋牌娱乐</a></li>
				<li><a href="http://dy.zgyce.com">一川影院</a></li>
				<li><a href="http://yxgame.zgyce.com">休闲游戏</a></li>
				<li><a href="http://gw.zgyce.com">一川导购</a></li>
				<li><a href="http://hy.zgyce.com">起点货源网</a></li>
				<li><a href="http://yb.zgyce.com">一币天下商城</a></li>
			</ul>
		</div>
		<p class="clickTop"><span class="hover"></span></p>
		<div class="d-login">
			<form method="POST" name="Form" onSubmit="return false">
				<p><input type="text" name="ygid" value="<% if(request.getParameter("id")!=null){%><%=request.getParameter("id")%><%}%>" class="name" /></p>
				<p><input type="password" name="pa" class="pw" /></p>
				<p><input type="text" name="validcode" class="key" /><span class="nbkey"><img src="/VerifyCode.jsp" title="点击刷新" onclick="this.src='/VerifyCode.jsp?'+Math.random()"></span></p>
				<!-- <p class="pab"><input type="checkbox" /><span>记住账号</span>   <a href="#">忘记密码</a></p> -->
				<p><button class="log" onClick="logins();"></button></p>
				<a class="restyle" href="/reg">注册账号</a>
			</form>
		</div>
		<div class="d-tips">
			<p>
				<span>用心经营</span>
				<span>全力打造</span>
				<span>稳步收益</span>
				<span>再创新高</span>
			</p>
		</div>
		</div>
	</div>
</body>
</html>