<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   dquser=request.cookies("regid")
   password=request.cookies("password")
   myid=request("my")
end if
%>
<%
set rsb = Server.CreateObject("ADODB.Recordset")
sqlb="select * from gcuser where username ='"&dquser&"'"
rsb.open sqlb,conn2,1,1
if myid<>dquser then
   response.write "<script language='javascript'>"
   response.write "alert('�������������µ�¼��');"
   response.write "top.location.replace('login.asp');"  
   response.write "</script>"
   response.end
end if
%>
<%
Dim allName
allName=myid
Call CalculateQ(allName,myid)
Function CalculateQ(allName,userName)
	set rs_Calculate = Server.CreateObject("ADODB.Recordset")
	sql_Calculate = "SELECT * FROM gcuser where username = '"&userName&"'"	
	rs_Calculate.open sql_Calculate,conn2,1,1
	
	If rs_Calculate.eof Or rs_Calculate.bof Then
	rs_Calculate.close()
	'Response.write "û������<br>"
	Exit Function
	End If
	
	if rs_Calculate("username")=userName Then
	if rs_Calculate("vip")=1 Then
	allName=rs_Calculate("username")
	Exit Function
	End if  
	Call CalculateQ(allName,rs_Calculate("up"))
    'rs_Calculate.close()
	Else
	'rs_Calculate.close()
	'Response.write "������߼�<br>"
	Exit Function'������߼�
	End if
 
End Function
'Response.write allName
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&allName&"'"
rs.open sql,conn2,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jzpay.value=="") {      alert("����д��Ҫת�˵�һ��!");      return false;    } 
  if (Form.jzpay.value<99) {      alert("ת�˵�һ�ұ�����ڵ���100!");      return false;    } 
  //if (Form.indexOf(jzpay/100,".").value!==0) {      alert("ÿ��ת�˵�EP������100�ı������磺100��200��300��400��500!");      return false;    } 
  if (Form.jzpay.value><%=rsb("pay")*0.05+rsb("pay")%>)    {   alert("����ת��һ�Ҳ��ܳ�����ʣ���һ�� <%=rsb("pay")%> ��5%�ķ���ѣ�");      return false;    } 
  if (Form.jzuser.value=="<%=dquser%>") {      alert("����ת���Լ�!");      return false;    }
  if (Form.pa3.value=="") {      alert("�����������������!");      return false;    } 
  if (Form.pa3.value!=="<%=rsb("password3")%>") {      alert("�������벻��ȷ!");      return false;    }
  if (Form.vipsq.value=="") {      alert("����д��Ȩ��!");      return false;    }
  if (!chkinteger(Form.jzpay.value)){
	alert('ת��һ��ֻ��Ϊ����!');
	document.Form.jzpay.focus;
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
<title>�Ŷӷ���������ϵ</title>
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
</head>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>��</LI>
  <LI><A>������Ϣ</A> </LI>
  <LI><A>ҵ����ѯ</A> </LI>
  <LI><A>�������</A> </LI>
  <LI><A>��Ϣ����</A> </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">�˳�ϵͳ</A> </LI>
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>��ǰλ�ã�<SPAN id=mTitle>��ҳ</SPAN></DIV></DIV></DIV>
<DIV class=box_title>һ �� �� �� �� ϸ</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <div align="center">
	<table border="0" width="60%" id="table1" height="209" cellspacing="3" cellpadding="2">
		<tr>
			<td align="right" width="32%">�Ŷӷ������ı�ţ�</td>
			<td width="66%"><font color="#FF0000"><%=left(rs("username"),2)%>***</font></td>
		</tr>
		<tr>
			<td align="right" width="32%">��ν��</td>
			<td width="66%"><font color="#0000FF"><%=rs("name")%></font></td>
		</tr>
		<tr>
			<td align="right" width="32%">��ϵQQ��</td>
			<td width="66%"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=rs("qq")%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=rs("qq")%>:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"></a><%=rs("qq")%></td>
		</tr>
		<tr>
			<td align="right" width="32%">��ϵ�绰��</td>
			<td width="66%"><%=rs("call")%></td>
		</tr>
		<tr>
			<td align="right" width="32%">�տ��˺ţ�</td>
			<td width="66%"><%=rs("bank")%>-<%=rs("card")%></td>
		</tr>
		<tr>
			<td><p align="right">���������ڵأ�</td>
			<td><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%>֧��</td>
		</tr>
		<tr>
			<td colspan="2"><p><b><font size="2" color="#008000">&nbsp;&nbsp;&nbsp; �й�ҵ���������ѯ�������޷���һ���г������չ�EP�Ĳ���������ʡȥ���չ�һ���У����ȶԷ�ȷ�ϣ����м价�ڣ��Ϳ�����ϵ���Ŷӷ������Ŀ��ٹ��򣨰�1000һ�ң�����950Ԫ�ı������У�</font></b></td>
		</tr>
	</table>
	<form method="POST" name="Form" action="vipupok.asp" onSubmit="return checkdate()">
		<p>��</p>
		<p><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">ת�˸��Ŷӷ�������</font></p>
		<table border="0" width="75%" id="table2" height="249">
			<tr>
				<td align="right" colspan="2" height="151" bgcolor="#E1FFE1">
				<p align="left"><font size="3" color="#0000FF">˵����</font></p>
				<p align="left"><font size="2">�˹��ܿ���ͨ���Ŷӷ������İ�����һ��ת������Ҫ�������û����ϣ������Ŷ������ڣ�����Ҫ֧������������5%�Ĳ�������ѣ�����ת��������������1000һ����Ҫ��A�û���ת��B�û���������¼A�û���������������������ת1000һ�ң�ϵͳ�Զ��۳�50һ�ң�������A�û�������һ��1050һ��֧�����Ŷӷ������ģ�50һ�Ҽ�5%��Ϊ���ķ���ѣ��������յ����漴ת1000һ�ҵ�B�û�����B�û���ʵ���յ�1000һ�ң�������̾������������Ҫ��Ч������</font></p>
				<p align="left"><font size="3" color="#0000FF">��ʾ��</font></p>
				<p align="left"><font size="2">һ���ɷ�������ת����һ���ǲ�������������ֻ�����ڿ���������������İ���ת��1000һ�ҵ�B�û�������B�û����յ�����1000һ�ҽ����ܷ���������һ�ҽ����г���</font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="����" size="2">�ӱ�����<%=dquser%>��ת��һ��������</font></td>
				<td width="58%"><font face="����"><input type="text" name="jzpay" size="20"><input type="hidden" name="jzuser" size="20" value="<%=rs("username")%>" readonly></font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="����" size="2">������<%=dquser%>���Ķ������룺</font></td>
				<td width="58%"><font face="����"><input type="password" name="pa3" size="20"></font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="����" size="2">�Ŷӷ���������Ȩ�룺</font></td>
				<td width="58%"><font face="����"><input type="text" name="vipsq" size="20"><font size="2">����ϵ������ȡ</font></font></td>
			</tr>
		</table>
		<p>��</p>
		<p><input type="submit" value="�ύ" name="B1"></p>
	</form>
	<p>��</div>
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
</body> 
</html>