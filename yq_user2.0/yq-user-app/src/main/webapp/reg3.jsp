<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-109709084'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='reg3.jsp.reg3.jsp.-1243798858'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-834832388'/>！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='reg3.jsp.reg3.jsp.912511120'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='notinternationalareacode'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='emptyinternationalareacode'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='Overseasnotchina'/>！');history.go(-1);</script></c:if>
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
	

	function checkdate1(lan) {
		 if (Form.ggbank.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1996388245'/>!");   Form.ggbank.focus();     return ;    }  
		  if (Form.ggcard.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-998560219'/>!");  Form.ggcard.focus();      return ;    }  
		  if(lan==0){
			  if (Form.provinceName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1924286904'/>!");      return ;    }
			  if (Form.cityName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1924280505'/>!");      return ;    }
			  if (Form.areaName.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.1280507619'/>!");      return ;    }
		 }
		  if (Form.ggbank.value=="<s:text name='reg.jsp.reg.jsp.-453899062'/>"||Form.ggbank.value=="<s:text name='reg.jsp.reg.jsp.1781968004'/>"||Form.ggbank.value=="<s:text name='reg.jsp.reg.jsp.691148048'/>"||Form.ggbank.value=="<s:text name='reg.jsp.reg.jsp.1019445992'/>")
		  {
			  var t=$("#gcard").val();
			  var z= /^[0-9]*$/;
			  if(!z.test(t)){
				  alert("<s:text name='Banks.can.only.be.numbers'/>!");
				  Form.ggcard.focus(); return;
			  }
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
										<c:if test="${lan==0}">
										<option value="<s:text name='reg.jsp.reg.jsp.-453899062'/>"><s:text name='reg.jsp.reg.jsp.-453899062'/></option>
										<option value="<s:text name='reg.jsp.reg.jsp.1781968004'/>"><s:text name='reg.jsp.reg.jsp.1781968004'/></option>
										<option value="<s:text name='reg.jsp.reg.jsp.691148048'/>"><s:text name='reg.jsp.reg.jsp.691148048'/></option>
										<option value="<s:text name='reg.jsp.reg.jsp.1019445992'/>"><s:text name='reg.jsp.reg.jsp.1019445992'/></option>
										</c:if>
										<c:if test="${lan==1}">
										<option value="<s:text name='bank_paypal'/>"><s:text name='bank_paypal'/></option>
										<option value='<s:text name='1worldbank'/>'><s:text name='1worldbank'/></option>
										<option value='<s:text name='2worldbank'/>'><s:text name='2worldbank'/></option>
										<option value='<s:text name='3worldbank'/>'><s:text name='3worldbank'/></option>
										<option value='<s:text name='4worldbank'/>'><s:text name='4worldbank'/></option>
										<option value='<s:text name='5worldbank'/>'><s:text name='5worldbank'/></option>
										<option value='<s:text name='6worldbank'/>'><s:text name='6worldbank'/></option>
										<option value='<s:text name='7worldbank'/>'><s:text name='7worldbank'/></option>
										<option value='<s:text name='8worldbank'/>'><s:text name='8worldbank'/></option>
										<option value='<s:text name='9worldbank'/>'><s:text name='9worldbank'/></option>
										<option value='<s:text name='10worldbank'/>'><s:text name='10worldbank'/></option>
										<option value='<s:text name='11worldbank'/>'><s:text name='11worldbank'/></option>
										<option value='<s:text name='12worldbank'/>'><s:text name='12worldbank'/></option>
										<option value='<s:text name='13worldbank'/>'><s:text name='13worldbank'/></option>
										<option value='<s:text name='14worldbank'/>'><s:text name='14worldbank'/></option>
										<option value='<s:text name='15worldbank'/>'><s:text name='15worldbank'/></option>
										<option value='<s:text name='16worldbank'/>'><s:text name='16worldbank'/></option>
										<option value='<s:text name='17worldbank'/>'><s:text name='17worldbank'/></option>
										<option value='<s:text name='18worldbank'/>'><s:text name='18worldbank'/></option>
										<option value='<s:text name='19worldbank'/>'><s:text name='19worldbank'/></option>
										<option value='<s:text name='20worldbank'/>'><s:text name='20worldbank'/></option>
										<option value='<s:text name='21worldbank'/>'><s:text name='21worldbank'/></option>
										<option value='<s:text name='22worldbank'/>'><s:text name='22worldbank'/></option>
										<option value='<s:text name='23worldbank'/>'><s:text name='23worldbank'/></option>
										<option value='<s:text name='24worldbank'/>'><s:text name='24worldbank'/></option>
										<option value='<s:text name='25worldbank'/>'><s:text name='25worldbank'/></option>
										<option value='<s:text name='26worldbank'/>'><s:text name='26worldbank'/></option>
										<option value='<s:text name='27worldbank'/>'><s:text name='27worldbank'/></option>
										<option value='<s:text name='28worldbank'/>'><s:text name='28worldbank'/></option>
										<option value='<s:text name='29worldbank'/>'><s:text name='29worldbank'/></option>
										<option value='<s:text name='30worldbank'/>'><s:text name='30worldbank'/></option>
										<option value='<s:text name='31worldbank'/>'><s:text name='31worldbank'/></option>
										<option value='<s:text name='32worldbank'/>'><s:text name='32worldbank'/></option>
										<option value='<s:text name='33worldbank'/>'><s:text name='33worldbank'/></option>
										<option value='<s:text name='34worldbank'/>'><s:text name='34worldbank'/></option>
										<option value='<s:text name='35worldbank'/>'><s:text name='35worldbank'/></option>
										<option value='<s:text name='36worldbank'/>'><s:text name='36worldbank'/></option>
										<option value='<s:text name='37worldbank'/>'><s:text name='37worldbank'/></option>
										<option value='<s:text name='38worldbank'/>'><s:text name='38worldbank'/></option>
										<option value='<s:text name='39worldbank'/>'><s:text name='39worldbank'/></option>
										<option value='<s:text name='40worldbank'/>'><s:text name='40worldbank'/></option>
										<option value='<s:text name='41worldbank'/>'><s:text name='41worldbank'/></option>
										<option value='<s:text name='42worldbank'/>'><s:text name='42worldbank'/></option>
										<option value='<s:text name='43worldbank'/>'><s:text name='43worldbank'/></option>
										<option value='<s:text name='44worldbank'/>'><s:text name='44worldbank'/></option>
										<option value='<s:text name='45worldbank'/>'><s:text name='45worldbank'/></option>
										<option value='<s:text name='46worldbank'/>'><s:text name='46worldbank'/></option>
										<option value='<s:text name='47worldbank'/>'><s:text name='47worldbank'/></option>
										<option value='<s:text name='48worldbank'/>'><s:text name='48worldbank'/></option>
										<option value='<s:text name='49worldbank'/>'><s:text name='49worldbank'/></option>
										<option value='<s:text name='50worldbank'/>'><s:text name='50worldbank'/></option>
										<option value='<s:text name='51worldbank'/>'><s:text name='51worldbank'/></option>
										<option value='<s:text name='52worldbank'/>'><s:text name='52worldbank'/></option>
										<option value='<s:text name='53worldbank'/>'><s:text name='53worldbank'/></option>
										<option value='<s:text name='54worldbank'/>'><s:text name='54worldbank'/></option>
										<option value='<s:text name='55worldbank'/>'><s:text name='55worldbank'/></option>
										<option value='<s:text name='56worldbank'/>'><s:text name='56worldbank'/></option>
										<option value='<s:text name='57worldbank'/>'><s:text name='57worldbank'/></option>
										<option value='<s:text name='58worldbank'/>'><s:text name='58worldbank'/></option>
										<option value='<s:text name='59worldbank'/>'><s:text name='59worldbank'/></option>
										<option value='<s:text name='60worldbank'/>'><s:text name='60worldbank'/></option>
										<option value='<s:text name='61worldbank'/>'><s:text name='61worldbank'/></option>
										<option value='<s:text name='62worldbank'/>'><s:text name='62worldbank'/></option>
										<option value='<s:text name='63worldbank'/>'><s:text name='63worldbank'/></option>
										<option value='<s:text name='64worldbank'/>'><s:text name='64worldbank'/></option>
										<option value='<s:text name='65worldbank'/>'><s:text name='65worldbank'/></option>
										<option value='<s:text name='66worldbank'/>'><s:text name='66worldbank'/></option>
										<option value='<s:text name='67worldbank'/>'><s:text name='67worldbank'/></option>
										<option value='<s:text name='68worldbank'/>'><s:text name='68worldbank'/></option>
										<option value='<s:text name='69worldbank'/>'><s:text name='69worldbank'/></option>
										<option value='<s:text name='70worldbank'/>'><s:text name='70worldbank'/></option>
										<option value='<s:text name='71worldbank'/>'><s:text name='71worldbank'/></option>
										<option value='<s:text name='72worldbank'/>'><s:text name='72worldbank'/></option>
										<option value='<s:text name='73worldbank'/>'><s:text name='73worldbank'/></option>
										<option value='<s:text name='74worldbank'/>'><s:text name='74worldbank'/></option>
										<option value='<s:text name='75worldbank'/>'><s:text name='75worldbank'/></option>
										<option value='<s:text name='76worldbank'/>'><s:text name='76worldbank'/></option>
										<option value='<s:text name='77worldbank'/>'><s:text name='77worldbank'/></option>
										<option value='<s:text name='78worldbank'/>'><s:text name='78worldbank'/></option>
										<option value='<s:text name='79worldbank'/>'><s:text name='79worldbank'/></option>
										<option value='<s:text name='80worldbank'/>'><s:text name='80worldbank'/></option>
										<option value='<s:text name='81worldbank'/>'><s:text name='81worldbank'/></option>
										<option value='<s:text name='82worldbank'/>'><s:text name='82worldbank'/></option>
										<option value='<s:text name='83worldbank'/>'><s:text name='83worldbank'/></option>
										<option value='<s:text name='84worldbank'/>'><s:text name='84worldbank'/></option>
										<option value='<s:text name='85worldbank'/>'><s:text name='85worldbank'/></option>
										<option value='<s:text name='86worldbank'/>'><s:text name='86worldbank'/></option>
										<option value='<s:text name='87worldbank'/>'><s:text name='87worldbank'/></option>
										<option value='<s:text name='88worldbank'/>'><s:text name='88worldbank'/></option>
										<option value='<s:text name='89worldbank'/>'><s:text name='89worldbank'/></option>
										<option value='<s:text name='90worldbank'/>'><s:text name='90worldbank'/></option>
										<option value='<s:text name='91worldbank'/>'><s:text name='91worldbank'/></option>
										<option value='<s:text name='92worldbank'/>'><s:text name='92worldbank'/></option>
										<option value='<s:text name='93worldbank'/>'><s:text name='93worldbank'/></option>
										<option value='<s:text name='94worldbank'/>'><s:text name='94worldbank'/></option>
										<option value='<s:text name='95worldbank'/>'><s:text name='95worldbank'/></option>
										<option value='<s:text name='96worldbank'/>'><s:text name='96worldbank'/></option>
										<option value='<s:text name='97worldbank'/>'><s:text name='97worldbank'/></option>
										<option value='<s:text name='98worldbank'/>'><s:text name='98worldbank'/></option>
										<option value='<s:text name='99worldbank'/>'><s:text name='99worldbank'/></option>
										<option value='<s:text name='100worldbank'/>'><s:text name='100worldbank'/></option>
										</c:if>
						</select>
					 	<p><label ><s:text name='reg.jsp.reg.jsp.1170349181'/>：</label> <input id="gcard"  type="text" name="ggcard"  size="19" maxlength="20"></p><!-- value==value.replace(/[^\d]/g,'') -->
						<p class="bwky">
							<c:if test="${lan!=1}"><label><s:text name='reg.jsp.reg.jsp.-1009112269'/>：</label>
							
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
							</c:if>
						</p>
						<p class="z-tc"><a class="newbut" id="xyb" href="#" onClick="checkdate1(${lan});"><s:text name='reg1.jsp.reg1.jsp.19846320'/></a></p>
					</div>
					
				 </form>
		</div>
	</div>
</body>
</html>
