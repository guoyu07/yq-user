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
swkmj=request("swkjl")
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
<p>��</p>
<p>��</p>
<div align="center">

<font style="font-size: 20pt; font-weight: 700" color="#800000">�����ڲ�������</font><font style="font-size: 20pt; font-weight: 700" color="#008000">ʵ���ҿ�</font><font style="font-size: 20pt; font-weight: 700" color="#800000">¼��</font><p><font style="font-size: 20pt; font-weight: 700" color="#800000">������ȷ��һ��¼����Ƿ�</font></p>
<p><font style="font-size: 20pt; font-weight: 700">�ۼ��ܽ����ֵ<%=swkmj%>��</font><font style="font-size: 20pt; font-weight: 700" color="#800000">���յ�</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF"><%=swkmj*1.5%>Ԫ</font><font style="font-size: 20pt; font-weight: 700" color="#800000">�ֽ�</font></p>
<p>��</p>
<p>��</p>
<p><a onClick="return confirm('��ʾ����ȷ������')" href="sjswk.asp?lkid=<%=lkid%>&mj=<%=swkmj%>"><input type="button" value="ȷ��¼��" name="B1" onclick=disabled=true style="font-size: 24pt; color: #0000FF; font-weight: bold"></a></p>
<p>��</p>
<p><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF0000" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>

</div>
