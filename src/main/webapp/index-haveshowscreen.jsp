<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心--积分游戏、消费增值平台、员工内部薪酬结算、办公、游戏理财及娱乐休闲平台！</title>
	<link rel="stylesheet" href="/css/common.css" /> 
		<style type="text/css">

.time-item{
	position: absolute; left:0; right:0; top:0; bottom: 0;
	text-align: center;
	padding-top: 41%;
	background:#FFF url(../images/bgss.png) no-repeat 50% 0 ;
	background-size: 60% auto;
}

.time-item span{
	position: absolute; 
	top:0;
	display: inline-block;
	padding: 5px 13px;
	margin:15px;
	border-radius: 3px; 
	background: #eee;
	cursor: pointer;
	font-size: 13px; 
	right:0;
}

.time-item h1 {
	font-family:"微软雅黑";
	font-size:40px;
	margin:20px 0;
	border-bottom:solid 1px #ccc;
	padding-bottom:20px;
	letter-spacing:2px;
}
.time-item strong {
	background:#ee1c25;
	color:#FFF;
	line-height:49px;
	font-size:100px;
	font-family:Arial;
	padding:0 10px;
	margin-right:10px;
	border-radius:5px;
	box-shadow:1px 1px 3px rgba(0,0,0,0.2);
}

.item-title .unit {
	background:none;
	line-height:49px;
	font-size:24px;
	padding:0 10px;
	float:left;
}

</style>
	
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
		 <%@ include file="/top.jsp"%>
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
	<div class="time-item">
		<span>关闭</span>
		<!-- <strong>倒记时</strong> -->
		<strong id="hour_show">0时</strong>
		<strong id="minute_show">0分</strong>
		<strong id="second_show">0秒</strong>
	</div>
</body>
</html>
<script type="text/javascript">
		var d1=new Date();
		var d2=new Date("2016/01/18 19:30:00");
		var d3=(d2-d1)/1000;
		var intDiff = parseInt(d3);//倒计时总秒数量

		function timer(intDiff){
			window.setInterval(function(){
			var day=0,
				hour=0,
				minute=0,
				second=0;//时间默认值		
			if(intDiff > 0){
				day = Math.floor(intDiff / (60 * 60 * 24));
				hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
				minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
				second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
			}
			if (minute <= 9) minute = '0' + minute;
			if (second <= 9) second = '0' + second;
			$('#hour_show').html('<s id="h"></s>'+hour+'时');
			$('#minute_show').html('<s></s>'+minute+'分');
			$('#second_show').html('<s></s>'+second+'秒');
			intDiff--;
			}, 1000);
		} 

		$(function(){
			timer(intDiff);
		});	

		$(".time-item span").click(function(){
				$(".time-item").remove();
		})

</script>
