<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<HTML>
<title></title>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>
<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="<s:text name='viplogin2j.jsp.login2j.jsp.1257887'/>";
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


function checkdate()  {  
	  if (Form.password3.value=="") {   alert("<s:text name='viplogin2j.jsp.login2j.jsp.-1719221018'/>");  Form.password3.focus();   return false;    }
	  var data = $("#Form").serialize();
	  $.post("login2j?status=1", data, function(response) {
		    var responseMsg = eval('(' + response + ')');
			if(responseMsg.erroCodeNum==0){//注册成功
				//执行跳转
				location.replace('epmyjl');
				return;
			}else{
				alert('<s:text name='viplogin2j.jsp.login2j.jsp.950326025'/>');
				Form.password3.focus();
				return;
			}
		});
	  return true;
	}
</SCRIPT>
<BODY bgcolor="#FFFFFF" >
<DIV class="top_bg cBlue">
<DIV style="POSITION: relative; HEIGHT: 10px">
　</DIV>　</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle><s:text name='viplogin2j.jsp.login2j.jsp.1257887'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="90%" height="54%" id="AutoNumber1">
    <tr>
      <td width="93%" height="100%"><form method="POST" action="" name="Form" id="Form" onSubmit="return false">
			 <font size="3">
			  <div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font size="5" color="#FF0000" face="楷体_GB2312"><s:text name='viplogin3j.jsp.login3j.jsp.-1886394640'/></font></p>
			  <table border="0" width="100%" id="table1">
					<tr>
						<td>
						<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						<s:text name='viplogin3j.jsp.login3j.jsp.1072980487'/><br>
						1、<s:text name='viplogin3j.jsp.login3j.jsp.1178622703'/>。<br>
						2、<s:text name='viplogin3j.jsp.login3j.jsp.1078412623'/>。<br>
						<s:text name='viplogin3j.jsp.login3j.jsp.203331168'/><br>
						1、<s:text name='viplogin3j.jsp.login3j.jsp.98672732'/>！<br>
						2、<s:text name='viplogin3j.jsp.login3j.jsp.-1363913732'/>。<br>
						3、<s:text name='viplogin3j.jsp.login3j.jsp.-9035302'/>。</td>
					</tr>
				</table>
				</b>
				</div>
				<p align="center">
				<p align="center">
				<p align="center">
				</font><div align="center">
                    <center>
                  <table border="0" cellpadding="0" style="border:1px solid #008000; border-collapse: collapse" width="50%" id="AutoNumber4" height="112" bgcolor="#FFD7D7">
                    <tr> 
                      <td width="42%" height="40" align="right" bgcolor="#FFD7D7"><font style="font-size: 11pt"><s:text name='viplogin2j.jsp.login2j.jsp.29623262'/>：</font></td>
                      <td width="57%" height="40" align="left" bgcolor="#FFD7D7"><font size="3"> <span style="font-size: 11pt"><INPUT name="m_username" size=12 value="${userName}" readonly></span></font></td>
                    </tr>
                    <tr> 
                      <td width="42%" height="40" align="right"><font style="font-size: 11pt"><s:text name='viplogin2j.jsp.login2j.jsp.630954966'/>：</font></td>
                      <td width="57%" height="40" align="left"><font size="3"> <span style="font-size: 11pt"><INPUT name="password3" size=12 type="password" ></span></font></td>
                    </tr>
                    <tr><td width="70%" height="40" align="center" colspan="2" bgcolor="#FFD7D7"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="3"><span style="font-size: 11pt"><input type="submit" value="<s:text name='viplogin8j.jsp.login8j.jsp.665975448'/> " name="login" class="lkbtn" onClick="checkdate();"></span></font></td>
                    </tr>
                    </table>
                    </center>
              </div>
        </form>      
      </td>
    </tr>
  </table>
  </center>
</div></div>
</BODY>
</HTML>
