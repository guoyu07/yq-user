<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�Ѳ����������µ�¼��');"
   response.write "window.location.replace('logout.asp');"
   response.write "</script>"
   response.end   
end if
%>
<%
gmsl=request("gmsl")
gmmj=request("mj")
%>
<%
lkid=request("lkid")
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from gcuser where username ='"&lkid&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���û������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if 
%>
<%
'response.redirect"dlbd006.asp?lkid="&lkid&"&mj="&gmmj&""
%>
<p>��</p>
<p>��</p>
<div align="center">

<font style="font-size: 20pt; font-weight: 700" color="#800000">�����ڲ�������</font><font style="font-size: 20pt; font-weight: 700" color="#008000">�������ӽ�ҿ�</font><font style="font-size: 20pt; font-weight: 700" color="#800000">¼��</font><p><font style="font-size: 20pt; font-weight: 700" color="#800000">������ȷ��һ�²������Ƿ�</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#FF0000"><%=gmsl%>��</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF">��ֵ<%if request("mj")=10 then %>10��ң�15Ԫ/�ţ�<%elseif request("mj")=50 then %>50��ң�75Ԫ/�ţ�<%elseif request("mj")=100 then %>100��ң�150Ԫ/�ţ�<%elseif request("mj")=300 then %>300��ң�450Ԫ/�ţ�<%elseif request("mj")=500 then %>500��ң�750Ԫ/�ţ�<%elseif request("mj")=1000 then %>1000��ң�1500Ԫ/�ţ�<%end if%></font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">���յ�</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF"><%=dlsy*1.5%>Ԫ</font><font style="font-size: 20pt; font-weight: 700" color="#800000">�ֽ�</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">=</font><font style="font-size: 20pt; font-weight: 700" color="#008000"><%=dlsy/10%>��</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">��ֵ10��ҵĿ�</font><font style="font-size: 20pt; font-weight: 700">�ۼƽ����ֵ<%=dlsy%>��</font></p>
<p>��</p>
<p>��</p>
<p><a onClick="return confirm('��ʾ����ȷ������')" href="xtbfk006.asp?lkid=<%=lkid%>&mj=<%=request("mj")%>&lksl=<%=gmsl%>"><input type="button" value="ȷ������" name="B1" onclick=disabled=true style="font-size: 24pt; color: #0000FF; font-weight: bold"></a></p>
<p>��</p>
<p><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF0000" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>

</div>
