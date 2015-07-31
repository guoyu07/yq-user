<!--#include file="../ct061888.asp"-->
<%
Function addgpjy(clname,mcsl,jyg)
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=clname
rs_d1("mcsl")=mcsl
rs_d1("sysl")=jyg
rs_d1("pay")=0.77
rs_d1("jy")=0
rs_d1("bz")="卖出挂牌中(系统代)"
rs_d1("jypay")=int(mcsl*0.77*1+0.1)/1
rs_d1("newjy")=3
rs_d1.update
End Function
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where cfc=3 and jygt1=0 "
'StrSQL = "SELECT * FROM gcuser where cfa>3 and jygt1=3"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
if rsTest("sjb")=100 then
   blsl=25000
elseif rsTest("sjb")=40 then
   blsl=15000
elseif rsTest("sjb")=20 then
   blsl=10000
elseif rsTest("sjb")=10 then
   blsl=5000
elseif rsTest("sjb")=4 then
   blsl=2000
elseif rsTest("sjb")=2 then
   blsl=1000
end if
kmcsl=rsTest("jyg")-blsl
If kmcsl>0 then
if kmcsl>30000 then
   mcbs=2000
elseif kmcsl>20000 then
   mcbs=1500
elseif kmcsl>10000 then
   mcbs=1200
elseif kmcsl>5000 then
   mcbs=800
elseif kmcsl>3000 then
   mcbs=500
else
   mcbs=kmcsl
end if
  clname=rsTest("username")
  jygall=rsTest("jyg")
  jygnumber=rsTest("jyg")-blsl
  ForCount=Int(jygnumber/mcbs)
  lasenumber=jygnumber Mod mcbs
  If ForCount>0 Then
	for j=1 to ForCount Step 1
	Call addgpjy(clname,mcbs,jygall-j*mcbs)
	Next
  End If
  If lasenumber>0 Then
	Call addgpjy(clname,lasenumber,jygall-ForCount*mcbs-lasenumber)
  End If
    rsTest("jyg")=blsl
    rsTest("cfc")=0
	rsTest("jygdate")=abcd
	'rsTest("jygt1")=0
End IF
    rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
session("adminusername")="" 
session("password")=""
response.Write "<script language=javascript>alert('q3m7成功！');location.replace('logout001.asp');</script>"
%>
<HTML>
<head></head>
<p>拆分满3次自动卖70%</p>
</HTML>