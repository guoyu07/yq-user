<!--#include file="../ct0618.asp"--><head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
vipuser=request("vip")
sqm=request("sq")
%>
<%
Function getCode(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "01235678abcd"
     k=Len(arrChar)
     Randomize
     For i=1 to iCount
          j=Int(k * Rnd )+1
          strCode = strCode & Mid(arrChar,j,1)
     Next
     getCode = strCode
End Function
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&vipuser&"'"
rs.open sql,conn2,2,3
if sqm<>"" then
   rs("vipsq")=sqm
   rs.update
   response.Write "<script language=javascript>alert('Updated successfully!');location.replace('vipsq.asp?vip="&vipuser&"');</script>"
end if
%>

<table border="0" width="100%" id="table1" cellspacing="1" height="35">
	<tr>
		<td width="273"><p align="right"><font size="2">The current authorization code:</font></td>
		<td><font color="#0000FF" size="2"><%=rs("vipsq")%></font></td>
		<td width="61"> <a href="vipsq.asp?vip=<%=vipuser%>&sq=<%=getcode(6)%>"><input type="button" value="Update" name="B2"></a></td>
		<td width="793"> <font size="2">Please regularly updated license key</font></td>
	</tr>
</table>