<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>

<title><s:text name='reg.jsp.reg.jsp.-1179328136'/></title>
<style type="text/css">
/* web_bg <s:text name='reg.jsp.reg.jsp.644602186'/>
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
		alert ("<s:text name='index.jsp.index.jsp.-2036326914'/>!");
		Form.gguser.focus();
		return false;
	}
	 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("<s:text name='reg.jsp.reg.jsp.-1848386260'/>");
		Form.gguser.focus();
		return false;
	}
    var uName=document.Form.gguser.value;
    var ajaxobj = new Ajax();
    ajaxobj.url="checkreg?gguser="+uName;
    ajaxobj.callback=function(){
	    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
	    if(responseMsg.erroCodeNum!=0){
	    	alert("<s:text name='reg.jsp.reg.jsp.842685271'/>！");
		    return;
	    }else{
	    	alert("<s:text name='reg.jsp.reg.jsp.-259258343'/>："+uName);
	    	return;
	    }
    }
    ajaxobj.send();
}


function reg(){
	if ( Form.gguser.value==""){
		alert("<s:text name='reg.jsp.reg.jsp.-2036326914'/>");
		Form.gguser.focus();
		return false;
	}
	 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("<s:text name='reg.jsp.reg.jsp.-1848386260'/>！");
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
	    		alert('<s:text name='reg.jsp.reg.jsp.-931208490'/>！');
	    	}else if(responseMsg.erroCodeNum==2){
	    		alert('<s:text name='reg.jsp.reg.jsp.-109709084'/>！');
	    	}else if(responseMsg.erroCodeNum==3){
	    		alert('<s:text name='reg.jsp.reg.jsp.498992772'/>]！');
	    	}else if(responseMsg.erroCodeNum==4){
	    		alert('<s:text name='reg.jsp.reg.jsp.-834832388'/>！！');
	    	}else if(responseMsg.erroCodeNum==5){
	    		alert('<s:text name='reg.jsp.reg.jsp.451801346'/>！');
	    	}else if(responseMsg.erroCodeNum==6){
	    		alert('<s:text name='reg.jsp.reg.jsp.-889663866'/>！');
	    	}else if(responseMsg.erroCodeNum==7){
	    		alert('<s:text name='reg.jsp.reg.jsp.-1989997891'/>');
	    	}else{
	    		alert('<s:text name='reg.jsp.reg.jsp.851378872'/>！');
	    	}
		    return;
	    }else{
	    	alert("<s:text name='reg.jsp.reg.jsp.-517693217'/>！");
	    	location.href="index.jsp?id="+uName;
	    	return;
	    }
    }
    ajaxobj.send();
}



 function checkdate()  {  
  if (Form.gguser.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-609490706'/>!"); Form.gguser.focus();     return false;    } 
  	        if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("<s:text name='reg.jsp.reg.jsp.-1848386260'/>！");
		Form.gguser.focus();
		return false;
	}
  if (Form.ggpa1.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-899532046'/>!");Form.ggpa1.focus();      return false;    } 
  if (!CheckIfEnglish(Form.ggpa1.value)) {      alert("<s:text name='reg.jsp.reg.jsp.-768271497'/>！");  Form.ggpa1.focus();      return false;    } 
  if (Form.ggpa1.value.length<6) {      alert("<s:text name='reg.jsp.reg.jsp.1079298527'/>!"); Form.ggpa1.focus();     return false;    } 
  if (Form.ggpa2.value != Form.ggpa1.value) {      alert("<s:text name='reg.jsp.reg.jsp.-1310540176'/>!"); Form.ggpa2.focus();     return false;    }
  if (Form.ggpa3.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-1719221018'/>!"); Form.ggpa3.focus();     return false;    } 
  if (!CheckIfEnglish(Form.ggpa3.value)) {      alert("<s:text name='reg.jsp.reg.jsp.-1932694410'/>！");  Form.ggpa3.focus();      return false;    } 
  if (Form.ggpa3.value.length<10) {      alert("<s:text name='reg.jsp.reg.jsp.908634376'/>!"); Form.ggpa3.focus();     return false;    } 
  if (Form.ggpa3.value.length>20) {      alert("<s:text name='reg.jsp.reg.jsp.653975038'/>!"); Form.ggpa3.focus();     return false;    } 
  if (Form.ggname.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.164342206'/>!");  Form.ggname.focus();    return false;    } 
  if (Form.ggname.value.length<2) {      alert("<s:text name='reg.jsp.reg.jsp.815297593'/>!");   Form.ggname.focus();     return false;    } 
  if (Form.ggname.value.length>8) {      alert("<s:text name='reg.jsp.reg.jsp.560668046'/>!");   Form.ggname.focus();     return false;    }
  if (Form.ggbank.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1996388245'/>!");   Form.ggbank.focus();     return false;    }  
  if (Form.ggcard.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-998560219'/>!");  Form.ggcard.focus();      return false;    }  
  if (Form.gguserid.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-1745964948'/>!");  Form.gguserid.focus();      return false;    }
  if (Form.gguserid.value.length<18) {      alert("<s:text name='reg.jsp.reg.jsp.1683299853'/>!"); Form.gguserid.focus();     return false;    } 
  if (Form.gguserid.value.length>18) {      alert("<s:text name='reg.jsp.reg.jsp.1428610724'/>!"); Form.gguserid.focus();     return false;    }    
  if (Form.ggcall.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>!");  Form.ggcall.focus();      return false;    }
  if (Form.ggcall.value.length<11) {      alert("<s:text name='reg.jsp.reg.jsp.-415194682'/>!"); Form.ggcall.focus();     return false;    } 
  if (Form.ggcall.value.length>11) {      alert("<s:text name='reg.jsp.reg.jsp.-669883811'/>!"); Form.ggcall.focus();     return false;    }
  if (Form.ggqq.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-764220017'/>!");  Form.ggqq.focus();    return false;    }
  if (Form.provinceName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1924286904'/>!");      return false;    }
  if (Form.cityName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1924280505'/>!");      return false;    }
  if (Form.areaName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1280507619'/>!");      return false;    }
  if (Form.upvip.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.1311603234'/>!"); Form.upvip.focus();     return false;    } 
  if (Form.sfz.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.741412114'/>");      return false;    } 
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
	document.getElementById("cityName").options[0] = new Option('==<s:text name='reg.jsp.reg.jsp.-145519509'/>==','0');
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
	document.getElementById("areaName").options[0] = new Option('==<s:text name='reg.jsp.reg.jsp.-145527167'/>==','0');
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
<!--web_bg <s:text name='reg.jsp.reg.jsp.644602186'/>-->
<ul id="web_bg">
    <li style="display:block;"><img src="image/yellow_bg.jpg" /></li>    
</ul>
<!--<s:text name='reg.jsp.reg.jsp.23666463'/>-->
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
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.29623262'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="gguser" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="12"><font size="2" color="#FF0000">**<input type="button" onClick="checkReg()" value="检测" name="B1"></font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.626784226'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="password" name="ggpa1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="15"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">确认<s:text name='reg.jsp.reg.jsp.626784226'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="password" name="ggpa2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="15"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.630954966'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="password" name="ggpa3" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="20"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.734362'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="ggname" size="20" maxlength="4" onKeyUp="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"><font size="2" color="#FF0000">** 确保真实才可以得到奖励</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.7501689'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="gguserid" size="20" maxlength="18"><font size="2" color="#FF0000">** 海外身份证请联系客服</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.799485150'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><select size="1" name="ggbank">
				<option selected value="0">==<s:text name='reg.jsp.reg.jsp.1996388245'/>==</option>
				<option value="<s:text name='reg.jsp.reg.jsp.-453899062'/>"><s:text name='reg.jsp.reg.jsp.-453899062'/></option>
				<option value="<s:text name='reg.jsp.reg.jsp.1781968004'/>"><s:text name='reg.jsp.reg.jsp.1781968004'/></option>
				<option value="<s:text name='reg.jsp.reg.jsp.691148048'/>"><s:text name='reg.jsp.reg.jsp.691148048'/></option>
				<option value="<s:text name='reg.jsp.reg.jsp.1019445992'/>"><s:text name='reg.jsp.reg.jsp.1019445992'/></option>
				</select> <font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.1170349181'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="ggcard" onKeyUp="value=value.replace(/[^\d]/g,'')" size="19" maxlength="20"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.-1009112269'/>：</font></b></td>
				<td>
				    
    
<select name="provinceName" onChange="ChangeProvince(document.getElementById('provinceName').options[document.getElementById('provinceName').selectedIndex].value);" id="provinceName" style="font-weight: 700">
                      <option selected= "selected" value="">==<s:text name='reg.jsp.reg.jsp.-145275757'/>==</option>
 <s:iterator var="data" value="provinceList">
<option value="${data.b}">${data.b}</option>
				</s:iterator>
            </select><select name="cityName" onChange="ChangeCity(document.getElementById('cityName').options[document.getElementById('cityName').selectedIndex].value);" id="cityName" style="font-weight: 700">
            <option selected="selected" value="">==<s:text name='reg.jsp.reg.jsp.-145519509'/>==</option>
            </select><select name="areaName" onChange="ChangeArea(document.getElementById('areaName').options[document.getElementById('areaName').selectedIndex].value);" id="areaName" style="font-weight: 700">
            <option selected="selected" value="">==<s:text name='reg.jsp.reg.jsp.-145527167'/>==</option>
            </select></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.806479'/>：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="ggcall" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="11"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">QQ：</font></b></td>
				<td><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="ggqq" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="10"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.25579282'/>：</font></b></td>
			    <td><p style="margin-top: 0; margin-bottom: 0"><input type="text" onKeyUp="value=value.replace(/[\W]/g,'')" name="upvip" size="20" value="${tag}"><font size="2" color="#FF0000">**</font></td>
			</tr>
            <tr>
            	<td colspan="2" style="position:absolute; right:60px; top:35px;"><a href="index.jsp"><img border="0" src="image/login.jpg" width="102" height="32" align="right"></td>
			<tr>
				<td width="193" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.-692292151'/>：</font></b></td>
				<td><font size="2" color="#FF0000">
				<span style="font-size: 11pt">
				<select size="1" name="sfz">
				<option selected value="0">==<s:text name='reg.jsp.reg.jsp.2105797912'/>==</option>
				<option value="0"><s:text name='reg.jsp.reg.jsp.19893584'/>！</option>
				<option value="1"><s:text name='reg.jsp.reg.jsp.1259576711'/>！</option>
				</select></span></font><font color="#FF0000" style="font-size: 11pt"> </font> 
				<font color="#008000" style="font-size: 11pt" size="2">&nbsp;</font><font color="#FF0000"><a href="javascript:openwindow('sfz.html')" style="text-decoration: none; font-weight: 700; "><font color="#008000" size="3"><s:text name='vipreg.jsp.reg.jsp.-692292151a'/></font></a></font></td>
			</tr>
		</table>
		<p style="margin-top: 0; margin-bottom: 0"></p>
		<p style="margin-top: 10px; margin-bottom: 0"><input type="submit" value="<s:text name='reg.jsp.reg.jsp.-1871876984'/>" name="submit" onClick="checkdate();" style="font-size: 12pt; font-weight: bold"></p>
		<p style="margin-top: 0; margin-bottom: 0" align="right"></p>
        </form>
<p style="margin-top: 0; margin-bottom: 0">　</div>
