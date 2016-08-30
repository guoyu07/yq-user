<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-931208490'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('恭喜同<s:text name='reg.jsp.reg.jsp.734362'/>用户注册<s:text name='reg1.jsp.reg1.jsp.799375'/>，请进行<s:text name='reg1.jsp.reg1.jsp.19846320'/>的<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/>！');location.href='tgdown'</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script language="javascript" src="/js/ajax.js"></script>

<script language="JavaScript"> 
function Check(){
	if ( Form.gguser.value==""){
		alert ("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
		Form.gguser.focus();
		return false;
	}
	 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("<s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.-1147321682'/>！");
		Form.gguser.focus();
		return false;
	}
    var uName=document.Form.gguser.value;
    var ajaxobj = new Ajax();
    ajaxobj.url="checkreg?gguser="+uName;
    ajaxobj.callback=function(){
	    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
	    if(responseMsg.erroCodeNum!=0){
	    	alert("<s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.842685271'/>！");
		    return;
	    }else{
	    	alert("<s:text name='reg.jsp.reg.jsp.-259258343'/>："+uName);
	    	return;
	    }
    }
    ajaxobj.send();
}

function CheckIfEnglish( String )
{ 
    var Letters = "abcdefghijklmnopqrstuvwxyz0123456789";
     var i;
     var c;
      if(String.charAt( 0 )=='-')
	return false;
      if( String.charAt( String.length - 1 ) == '-' )
          return false;
     for( i = 0; i < String.length; i ++ )
     {
          c = String.charAt( i );
	  if (Letters.indexOf( c ) < 0)
	     return false;
     }
     return true;
}

 function checkdate()  {  
  if (Form.gguser.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.-609490706'/>!"); Form.gguser.focus();     return false;    } 
  	        if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 12 || Form.gguser.value.length < 4) {
		alert("<s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.-1147321682'/>！");
		Form.gguser.focus();
		return false;
	}
 
  if (Form.sfz.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.741412114'/>");      return false;    } 
return true;  }  
</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp" %>
				
			</div>
			<div class="z-l">
				<div class="content-box1" style="height:190px;">
					<div class="content-title">
						<span><s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.1616957653'/></span>
					</div>
					<div class="content-form">
						<s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.-1290755823'/>
					</div>
				</div>
				<div class="content-box2 mt10"  style="height:370px;">
					<form class="form form3" method="POST" action="regTheSame?status=1" name="Form" onSubmit="return checkdate()">
							<p><label><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><input type="text" name="gguser" size="15" maxlength="12" onKeyUp="value=value.replace(/[\W]/g,'')"></p>
							<p><label><s:text name='reg.jsp.reg.jsp.626784226'/>：</label><s:text name='vipreg.jsp.reg.jsp.-1975491897'/></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><s:text name='vipreg.jsp.reg.jsp.-1975491897'/></p>
							<p><label><s:text name='reg.jsp.reg.jsp.734362'/>：</label>${gcuser.name}</p>
							<p><label><s:text name='reg.jsp.reg.jsp.25579282'/>：</label>${gcuser.username}</p>
							<p><label><s:text name='reg.jsp.reg.jsp.-692292151'/>：</label>
								<select size="1" name="sfz">
								<option selected value="0">==<s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.2105797912'/>==</option>
								<option value="0"><s:text name='reg.jsp.reg.jsp.19893584'/>！</option>
								<option value="1"><s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.1259576711'/>！</option>
								</select>
								<a href="javascript:openwindow('/sfz.html')" class="c-g xy-sm"><s:text name='reg.jsp.reg.jsp.-692292151'/></a>
							</p>
							<p><label></label><button class="but1" type="submit"><s:text name='reg.jsp.reg.jsp.-1871876984'/></button></p>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
