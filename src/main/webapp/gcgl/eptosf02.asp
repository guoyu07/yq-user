<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
sfuser=request("sfid")
sfpay=request("cpsl")
dim sql
dim rs
sql="select * from gcuser where username = '"&sfuser&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("pay")<sfpay+0 then
   response.write"<script>alert('ע�⣺�������С��"&sfpay&"Ԫ�����ֵ��');history.go(-1);</script>"
   response.end
end if
%>
<div align="center">
��<p>��</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">�����ڲ�������</font><font style="font-size: 20pt; font-weight: 700" color="#008000">EP-����Ʒ</font><font style="font-size: 20pt; font-weight: 700" color="#800000">¼��</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">������ȷ��һ�¹�����Ƿ�</font></p>
<p>��</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">��Ҫ</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF"><%=sfpay%>Ԫ</font><font style="font-size: 20pt; font-weight: 700" color="#800000">EP</font></p>
<p>��</p>
<p><a onClick="return confirm('��ʾ����ȷ������ ')" href="eptosf03.asp?sfid=<%=request("sfid")%>&sfpay=<%=sfpay%>">
<input type="button" value="ȷ�����ҵ�EP�۳�" name="B1" onclick=disabled=true style="font-size: 12pt; color: #0000FF; font-weight: bold"></a> </p>
<p>��<p>  
<b><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һ��</font></a></div>