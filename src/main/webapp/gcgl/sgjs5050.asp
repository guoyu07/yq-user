<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from fcxt where id =2 "
rs0.open sql0,conn2,2,3
mqbz=rs0("payadd")
sqbz=rs0("payadd")-1
lastname=rs0("lname")
%>
<%
dim rs_js,sql_js
set rs_js = Server.CreateObject("ADODB.Recordset")
sql_js="select * from fcxt where id =2 "
rs_js.open sql_js,conn2,1,1
if Now()<rs_js("jsdate") then
   response.write "<script language='javascript'>"
   response.write "alert('还没有到结算的日期（每星期二22点后）！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM sgxt where aq>0 and bq>0"
rsTest.Open StrSQL, conn7,2,3
While Not rsTest.EOF
if rsTest("aq")=rsTest("bq") then
   jsq=rsTest("bq")
elseif rsTest("aq")<rsTest("bq") then
   jsq=rsTest("aq")
elseif rsTest("aq")>rsTest("bq") then
   jsq=rsTest("bq")
end if
if jsq*50>rsTest("fdpay") then
   rsTest("pay")=rsTest("fdpay")
   rsTest("cbpay")=rsTest("cbpay")+rsTest("fdpay")
   rsTest("aq")=0
   rsTest("bq")=0
   rsTest.update
else
   rsTest("pay")=jsq*50
   rsTest("cbpay")=jsq*50+rsTest("cbpay")
   rsTest("aq")=rsTest("aq")-jsq
   rsTest("bq")=rsTest("bq")-jsq
   rsTest.update
end if
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&rstest("username")&"'"
rs.open sql,conn2,2,3
if not rs.eof then
rs("pay")=rsTest("pay")*0.5+rs("pay")
rs("cbpay")=rsTest("pay")*0.5+rs("cbpay")
rs("jjsy")=rsTest("pay")*0.5+rs("jjsy")
rs("ljsy")=rsTest("pay")*0.5+rs("ljsy")
rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rstest("username")
rs_d1("regid")="游戏业务"&jsq&"碰奖金-50%"
rs_d1("syjz")=rsTest("pay")*0.5
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("bz")=rs0("payadd")
rs_d1.update
set rs_d1b = Server.CreateObject("ADODB.Recordset")
sql_d1b = "SELECT * FROM gcfh"
rs_d1b.open sql_d1b,conn9,2,3
rs_d1b.addnew
rs_d1b("userid")=rstest("username")
rs_d1b("syfh")=rsTest("pay")*0.5
rs_d1b("ljfhtj")=(rs("ljsy")*1)-(rs("sytx")*1)
rs_d1b("bz")="游戏业务"&jsq&"碰奖金-50%"
rs_d1b("lb")=3
rs_d1b.update
end if
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcuser where username = '"&rs("up")&"' and sjb>0"
rs1.open sql1,conn2,2,3
if not rs1.eof then
rs1("pay")=rsTest("pay")*0.05+rs1("pay")
rs1("cbpay")=rsTest("pay")*0.05+rs1("cbpay")
rs1("jjsy")=rsTest("pay")*0.05+rs1("jjsy")
rs1("ljsy")=rsTest("pay")*0.05+rs1("ljsy")
rs1.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rs("up")
rs_d2("regid")=""&rstest("username")&"游戏业务"&jsq&"碰领导奖-50%"
rs_d2("syjz")=rsTest("pay")*0.05
rs_d2("pay")=rs1("pay")
rs_d2("jydb")=rs1("jydb")
rs_d2.update
set rs_d2b = Server.CreateObject("ADODB.Recordset")
sql_d2b = "SELECT * FROM gcfh"
rs_d2b.open sql_d2b,conn9,2,3
rs_d2b.addnew
rs_d2b("userid")=rs("up")
rs_d2b("syfh")=rsTest("pay")*0.05
rs_d2b("ljfhtj")=(rs1("ljsy")*1)-(rs1("sytx")*1)
rs_d2b("bz")=""&rstest("username")&"游戏业务"&jsq&"碰领导奖-50%"
rs_d2b("lb")=3
rs_d2b.update
end if
    rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
set rs_sgaq = Server.CreateObject("ADODB.Recordset")
sql_sgaq = "SELECT sum(aq) as syaq FROM sgxt"
rs_sgaq.open sql_sgaq,conn7,1,1
%>
<%
set rs_sgbq = Server.CreateObject("ADODB.Recordset")
sql_sgbq = "SELECT sum(bq) as sybq FROM sgxt"
rs_sgbq.open sql_sgbq,conn7,1,1
%>
<%
set rs_mq = Server.CreateObject("ADODB.Recordset")
sql_mq = "SELECT sum(syjz) as tjmq FROM datepay where bz = "&mqbz&""
rs_mq.open sql_mq,conn9,1,1
%>
<%
Set rs_tj= Server.CreateObject("ADODB.Recordset")
sql_tj="select * from sgtj where sgid = "&sqbz&"" 
rs_tj.open sql_tj,conn2,1,1
jsdate=rs_tj("jsdate")
%>
<% 
sql_zd="select sum(sjb) as ljzd from sgxt" 
Set rs_zd= Server.CreateObject("ADODB.Recordset") 
rs_zd.open sql_zd,conn7,1,1
%>
<%
Set rs_lid= Server.CreateObject("ADODB.Recordset")
sql_lid="select * from sgxt where username = '"&lastname&"'" 
rs_lid.open sql_lid,conn7,1,1
lastid=rs_lid("id")
%>
<% 
sql_nd="select sum(sjb) as ljnd from sgxt where id>"&lastid&"" 
Set rs_nd= Server.CreateObject("ADODB.Recordset") 
rs_nd.open sql_nd,conn7,1,1
%>
<% 
sql_cb="select sum(cbpay) as ljcb from gcuser" 
Set rs_cb= Server.CreateObject("ADODB.Recordset") 
rs_cb.open sql_cb,conn2,1,1
%>
<% 
sql_pa="select sum(pay) as ljpa from gcuser" 
Set rs_pa= Server.CreateObject("ADODB.Recordset") 
rs_pa.open sql_pa,conn2,1,1
%>
<% 
sql_tx="select sum(txpay) as ljtx from gcuser" 
Set rs_tx= Server.CreateObject("ADODB.Recordset") 
rs_tx.open sql_tx,conn2,1,1
%>
<% 
sql_db="select sum(jydb) as ljdb from gcuser" 
Set rs_db= Server.CreateObject("ADODB.Recordset") 
rs_db.open sql_db,conn2,1,1
%>
<% 
sql_xt="select sum(jyg) as ljyg from gcuser" 
Set rs_xt= Server.CreateObject("ADODB.Recordset") 
rs_xt.open sql_xt,conn2,1,1
%>
<% 
sql_fhg="select sum(gdgc) as ljfhg from gcuser" 
Set rs_fhg= Server.CreateObject("ADODB.Recordset") 
rs_fhg.open sql_fhg,conn2,1,1
%>
<% 
sql_zfh="select sum(ljfh) as ljzfh from gcuser" 
Set rs_zfh= Server.CreateObject("ADODB.Recordset") 
rs_zfh.open sql_zfh,conn2,1,1
%>
<% 
sql_ztx="select sum(paynum) as ljztx from txpay" 
Set rs_ztx= Server.CreateObject("ADODB.Recordset") 
rs_ztx.open sql_ztx,conn9,1,1
%>
<%
set rs_tj= Server.CreateObject("ADODB.Recordset")
sql_tj= "SELECT * FROM sgtj"
rs_tj.open sql_tj,conn2,2,3
rs_tj.addnew
rs_tj("zd")=rs_zd("ljzd")
rs_tj("nd")=rs_nd("ljnd")
rs_tj("aq")=rs_sgaq("syaq")
rs_tj("bq")=rs_sgbq("sybq")
rs_tj("zpay")=rs_mq("tjmq")
rs_tj("abp")=rs_mq("tjmq")/50
rs_tj("ldpay")=rs_mq("tjmq")*0.1
rs_tj("jsdate")=Now()
rs_tj("ljcb")=rs_cb("ljcb")
rs_tj("ljpa")=rs_pa("ljpa")
rs_tj("ljtx")=rs_tx("ljtx")
rs_tj("ljztx")=rs_ztx("ljztx")
rs_tj("ljdb")=rs_db("ljdb")
rs_tj("ljyg")=rs_xt("ljyg")
rs_tj("ljfhg")=rs_fhg("ljfhg")
rs_tj("ljzfh")=rs_zfh("ljzfh")
'rs_tj("bz")=0
rs_tj.update
%>
<%
Set rs_last= Server.CreateObject("ADODB.Recordset")
sql_last="select * from sgxt order by id desc" 
rs_last.open sql_last,conn7,1,1
%>
<%
rs0("payadd")=rs0("payadd")+1
rs0("jsdate")=rs0("jsdate")+7
rs0("lname")=rs_last("username")
rs0.update
response.Write "<script language=javascript>alert('游戏业务结算成功！');location.replace('searchg0701.asp');</script>"
%>