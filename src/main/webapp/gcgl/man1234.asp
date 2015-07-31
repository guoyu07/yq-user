<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
jyj=rs1("jygj")+0.2
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where jydb>30 and DateDiff('d',date(),dbdate)<-7 and dbt1=1"
rs.open sql,conn2,1,3
if not rs.eof  Then
	If rs("jydb")>30 then
	clname=rs("username")
	dbjc=rs("jydb")-30
	jc30=dbjc*0.3
	hs30=int(jc30/1)
	rs("jydb")=rs("jydb")-hs30
	rs.update
set rs_hs = Server.CreateObject("ADODB.Recordset")
sql_hs = "SELECT * FROM datepay"
rs_hs.open sql_hs,conn9,2,3
rs_hs.addnew
	rs_hs("username")=clname
	rs_hs("dbjc")=hs30
	rs_hs("pay")=rs("pay")
	rs_hs("jydb")=rs("jydb")
	rs_hs("regid")="超出"&dbjc&"系统回收30%"
	rs_hs.update
	End if
end if
%>
<%
Dim StrSQL,rsTest 
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where username = '"&clname&"' and dbt1=1 and DateDiff('d',date(),dbdate)<-7 and jydb>30"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
  clname=rsTest("username")
  jydball=rsTest("jydb")
  jydbnumber=rsTest("jydb")-30
  ForCount=Int(jydbnumber/30)
  lasenumber=jydbnumber Mod 30
  If ForCount>0 Then
	for j=1 to ForCount Step 1
	insertid=adddatepay(clname,30,jydball-j*30,rsTest("pay"))
	Call addgpjy(clname,30,jydball-ForCount*30,insertid)
	Next
  End If
  If lasenumber>1 Then
    insertid=adddatepay(clname,lasenumber,jydball-ForCount*30-lasenumber,rsTest("pay"))
	Call addgpjy(clname,lasenumber,jydball-ForCount*30-lasenumber,insertid)
  End If
    rsTest("jydb")=30
	rsTest("dbdate")=abcd
	rsTest("dbt1")=0
    rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
Function adddatepay(clname,jo,jydb,pay)
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,1,3
rs_d2.addnew
rs_d2("username")=clname
rs_d2("dbjc")=jo
rs_d2("pay")=pay
rs_d2("jydb")=jydb
rs_d2("regid")="买入挂牌中(系统代)"
rs_d2.update
adddatepay=rs_d2("id")
End Function
%>
<%
Function addgpjy(clname,mysl,jyg,jyid)
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,1,3
rs_d1.addnew
rs_d1("username")=clname
rs_d1("mysl")=int(mysl/jyj*1+0.1)/1
rs_d1("sysl")=rsTest("jyg")
rs_d1("pay")=jyj
rs_d1("bz")="买入挂牌中(系统代)"
rs_d1("jypay")=int(mysl*1+0.1)/1
rs_d1("jyid")=jyid
rs_d1.update
End Function
%>
<HTML>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="refresh" content="35; url=""">
</head>
<p>后台管理</p>
<p>　</p>
<p>　</p>
</HTML>