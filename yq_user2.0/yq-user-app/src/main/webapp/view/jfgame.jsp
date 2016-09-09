<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title><s:text name='viewjflc.jsp.jflc.jsp.951004942'/></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="<s:text name='vipbdbdate.jsp.bdbdate.jsp.1257887'/>";
  }
}

</SCRIPT>

<SCRIPT src="main/leftNo.js"></SCRIPT>

<SCRIPT type=text/javascript src="main/jquery-1.2.6.min.js"></SCRIPT>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$("#wenzhang>dd>dl>dd").hide();
	$.each($("#wenzhang>dd>dl>dt"), function(){
		$(this).click(function(){
			$("#wenzhang>dd>dl>dd ").not($(this).next()).slideUp();
			$(this).next().slideToggle(500);
			//$(this).next().toggle();
		});
	});
});


</SCRIPT>
<script language="JavaScript">
 function checkdate()  {  
  if (Form.pa.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>!");      return false;    } 
  return true;  }  
 </script>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j?inputUrl=login2j.jsp" style="text-decoration: none"><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></A> </LI>
  <LI><A><s:text name='viewlinks.html.links.html.627723500'/></A> 
  </LI>
  <LI><A><s:text name='vipbdbdate.jsp.bdbdate.jsp.1097687684'/></A> 
  </LI>
  <LI><A><s:text name='vipbdbdate.jsp.bdbdate.jsp.860074668'/></A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1119407294'/></A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location><s:text name='vipjfgame.jsp.jfgame.jsp.-1860602679'/></DIV></DIV></DIV>
<DIV class=box_title><s:text name='vipjfgame.jsp.jfgame.jsp.-250171492'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
        <p align="center">
		<strong><font size="6" color="#000000"><s:text name='vipjfgame.jsp.jfgame.jsp.-250171492'/></font></strong><p align="center">
		　<p align="center">
		<img border="0" src="images/02.png" width="926" height="238"><p align="center">
		　<p align="center">
		<a href="http://p.cfjte.com/GameInfo.html"><font color="#FF0000" size="3"><s:text name='viewjflc.jsp.jflc.jsp.951004942'/> <s:text name='introduce'/></font></a>&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000" size="3">&nbsp;<a href="http://p.cfjte.com/FaqList.html"><font color="#FF0000"><s:text name='help'/></font></a>&nbsp;&nbsp;&nbsp; </font><b> <font color="#008000" size="3">&nbsp;</font></b><p align="center">
		　<p align="center">
		<b> <font color="#008000" size="3"><s:text name='vipjfgame.jsp.jfgame.jsp.-1686466288'/>）</font><p align="center">
		　<p align="center">
		<b><font color="#0000FF" size="3"><s:text name='vipjfgame.jsp.jfgame.jsp.276574634'/>！</font></b><form method="POST" action="jfgame?status=1" name="Form" onSubmit="return checkdate()" >
			<p align="center">　</p>
			<p align="center"><font size="6" color="#FF00FF"><s:text name='vipjfgame.jsp.jfgame.jsp.-1801071032'/>！</font></p>
			<p align="center">　</p>
			<p align="center"><input type="submit" value="<s:text name='vipjfgame.jsp.jfgame.jsp.-2110429154'/>" name="B1" onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')" ></p>
		</form>
		</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>
<p align="center">
　</p>
</body> 
</html>
