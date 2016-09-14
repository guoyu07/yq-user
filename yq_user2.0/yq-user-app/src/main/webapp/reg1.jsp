<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
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
			alert ("<s:text name='reg1.jsp.reg1.jsp.-2036326914'/>!！");
			Form.gguser.focus();
			return;
		}
		 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
			 alert ("<s:text name='reg1.jsp.reg1.jsp.-1848386260'/>!！");
			Form.gguser.focus();
			return ;
		}
	    var uName=document.Form.gguser.value;
	    var ajaxobj = new Ajax();
	    ajaxobj.url="checkreg?gguser="+uName;
	    ajaxobj.callback=function(){
		    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
		    if(responseMsg.erroCodeNum!=0){
		    	alert("<s:text name='reg.jsp.reg.jsp.842685271'/>");
			    return;
		    }else{
		    	alert("<s:text name='reg.jsp.reg.jsp.-259258343'/>："+uName);
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
			alert("<s:text name='reg.jsp.reg.jsp.-609490706'/>!");
			Form.gguser.focus();
			return;
		}
		if (!CheckIfEnglish(Form.gguser.value) || Form.gguser.value.length > 10
				|| Form.gguser.value.length < 4) {
			alert ("<s:text name='reg1.jsp.reg1.jsp.-1848386260'/>!！");
			Form.gguser.focus();
			return;
		}
		if (Form.ggpa1.value == "") {
			alert("<s:text name='reg.jsp.reg.jsp.-899532046'/>!");
			Form.ggpa1.focus();
			return;
		}
		if (!CheckIfEnglish(Form.ggpa1.value)) {
			alert("<s:text name='reg1.jsp.reg1.jsp.-768271497'/>");
			Form.ggpa1.focus();
			return;
		}
		if (Form.ggpa1.value.length < 6) {
			alert("<s:text name='reg.jsp.reg.jsp.1079298527'/>!");
			Form.ggpa1.focus();
			return;
		}
		if (Form.ggpa2.value != Form.ggpa1.value) {
			alert("<s:text name='reg.jsp.reg.jsp.-1310540176'/>!");
			Form.ggpa2.focus();
			return;
		}
		if (Form.ggpa3.value == "") {
			alert("<s:text name='reg.jsp.reg.jsp.-1719221018'/>!");
			Form.ggpa3.focus();
			return;
		}
		if (!CheckIfEnglish(Form.ggpa3.value)) {
			alert("<s:text name='reg1.jsp.reg1.jsp.-1932694410'/>");
			Form.ggpa3.focus();
			return;
		}
		if (Form.ggpa3.value.length < 10) {
			alert("<s:text name='reg.jsp.reg.jsp.908634376'/>!");
			Form.ggpa3.focus();
			return;
		}
		if (Form.ggpa3.value.length > 20) {
			alert("<s:text name='reg.jsp.reg.jsp.653975038'/>!");
			Form.ggpa3.focus();
			return;
		}
		if (!Form.sfz.checked) {
			alert("<s:text name='reg.jsp.reg.jsp.741412114'/>");
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
						<li><span class="spanl"></span></li>
						<li><b>2</b></li>
						<li><span class="spanl"></span></li>
						<li><b>3</b></li>
						<li><span class="spanl"></span></li>
						<li><b>4</b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.650688080'/></li>
						<li><s:text name='reg1.jsp.reg1.jsp.-1147457200'/></li>
						<li><s:text name='reg1.jsp.reg1.jsp.-1456505170'/></li>
						<li>　　<s:text name='reg1.jsp.reg1.jsp.799375'/></li>
					</ul>
				</div>

				<form name="Form" method="post" action="reg?step=1&lan=${lan}">
					<div class="fbox founbox1">
						<p><label><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><input type="text" name="gguser" onKeyUp="value=value.replace(/[\W]/g,'')"><a href="#" onClick="checkReg();"><span class="jc"><s:text name='Check'/></span></a></p>
						<p><label><s:text name='reg.jsp.reg.jsp.626784226'/>：</label><input type="password" name="ggpa1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" ></p>
						<p><label><s:text name='reg1.jsp.reg1.jsp.1449504216'/>：</label><input type="password" name="ggpa2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" ></p>
						<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input type="password" name="ggpa3" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="20"></p>
						<p class="tyxy"><input type="checkbox" checked="checked" name="sfz"><s:text name='reg1.jsp.reg1.jsp.-2094390242'/></p>
						<p class="z-tc"><a class="newbut" href="#" onClick="checkdate1();"><s:text name='reg1.jsp.reg1.jsp.19846320'/></a></p>
					</div>
				 </form>
		</div>
	</div>
</body>
</html>
