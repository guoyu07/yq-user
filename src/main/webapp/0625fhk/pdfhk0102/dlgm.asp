<%
if request.cookies("regid")="" or request.cookies("password")="" then
   session.timeout=10
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"logtgs.asp" 
   response.write "</script>" 
   response.end
else
   regid=request.cookies("regid")
end if
%>
<!--#include file="../shopmfh.asp"-->
<%
dluser=request("dl")
add=request("add")
dim sql
dim rs
sql="select * from cfuser where username = '"&regid&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn1,1,1
%>
<%
dim sql1
dim rs1
sql1="select * from cfuser where username = '"&dluser&"'" 
Set rs1= Server.CreateObject("ADODB.Recordset") 
rs1.open sql1,conn1,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmsl.value==0) {      alert("��ѡ����Ҫ���������!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>�������ٷְ١�-��̨����ϵͳ</title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<body bgcolor="#99CCFF">

<div align="center">
<table border="0" width="100%" id="table1" cellspacing="1" height="700">
	<tr>
		<td height="71">
		<p align="center">
	<span style="background-color: #FFFFFF">
	<font color="#008000" style="font-size: 20pt">�����û���(�ƹ��̱��)Ϊ </font><b>
	<font color="#FF0000" style="font-size: 20pt"><%=regid%> </font></b>
	</span><b><font style="font-size: 20pt"><%if rs("jb")=1 then%><font color="#FF0000">(�����̼�)</font><%elseif rs("jb")=2 then%><font color="#008000">(ʡ�����۵�)</font><font color="#0000FF"><%elseif rs("jb")=3 then%></font><font color="#FF00FF">(�м����۵�)</font><font color="#0000FF"><%elseif rs("jb")=4 then%></font><font color="#800000">(�������۵�)<%elseif rs("jb")=5 then%></font><font color="#000080">(�򼶴��۵�)</font><font color="#0000FF"><%else%>(ҵ��Ա)<%end if%></font></font></b></td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">
			<table border="0" width="78%" id="table3" cellspacing="0" height="396" bgcolor="#FFFFFF" cellpadding="0">
				<tr><b><td align="center" width="99%" bgcolor="#FFF4DF" height="28" colspan="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="left"><b><font color="#FF00FF">&nbsp;����ǰ����������</font><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%><%=rs("addzhen")%></b></td>
				</tr>
				<tr><td align="center" width="66%" bgcolor="#FFF4DF" height="28"><p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">&nbsp;���������·�ʽ��ϵ���ǵ�<b><font color="#FF0000"><%=add%></font></b>������۵�</td>
					<td align="center" width="34%" bgcolor="#FFFFFF" height="28"><b><font color="#800000">��ʾ��ÿ�ſ�ͳһ�ۼ�Ϊ10Ԫһ��</font></b></td>
				</tr>
				<tr><td align="center" width="99%" bgcolor="#EEEEEE" height="28" colspan="2"><p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>&nbsp;��ϵ��ַ��<font color="#008000"><%=rs1("addsheng")%><%=rs1("addshi")%><%=rs1("addqu")%><%=rs1("addzhen")%><%=rs1("address")%></font></b></td>
				</tr>
				<tr><td height="28" colspan="2" bgcolor="#EEEEEE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>&nbsp;��ϵ�ˣ�<font color="#0000FF"><%=rs1("name")%></font>&nbsp;&nbsp; ��ϵ�绰��</b><font color="#0000FF"><b><%=rs1("call")%></b></font><b>&nbsp; QQ��</b><font color="#0000FF"><b><%=rs1("qq")%></b></font></td>
				</tr>
				<tr><td height="28" colspan="2" bgcolor="#E1FFE1">&nbsp;��˾ʵ��ͳһ�����淶�г������̼������ϵ���ش��۵㹺�򿨣�</td>
				</tr>
				<tr><td height="45" colspan="2">
<div align="center">
<table width="737" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="31">
  <tr>
    <td align="center" valign="top" width="733" style="color: #304618; font-size: 12px" bordercolor="#669933" height="40"> 
      <b> 
      <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="3"><font color="#800080">���ӿ����������깺���깺��ϵͳ������һ�����ѱ�š���¼���뼰��α���롣</font></p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800080">ʵ�￨ֻ���ڵ��ش��۵㴦���򣬿�����ӡ�����ѱ�š���¼���뼰��α���롣</font></font></td>
    </tr>
  </table>
					</div>
					</td>
				</tr>
				<tr>
					<td height="423" colspan="2">
<table border="0" width="100%" id="table8" cellspacing="1" height="328">
	<tr>
		<b>
		<td height="87"><b>
<img border="0" src="images/tixing.jpg" width="148" height="85"></td>
		<td bgcolor="#ECFFEC" height="87"><b>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font size="4">�ô��۵�Ŀǰʵ�￨����Ϊ<font color="#FF00FF"><%=rs1("dlgmjl")%>��</font></font></p>
		</b>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font color="#FF0000">Ϊ�˸������̼ҵİ�ȫ���ǣ���ʱ�����Թ��򳬹������ֵ��ͬʱҪ����۵�¼�빩����¼��¼���¼�Ա�֤����ʵ�￨����ʵ�ԣ������̼Һʹ��۵���ϡ�</font></td>
	</tr>
	<tr>
		<td colspan="2" height="238">
		<p align="center" style="margin-top: 0; margin-bottom: 0">
		<iframe name="I2" scrolling="no" align="center" border="0" frameborder="0" width="78%" height="210" marginwidth="1" marginheight="1" src="logdl.asp?dl=<%=dluser%>">
		</iframe>
		<p align="center" style="margin-top: 0; margin-bottom: 0"><b><font color="#FF0000">¼���¼�Ա�֤����ʵ�￨����ʵ�ԣ�¼���������ܳ������п�档</font></td>
	</tr>
</table>
					</td>
				</tr>
			</table>
    		</div>
		</td>
	</tr>
</table></div>