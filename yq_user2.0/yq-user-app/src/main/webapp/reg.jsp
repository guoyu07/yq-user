<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>

<title>新用户注册登记</title>
<style type="text/css">
/* web_bg 全屏背景
--------------------------*/
body,ul,li { margin:0; padding:0; }
#web_bg { position:absolute; width:100%; height:100%; z-index:-1; }
#web_bg li { display:none; }
#web_bg li img { position:fixed; width:100%; height:100%; /*opacity:0.6; filter:alpha(opacity:60);*/ }
/* 对联
--------------------------*/
.couplet_left { position:fixed; top:160px; left:78px; }
.couplet_right { position:fixed; top:160px; right:77px; }
</style>
</head>
<script language="javascript" src="js/ajax.js"></script>
<script language="javascript" src="scripts/myarea.js"></script>

<script language="JavaScript"> 
function CheckIfEnglish( str )
{  
if(/[a-z]/.test(str)&&/[0-9]/.test(str)){
return true;
}else{
return false;
}
}


function checkReg(){
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



 function checkdate()  {  
  if (Form.gguser.value=="") {      alert("用户名不能为空!"); Form.gguser.focus();     return false;    } 
  	        if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("提示：\n\n您的用户名不符合规范，必须4-10个小写英文字母+数字！");
		Form.gguser.focus();
		return false;
	}
  if (Form.ggpa1.value=="") {      alert("一级密码不能为空!");Form.ggpa1.focus();      return false;    } 
  if (!CheckIfEnglish(Form.ggpa1.value)) {      alert("您的登录密码不符合规范，必须小写英文字母+数字！");  Form.ggpa1.focus();      return false;    } 
  if (Form.ggpa1.value.length<6) {      alert("一级密码至少为6位数!"); Form.ggpa1.focus();     return false;    } 
  if (Form.ggpa2.value != Form.ggpa1.value) {      alert("一级两次输入密码不同!"); Form.ggpa2.focus();     return false;    }
  if (Form.ggpa3.value=="") {      alert("二级密码不能为空!"); Form.ggpa3.focus();     return false;    } 
  if (!CheckIfEnglish(Form.ggpa3.value)) {      alert("您的二级密码不符合规范，必须小写英文字母+数字！");  Form.ggpa3.focus();      return false;    } 
  if (Form.ggpa3.value.length<10) {      alert("二级密码至少为10位数!"); Form.ggpa3.focus();     return false;    } 
  if (Form.ggpa3.value.length>20) {      alert("二级密码至多为20位数!"); Form.ggpa3.focus();     return false;    } 
  if (Form.ggname.value=="") {      alert("请输入您的真实姓名!");  Form.ggname.focus();    return false;    } 
  if (Form.ggname.value.length<2) {      alert("真实名字至少为2个汉字!");   Form.ggname.focus();     return false;    } 
  if (Form.ggname.value.length>8) {      alert("真实名字至多为4个汉字!");   Form.ggname.focus();     return false;    }
  if (Form.ggbank.value==0) {      alert("请选择收款银行!");   Form.ggbank.focus();     return false;    }  
  if (Form.ggcard.value=="") {      alert("请填入您的对应银行帐号!");  Form.ggcard.focus();      return false;    }  
  if (Form.gguserid.value=="") {      alert("请填入您的身份证号码!");  Form.gguserid.focus();      return false;    }
  if (Form.gguserid.value.length<18) {      alert("身份证号码至少为18位数!"); Form.gguserid.focus();     return false;    } 
  if (Form.gguserid.value.length>18) {      alert("身份证号码至多为18位数!"); Form.gguserid.focus();     return false;    }    
  if (Form.ggcall.value=="") {      alert("请填入您的手机号码!");  Form.ggcall.focus();      return false;    }
  if (Form.ggcall.value.length<11) {      alert("手机号码至少为11位数!"); Form.ggcall.focus();     return false;    } 
  if (Form.ggcall.value.length>11) {      alert("手机号码至多为11位数!"); Form.ggcall.focus();     return false;    }
  if (Form.ggqq.value=="") {      alert("请输入您的QQ号码!");  Form.ggqq.focus();    return false;    }
  if (Form.provinceName.value==0) {      alert("请选择您的所在的省!");      return false;    }
  if (Form.cityName.value==0) {      alert("请选择您的所在的市!");      return false;    }
  if (Form.areaName.value==0) {      alert("请选择您的所在的地区/县!");      return false;    }
  if (Form.upvip.value=="") {      alert("推荐人不能为空!"); Form.upvip.focus();     return false;    } 
  if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    } 
  reg();
return true;  }  
</script>
<script language="javascript" type="text/javascript">
<!--
function ChangeProvince(subid)
{
	document.getElementById("cityName").length = 0; 
	var subid=subid;
	var i;
	document.getElementById("cityName").options[0] = new Option('==请选择城市==','0');
	for (i=0;i < subCity.length; i++)
	{
		if (subCity[i][1] == subid)
		{ 
			document.getElementById("cityName").options[document.getElementById("cityName").length] = new Option(subCity[i][0], subCity[i][2]);
		} 
	}
	ChangeCity(0)	////清空三级菜单
} 

function ChangeCity(subid)
{
	document.getElementById("areaName").length = 0; 
	var subid=subid;
	var i;
	document.getElementById("areaName").options[0] = new Option('==请选择地区==','0');
	for (i=0;i < subArea.length; i++)
	{
		if (subArea[i][1] == subid)
		{ 
			document.getElementById("areaName").options[document.getElementById("areaName").length] = new Option(subArea[i][0], subArea[i][2]);
		} 
	}
} 

function AmendCity(ProvinceID,CityID,AreaID)
{
	ChangeProvince(ProvinceID);
	for(var i=1;i<document.getElementById("cityName").length;i++)
	{
		if (document.getElementById("cityName").options[i].value == CityID)
			{document.getElementById("cityName").options[i].selected=true;}
	}
	ChangeCity(CityID);
	for(var i=1;i<document.getElementById("areaName").length;i++)
	{
		if (document.getElementById("areaName").options[i].value == AreaID)
			{document.getElementById("areaName").options[i].selected=true;}
	}
}

//-->
</script>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
    }
//-->
</SCRIPT>
<body>
<!--web_bg 全屏背景-->
<ul id="web_bg">
    <li style="display:block;"><img src="image/yellow_bg.jpg" /></li>    
</ul>
<!--对联区-->
<div class="couplet_left"><img src="image/advert1.jpg" alt=""></div>
<div class="couplet_right"><img src="image/advert2.jpg" alt=""></div>

<p align="center" style="margin-top: 0; margin-bottom: 0"><img border="0" src="image/reg_banner.jpg" width="1110" height="150"></p>
<div align="center">
<form method="POST" action="reg?status=1" name="Form" onSubmit="return false">
		<p style="margin-top: 0; margin-bottom: 0"><img border="0" src="image/bg01.jpg"></p>
        <p style="margin-top:-25px; margin-bottom:-48px;"><img src="image/gou.png" style="position:relative; z-index:2;"></p>
		<p style="margin-top: 0; margin-bottom: 0">　</p>
		<table border="0" width="53%" id="table1" height="425" cellpadding="5" bgcolor="#FFFFFF" style="border-radius:5px; -webkit-box-shadow: 0 3px 10px rgba(0,0,0,0.2); -moz-box-shadow: 0 3px 10px rgba(0,0,0,0.2); box-shadow: 0 3px 10px rgba(0,0,0,0.2); padding:30px 0; position:relative; z-index:1;">
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">用户名：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="gguser" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="12"><font size="2" color="#FF0000">**<input type="button" onClick="checkReg()" value="检测" name="B1"></font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">一级密码：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="password" name="ggpa1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="15"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">确认一级密码：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="password" name="ggpa2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="15"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">二级密码：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="password" name="ggpa3" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="20"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">姓名：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="ggname" size="20" maxlength="4" onKeyUp="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"><font size="2" color="#FF0000">** 确保真实才可以得到奖励</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">身份证号码：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="gguserid" size="20" maxlength="18"><font size="2" color="#FF0000">** 海外身份证请联系客服</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">收款银行：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><select size="1" name="ggbank">
				<option selected value="0">==请选择收款银行==</option>
				<option value="工商银行">工商银行</option>
				<option value="农业银行">农业银行</option>
				<option value="建设银行">建设银行</option>
				<option value="中国银行">中国银行</option>
				</select> <font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">银行帐号：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="ggcard" onKeyUp="value=value.replace(/[^\d]/g,'')" size="19" maxlength="20"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">开户行所在地：</font></b></td>
				<td>
				    
    
<select name="provinceName" onChange="ChangeProvince(document.getElementById('provinceName').options[document.getElementById('provinceName').selectedIndex].value);" id="provinceName" style="font-weight: 700">
                      <option selected= "selected" value="">==请选择省份==</option>
 <s:iterator var="data" value="provinceList">
<option value="${data.b}">${data.b}</option>
				</s:iterator>
            </select><select name="cityName" onChange="ChangeCity(document.getElementById('cityName').options[document.getElementById('cityName').selectedIndex].value);" id="cityName" style="font-weight: 700">
            <option selected="selected" value="">==请选择城市==</option>
            </select><select name="areaName" onChange="ChangeArea(document.getElementById('areaName').options[document.getElementById('areaName').selectedIndex].value);" id="areaName" style="font-weight: 700">
            <option selected="selected" value="">==请选择地区==</option>
            </select></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">手机：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="ggcall" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="11"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">QQ：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="ggqq" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="10"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">推荐人：</font></b></td>
			    <td><p style="margin-top: 0; margin-bottom: 0"><input type="text" onKeyUp="value=value.replace(/[\W]/g,'')" name="upvip" size="20" value="${tag}"><font size="2" color="#FF0000">**</font></td>
			</tr>
            <tr>
            	<td colspan="2" style="position:absolute; right:60px; top:35px;"><a href="index.jsp"><img border="0" src="image/login.jpg" width="102" height="32" align="right"></td>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">协议及声明：</font></b></td>
				<td><font size="2" color="#FF0000">
				<span style="font-size: 11pt">
				<select size="1" name="sfz">
				<option selected value="0">==请选择是否同意协议及声明==</option>
				<option value="0">不同意！</option>
				<option value="1">同意协议及声明，自愿参与！</option>
				</select></span></font><font color="#FF0000" style="font-size: 11pt"> </font> 
				<font color="#008000" style="font-size: 11pt" size="2">&nbsp;</font><font color="#FF0000"><a href="javascript:openwindow('sfz.html')" style="text-decoration: none; font-weight: 700; "><font color="#008000" size="3">查看协议及声明</font></a></font></td>
			</tr>
		</table>
		<p style="margin-top: 0; margin-bottom: 0"></p>
		<p style="margin-top: 10px; margin-bottom: 0"><input type="submit" value="提 交 注 册" name="submit" onClick="checkdate();" style="font-size: 12pt; font-weight: bold"></p>
		<p style="margin-top: 0; margin-bottom: 0" align="right"></p>
        </form>
<p style="margin-top: 0; margin-bottom: 0">　</div>