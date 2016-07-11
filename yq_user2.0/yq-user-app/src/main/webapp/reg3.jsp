<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('没有这个推荐人账号，请重新写入！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('该姓名[${ggname}]及身份证号码[${gguserid}]已经被注册过，请您登录后在-[业务查询]下-[添加同名账户]！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('注意：您填写的身份证号码不合法或错误，请检查后再试！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('该姓名[${ggname}]及身份证号码[${gguserid}]禁止注册！');history.go(-1);</script></c:if>
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
	<script src="/scripts/location.js"></script>
	<script src="/scripts/select2.js"></script>
	<script src="/scripts/select2_locale_zh-CN.js"></script>
	<script language="javascript" src="/js/ajax.js"></script>
	    <script language="javascript" src="scripts/myarea.js"></script>
	
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
		 if (Form.ggbank.value==0) {      alert("请选择收款银行!");   Form.ggbank.focus();     return ;    }  
		  if (Form.ggcard.value=="") {      alert("请填入您的对应银行帐号!");  Form.ggcard.focus();      return ;    }  
		 if (Form.provinceName.value==0) {      alert("请选择您的所在的省!");      return ;    }
		  if (Form.cityName.value==0) {      alert("请选择您的所在的市!");      return ;    }
		  if (Form.areaName.value==0) {      alert("请选择您的所在的地区/县!");      return ;    }
		//location.href = '/reg?step=1&ggpa1=' + Form.ggpa1.value + '&ggpa2='
		//		+ Form.ggpa2.value + "ggpa3=" + Form.ggpa3.value;
		Form.submit();
		return;
	}
	
	function reg(){
		if ( Form.gguser.value==""){
			alert ("提示：用户名不能为空!！");
			Form.gguser.focus();
			return false;
		}
		 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
			alert("提示：\n\n您的用户名不符合规范，必须4-10个小写英文字母+数字！");
			Form.gguser.focus();
			return false;
		}
	    var uName=document.Form.gguser.value;
	    var ajaxobj = new Ajax();
	    ajaxobj.url="reg?status=1&gguser="+uName+"&upvip="+Form.upvip.value+"&ggname="+Form.ggname.value+"&gguserid="+Form.gguserid.value+"&ggpa1="+Form.ggpa1.value+"&ggpa3="+Form.ggpa3.value+"&ggbank="+Form.ggbank.value+"&ggcard="+Form.ggcard.value+"&ggcall="+Form.ggcall.value+"&ggqq="+Form.ggqq.value+"&provinceName="+Form.provinceName.value+"&cityName="+Form.cityName.value+"&areaName="+Form.areaName.value;
	    ajaxobj.callback=function(){
		    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
		    if(responseMsg.erroCodeNum!=0){
		    	if(responseMsg.erroCodeNum==1){
		    		alert('此用户名已有人使用！请更换！');
		    	}else if(responseMsg.erroCodeNum==2){
		    		alert('没有这个推荐人账号，请重新写入！');
		    	}else if(responseMsg.erroCodeNum==3){
		    		alert('该姓名['+uName+']及身份证号码['+Form.gguserid.value+']已经被注册过，请您登录后在-[业务查询]下-[添加同名账户]！');
		    	}else if(responseMsg.erroCodeNum==4){
		    		alert('注意：您填写的身份证号码不合法或错误，请检查后再试！！');
		    	}else if(responseMsg.erroCodeNum==5){
		    		alert('该姓名['+uName+']及身份证号码['+Form.gguserid.value+']禁止注册！');
		    	}else if(responseMsg.erroCodeNum==6){
		    		alert('所在地区不全！请重新选择！');
		    	}else if(responseMsg.erroCodeNum==7){
		    		alert('注册失败！数据异常');
		    	}else{
		    		alert('注册失败！');
		    	}
			    return;
		    }else{
		    	alert("恭喜注册成功！请登录进行其它操作！");
		    	location.href="index.jsp?id="+uName;
		    	return;
		    }
	    }
	    ajaxobj.send();
	}
</script>

<script language="javascript" type="text/javascript">
<!--
function ChangeProvince(subid)
{

	document.getElementById("loc_city").length = 0; 
	var subid=subid;
	var i;
	document.getElementById("loc_city").options[0] = new Option('=请选择城市=','0');
	for (i=0;i < subCity.length; i++)
	{
		if (subCity[i][1] == subid)
		{ 
			document.getElementById("loc_city").options[document.getElementById("loc_city").length] = new Option(subCity[i][0], subCity[i][2]);
		} 
	}
	ChangeCity(0)	////清空三级菜单
} 

function ChangeCity(subid)
{
	document.getElementById("loc_town").length = 0; 
	var subid=subid;
	var i;
	document.getElementById("loc_town").options[0] = new Option('=请选择地区=','0');
	for (i=0;i < subArea.length; i++)
	{
		if (subArea[i][1] == subid)
		{ 
			document.getElementById("loc_town").options[document.getElementById("loc_town").length] = new Option(subArea[i][0], subArea[i][2]);
		} 
	}
} 

function AmendCity(ProvinceID,CityID,AreaID)
{
	ChangeProvince(ProvinceID);
	for(var i=1;i<document.getElementById("loc_city").length;i++)
	{
		if (document.getElementById("loc_city").options[i].value == CityID)
			{document.getElementById("loc_city").options[i].selected=true;}
	}
	ChangeCity(CityID);
	for(var i=1;i<document.getElementById("loc_town").length;i++)
	{
		if (document.getElementById("loc_town").options[i].value == AreaID)
			{document.getElementById("loc_town").options[i].selected=true;}
	}
}

//-->
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
						<li><span class="lh"></span></li>
						<li><b class="lh">3</b></li>
						<li><span></span></li>
						<li class="gsd"><b><strong></strong></b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh">创建账户　　</li>
						<li class="lh">设置身份信息</li>
						<li class="lh">设置收款方式</li>
						<li>　　成功</li>
					</ul>
				</div>

				<form  name="Form" method="post" action="reg?step=3&lan=${lan}">
					<input type="hidden" name="gguser" onKeyUp="value=value.replace(/[\W]/g,'')" value="${gguser}">
					<input type="hidden" name="ggpa1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa1}">
					<input type="hidden" name="ggpa2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa2}">
					<input type="hidden" name="ggpa3" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa3}">
					<input type="hidden" name="ggname" size="20" maxlength="4" onKeyUp="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" value="${ggname}">
					<input type="hidden" name="gguserid" size="20" maxlength="18" value="${gguserid}">
					<input type="hidden" name="ggcall" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="11" value="${ggcall}">
					<input type="hidden" name="ggqq" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="10" value="${ggqq}">
					<input type="hidden" onKeyUp="value=value.replace(/[\W]/g,'')" name="upvip" size="20" value="${upvip}">
					<div class="fbox founbox3">
						<p><label>收款银行：</label><select id="loc_bank" style="width:350px;" name="ggbank">
										<option value="工商银行">工商银行</option>
										<option value="农业银行">农业银行</option>
										<option value="建设银行">建设银行</option>
										<option value="中国银行">中国银行</option>
						</select>
					 	<p><label>银行帐号：</label><input type="text" name="ggcard" onKeyUp="value=value.replace(/[^\d]/g,'')" size="19" maxlength="20"></p>
						<p class="bwky">
							<label>开户行所在地：</label>
							<select style="width:220px;" id="loc_province" name="provinceName" onChange="ChangeProvince(document.getElementById('loc_province').options[document.getElementById('loc_province').selectedIndex].value);">
							   <s:iterator var="data" value="provinceList">
									<option value="${data.b}">${data.b}</option>
								</s:iterator>
							</select>
							<select style="width:220px;" id="loc_city" name="cityName" onChange="ChangeCity(document.getElementById('loc_city').options[document.getElementById('loc_city').selectedIndex].value);">
							</select>
							<select style="width:220px;" id="loc_town" name="areaName" onChange="ChangeArea(document.getElementById('loc_town').options[document.getElementById('loc_town').selectedIndex].value);">
							</select>
						</p>
						<p class="z-tc"><a class="newbut" id="xyb" href="#" onClick="checkdate1();">下一步</a></p>
					</div>
					
				 </form>
		</div>
	</div>
</body>
</html>