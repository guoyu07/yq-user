<%
if request.cookies("regid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<!--#include file="../ct0618.asp"-->
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&regid&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<html>
<title>������Ϸ</title>
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
    document.getElementById("mTitle").innerHTML="��ҳ";
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
  if (Form.cjpay.value=="") {      alert("��������Ҫ��ֵ������!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("��ֵ��������Ϊ��!");      return false;    }
  if (!chkinteger(Form.cjpay.value)){
	alert('��ֵ����ֻ��Ϊ����!');
	document.Form.cjpay.focus;
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
  if (Form.cjpay.value<100) {      alert("ÿ�γ�ֵ����С��100����!");      return false;    }
  if (Form.cjpay.value><%=rs("jyg")%>) {      alert("��ĳ�ֵ�������ܴ�����ʣ������� <%=rs("jyg")%> Ŷ!");      return false;    } 
  if (Form.pa3.value=="") {      alert("�����������������!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("�������벻��ȷ!");      return false;    }
  return true;  }  
 </script>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>��</LI>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">������Ϣ</A> </LI>
  <LI><A>ҵ����ѯ</A> 
  </LI>
  <LI><A>�������</A> 
  </LI>
  <LI><A>��Ϣ����</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">�˳�ϵͳ</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>��ǰλ�ã�<SPAN id=mTitle>��ҳ</SPAN></DIV></DIV></DIV>
<DIV class=box_title>�� �� �� Ϸ</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
        <p align="center">
		<strong><font size="6" color="#000000">�� �� �� Ϸ</font></strong><p align="center">
		��<p align="center">
		<img border="0" src="images/02.png" width="926" height="238"><p align="center">
		��<p align="center">
		<a href="http://p.cfjte.com/GameInfo.html"><font color="#FF0000" size="3">������Ϸ����</font></a><font size="3">&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000">&nbsp;<a href="http://p.cfjte.com/FaqList.html"><font color="#FF0000">��������</font></a>&nbsp;&nbsp;&nbsp;&nbsp; </font> </font>
		<p align="center">
		��<p align="center">
		<font size="3"><font color="#008000"><b>��ʾ��</b></font><font color="#FF0000"><a target="_blank" href="http://p.cfjte.com/download/������Ϸ����.exe"><font color="#0000FF">�״���Ϸ����������Ϸ��������װ</font></a></font></font><font color="#FF0000" size="3">��ʹ��<a target="_blank" href="http://ie.sogou.com"><font color="#800000">�ѹ������</font></a>�����ٶ���ѣ�</font><p align="center">
		��<p align="center">
		<font size="3">��Ϸǰ�ȳ�ֵ ��ǰ��Ϸ�û����ǣ�<b><font color="#FF00FF"><%=regid%></font></b>&nbsp;&nbsp; ƽ̨�ܻ���Ϊ��<b><font color="#008000"><%=rs("jyg")%></font></b></font><p align="center">
		��<form method="POST" action="jtgameok.asp" name="Form" onSubmit="return checkdate()" >
			<div align="center">
				<table border="0" width="59%" id="table1" height="87">
					<tr>
						<td align="right" width="278"><font size="3">��Ҫ��ֵ����Ϸ�˻���</font></td>
						<td><input type="text" name="cjpay" size="20"></td>
					</tr>
					<tr>
						<td align="right" width="278"><font size="3">�������룺</font></td>
						<td><input type="password" name="pa3" size="20"></td>
					</tr>
				</table>
			</div>
			<p align="center">��</p>
			<p align="center">
			<input type="submit" value="�ύ" name="B1" onClick="return confirm('��ʾ����ȷ������')" style="font-size: 12pt" ></p>
		</form>
		<p align="center">
		��<p align="center">
		<font size="2">
		<a target="_blank" href="http://p.cfjte.com/Default.html">�ݲ���ֵ��</a></font><p align="center">
		��<p align="center">
		��</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
</body> 
</html>