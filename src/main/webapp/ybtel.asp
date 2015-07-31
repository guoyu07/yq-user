<!--#include file="vip/cfvip.asp"-->
<%
dim db,connstr2
db="cftogo\cftogouser.mdb"
set conn2 = server.CreateObject("ADODB.Connection")
connstr2="DBQ="&server.mappath(db)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn2.Open connstr2
%>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&request("user")&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('请不要测试。。！');"
   response.write "top.location.replace('http://vip.zgyce.com/index.asp');"
   response.write "</script>"
   response.end
elseif md5(rs("vipsq"))<>request("hfcode") then
   response.write "<script language='javascript'>"
   response.write "alert('请停止测试。。！');"
   response.write "top.location.replace('http://vip.zgyce.com/index.asp');"
   response.write "</script>"
   response.end
elseif rs("hfcjdate")>date() then
   response.write "<script language='javascript'>"
   response.write "alert('您好，同一姓名及证件号30天内仅提供一次充值，请于"&rs("hfcjdate")-date()&"天后再来，谢谢！');"
   response.write "top.location.replace('http://vip.zgyce.com/index.asp');"
   response.write "</script>"
   response.end
elseif rs("pay")+0<100 or rs("pay")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，一币不足100，暂时不能充值，谢谢！');"
   response.write "top.location.replace('http://vip.zgyce.com/index.asp');"
   response.write "</script>"
   response.end
end if
%>
