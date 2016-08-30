<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipjfjqks.jsp.jfjqks.jsp.1063864018'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipjfjqks.jsp.jfjqks.jsp.1464958073'/>！');location.replace('jfjqks');</script></c:if>

<script type="text/javascript" src="images/jquery.min.js"></script>

<script type="text/javascript">
	var startTime = new Date();
	//alert('year=${year},month=${month},day=${day}');
	startTime.setFullYear(${year}, ${month}, ${day});
	startTime.setHours(${hours});
	startTime.setMinutes(${minutes});
	startTime.setSeconds(59);
	startTime.setMilliseconds(999);
	var EndTime=startTime.getTime();
	function GetRTime(){
		var NowTime = new Date();
		var nMS = EndTime - NowTime.getTime();
		var nD = Math.floor(nMS/(1000 * 60 * 60 * 24));
		var nH = Math.floor(nMS/(1000*60*60)) % 24;
		var nM = Math.floor(nMS/(1000*60)) % 60;
		var nS = Math.floor(nMS/1000) % 60;
		if (nMS < 0){
			//window.location.reload();
			window.location.href="vip/jfkjz.jsp";
			$("#dao").hide();
			$("#daoend").show();
		}else{
		   $("#dao").show();
		   $("#daoend").hide();
		   //$("#RemainD").text(nD);
		   //$("#RemainH").text(nH);
		   $("#RemainM").text(nM);
		   $("#RemainS").text(nS); 
		}
	}
	
	$(document).ready(function () {
		var timer_rt = window.setInterval("GetRTime()", 1000);
	});
</script>
<script language="JavaScript"> 
 function checkdate()  { 
  if (Form.tzlb.value==0) {      alert("<s:text name='vipjfjqks.jsp.jfjqks.jsp.846497453'/>!");      return false;    }
  if (Form.tzsl.value=="") {      alert("<s:text name='vipjfjqks.jsp.jfjqks.jsp.-1288376084'/>!");      return false;    }
  if (Form.tzsl.value<10) {      alert("<s:text name='vipjfjqks.jsp.jfjqks.jsp.862540408'/>10");      return false;    }
  if (Form.tzsl.value>${jyg}) {      alert("<s:text name='vipjfjqks.jsp.jfjqks.jsp.1637608855'/>!");      return false;    } 
  if (!chkinteger(Form.tzsl.value)){
	alert('<s:text name='vipjfjqks.jsp.jfjqks.jsp.-229804544'/>!');
	document.Form.tzsl.focus;
	return (false);
 }
 function chkinteger(checkStr) {
var checkOK = "0123456789";
var allValid = true;
for (i=0; i<checkStr.length; i++) {
ch = checkStr.charAt(i);
if (checkOK.indexOf(ch) == -1) {
allValid = false;
break;
}
if ((ch == '+' || ch == '-') && i>0) {
allValid = false;
break;
}
}
return (allValid);
}
   return true;  }
</script>
<html>
<title><s:text name='vipjfjqks.jsp.jfjqks.jsp.-810493798'/></title>
</head>

<div align="center">
	<b>
  	<form method="POST" action="jfjqks?status=1" name="Form" onSubmit="return checkdate()">
		<table border="0" width="100%" id="table4" height="60" bgcolor="#FC273D">
			<tr>
		<td width="330" rowspan="2"><b><p>&nbsp;<s:text name='vipjfjqks.jsp.jfjqks.jsp.-1206515557'/></td>
		<td width="165" align="right"><b><s:text name='vipjfjqks.jsp.jfjqks.jsp.1956974099'/>：</b></td>
		<td><b><select size="1" name="tzlb">
			<option selected value="0">=<s:text name='vipjfjqks.jsp.jfjqks.jsp.1956974099'/>=</option>
			<option value="1">-单-</option>
			<option value="2">-双-</option>
			<option value="3">-大-</option>
			<option value="4">-小-</option>
			</select></td>
		<td width="75" rowspan="2"><p align="center"><b><input type="submit" value="提交" name="B3" style="; font-size: 12pt; font-weight: bold" onClick="return confirm('<s:text name='vipjztojb3.jsp.jztojb3.jsp.600719861'/>')"></td>
		<td width="500" rowspan="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font ><font color="#FFFFFF" size="2"><b><s:text name='vipjfjqks.jsp.jfjqks.jsp.-599225566'/>。</font></td>
			</tr>
			<tr>
		<td width="165" align="right"><b><s:text name='vipjfjqks.jsp.jfjqks.jsp.1680066643'/>：</b></td>
		<td><input type="text" name="tzsl" size="15"></td>
			</tr>
		</table>
	</form>
  	<table border="0" width="100%" id="table1" height="100%" cellspacing="0" cellpadding="0">
		<tr>
		<td width="15%" valign="top"><iframe name="I1" src="jfkjjl" marginwidth="1" marginheight="1" align="top" border="0" frameborder="0" scrolling="no" height="100%" width="100%"></iframe></td>
		<td width="85%" valign="top"><b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#008000" id="table2">
          <tr> 
        <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font ><b><s:text name='vipjfjqks.jsp.jfjqks.jsp.-810493798'/></b><font size="2">
	</font></font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="55" id="table3">
            <tr>        
     <td width="103" align="center" height="26" bgcolor="#E8E8FF"><b><font size="2" ><s:text name='vipepkjjl.jsp.epkjjl.jsp.839864'/></font></b></td>                
     <td width="157" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> <font  color="#800000" size="2"><strong><s:text name='vipjfjqks.jsp.jfjqks.jsp.966306219'/></strong></font></td><b>
     <td width="117" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000"  size="2"> <strong><s:text name='vipjfjqks.jsp.jfjqks.jsp.779616810'/></strong></font></td></b>                
     <td width="118" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000"  size="2"> <strong><s:text name='vipjfjqks.jsp.jfjqks.jsp.792897830'/></strong></font></td>
     <td width="108" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000"  size="2"><s:text name='vipjfjqks.jsp.jfjqks.jsp.649010183'/></font></b></td><b>
     <td width="220" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b> <font color="#FF0000"  size="2"><s:text name='vipjfjqks.jsp.jfjqks.jsp.962146421'/></font></b></td></b>
     <td width="216" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font  size="2"><s:text name='vipdatepay.jsp.datepay.jsp.734401'/></font></b></td>
        </tr>
      <s:iterator var="data" value="dataList">
         <tr> 
     <td height="32" width="103" align="center" bgcolor="#DFFFEF"><b><font size="2" >${data.kjqi}</font></b></td>
     <td height="32" width="157" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000"  size="2" style="font-weight: 700">${data.username}</font></td><b>
     <td valign="middle" width="117" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000"  size="2">
     <c:if test="${data.mcsl>0}">-${data.mcsl}</c:if><c:if test="${data.mcsl<=0}">${data.mcsl}</c:if></font></td></b>
     <td valign="middle" width="118" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000"  size="2">${data.mysl}</font></td>
     <td valign="middle" align="center" width="108" bgcolor="#DFFFEF"><font  size="2">${data.sysl}</font></td><b>
     <td valign="middle" align="center" width="220" bgcolor="#DFFFEF"><font size="2" >${data.cgdate}</font></td></b>
     <td valign="middle" align="center" width="216" bgcolor="#DFFFEF"><font size="2" >${data.bz}</font></td>
         </tr>
             </s:iterator>
        </table> 
</div><font size="2" >
<aldtags:pageTag/>
</font>
</tr> 
</table> 
	</td>
</tr>
	</table>
</div> 
</body> 
</html>
