<!--#include file="../ct0618.asp"-->
<%
if request.cookies("lktojb")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�Ѳ����������µ�¼��');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
elseif request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
gmsl=request("gmsl")
gmmj=request("mj")
dlsy=request("gmsl")*request("mj")
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("pay")<15 then
   response.write"<script>alert('ע�⣺����һ��С��15�����ֵ��');history.go(-1);</script>"
   response.end
elseif rs("pay")<dlsy*1.5 then
   response.write"<script>alert('ע�⣺����һ�Ҳ������ι��������ֵ��');history.go(-1);</script>"
   response.end
end if
%>
<div align="center">
��<p>��</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">�����ڲ�������</font><font style="font-size: 20pt; font-weight: 700" color="#008000">һ��ת�����ӽ�ҿ�</font><font style="font-size: 20pt; font-weight: 700" color="#800000">¼��</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">������ȷ��һ�¹�����Ƿ�</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#FF0000"><%=gmsl%>��</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF">��ֵ<%if request("mj")=10 then %>10��ң�15һ��/�ţ�<%elseif request("mj")=50 then %>50��ң�75һ��/�ţ�<%elseif request("mj")=100 then %>100��ң�150һ��/�ţ�<%elseif request("mj")=300 then %>300��ң�450һ��/�ţ�<%elseif request("mj")=500 then %>500��ң�750һ��/�ţ�<%elseif request("mj")=1000 then %>1000��ң�1500һ��/�ţ�<%end if%></font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">��Ҫ</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF"><%=dlsy*1.5%>һ��</font><font style="font-size: 20pt; font-weight: 700" color="#800000">�ֽ�</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">=</font><font style="font-size: 20pt; font-weight: 700" color="#008000"><%=dlsy/10%>��</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">��ֵ10��ҵĿ�</font><font style="font-size: 20pt; font-weight: 700">�ۼƽ��<%=dlsy%>��</font></p>
<p>��</p>
<p><a onClick="return confirm('��ʾ����ȷ������ ')" href="jztojb4.asp?mj=<%=request("mj")%>&jbpay=<%=dlsy%>&lksl=<%=gmsl%>">
<input type="button" value="ȷ�����ҵ�һ��-�۳�" name="B1" onclick=disabled=true style="font-size: 12pt; color: #0000FF; font-weight: bold"></a> </p>
<p>��<p>  <b><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һ��</font></a></div>