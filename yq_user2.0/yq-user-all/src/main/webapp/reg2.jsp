<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
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
		  if (Form.ggname.value=="") {      alert("请输入您的真实姓名!");  Form.ggname.focus();    return false;    } 
		  <c:if test="${lan==0}">
		  if (Form.ggname.value.length<2) {      alert("真实名字至少为2个汉字!");   Form.ggname.focus();     return false;    } 
		  if (Form.ggname.value.length>8) {      alert("真实名字至多为4个汉字!");   Form.ggname.focus();     return false;    }
		  </c:if>
		  if (Form.gguserid.value=="") {      alert("请填入您的身份证号码!");  Form.gguserid.focus();      return false;    }
		  <c:if test="${lan==0}">
		  if (Form.gguserid.value.length<18) {      alert("身份证号码至少为18位数!"); Form.gguserid.focus();     return false;    } 
		  if (Form.gguserid.value.length>18) {      alert("身份证号码至多为18位数!"); Form.gguserid.focus();     return false;    }    
		  </c:if>
		  if (Form.ggcall.value=="") {      alert("请填入您的手机号码!");  Form.ggcall.focus();      return false;    }
		  if (Form.ggcall.value.length<11) {      alert("手机号码至少为11位数!"); Form.ggcall.focus();     return false;    } 
		  if (Form.ggcall.value.length>11) {      alert("手机号码至多为11位数!"); Form.ggcall.focus();     return false;    }
		  if (Form.ggqq.value=="") {      alert("请输入您的QQ号码!");  Form.ggqq.focus();    return false;    }
		  if (Form.upvip.value=="") {      alert("推荐人不能为空!"); Form.upvip.focus();     return false;    } 
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
						<li><span class="lh"></span></li>
						<li><b class="lh">2</b></li>
						<li><span></span></li>
						<li><b>3</b></li>
						<li><span></span></li>
						<li class="gsd"><b><strong></strong></b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh">创建账户　　</li>
						<li class="lh">设置身份信息</li>
						<li>设置收款方式</li>
						<li>　　成功</li>
					</ul>
				</div>

				<form name="Form" method="post" action="reg?step=2&lan=${lan}">
					<div class="fbox founbox2">
					    <input type="hidden" name="gguser" onKeyUp="value=value.replace(/[\W]/g,'')" value="${gguser}">
					    <input type="hidden" name="ggpa1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa1}">
					    <input type="hidden" name="ggpa2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa2}">
					    <input type="hidden" name="ggpa3" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa3}">
						<p><label>姓名：</label><input type="text" name="ggname" size="20" maxlength="20" <c:if test="${lan==0}">onKeyUp="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"</c:if>><span>确保真实才可以得到奖励</span></p>
						<p><label>身份证号码：</label><input type="text" name="gguserid" size="20" maxlength="18"><c:if test="${lan==0}"><span>海外身份证请联系客服</span></c:if><c:if test="${lan==1}"><span>海外玩家注册专用，国内玩家勿用 </span></c:if></p>
						<p><label>手机号码：</label><input type="text" name="ggcall" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="11"></p>
						<p><label>QQ：</label><input type="text" name="ggqq" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="10"></p>
						<p><label>推荐人：</label><input type="text"  name="upvip" size="20" value="${tag}"></p>
						<p class="z-tc"><a class="newbut" href="#" onClick="checkdate1();">下一步</a></p>
					</div>
				 </form>
		</div>
	</div>
</body>
</html>