<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipjfjqks.jsp.jfjqks.jsp.1063864018'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==20}"><script language=javascript>alert('<s:text name='vipjfjqks.jsp.jfjqks.jsp.1464958073'/>！');location.replace('epjqks');</script></c:if>
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
			window.location.href="epkjz.jsp";
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
  if (Form.tzlb.value==0) {      alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.35601975'/>要的竞猜项目!");      return false;    }
  if (Form.tzsl.value=="") {      alert("请写入投注<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>数量!");      return false;    }
  if (Form.tzsl.value<10) {      alert("投注<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>数量不能小于10");      return false;    }
  if (Form.tzsl.value> ${pay} ) {      alert("投注<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>数量不能大于您<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/>的数量 ${pay}哦!");    return false;    }
  if (!chkinteger(Form.tzsl.value)){
	alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>投注只能为整字!');
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
<title><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>竞猜记录</title>
</head>
<div align="center"><b><form method="POST" action="epjqks?status=1" name="Form" onSubmit="return checkdate()">
		<table border="0" width="100%" id="table4" height="60" bgcolor="#FFFF66">
			<tr>
		<td width="330" rowspan="2"><b><p>&nbsp;离<font color="#FF0000">第${epkjdate.kid}期</font><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>开奖还有：<!--<span id="RemainD">&nbsp;</span>天<span id="RemainH">&nbsp;</span>时--><span id="RemainM">&nbsp;</span>分<span id="RemainS">&nbsp;</span>秒</td>
		<td width="165" align="right"><b><s:text name='vipepjqks.jsp.epjqks.jsp.1956974099'/>：</b></td>
		<td><b><select size="1" name="tzlb">
			<option selected value="0">=<s:text name='vipepjqks.jsp.epjqks.jsp.1956974099'/>=</option>
			<option value="1">-单-</option>
			<option value="2">-双-</option>
			<option value="3">-大-</option>
			<option value="4">-小-</option>
			</select></td>
		<td width="75" rowspan="2"><p align="center"><b><input type="submit" value="<s:text name='vipsgreg.jsp.sgreg.jsp.812244'/>" name="B3" style="; font-size: 12pt; font-weight: bold" onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')"></td>
		<td width="500" rowspan="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font ><font color="#FF0000" size="2"><b>友</b></font><b><font color="#FF0000" size="2">情提示：</font></b></font><font  size="2">竞猜游戏中没有100%的中奖，所投注的-<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>-不管中与不中，均无法撤销，本游戏不是赌博，请保持良好的游戏心态，量力而行。</font></td>
			</tr>
			<tr>
		<td width="165" align="right"><b>下注<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>数量：</b></td>
		<td><input type="text" name="tzsl" size="15"></td>
			</tr>
		</table>
	</form>
  	<table border="0" width="100%" id="table1" height="100%" cellspacing="0" cellpadding="0">
		<tr>
		<td width="15%" valign="top"><iframe name="I1" src="epkjjl" marginwidth="1" marginheight="1" align="top" border="0" frameborder="0" scrolling="no" height="100%" width="100%"></iframe></td>
		<td width="85%" valign="top"><b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#FF6600" id="table2">
        <tr> 
        <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
        <font ><b><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>-竞猜记录</b><font size="2">
</font></font></p>
	<div align="center">    
      <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="55" id="table3">
        <tr>        
     <td width="103" align="center" height="26" bgcolor="#E8E8FF"><b>
		<font size="2" ><s:text name='vipepjqks.jsp.epjqks.jsp.839864'/></font></b></td>                
     <td width="157" align="center" height="26" bgcolor="#E8E8FF"> <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> <font  color="#800000" size="2"><strong><s:text name='vipepjqks.jsp.epjqks.jsp.966306219'/></strong></font></td><b>
     <td width="117" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000"  size="2"> <strong>投注<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></strong></font></td></b>                
     <td width="118" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000"  size="2"> <strong>收入<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></strong></font></td>
     <td width="108" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000"  size="2"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></font></b></td><b>
     <td width="220" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b> <font color="#FF0000"  size="2">竞投<s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.847550'/></font></b></td></b>
     <td width="216" align="center" height="26" bgcolor="#E8E8FF"> <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font  size="2"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></font></b></td>
        </tr>
      <s:iterator var="data" value="dateList">
        <tr> 
     <td height="32" width="103" align="center" bgcolor="#DFFFEF"><b><font size="2" >${data.kjqi}</font></b></td>
     <td height="32" width="157" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000"  size="2" style="font-weight: 700">${data.username}</font></td><b>
     <td valign="middle" width="117" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000"  size="2">
     <c:if test="${data.jc>0}">-${data.jc}</c:if><c:if test="${data.jc<=0}">${data.jc}</c:if></font></td></b>
     <td valign="middle" width="118" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000"  size="2">${data.syjz}</font></td>
     <td valign="middle" align="center" width="108" bgcolor="#DFFFEF"><font  size="2">${data.pay}</font></td><b>
     <td valign="middle" align="center" width="220" bgcolor="#DFFFEF"><font size="2" >${data.abdate}</font></td></b>
     <td valign="middle" align="center" width="216" bgcolor="#DFFFEF"><font size="2" >${data.regid}</font></td>
         </tr>
</s:iterator>
        </table> 
</div><font size="2" > <aldtags:pageTag/>
</font>
</tr> 
</table> 
</td>
</tr>
</table>
</div> 
</body> 
</html>
