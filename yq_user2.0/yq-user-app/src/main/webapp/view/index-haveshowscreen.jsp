<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.955964342'/>！</title>
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
	font-family:"<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.766224877'/>";
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
			  if (Form.ygid.value=="") {      alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.1653587007'/>!");      return false;    } 
			  if (Form.pa.value=="") {      alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.-63210920'/>!");      return false;    }
			  if (Form.validcode.value=="") {      alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.2085402601'/>!");      return false;    }
			 // if (Form.sfz.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.741412114'/>");      return false;    }
			  return true;  
			}  
		    function logins(){
		    	if (Form.ygid.value=="") {      alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.1653587007'/>!");      return false;    } 
		    	if (Form.pa.value=="") {      alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.-63210920'/>!");      return false;    }
		    	if (Form.validcode.value=="") {      alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.2085402601'/>!");      return false;    }
		    	//if (Form.sfz.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.741412114'/>");      return false;    }
			    var ajaxobj = new Ajax();
			    ajaxobj.url="/login?adminName="+Form.ygid.value+"&adminPassword="+Form.pa.value+"&randString="+Form.validcode.value;
			    ajaxobj.callback=function(){
				    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
				    if(responseMsg.erroCodeNum!=0){
				    	if(responseMsg.erroCodeNum==1){
				    		alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.-1019997916'/>");
				    	}else if(responseMsg.erroCodeNum==2){
				    		alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.-1019946270'/>");
				    	}else if(responseMsg.erroCodeNum==3){
				    		alert("<s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.-1545864663'/>");
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
				<p><input type="text" name="validcode" class="key" /><span class="nbkey"><img src="/VerifyCode.jsp" title="<s:text name='Clickrefresh'/>" onclick="this.src='/VerifyCode.jsp?'+Math.random()"></span></p>
				<!-- <p class="pab"><input type="checkbox" /><span>记住<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1141649'/></span>   <a href="#">忘记密码</a></p> -->
				<p><button class="log" onClick="logins();"></button></p>
				<a class="restyle" href="/reg"><s:text name='register'/><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1141649'/></a>
			</form>
		</div>
		<div class="d-tips">
			<p>
				<span><s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.918090769'/></span>
				<span><s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.641983904'/></span>
				<span><s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.959206246'/></span>
				<span><s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.642992598'/></span>
			</p>
		</div>
		</div>
	</div>
	<div class="time-item">
		<span><s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.684762'/></span>
		<!-- <strong><s:text name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.20833240'/></strong> -->
		<strong id="hour_show">0<s:test name="hour"></s:test></strong>
		<strong id="minute_show">0<s:test name="Minute"></s:test></strong>
		<strong id="second_show">0<s:test name="second"></s:test></strong>
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
				second=0;//<s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.847550'/>默认值		
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
