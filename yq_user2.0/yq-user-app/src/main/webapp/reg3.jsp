<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-109709084'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='reg3.jsp.reg3.jsp.-1243798858'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-834832388'/>！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='reg3.jsp.reg3.jsp.912511120'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='notinternationalareacode'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='emptyinternationalareacode'/>！');history.go(-1);history.go(-1);</script></c:if>
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
			alert ("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
			Form.gguser.focus();
			return;
		}
		 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
			alert("<s:text name='reg3.jsp.reg3.jsp.-1848386260'/>!");
			Form.gguser.focus();
			return ;
		}
	    var uName=document.Form.gguser.value;
	    var ajaxobj = new Ajax();
	    ajaxobj.url="checkreg?gguser="+uName;
	    ajaxobj.callback=function(){
		    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
		    if(responseMsg.erroCodeNum!=0){
		    	alert("<s:text name='reg3.jsp.reg3.jsp.842685271'/>");
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
		 if (Form.ggbank.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1996388245'/>!");   Form.ggbank.focus();     return ;    }  
		  if (Form.ggcard.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-998560219'/>!");  Form.ggcard.focus();      return ;    }  
		 if (Form.provinceName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1924286904'/>!");      return ;    }
		  if (Form.cityName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1924280505'/>!");      return ;    }
		  if (Form.areaName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1280507619'/>!");      return ;    }
		  if (Form.ggbank.value=="<s:text name='reg.jsp.reg.jsp.-453899062'/>"||Form.ggbank.value=="<s:text name='reg.jsp.reg.jsp.1781968004'/>"||Form.ggbank.value=="<s:text name='reg.jsp.reg.jsp.691148048'/>"||Form.ggbank.value=="<s:text name='reg.jsp.reg.jsp.1019445992'/>")
		  {
			  var t=$("#gcard").val();
			  var z= /^[0-9]*$/;
			  if(!z.test(t)){
				  alert("<s:text name='Banks.can.only.be.numbers'/>!");
				  Form.ggcard.focus(); return;
			  }
			 /*  var pattern = /\D/ig;
			  var str = "";// your string
			  pattern.test(str); */
		  }
		//location.href = '/reg?step=1&ggpa1=' + Form.ggpa1.value + '&ggpa2='
		//		+ Form.ggpa2.value + "ggpa3=" + Form.ggpa3.value;
		Form.submit();
		return;
	}
	
	function reg(){
		if ( Form.gguser.value==""){
			alert ("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
			Form.gguser.focus();
			return false;
		}
		 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
			alert("<s:text name='reg3.jsp.reg3.jsp.-1848386260'/>！");
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
		    		alert('<s:text name='reg3.jsp.reg3.jsp.498992772'/>]！');
		    	}else if(responseMsg.erroCodeNum==4){
		    		alert('<s:text name='reg.jsp.reg.jsp.-834832388'/>！！');
		    	}else if(responseMsg.erroCodeNum==5){
		    		alert('<s:text name='reg3.jsp.reg3.jsp.451801346'/>！');
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
</script>

<script language="javascript" type="text/javascript">
/* <option value="<s:text name='reg.jsp.reg.jsp.-453899062'/>"><s:text name='reg.jsp.reg.jsp.-453899062'/></option>
<option value="<s:text name='reg.jsp.reg.jsp.1781968004'/>"><s:text name='reg.jsp.reg.jsp.1781968004'/></option>
<option value="<s:text name='reg.jsp.reg.jsp.691148048'/>"><s:text name='reg.jsp.reg.jsp.691148048'/></option>
<option value="<s:text name='reg.jsp.reg.jsp.1019445992'/>"><s:text name='reg.jsp.reg.jsp.1019445992'/></option> */
 
<!--
function ChangeProvince(subid)
{

	document.getElementById("loc_city").length = 0; 
	var subid=subid;
	var i;
	document.getElementById("loc_city").options[0] = new Option('=<s:text name='reg.jsp.reg.jsp.-145519509'/>=','0');
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
	document.getElementById("loc_town").options[0] = new Option('=<s:text name='reg.jsp.reg.jsp.-145527167'/>=','0');
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
						<li><span class="spanl"></span></li>
						<li><b class="lh">2</b></li>
						<li><span class="spanl"></span></li>
						<li><b class="lh">3</b></li>
						<li><span class="spanl"></span></li>
						<li class="gsd"><b><strong></strong></b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.650688080'/>　　</li>
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.-1147457200'/></li>
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.-1456505170'/></li>
						<li>　　<s:text name='reg1.jsp.reg1.jsp.799375'/></li>
					</ul>
				</div>

				<form  name="Form" method="post" action="reg?step=3&lan=${lan}">
					<input type="hidden" name="gguser" onKeyUp="value=value.replace(/[\W]/g,'')" value="${gguser}">
					<input type="hidden" name="ggpa1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa1}">
					<input type="hidden" name="ggpa2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa2}">
					<input type="hidden" name="ggpa3" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa3}">
					<input type="hidden" name="ggname" size="20" maxlength="4" onKeyUp="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" value="${ggname}">
					<input type="hidden" name="gguserid" size="20" maxlength="18" value="${gguserid}">
					<input type="hidden" name="areaCode" size="20" maxlength="18" value="${areaCode}">
					<input type="hidden" name="ggcall" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="11" value="${ggcall}">
					<input type="hidden" name="ggqq" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="10" value="${ggqq}">
					<input type="hidden" onKeyUp="value=value.replace(/[\W]/g,'')" name="upvip" size="20" value="${upvip}">
					<div class="fbox founbox3">
						<p><label><s:text name='reg.jsp.reg.jsp.799485150'/>：</label>
						<select id="loc_bank" style="width:350px;" name="ggbank"><!--  ONCHANGE="CHECKBANK(DOCUMENT.GETELEMENTBYID('LOC_BANK').OPTIONS[DOCUMENT.GETELEMENTBYID('LOC_BANK').SELECTEDINDEX].VALUE)" -->
										<option value="<s:text name='reg.jsp.reg.jsp.-453899062'/>"><s:text name='reg.jsp.reg.jsp.-453899062'/></option>
										<option value="<s:text name='reg.jsp.reg.jsp.1781968004'/>"><s:text name='reg.jsp.reg.jsp.1781968004'/></option>
										<option value="<s:text name='reg.jsp.reg.jsp.691148048'/>"><s:text name='reg.jsp.reg.jsp.691148048'/></option>
										<option value="<s:text name='reg.jsp.reg.jsp.1019445992'/>"><s:text name='reg.jsp.reg.jsp.1019445992'/></option>
										<option value="<s:text name='bank_paypal'/>"><s:text name='bank_paypal'/></option>
										<option value="<s:text name='alipay'/>"><s:text name='alipay'/></option>
						</select>
					 	<p><label ><s:text name='reg.jsp.reg.jsp.1170349181'/>：</label> <input id="gcard"  type="text" name="ggcard"  size="19" maxlength="20"></p><!-- value==value.replace(/[^\d]/g,'') -->
						<p class="bwky">
							<label><s:text name='reg.jsp.reg.jsp.-1009112269'/>：</label>
							<select style="width:220px;" id="loc_province" name="provinceName" onChange="ChangeProvince(document.getElementById('loc_province').options[document.getElementById('loc_province').selectedIndex].value);">
							   <s:iterator var="data" value="provinceList">
									<option value="${data.b}">${data.b}</option>
								</s:iterator>
								<option value="国外">国外</option>
							</select>
							<select style="width:220px;" id="loc_city" name="cityName" onChange="ChangeCity(document.getElementById('loc_city').options[document.getElementById('loc_city').selectedIndex].value);">
							</select>
							<select style="width:220px;" id="loc_town" name="areaName" onChange="ChangeArea(document.getElementById('loc_town').options[document.getElementById('loc_town').selectedIndex].value);">
							</select>
						</p>
						<p class="z-tc"><a class="newbut" id="xyb" href="#" onClick="checkdate1();"><s:text name='reg1.jsp.reg1.jsp.19846320'/></a></p>
					</div>
					
				 </form>
		</div>
	</div>
</body>
</html>
