<%
response.cookies("gopay")=""
%>
<%
if request.cookies("regid")="" then
   session.timeout=30
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż�������������µ�¼��');"
   response.write "window.location.replace('logtgs.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")   
end if
%>
<!--#include file="../shopmfh.asp"-->
<%
sql2="select * from cfuser where username = '"&regid&"'" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn1,1,1
if rs2("jhtj")*100>rs2("jhstop")*10000 then
   stop0="�Ѽ���������ֵ����10��"
   stop1="readonly"  
end if
%>
<%
sql3="select count(bzok) as jhpd from mgmid where up = '"&regid&"' and bzok=1 " 
Set rs3= Server.CreateObject("ADODB.Recordset") 
rs3.open sql3,conn0,1,1
%>
<%
sql4="select count(lqcg) as pdcg from mgmid where up = '"&regid&"' and lqcg=2 " 
Set rs4= Server.CreateObject("ADODB.Recordset") 
rs4.open sql4,conn0,1,1
%>
<%
sql5="select count(bzok) as mpd from mgmid where up = '"&regid&"' and bzok=0 " 
Set rs5= Server.CreateObject("ADODB.Recordset") 
rs5.open sql5,conn0,1,1
%>
<%
Function getCode(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "01234567890abcqxyzstji"
     k=Len(arrChar)
     Randomize
     For i=1 to iCount
          j=Int(k * Rnd )+1
          strCode = strCode & Mid(arrChar,j,1)
     Next
     getCode = strCode
End Function
%>
<html>
<title>��ʾ������¼</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<LINK 
href="adminstyle.css" type=text/css rel=StyleSheet>
</head>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
</SCRIPT>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.pdid.value=="") {      alert("���ѱ�Ų���Ϊ��!");      return false;    } 
  if (Form.pdpa.value=="") {      alert("��¼���벻��Ϊ��!");      return false;    }  
  if (Form.fwid.value=="") {      alert("��α���벻��Ϊ��!");    return false;    } 
  if (Form.sfz.value==0) {      alert("��������鿴������Э�飬ֻ��ͬ���ſ��Լ���!");      return false;    }
  return true;  }  
 </script>
<%
   const MaxPerPage=50
   dim totalPut   
   dim CurrentPage
   dim TotalPages
   dim i,j

   if not isempty(request("page")) then
      currentPage=cint(request("page"))
   else
      currentPage=1
   end if
   
%>

<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<div align="center">

  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">��</p>
	<table border="0" width="35%" id="table12" height="38" bgcolor="#FFFFA4">
		<tr>
			<td>
			<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<b><a href="../gg.asp" style="text-decoration: none">
			<font color="#FF0000">�����¹������鿴</font></a></b></td>
		</tr>
	</table>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">��</p>

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="35" bgcolor="#FFE1FF">
	<p align="center" style="margin-top: 0; margin-bottom: 0; line-height:150%">
	<span style="background-color: #FFFFFF">
	<font size="4" color="#008000">�����û���(�ƹ��̱��)Ϊ </font><font size="4"><b><font color="#FF0000"><%=regid%> </font></b>
	</font></span><b><font size="4"><%if rs2("jb")=1 then%><font color="#FF0000">(�����̼�)</font><%elseif rs2("jb")=2 then%><font color="#008000">(ʡ�����۵�)</font><font color="#0000FF"><%elseif rs2("jb")=3 then%></font><font color="#FF00FF">(�м����۵�)</font><font color="#0000FF"><%elseif rs2("jb")=4 then%></font><font color="#800000">(�������۵�)<%elseif rs2("jb")=5 then%></font><font color="#000080">(�򼶴��۵�)</font><font color="#0000FF"><%else%>(ҵ��Ա)<%end if%></font></font></p>
</b>
		</td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84">
	<div align="center">
			<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">��</p>
			<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000080"><span style="font-size: 11pt">����������ѡ��������ѣ��ֹ涨ÿ���˺��ݶ�����ۼƼ���������ֵ50000Ԫ������Ҫ��߿���ϵ���ش����˾�����������Ѷ</span></font></p>
			<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<font size="2" color="#800000">�ṩ����̼ҵ�Ӫҵִ�ա��̼Ҵ���Э�顢��10���ڣ�������Ʒ���վݻ�Ʊ�͹�˾�ġ��������쿨��¼�������̼ҵ��û����������������Ѷ���û���</font></p>
			<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" color="#800000">--ɨ����ʼĵ���˾��ɨ�������QQ���䣺1832092076@qq.com 2����˾��ַ���㶫ʡ��ɽ���Ϻ�������������·5�� �绰��0757-88739272 �ռ��ˣ���С��</font></p>
			<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">��</p>
			<table border="0" width="51%" id="table8" cellspacing="1" height="203" bgcolor="#FFFFFF">
				<tr>
					<td height="201">

<table width="619" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table9">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="615" style="color: #304618; font-size: 12px"> 
      <form method="POST" align="center" action="chklogin.asp" name="Form" onSubmit="return checkdate()">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="503" border=0 cellPadding=3 cellSpacing=1 id="table10" height="164">
  <TBODY>

    <TR class=content> 
      <TD width="177" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="29">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3" color="#000000">���ѱ�ţ�</font></b></TD>
      <TD width="311" bgColor=#ffffff style="color: #304618; font-size: 12px" height="29">  
              <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">  
              <font size="2"><span style="font-size: 9pt">  
              <font size="3">  
              <input type="text" maxlength="20" name="pdid" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=stop0%>" <%=stop1%>></font></span></font></TD>
    </TR>
    <TR class=content> 
      <TD width="177" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="28">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3" color="#000000">��¼���룺</font></b></TD>
      <TD width="311" bgColor=#ffffff style="color: #304618; font-size: 12px" height="28">  
              <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">  
              <font size="2"><span style="font-size: 9pt">  
              <font size="3">  
              <input type="text" maxlength=15 name="pdpa" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></font></span></font></TD>
    </TR>
    <TR class=content> 
      <TD width="177" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="29">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3" color="#000000">��α���룺</font></b></TD>
      <TD width="311" bgColor=#ffffff style="color: #304618; font-size: 12px" height="29">  
              <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">  
              <font size="2"><span style="font-size: 9pt">  
              <font size="3">  
              <input type="text" maxlength=15 name="fwid" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" <%=call0%>></font></span></font></TD>
    </TR>
    <TR class=content> 
      <TD width="495" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" colspan="2" height="53">
		<table border="0" width="82%" id="table11" cellspacing="0" cellpadding="0" height="37">
			<tr>
				<td>
				<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" color="#FF0000">
				<select size="1" name="sfz">
				<option selected value="0">==��ѡ���Ƿ�ͬ��������Э��==</option>
				<option value="0">��ͬ�⣬�Ҳ���ȴ�����Ҫ�ѿ�����...</option>
				<option value="1">ͬ��Э�飬���Ѿ����Լ���Ҫ�Ĳ�Ʒ��</option>
				</select>
				<a href="javascript:openwindow('../sfz.asp')" style="text-decoration: none; font-weight: 700"><font color="#008000" size="3">�鿴������Э��</font></a></font></td>
			</tr>
		</table>
		</TD>
    </TR>
    <TR class=content> 
      <TD width="495" bgColor=#ffffff align="center" style="color: #304618; font-size: 12px" colspan="2">
              <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
              <INPUT class=normalButton type=submit value="ȷ ��" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
					</td>
				</tr>
			</table>
			</div>
</tr> 
</table> 
</div> 
</body> 
</html>