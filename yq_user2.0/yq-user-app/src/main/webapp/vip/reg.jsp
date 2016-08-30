<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-931208490'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipreg.jsp.reg.jsp.1935130424'/>！');location.href='tgdown'</script></c:if>
<title><s:text name='reg.jsp.reg.jsp.-1179328136'/></title>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script language="javascript" src="js/ajax.js"></script>

<script language="JavaScript"> 
function Check(){
	if ( Form.gguser.value==""){
		alert ("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
		Form.gguser.focus();
		return false;
	}
	 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("<s:text name='vipreg.jsp.reg.jsp.-1848386260'/>！");
		Form.gguser.focus();
		return false;
	}
    var uName=document.Form.gguser.value;
    var ajaxobj = new Ajax();
    ajaxobj.url="checkreg?gguser="+uName;
    ajaxobj.callback=function(){
	    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
	    if(responseMsg.erroCodeNum!=0){
	    	alert("<s:text name='vipreg.jsp.reg.jsp.842685271'/>！");
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
		alert("<s:text name='vipreg.jsp.reg.jsp.-1147321682'/>！");
		Form.gguser.focus();
		return false;
	}
 
  if (Form.sfz.value==0) {      alert("<s:text name='reg.jsp.reg.jsp.741412114'/>");      return false;    } 
return true;  }  
</script>
<body background="../image/regbg.gif">
<div align="center">
<form method="POST" action="regTheSame?status=1" name="Form" onSubmit="return checkdate()">
		<p style="margin-top: 0; margin-bottom: 0">　</p>
		<p style="margin-top: 0; margin-bottom: 0"><img border="0" src="../image/bg01.jpg" width="60%" height="79"></p>
		<table border="0" width="60%" id="table1" height="365" cellpadding="5" bgcolor="#FFFFFF">
			<tr>
				<td align="left" colspan="2">
				<table border="2" width="100%" id="table2" cellspacing="1" bordercolor="#FF0000" style="border-collapse: collapse" cellpadding="4">
					<tr>
						<td><p style="line-height: 150%"><font color="#FF0000">&nbsp;&nbsp; <s:text name="vipreg.jsp.reg.jsp.2004774893"></s:text></font><a target="_top" href="reg"><img src="../images/a02.png"></a></td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.29623262'/>：</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="gguser" size="15" maxlength="12" onKeyUp="value=value.replace(/[\W]/g,'')"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.626784226'/>：</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><s:text name='vipreg.jsp.reg.jsp.-1975491897'/></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.630954966'/>：</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><s:text name='vipreg.jsp.reg.jsp.-1975491897'/></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.734362'/>：</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2">${gcuser.name}</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.25579282'/>：</font></b></td>
			    <td width="66%"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#FF0000">${userName}</font></b></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2"><s:text name='reg.jsp.reg.jsp.-692292151'/>：</font></b></td>
				<td width="66%"><font size="2" color="#FF0000">
				<span style="font-size: 11pt">
				<select size="1" name="sfz">
				<option selected value="0">==<s:text name='vipreg.jsp.reg.jsp.2105797912'/>==</option>
				<option value="0"><s:text name='reg.jsp.reg.jsp.19893584'/>！</option>
				<option value="1"><s:text name='vipreg.jsp.reg.jsp.1259576711'/>！</option>
				</select></span></font><font color="#FF0000" style="font-size: 11pt"> </font> 
				<font color="#008000" style="font-size: 11pt" size="2">&nbsp;</font><font color="#FF0000"><a href="javascript:openwindow('sfz.html')" style="text-decoration: none; font-weight: 700; "><font color="#008000" size="3"><s:text name='vipreg.jsp.reg.jsp.-692292151a'/></font></a></font></td>
			</tr>
		</table>
		<p style="margin-top: 0; margin-bottom: 0"></p>
		<p style="margin-top: 0; margin-bottom: 0">　</p>
		<p style="margin-top: 0; margin-bottom: 0"><input type="submit" value="<s:text name='reg.jsp.reg.jsp.-1871876984'/>" name="submit" style="font-size: 12pt; font-weight: bold"></p>
		<p style="margin-top: 0; margin-bottom: 0" align="right"></p>
        </form>
<p style="margin-top: 0; margin-bottom: 0">　</div>
