<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Temporarily unable to sell!');"
   response.write "history.go(-1);" 
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("sgid")
   jybhgj=request("jygj")
end if
%>
<%
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where id ="&jybh&""
rs_my.open sql_my,conn2,2,3
mypay=rs_my("jypay")
pay=rs_my("pay")
mcsl=rs_my("mcsl")
if jybhgj+0>pay+0 then
   response.Write "<script language=javascript>alert('Modify selling price can not be greater than "&rs_my("pay")&" Oh!');location.href='history.go(-1);'</script>"
   response.end
end if
%>
<%
if rs_my("jy")>1 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('The integration of the transaction or the transaction has been succeeded by its people, can not be modified, please choose other deals!');location.href='history.go(-1);'</script>"
   response.end
else
   rs_my("jy")=2
   rs_my("dqdate")=now()
   rs_my.update
end if
%>
<%
dim rs_qx,sql_qx
set rs_qx = Server.CreateObject("ADODB.Recordset")
sql_qx="select * from gpjy where id ="&jybh&""
rs_qx.open sql_qx,conn2,2,3
if rs_qx("cgdate")<>"" and rs_qx("dfuser")<>"" then
rs_qx("jy")=1
rs_qx.update
else
rs_qx("jy")=0
rs_qx("pay")=jybhgj
rs_qx("jypay")=int(jybhgj*mcsl*1+0.1)/1
rs_qx.update
end if
%>
<%
response.Write "<script language=javascript>alert('Modify selling price success!');location.replace('diyjygj.asp?sgid="&jybh&"');</script>"
%>