<%
if request.cookies("regid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")   
end if
%>
<!--#include file="../ct0618.asp"-->
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gpjy where Now()>dqdate+0.001 and jy=2"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("jy")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
rsTest.close
Set rsTest=Nothing
%>
<html>
<title>���ֽ����г�</title>
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
<DIV class=box_title>�� �� �� �� �� ��</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="80">
    <tr>
      <td width="100%" height="25"><p align="center"><strong><font color="#000000" size="6">�� �� �� �� �� ��</font></strong><font size="4"><b><font color="#0000FF">��ǰ���׼��� </font><font color="#FF0000"><%if rs1("jygj")<1 then%>0<%=rs1("jygj")%><%else%><%=rs1("jygj")%><%end if%></font></b></font><p align="center">
��<p align="center"> </td> 
  </tr>
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="80">
	<div align="center">
		<table border="1" width="85%" id="table1" bgcolor="#404020" bordercolor="#000000" height="60">
			<tr>
				<td align="center" width="160" bgcolor="#FFFFFF" rowspan="2"><font color="#800000" face="����"><b><a href="mcsl.asp" style="text-decoration: none; background-color:#FFFFFF"><font color="#800000" style="font-size: 16pt">��������</font></a></b></font></td>
				<td align="center" width="100"><b><font color="#FFFF00" style="font-size: 11pt">���̼�</font></b></td>
				<td align="center" width="100"><font color="#FFFF00" style="font-size: 11pt"><b>��߼�</b></font></td>
				<td align="center" width="100"><font color="#FFFF00" style="font-size: 11pt"><b>��ͼ�</b></font></td>
				<td align="center" width="100"><font color="#FFFF00" style="font-size: 11pt"><b>�ּ�</b></font></td>
				<td align="center" width="100"><font color="#FFFF00" style="font-size: 11pt"><b>���׷�Χ</b></font></td>
				<td align="center" width="160" bgcolor="#FFFFFF" rowspan="2"><font color="#000000" face="����"> <a href="mysl.asp" style="text-decoration: none; font-weight:700; background-color:#FFFFFF"><font color="#FF0000" style="font-size: 16pt">��������</font></a></font></td>
			</tr>
			<tr>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">0.77</span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700"><%if rs1("zgj")+0.03<1 then%>0<%=rs1("zgj")+0.03%><%else%><%=rs1("zgj")+0.03%><%end if%></span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">0<%=rs1("zdj")%></span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700"><%if rs1("jygj")<1 then%>0<%=rs1("jygj")%><%else%><%=rs1("jygj")%><%end if%></span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700"><%if rs1("zgj")+0.03<1 then%>0<%=rs1("zgj")+0.03%><%else%><%=rs1("zgj")+0.03%><%end if%>/0<%=rs1("zdj")%></span></font></td>
			</tr>
		</table>
	</div>
	<p align="center"><font size="2">�������ѣ������г���������ӻ��ֵ��ۻ��Ȳ����ǣ���һ��ʱ���֡�</font><table border="0" width="100%" id="table2" cellpadding="2">
		<tr>
			<td align="center"><iframe name="I1" marginwidth="1" marginheight="1" width="100%" height="1250" align="center" border="0" frameborder="0" src="gpjymc.asp" scrolling="no" ></iframe></td>
			<td align="center"><iframe name="I2" marginwidth="1" marginheight="1" width="100%" height="1250" align="center" border="0" frameborder="0" src="gpjymy.asp" scrolling="no" ></iframe></td>
		</tr>
	</table>
</tr> 
</table> 
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
</body>
<meta http-equiv=Refresh content="120; url=">
</html>