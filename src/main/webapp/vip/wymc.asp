<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
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
   jybh=request("id")
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from gpjy where id ="&jybh&""
rs_mc.open sql_mc,conn2,2,3
mypay=rs_mc("jypay")
mcsl=rs_mc("mysl")
dqpay=mypay*0.9
mc70a=0.7*dqpay
mc70=int(mc70a*1+0.1)/1
mc30a=0.3*dqpay
mc30=int(mc30a*1+0.1)/1
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("bddate")+100>Now() and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('δ��100����˻���������ʱֹͣ�������ף�������ɺ��Զ����ţ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jyg")+0<0 or rs("jyg")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã����׻����������㣬лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif mcsl+0>rs("jyg") or rs("jyg")<1 then
   response.Write "<script language=javascript>alert('���ã����ν��׻�������������ʣ��������� "&rs("jyg")&" ����ʱ���ܽ��ף����ν�����Ҫ "&mcsl&" ���֣�лл��');location.href='gpjysc.asp'</script>"
   response.end
end if
%>
<%
if rs_mc("jy")>1 or rs_mc("cgdate")<>"" then
   response.Write "<script language=javascript>alert('�ùɽ��׽����л��Ѿ������˽��׳ɹ��ˣ������ظ�����ѡ���������ף�');location.href='gpjysc.asp'</script>"
   response.end
else
   rs_mc("jy")=2
   rs_mc("dqdate")=now()
   rs_mc.update
end if
%>
<script>
</script>
<p align="center">��</p>
<p align="center">���ν��׵���ʱ��ʣ<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> �룬��ʱûȷ�Ͻ����Զ�ȡ���ý��ף�</p>
<p align="center">��</p>
<p align="center"><font size="6">�����������׻�������Ϊ��<font color="#FF0000"><%=mcsl%></font></font></p>
<p align="center"><font size="5">���������˻���۳���<b><font color="#FF0000"><%=mcsl%></font></b></font><font size="6">����</font></p>
<div align="center">
	<table border="0" width="52%" id="table1" cellspacing="1" bgcolor="#E6E6E6" height="210">
	<tr>
	<td><b><font size="4"><font color="#FF0000"><%=tgpay%></font>�����ǣ�<font color="#FF0000"><%if rs_mc("pay")<1 then%>0<%=rs_mc("pay")%><%else%><%=rs_mc("pay")%><%end if%>&nbsp; </font>�ܶ�Ϊ��<font color="#FF0000"><%=rs_mc("jypay")%></font></font><font size="4" color="#800000"> </font></b>
	<p><b><font size="4" color="#800000">�����ɹ���</font></b></p>
	<p><b><font size="4">�۳�10%�������������õ���<font color="#800080"><%=dqpay%></font> һ��</font></b></p>
	<p><b><font size="4">����70%���䵽һ���˻���<font color="#800080"><%=mc70%></font> һ��</font></b></p>
	<p><b><font size="4">����30%���䵽����˻���<font color="#800080"><%=mc30%></font></font></b></p>
	</td>
	</tr>
	</table>
	</div>
<p align="center"><a onClick="return confirm('��ʾ����ȷ������')" href="mcok.asp?jyg=<%=mcsl%>&id=<%=jybh%>"><input type="button" value="ȷ������" name="B1" onclick=disabled=true style="font-size: 14pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">��</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('��ʾ����ȷ��ȡ�����ν����� ')" href="qxjy.asp?id=<%=jybh%>"><font color="#008000">���ؽ����г�</font></a></b></p>
<p align="center">��</p>
<%
Rs.close
Set Rs=Nothing
Rs_mc.close
Set Rs_mc=Nothing
conn2.close
set conn2=nothing
conn7.close
set conn7=nothing
%>
<script>
var secs = 30;  //6Ϊ����ʱ����
for(i=0;i<=secs;i++) {
   window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
if(num == secs) {
   window.location="qxjy.asp?id=<%=jybh%>";  //2.htmΪ��ʱ��ת��ҳ��URL
}
else {
 printnr = secs-num;
 document.getElementById('sec').innerHTML = printnr;
}
}
</script>