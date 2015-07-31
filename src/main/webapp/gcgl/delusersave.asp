<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
userid=request("del")
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
if rs("jb")>0 or rs("sjb")>0 or rs("pay")>0 or rs("jyg")>0 then
   response.write "<script language='javascript'>"
   response.write "alert('已经是正式玩家，不能删除！！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   set rs_dl =server.createobject("adodb.recordset")
   sql_dl ="delete from gcuser where username = '"&userid&"'"
   rs_dl.open sql_dl,conn2,2,3
   set rs_dl =server.createobject("adodb.recordset")
   sql_dl ="delete from txifok where username = '"&userid&"'"
   rs_dl.open sql_dl,conn9,2,3 
end if
%>
<%
response.Write "<script language=javascript>alert('会员删除成功！');history.go(-1);</script>"
response.end
%>