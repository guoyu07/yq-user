<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�Ѳ����������µ�¼��');"
   response.write "top.location.replace('log88out.asp');"
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="120"
   cjyh=request("uid")
   cjpay=request("cj")
   cjfs=request("fs")
   czy=request("czy")
   'bfym=Request.ServerVariables("SERVER_NAME")
   'Request.ServerVariables("HTTP_HOST")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="secjlog.asp"-->
<%
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from fcxt where ncjud ='"&czy&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('����Ա�����ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&cjyh&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���û��������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("gmdate")+0.0008>Now() then
   response.write "<script language='javascript'>"
   response.write "alert('��������ֻ�ܳ�ֵһ�Σ����Ժ����ԣ�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
  rs("cjtj")=rs("cjtj")+cjpay
  rs("gmdate")=Now()
  rs.update
end if
%>
<%
if cjpay=1000 and rs("pay")<9000 then
   response.write "<script language='javascript'>"
   response.write "alert('���γ�ֵ1000��һ��С��9000�����Ȳ���һ�ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay=2000 and rs("pay")<18000 then
   response.write "<script language='javascript'>"
   response.write "alert('���γ�ֵ2000��һ��С��18000�����Ȳ���һ�ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay=3000 and rs("pay")<27000 then
   response.write "<script language='javascript'>"
   response.write "alert('���γ�ֵ3000��һ��С��27000�����Ȳ���һ�ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay=4000 and rs("pay")<36000 then
   response.write "<script language='javascript'>"
   response.write "alert('���γ�ֵ4000��һ��С��36000�����Ȳ���һ�ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay=5000 and rs("pay")<45000 then
   response.redirect "cfkfcbdb.asp?czy="&czy&"&cj="&cjpay&"&uid="&cjyh&"&fs="&cjfs&""
elseif cjpay>5000 then
   response.redirect "cfkfcbdb.asp?czy="&czy&"&cj="&cjpay&"&uid="&cjyh&"&fs="&cjfs&""   
end if
if cjpay=1000 and rs("pay")>8999 then
  rs("pay")=rs("pay")-9000
  rs("txpay")=rs("txpay")+9000
  rs("vippay")=rs("vippay")-9000
  rs("fhpay")=rs("fhpay")-9000
  rs("ljbdb")=rs("ljbdb")+10000
  rs("sybdb")=rs("sybdb")+10000
  rs.update
set rs_ep1 = Server.CreateObject("ADODB.Recordset")
sql_ep1 = "SELECT * FROM datepay"
rs_ep1.open sql_ep1,conn9,2,3
rs_ep1.addnew
rs_ep1("username")=cjyh
rs_ep1("regid")="תΪ������"
rs_ep1("jc")=9000
rs_ep1("pay")=rs("pay")
rs_ep1("jydb")=rs("jydb")
rs_ep1.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM bdbdate"
rs_d1.open sql_d1,conn1,2,3
rs_d1.addnew
rs_d1("zuser")=cjyh
rs_d1("sy")=10000
rs_d1("sybdb")=rs("sybdb")
rs_d1("ljbdb")=rs("ljbdb")
rs_d1("bz")="��ֵ1000��һ��9000��Ч"
rs_d1.update
elseif cjpay=2000 and rs("pay")>17999 then
  rs("pay")=rs("pay")-18000
  rs("txpay")=rs("txpay")+18000
  rs("vippay")=rs("vippay")-18000
  rs("fhpay")=rs("fhpay")-18000
  rs("ljbdb")=rs("ljbdb")+20000
  rs("sybdb")=rs("sybdb")+20000
  rs.update
set rs_ep3 = Server.CreateObject("ADODB.Recordset")
sql_ep3 = "SELECT * FROM datepay"
rs_ep3.open sql_ep3,conn9,2,3
rs_ep3.addnew
rs_ep3("username")=cjyh
rs_ep3("regid")="תΪ������"
rs_ep3("jc")=18000
rs_ep3("pay")=rs("pay")
rs_ep3("jydb")=rs("jydb")
rs_ep3.update
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM bdbdate"
rs_d3.open sql_d3,conn1,2,3
rs_d3.addnew
rs_d3("zuser")=cjyh
rs_d3("sy")=20000
rs_d3("sybdb")=rs("sybdb")
rs_d3("ljbdb")=rs("ljbdb")
rs_d3("bz")="��ֵ2000��һ��18000��Ч"
rs_d3.update
elseif cjpay=3000 and rs("pay")>26999 then
  rs("pay")=rs("pay")-27000
  rs("txpay")=rs("txpay")+27000
  rs("vippay")=rs("vippay")-27000
  rs("fhpay")=rs("fhpay")-27000
  rs("ljbdb")=rs("ljbdb")+30000
  rs("sybdb")=rs("sybdb")+30000
  rs.update
set rs_ep6 = Server.CreateObject("ADODB.Recordset")
sql_ep6 = "SELECT * FROM datepay"
rs_ep6.open sql_ep6,conn9,2,3
rs_ep6.addnew
rs_ep6("username")=cjyh
rs_ep6("regid")="תΪ������"
rs_ep6("jc")=27000
rs_ep6("pay")=rs("pay")
rs_ep6("jydb")=rs("jydb")
rs_ep6.update
set rs_d6 = Server.CreateObject("ADODB.Recordset")
sql_d6 = "SELECT * FROM bdbdate"
rs_d6.open sql_d6,conn1,2,3
rs_d6.addnew
rs_d6("zuser")=cjyh
rs_d6("sy")=30000
rs_d6("sybdb")=rs("sybdb")
rs_d6("ljbdb")=rs("ljbdb")
rs_d6("bz")="��ֵ3000��һ��27000��Ч"
rs_d6.update
elseif cjpay=4000 and rs("pay")>35999 then
  rs("pay")=rs("pay")-36000
  rs("txpay")=rs("txpay")+36000
  rs("vippay")=rs("vippay")-36000
  rs("fhpay")=rs("fhpay")-36000
  rs("ljbdb")=rs("ljbdb")+40000
  rs("sybdb")=rs("sybdb")+40000
  rs.update
set rs_ep10 = Server.CreateObject("ADODB.Recordset")
sql_ep10 = "SELECT * FROM datepay"
rs_ep10.open sql_ep10,conn9,2,3
rs_ep10.addnew
rs_ep10("username")=cjyh
rs_ep10("regid")="תΪ������"
rs_ep10("jc")=36000
rs_ep10("pay")=rs("pay")
rs_ep10("jydb")=rs("jydb")
rs_ep10.update
set rs_d10 = Server.CreateObject("ADODB.Recordset")
sql_d10 = "SELECT * FROM bdbdate"
rs_d10.open sql_d10,conn1,2,3
rs_d10.addnew
rs_d10("zuser")=cjyh
rs_d10("sy")=40000
rs_d10("sybdb")=rs("sybdb")
rs_d10("ljbdb")=rs("ljbdb")
rs_d10("bz")="��ֵ4000��һ��36000��Ч"
rs_d10.update
elseif cjpay=5000 and rs("pay")>44999 then
  rs("pay")=rs("pay")-45000
  rs("txpay")=rs("txpay")+45000
  rs("vippay")=rs("vippay")-45000
  rs("fhpay")=rs("fhpay")-45000
  rs("ljbdb")=rs("ljbdb")+50000
  rs("sybdb")=rs("sybdb")+50000
  rs.update
set rs_ep05 = Server.CreateObject("ADODB.Recordset")
sql_ep05 = "SELECT * FROM datepay"
rs_ep05.open sql_ep05,conn9,2,3
rs_ep05.addnew
rs_ep05("username")=cjyh
rs_ep05("regid")="תΪ������"
rs_ep05("jc")=45000
rs_ep05("pay")=rs("pay")
rs_ep05("jydb")=rs("jydb")
rs_ep05.update
set rs_d05 = Server.CreateObject("ADODB.Recordset")
sql_d05 = "SELECT * FROM bdbdate"
rs_d05.open sql_d05,conn1,2,3
rs_d05.addnew
rs_d05("zuser")=cjyh
rs_d05("sy")=50000
rs_d05("sybdb")=rs("sybdb")
rs_d05("ljbdb")=rs("ljbdb")
rs_d05("bz")="��ֵ5000��һ��45000��Ч"
rs_d05.update
end if
%>
<%
if rs("vippay")<0 then
   rs("vippay")=0
   rs.update
end if
if rs("fhpay")<0 then
   rs("fhpay")=0
   rs.update
end if
response.redirect "/vgo/cfkfc04.asp?dl="&cjyh&"&cj="&cjpay&"&cjtj="&rs("cjtj")&"&cz="&czy&"&fs="&cjfs&""
response.end
%>
<%
'dim rs_c,sql
'set rs_c= Server.CreateObject("ADODB.Recordset")
'sql_c="select * from datecj"
'rs_c.open sql_c,conn1,2,3
'rs_c.addnew
'rs_c("cjuser")=cjyh
'rs_c("dqcj")=cjpay
'rs_c("ljcj")=rs("cjtj")
'rs_c("cjfs")=cjfs
'rs_c("cz")=czy
'rs_c("ip")=Request.ServerVariables("REMOTE_ADDR")
'rs_c.update
'response.Write "<script language=javascript>alert('��ϲ��ֵ�ɹ���������');location.href='/gcgl/ycbdcj.asp?dl="&czy&"'</script>"
'response.end
%>