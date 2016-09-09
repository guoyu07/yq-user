<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title><s:text name='vipepmcjl.jsp.epmcjl.jsp.2110934020'/></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
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
</head>
<DIV class="top_bg cBlue">
　</DIV>
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
<DIV style="DISPLAY: none" class=Location><s:text name='vipepmcjl.jsp.epmcjl.jsp.-1860602679'/><SPAN id=mTitle><s:text name='vipbdbdate.jsp.bdbdate.jsp.1257887'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title><s:text name='vipepmcjl.jsp.epmcjl.jsp.2110934020'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<strong>
		<font color="#000000" face="楷体" size="5"><s:text name='vipepmcjl.jsp.epmcjl.jsp.2110934020'/></font></strong></td> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
    <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="104" align="center" height="23" bgcolor="#FBFAEC"><b><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404'/>1</b></td>
          <td width="136" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400"><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.-365289126'/></strong></font></td>
          <td width="83" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000"><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.855285018'/></font></td>
          <td width="133" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000"><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.663201424'/></font></td>
          <td width="242" align="center" height="23" bgcolor="#FBFAEC"><s:text name='vipepmcjl.jsp.epmcjl.jsp.625799226'/></td>
          <td width="342" align="center" height="23" bgcolor="#FBFAEC"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></td>
          </tr>
           <s:iterator var="data" value="dataList">
          <tr> 
          <td height="28" width="104" align="center"><b>${data.payid}</b></td>
          <td height="28" width="136" align="center"><p><font color="#000000">${data.payusername}</font></td>
          <td valign="middle" align="center" width="83"><font color="#FF0000">${data.paynum9}元</font></td>
          <td valign="middle" align="center" width="133"><font color="#000000">${data.paytime}</font></td>
          <td valign="middle" align="center" width="242">
          <c:if test="${not empty data.zftime}"><s:text name='vipepmcjl.jsp.epmcjl.jsp.-1287522754'/>--${data.dfuser}--${data.zftime}</c:if>
          <c:if test="${empty data.zftime}">
             <c:if test="${data.ep==1}">${data.dfuser}--<s:text name='vipepmcjl.jsp.epmcjl.jsp.-507211912'/>...</c:if>
             <c:if test="${data.ep==2}">${data.dfuser}--<s:text name='vipepmcjl.jsp.epmcjl.jsp.-1279856973'/><b><font color="#0000FF">${data.rgdate}</font></b><s:text name='vipepmcjl.jsp.epmcjl.jsp.-1279856973a'/>。。。</c:if>
             <c:if test="${data.ep!=1&&data.ep!=2}"><s:text name="vipepmcjl.jsp.epmcjl.jsp.1467453928"/>。。--<b><a onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')" href="qxepmc?qx=${data.payid}"><font color="#FF0000"><s:text name='vipepjysc.jsp.epjysc.jsp.1991539691a'/></font></a></b></c:if>
          </c:if>
          </td>
          <td valign="middle" align="center" width="342">
          <a onClick="return confirm('<s:text name="vipepmcjl.jsp.epmcjl.jsp.-299506267"/>！')" href="mcepok.asp?ep= ${data.payid}"><font color="#FF0000" size="2">
          <c:if test="${data.ep==2}"><input type="button" value="<s:text name="vipepmcjl.jsp.epmcjl.jsp.1726063994"/>" name="B1" onclick=disabled=true style="font-size: 10pt; color: #0000FF; font-weight: bold">
          </c:if>
          </font>
          </a>
          </td>
          </tr>
          </s:iterator>
            </table> 
</div><aldtags:pageTag/>
</tr> 
</table> 
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epjysc"><font color="#0000FF"><s:text name='vipepmcjl.jsp.epmcjl.jsp.-2109031624'/></font></a>---<a href="epmyjl"><font color="#008000"><s:text name='vipepmcjl.jsp.epmcjl.jsp.-2109031624a'/></font></a></font></p>
<p align="center">
　</p>
<p align="center">
　</p>
<meta http-equiv=Refresh content="120; url=">
</body> 
</html>
