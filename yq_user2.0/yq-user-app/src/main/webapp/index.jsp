<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.yq.common.utils.I18NUtil" %>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text  name='index.jsp.index.jsp.955964342'/></title>
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
			  if (Form.ygid.value=="") {      alert("<s:text name='index.jsp.index.jsp.1653587007'/>");      return false;    } 
			  if (Form.pa.value=="") {      alert(" <s:text name='index.jsp.index.jsp.-63210920'/>");      return false;    }
			  if (Form.validcode.value=="") {      alert("<s:text  name='index.jsp.index.jsp.2085402601'/>");    return false;    }
			 // if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    }
			  return true;  
			} 
		    function logins(){
		    	if (Form.ygid.value=="") {      alert("<s:text name='index.jsp.index.jsp.1653587007'/>");      return false;    } 
		    	if (Form.pa.value=="") {      alert(" <s:text name='index.jsp.index.jsp.-63210920'/>");      return false;    }
		    	if (Form.validcode.value=="") {      alert("<s:text name='index.jsp.index.jsp.2085402601'/>");      return false;    }
		    	//if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    }
			    var ajaxobj = new Ajax();
			    ajaxobj.url="/login?adminName="+Form.ygid.value+"&adminPassword="+Form.pa.value+"&randString="+Form.validcode.value;
			    ajaxobj.callback=function(){
				    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
				    if(responseMsg.erroCodeNum!=0){
				    	if(responseMsg.erroCodeNum==1){
				    		alert(" <s:text name='index.jsp.index.jsp.-1019997916'/>");
				    	}else if(responseMsg.erroCodeNum==2){
				    		alert(" <s:text name='index.jsp.index.jsp.-1019946270'/>");
				    	}else if(responseMsg.erroCodeNum==3){
				    		alert(" <s:text name='index.jsp.index.jsp.-1545864663'/>");
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
		    //验证用户是否存在，如果存在跳转到重置密码界面
		    function checkReg(){
				if ( Form.ygid.value==""){
					alert (" <s:text name='index.jsp.index.jsp.-2036326914'/>");
					Form.ygid.focus();
					return;
				}
				 if (!CheckIfEnglish(Form.ygid.value ) || Form.ygid.value.length > 10 || Form.ygid.value.length < 4) {
					alert(" <s:text name='index.jsp.index.jsp.-1848386260'/>");
					Form.ygid.focus();
					return ;
				}
			    var uName=document.Form.ygid.value;
			    var ajaxobj = new Ajax();
			    ajaxobj.url="checkreg?gguser="+uName;
			    ajaxobj.callback=function(){
				    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
				    if(responseMsg.erroCodeNum!=0){
				    	location.href="/resetPasswod?userName="+uName;
					    return;
				    }else{
				    	alert(" <s:text name='index.jsp.index.jsp.-1643377023'/>");
				    	return;
				    }
			    }
			    ajaxobj.send();
			}
		    function CheckIfEnglish( str )
		    {  
		    if(/[a-z]/.test(str)&&/[0-9]/.test(str)){
		    return true;
		    }else{
		    return false;
		    }
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
				<!-- <input type="checkbox" /><span>记住账号</span>--> <p class="pab">  <a href="#" onClick="checkReg();"><s:text name='Forget_password'/></a></p><!-- onClick="forgetpasswd();" --> 
				<p><button class="log" onClick="logins();"></button></p>
				<a class="restyle" href="/reg"><s:text  name='reg.jsp.reg.jsp.-1179328136'/></a>
			</form>
		</div>
		<div class="d-tips">
			<p>
				<span><s:text  name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.918090769'/></span>
				<span><s:text  name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.641983904'/></span>
				<span><s:text  name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.959206246'/></span>
				<span><s:text  name='index-haveshowscreen.jsp.index-haveshowscreen.jsp.642992598'/></span>
			</p>
		</div>
		</div>
	</div>
	
<span style="display:none"><script src="http://s11.cnzz.com/z_stat.php?id=1259177711&web_id=1259177711" language="JavaScript"></script></span>
</body>
</html>
