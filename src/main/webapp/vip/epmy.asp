<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="cfvip.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("ep")
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from txpay where payid ="&jybh&""
rs_mc.open sql_mc,conn1,2,3
txpay=rs_mc("paynum")
fbuser=rs_mc("payusername")
paybank=rs_mc("paybank")
%>
<%
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
Set rs = conn2.execute(sql)
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���������˫����ң���ʱ����ʹ��һ����ƹ��ܣ�');"
   response.write "location.replace('vipup.asp?my="&username&"');"
   response.write "</script>" 
   response.end
elseif rs("sjb")+0<20 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�����û�ﵽD�ײͣ���ʱ����ʹ��һ����ƹ��ܣ�\n\n��������ϵ�Ŷӷ���������95%�ļ۸���һ�Һ���в�����');"
   response.write "location.replace('vipup.asp?my="&username&"');"
   response.write "</script>" 
   response.end
elseif rs("cxt")<4 and rs("cxdate")>date() then
   response.write "<script language='javascript'>"
   response.write "alert('���ã����ĳ�����Ϊ"&rs("cxt")&"����ȡ��[�����Ϲ�]ʱ�仹��"&rs("cxdate")-date()&"�죬лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("username")=fbuser then
   response.write "<script language='javascript'>"
   response.write "alert('���ã������Ϲ��Լ���һ�ң���ѡ�������û���лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jyg")+0<txpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã����Ļ�����������"&txpay&"���Ϲ�һ����Ϊ���Ž𣩣���ʱ����ʹ��һ����ƹ��ܣ�\n\n��������ϵ�Ŷӷ���������95%�ļ۸���һ�Һ���в�����');"
   response.write "location.replace('vipup.asp?my="&username&"');"
   response.write "</script>" 
   response.end
else
   dqu=rs("dqu")
   password3=rs("password3")
end if
rs.close
set rs=Nothing
%>
<%
if dqu="0" or dqu="7" or dqu="2" or dqu="8" then
   cz01="�й�һ�����ٺš��ͷ�QQ��613697151"
   qq=613697151
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="�й�һ�����ںš��ͷ�QQ��613697152"
   qq=613697152
end if
%>
<%
if rs_mc("ep")>0 or rs_mc("zftime")<>"" or rs_mc("kjygid")<>0 then
   response.Write "<script language=javascript>alert('��һ�ҽ��׽����л��Ѿ������˽��׳ɹ��ˣ������ظ�����ѡ���������ף�');location.href='epjysc.asp'</script>"
   response.end
else
   rs_mc("ep")=1
   rs_mc("rgdate")=now()
   rs_mc.update
   rs_mc.close
   set rs_mc=Nothing
end if
conn1.close
set conn1=nothing
conn2.close
set conn2=nothing
%>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
  function checkdate()  { 
  if (Form.epnm3.value=="") {      alert("�����������������!");      return false;    } 
  if (hex_md5(Form.epnm3.value) !=="<%=md5(password3)%>") {      alert("�������벻��ȷ!");      return false;    }
  return true;  }  
 </script>
<p align="center">��</p>
<p align="center">���ν��׵���ʱ��ʣ<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> �룬��ʱûȷ�Ͻ����Զ�ȡ���ý��ף�</p>
<p align="center">��</p>
<p align="center"><font size="6">�����Ϲ�һ������Ϊ��<font color="#FF0000"><%=txpay%></font></font><b><font color="#FF00FF" size="5" face="����">-�����ӵ����ġ�һ��-��</font></b></p>
<p align="center"><b><font color="#800000" face="����" style="font-size: 20pt">ʵ��ֻ��Ҫ�򷢲���</font><font color="#000080" face="����" style="font-size: 20pt"><%=fbuser%></font><font color="#800000" face="����" style="font-size: 20pt">֧����</font><font color="#FF0000" face="����" style="font-size: 20pt"><%=txpay*0.9%></font><font face="����" style="font-size: 20pt">Ԫ</font></b></p>
<div align="center">
	<table border="0" width="80%" id="table1" cellspacing="1" bgcolor="#EFEFEF" height="135">
	<tr>
	<td><b><font color="#FF0000">��Ҫ��ʾ��</font><font color="#0000FF">(������ʹ�õ��տʽ�ǡ�</font><font color="#008000"><%=paybank%></font><font color="#0000FF">��)</font></b><p>
	�����µ����������û���(�Ϲ���)��<b><font color="#008000"><%=username%> </font></b>�Ļ����˻��ݿ�<b><font color="#FF0000"><%=txpay%></font></b>��Ϊ���ν��׳��Ž�<p>
	�µ��ɹ�������ڡ�<font color="#FF0000">2Сʱ</font>�����򷢲���<font color="#0000FF"><%=fbuser%></font>��ָ�������˺Ŵ��벻����<b><font color="#FF0000"><%=txpay*0.9%></font></b>Ԫ��ͬʱ�ڵ�¼ƽ̨�㡰һ��-��ơ��¡��Ϲ���ϸ���鿴�ñʽ���״̬-������<font color="#0000FF"><%=fbuser%></font>�տ��˺ţ������С����Ѹ���<b><font color="#FF0000"><%=txpay*0.9%></font></b>-֪ͨ������ȷ�ϡ��Ĳ�����</td>
	</tr>
	</table>
<table border="0" width="80%" id="table2" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
			<td align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">������ע���û�ʱѡ��ĵ���������������Ϊ���ṩ����ķ�������߰���Ч�ʣ�</span></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">���κ�������������ϵ��<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"></a></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">�����ŷ���������Ա�ֹ���һ���˲����ظ����ϣ���������ÿ����ͬһʱ����ѯͬһ������</font></td>
		</tr>
		</table>
	</div>
<p align="center">��</p>
<form method="POST" action="epmyok.asp?ep=<%=jybh%>"  name="Form" onSubmit="return checkdate()">
	<div align="center">
		<table border="0" width="56%" id="table3">
			<tr>
				<td align="center"><p align="right"><span style="font-size: 11pt">�Ϲ���<font color="#FF0000"><%=username%></font>�Ķ������룺</span></td>
				<td align="center" width="160"><span style="font-size: 11pt"><input type="password" name="epnm3" size="20"></span></td>
				<td align="center" width="189"><input type="submit" value="ȷ������" name="B1" style="font-size: 11pt; color: #0000FF; font-weight: bold; float:left"></a></td>
			</tr>
		</table>
	</div>
</form>
<p align="center">��</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('��ʾ����ȷ��ȡ�����ν����� ')" href="qxepjy.asp?ep=<%=jybh%>"><font color="#008000">���ؽ����г�</font></a></b></p>
<p align="center">��</p>
<script>
var secs = 60;  //6Ϊ����ʱ����
for(i=0;i<=secs;i++) {
   window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
if(num == secs) {
   window.location="qxepjy.asp?ep=<%=jybh%>";  //2.htmΪ��ʱ��ת��ҳ��URL
}
else {
 printnr = secs-num;
 document.getElementById('sec').innerHTML = printnr;
}
}
</script>