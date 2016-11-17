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
	<!-- <script src="/scripts/area.js"></script> -->
	<script src="/scripts/location.js"></script>
	<script src="/scripts/select2.js"></script>
	<script src="/scripts/select2_locale_zh-CN.js"></script>
	<script language="javascript" src="/js/ajax.js"></script>
	<!-- <script language="javascript" src="scripts/myarea.js"></script> -->
	<script src="/scripts/areacode.js"></script>
	<script language="javascript" src="scripts/myarea2.js"></script>
	<script language="javascript" src="scripts/locationarea.js"></script>
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
			alert("<s:text name='reg2.jsp.reg2.jsp.-1848386260'/>!");
			Form.gguser.focus();
			return ;
		}
	    var uName=document.Form.gguser.value;
	    var ajaxobj = new Ajax();
	    ajaxobj.url="checkreg?gguser="+uName;
	    ajaxobj.callback=function(){
		    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
		    if(responseMsg.erroCodeNum!=0){
		    	alert("<s:text name='reg2.jsp.reg2.jsp.842685271'/>！");
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
		  if (Form.ggname.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.164342206'/>!");  Form.ggname.focus();    return false;    } 
		  <c:if test="${lan==0}">
		  if (Form.ggname.value.length<2) {      alert("<s:text name='reg.jsp.reg.jsp.815297593'/>!");   Form.ggname.focus();     return false;    } 
		  if (Form.ggname.value.length>8) {      alert("<s:text name='reg.jsp.reg.jsp.560668046'/>!");   Form.ggname.focus();     return false;    }
		  </c:if>
		  if (Form.gguserid.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-1745964948'/>!");  Form.gguserid.focus();      return false;    }
		  <c:if test="${lan==0}">
		  if (Form.gguserid.value.length<18) {      alert("<s:text name='reg.jsp.reg.jsp.1683299853'/>!"); Form.gguserid.focus();     return false;    } 
		  if (Form.gguserid.value.length>18) {      alert("<s:text name='reg.jsp.reg.jsp.1428610724'/>!"); Form.gguserid.focus();     return false;    }    
		  </c:if>
		  
		  if (Form.ggcall.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>!");  Form.ggcall.focus();      return false;    }
		  <c:if test="${lan==0}">
		  if (Form.ggcall.value.length<11) {      alert("<s:text name='reg.jsp.reg.jsp.-415194682'/>!"); Form.ggcall.focus();     return false;    } 
		  if (Form.ggcall.value.length>11) {      alert("<s:text name='reg.jsp.reg.jsp.-669883811'/>!"); Form.ggcall.focus();     return false;    }
		  </c:if>
		  if (Form.areaCode.value=="") {      alert("<s:text name='emptyinternationalareacode'/>!");     return false;    }
		  if (Form.ggqq.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-764220017'/>!");  Form.ggqq.focus();    return false;    }
		  if (Form.upvip.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.1311603234'/>!"); Form.upvip.focus();     return false;    } 
		  if (Form.areaCode.value==0) {      alert("<s:text name='emptyinternationalareacode'/>!");      return ;    }
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
						<li><b class="lh">2</b></li>
						<li><span class="spanl"></span></li>
						<li><b>3</b></li>
						<li><span class="spanl"></span></li>
						<li class="gsd"><b><strong></strong></b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.650688080'/>　　</li>
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.-1147457200'/></li>
						<li><s:text name='reg1.jsp.reg1.jsp.-1456505170'/></li>
						<li>　　<s:text name='reg1.jsp.reg1.jsp.799375'/></li>
					</ul>
				</div>

				<form name="Form" method="post" action="reg?step=2&lan=${lan}">
					<div class="fbox founbox2">
					    <input type="hidden" name="gguser" onKeyUp="value=value.replace(/[\W]/g,'')" value="${gguser}">
					    <input type="hidden" name="ggpa1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa1}">
					    <input type="hidden" name="ggpa2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa2}">
					    <input type="hidden" name="ggpa3" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" value="${ggpa3}">
						<p><label><s:text name='reg.jsp.reg.jsp.734362'/>：</label><input type="text" name="ggname" size="20" maxlength="20" <c:if test="${lan==0}"> onKeyUp="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"</c:if> ><span><s:text name="idcardmakesure"></s:text></span></p>
						<p><label> <c:if test="${lan==1}"><s:text name='passport'/></c:if><c:if test="${lan==0}"><s:text name='reg.jsp.reg.jsp.7501689'/></c:if>：</label><input type="text" name="gguserid" size="20" maxlength="18"><c:if test="${lan==0}"><span><s:text name="pleasecontact"></s:text></span></c:if><c:if test="${lan==1}"><span><s:text name="overplayer"></s:text></span></c:if></p>
						<p class="bwky">
						<label><s:text name='reg2.jsp.reg2.jsp.775723385'/>：</label>
						<select style="width:220px;" id="loc_areaCode" name="areaCode" >
							   <s:iterator var="data" value="areaCodeList">
									<option  value="${data.region_code}">${data.country_name}</option>
								</s:iterator>
								<option selected= "selected" value="86"><s:text name='china'/></option>
							</select>
						<label><input type="text" name="ggcall" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="11"></label>
						</p>
						<p><label>QQ：</label><input type="text" name="ggqq" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="10"></p>
						<p><label><s:text name='reg.jsp.reg.jsp.25579282'/>：</label><input type="text"  name="upvip" size="20" value="${tag}"></p>
						<p class="z-tc"><a class="newbut" href="#" onClick="checkdate1();"><s:text name='reg1.jsp.reg1.jsp.19846320'/></a></p>
					</div>
				 </form>
		</div>
	</div>
</body>
</html>
