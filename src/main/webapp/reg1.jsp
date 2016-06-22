<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/select.css" />
	<script src="/scripts/jquery.js"></script>
	<script src="/scripts/common.js"></script>
	<script src="/scripts/area.js"></script>
	<script src="/scripts/select2.js"></script>
	<script src="/scripts/select2_locale_zh-CN.js"></script>
	<script language="javascript" src="/js/ajax.js"></script>
<script language="JavaScript">
	function CheckIfEnglish(str) {
		if (/[a-z]/.test(str) && /[0-9]/.test(str)) {
			return true;
		} else {
			return false;
		}
	}
	
	function checkReg(){
		if ( Form.gguser.value==""){
			alert ("提示：用户名不能为空!！");
			Form.gguser.focus();
			return;
		}
		 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
			alert("提示：\n\n您的用户名不符合规范，必须4-10个小写英文字母+数字！");
			Form.gguser.focus();
			return ;
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
	
	<!--
	function openwindow(url) {
	   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
	    }
	//-->
	

	function checkdate1() {
		if (Form.gguser.value == "") {
			alert("用户名不能为空!");
			Form.gguser.focus();
			return;
		}
		if (!CheckIfEnglish(Form.gguser.value) || Form.gguser.value.length > 10
				|| Form.gguser.value.length < 4) {
			alert("提示：\n\n您的用户名不符合规范，必须4-10个小写英文字母+数字！");
			Form.gguser.focus();
			return;
		}
		if (Form.ggpa1.value == "") {
			alert("一级密码不能为空!");
			Form.ggpa1.focus();
			return;
		}
		if (!CheckIfEnglish(Form.ggpa1.value)) {
			alert("您的登录密码不符合规范，必须小写英文字母+数字！");
			Form.ggpa1.focus();
			return;
		}
		if (Form.ggpa1.value.length < 6) {
			alert("一级密码至少为6位数!");
			Form.ggpa1.focus();
			return;
		}
		if (Form.ggpa2.value != Form.ggpa1.value) {
			alert("一级两次输入密码不同!");
			Form.ggpa2.focus();
			return;
		}
		if (Form.ggpa3.value == "") {
			alert("二级密码不能为空!");
			Form.ggpa3.focus();
			return;
		}
		if (!CheckIfEnglish(Form.ggpa3.value)) {
			alert("您的二级密码不符合规范，必须小写英文字母+数字！");
			Form.ggpa3.focus();
			return;
		}
		if (Form.ggpa3.value.length < 10) {
			alert("二级密码至少为10位数!");
			Form.ggpa3.focus();
			return;
		}
		if (Form.ggpa3.value.length > 20) {
			alert("二级密码至多为20位数!");
			Form.ggpa3.focus();
			return;
		}
		if (!Form.sfz.checked) {
			alert("请您认真查看协议及声明，只有同意后才可以继续");
			return;
		}
		//location.href = '/reg?step=1&ggpa1=' + Form.ggpa1.value + '&ggpa2='
		//		+ Form.ggpa2.value + "ggpa3=" + Form.ggpa3.value;
		Form.submit();
		return;
	}
</script>
</head>
<body>
	<div class="mainbox denglu">
     <%@ include file="/top.jsp"%>
		<div class="d-founduser">
				<div class="navt2">
					<ul>
						<li><b class="lh">1</b></li>
						<li><span></span></li>
						<li><b>2</b></li>
						<li><span></span></li>
						<li><b>3</b></li>
						<li><span></span></li>
						<li><b>4</b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh">创建账户　　</li>
						<li>设置身份信息</li>
						<li>设置收款方式</li>
						<li>　　成功</li>
					</ul>
				</div>

				<form name="Form" method="post" action="reg?step=1&lan=${lan}">
					<div class="fbox founbox1">
						<p><label>用户名：</label><input type="text" name="gguser" onKeyUp="value=value.replace(/[\W]/g,'')"><a href="#" onClick="checkReg();"><span class="jc">检 测</span></a></p>
						<p><label>一级密码：</label><input type="password" name="ggpa1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" ></p>
						<p><label>确认一级密码：</label><input type="password" name="ggpa2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" ></p>
						<p><label>二级密码：</label><input type="password" name="ggpa3" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="20"></p>
						<p class="tyxy"><input type="checkbox" checked="checked" name="sfz">同意<a href="javascript:openwindow('sfz.html')">《积分游戏平台用户使用协议》</a></p>
						<p class="z-tc"><a class="newbut" href="#" onClick="checkdate1();">下一步</a></p>
					</div>
				 </form>
		</div>
	</div>
</body>
</html>