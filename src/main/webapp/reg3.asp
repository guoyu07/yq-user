<%
id=request("id")
%>
<!--#include file="ctshop.asp"-->
<%
id=request("id")
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&id&"'"
rs.open sql,conn2,2,3
if rs("addsheng")="山东省" or rs("addsheng")="江苏省" or rs("addsheng")="上海市" then
    rs("dqu")=0
    rs("add9dqu")="华东一区"
    rs.update
end if
if rs("addsheng")="安徽省" or rs("addsheng")="浙江省" or rs("addsheng")="福建省" then
    rs("dqu")=1
    rs("add9dqu")="华东二区"
    rs.update
end if
if rs("addsheng")="广东省" or rs("addsheng")="广西壮族自治区" or rs("addsheng")="海南省" or rs("addsheng")="四川省" then
    rs("dqu")=2
    rs("add9dqu")="华南地区"
    rs.update
end if
if rs("addsheng")="湖北省" or rs("addsheng")="湖南省" or rs("addsheng")="河南省" or rs("addsheng")="江西省" then
    rs("dqu")=3
    rs("add9dqu")="华中地区"
    rs.update
end if
if rs("addsheng")="北京市" or rs("addsheng")="天津市" or rs("addsheng")="河北省" or rs("addsheng")="河北省" or rs("addsheng")="山西省" or rs("addsheng")="内蒙古自治区" then
    rs("dqu")=4
    rs("add9dqu")="华北地区"
    rs.update
end if
if rs("addsheng")="宁夏回族自治区" or rs("addsheng")="新疆维吾尔自治区" or rs("addsheng")="青海省" or rs("addsheng")="陕西省" or rs("addsheng")="甘肃省" then
    rs("dqu")=5
    rs("add9dqu")="西北地区"
    rs.update
end if
if rs("addsheng")="云南省" or rs("addsheng")="贵州省" or rs("addsheng")="西藏自治区" or rs("addsheng")="重庆市" then
    rs("dqu")=6
    rs("add9dqu")="西南地区"
    rs.update
end if
if rs("addsheng")="辽宁省" or rs("addsheng")="吉林省" or rs("addsheng")="黑龙江省" then
    rs("dqu")=7
    rs("add9dqu")="东北地区"
    rs.update
end if
if rs("addsheng")="台湾省" or rs("addsheng")="香港特别行政区" or rs("addsheng")="澳门特别行政区" then
    rs("dqu")=8
    rs("add9dqu")="港澳台地区"
    rs.update
end if
%>
<%
sql_tx="select * from txifok where username = '"&id&"'"
Set rs_tx= Server.CreateObject("ADODB.Recordset") 
rs_tx.open sql_tx,conn9,2,3
if rs_tx.eof and rs_tx.bof then
  rs_tx.addnew
  rs_tx("username")=rs("username")
  rs_tx("up")=rs("up")
  rs_tx("password3")=rs("password3")
  rs_tx("name")=rs("name")
  rs_tx("call")=rs("call")
  rs_tx.update
end if
%>
<%
response.redirect "index.asp?id="&id&""
%>