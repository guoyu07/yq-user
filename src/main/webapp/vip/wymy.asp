<!--#include file="../ct0618.asp"-->
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
'dim rs1,sql1
'set rs1 = Server.CreateObject("ADODB.Recordset")
'sql1="select * from fcxt where id =2 "
'rs1.open sql1,conn2,1,1
'if rs1("jygj")>1.18 then
   'response.write "<script language='javascript'>"
   'response.write "alert('ϵͳ����ڼ���ͣ���ף�Ԥ����Ҫһ��ĵ����ڣ���ֺ�ָ�������');"
   'response.write "history.go(-1);"
   'response.write "</script>" 
   'response.end
'end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where id ="&jybh&""
rs_my.open sql_my,conn2,2,3
mypay=rs_my("jypay")
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
elseif rs("jydb")+0<0 or rs("jydb")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�������㣬���ֵ��ת����ң�лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif mypay+0>rs("jydb") or rs("jydb")<1 then
   response.Write "<script language=javascript>alert('���ã�������Ҫ���׽�� "&mypay&" ������ʣ���� "&rs("jydb")&" ����ʱ���ܽ��ף����ֵ��ת����ң�лл��');location.href='gpjysc.asp'</script>"
   response.end
end if
%>
<%
if rs_my("jy")>1 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('�û��ֽ��׽����л��Ѿ������˽��׳ɹ��ˣ������ظ�����ѡ���������ף�');location.href='gpjysc.asp'</script>"
   response.end
else
   rs_my("jy")=2
   rs_my("dqdate")=now()
   rs_my.update
end if
%>
<p align="center">��</p>
<p align="center">���ν��׵���ʱ��ʣ<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> �룬��ʱûȷ�Ͻ����Զ�ȡ���ý��ף�</p>
<p align="center">��</p>
<p align="center"><font size="6">����������Ҫ���Ϊ��<font color="#FF0000"><%=mypay%></font></font></p>
<p align="center"><font size="5">�������Ľ��Ǯ���۳���<b><font color="#FF0000"><%=mypay%></font></b></font></p>
<p align="center">��</p>
<p align="center"><a onClick="return confirm('��ʾ����ȷ������')" href="myok.asp?db=<%=mypay%>&id=<%=jybh%>"><input type="button" value="ȷ������" name="B1" onclick=disabled=true style="font-size: 14pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">��</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('��ʾ����ȷ��ȡ�����ν����� ')" href="qxjy.asp?id=<%=jybh%>"><font color="#008000">���ؽ����г�</font></a></b></p>
<p align="center">��</p>
<script>
var secs = 15;  //6Ϊ����ʱ����
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