<!--#include file="../mq0618.asp"-->
<%
addsheng=request.Form("ProvinceName")
addshi=request.Form("CityName")
addqu=request.Form("AreaName")
jzcj=request("jzcj")
if jzcj="-1" then
 jzt="Yesterday"
elseif jzcj="-2" then
 jzt="The day before yesterday"
else
 jzt="Present day"
end if
%>
<%
if addsheng<>"" and addshi="0" and addqu="0" then
   add1="addsheng"
   add10=addsheng
   add2="addsheng"
   add20=addsheng
   add3="addsheng"
   add30=addsheng
elseif addsheng<>"" and addshi<>"" and addqu="0" then
   add1="addshi"
   add10=addshi
   add2="addshi"
   add20=addshi
   add3="addshi"
   add30=addshi
elseif addsheng<>"" and addshi<>"" and addqu<>"" then
   add1="addshi"
   add10=addshi
   add2="addqu"
   add20=addqu
   add3="addqu"
   add30=addqu
end if
%>
<%
dim sql_om0
dim rs_om0
sql_om0="select sum(pdlb) as down_om0 from mqfh where addsheng='"&addsheng&"' and "&add1&"='"&add10&"' and "&add2&"= '"&add20&"' and DateDiff('d',date(),pddate)='"&jzcj&"' " 
Set rs_om0= Server.CreateObject("ADODB.Recordset") 
rs_om0.open sql_om0,conn7,1,1
%><body bgcolor="#F5F5F1"><p align="center"><strong>
			<font color="#000000" style="font-size: 12pt">You Searched</font><font color="#FF0000" style="font-size: 12pt"><%=addsheng%><%if addshi<>"0" then%><%=addshi%><%if addqu<>"0" then%><%=addqu%><%if addzhen<>"0" then%><%=addzhen%><%end if%><%end if%><%end if%></font><font color="#008000"><%=jzt%></font>Activation<font color="#0000FF" style="font-size: 12pt"><%=rs_om0("down_om0")%></font><font color="#000000" style="font-size: 12pt">Equity</font></strong>