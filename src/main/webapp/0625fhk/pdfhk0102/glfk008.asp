<!--#include file="../shopmfh.asp"-->
<%
if request.cookies("lkuserid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('操作超时，重新登录！');"
   response.write "window.location.replace('logout.asp');"
   response.write "</script>"
   response.end
end if
%>
<%
lkid=request("lkid")
gmmj=request("mj")
fkgl=request("fk")
response.cookies("lkuserid")=""
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from lkjl where lkuser = '"&lkid&"'"
rs.open sql,conn0,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该用户不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
end if
%>
<%
Function getCode(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "0123456789abcdefghjkxyzi"
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
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1= "SELECT * FROM ejbk"
rs1.open sql1,conn0,2,3
rs1.addnew
rs1("pdid")="GL"&fkgl&getcode(6)
rs1("up")=lkid
rs1("gpa")=1
rs1("bf2")=gmmj/10
rs1("gmdate")=now()
rs1.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2= "SELECT * FROM ejbk"
rs2.open sql2,conn0,2,3
rs2.addnew
rs2("pdid")="GL"&fkgl&getcode(6)
rs2("up")=lkid
rs2("gpa")=1
rs2("bf2")=gmmj/10
rs2("gmdate")=now()
rs2.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs3 = Server.CreateObject("ADODB.Recordset")
sql3= "SELECT * FROM ejbk"
rs3.open sql3,conn0,2,3
rs3.addnew
rs3("pdid")="GL"&fkgl&getcode(6)
rs3("up")=lkid
rs3("gpa")=1
rs3("bf2")=gmmj/10
rs3("gmdate")=now()
rs3.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs4 = Server.CreateObject("ADODB.Recordset")
sql4= "SELECT * FROM ejbk"
rs4.open sql4,conn0,2,3
rs4.addnew
rs4("pdid")="GL"&fkgl&getcode(6)
rs4("up")=lkid
rs4("gpa")=1
rs4("bf2")=gmmj/10
rs4("gmdate")=now()
rs4.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs5 = Server.CreateObject("ADODB.Recordset")
sql5= "SELECT * FROM ejbk"
rs5.open sql5,conn0,2,3
rs5.addnew
rs5("pdid")="GL"&fkgl&getcode(6)
rs5("up")=lkid
rs5("gpa")=1
rs5("bf2")=gmmj/10
rs5("gmdate")=now()
rs5.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs6 = Server.CreateObject("ADODB.Recordset")
sql6= "SELECT * FROM ejbk"
rs6.open sql6,conn0,2,3
rs6.addnew
rs6("pdid")="GL"&fkgl&getcode(6)
rs6("up")=lkid
rs6("gpa")=1
rs6("bf2")=gmmj/10
rs6("gmdate")=now()
rs6.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs7 = Server.CreateObject("ADODB.Recordset")
sql7= "SELECT * FROM ejbk"
rs7.open sql7,conn0,2,3
rs7.addnew
rs7("pdid")="GL"&fkgl&getcode(6)
rs7("up")=lkid
rs7("gpa")=1
rs7("bf2")=gmmj/10
rs7("gmdate")=now()
rs7.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs8 = Server.CreateObject("ADODB.Recordset")
sql8= "SELECT * FROM ejbk"
rs8.open sql8,conn0,2,3
rs8.addnew
rs8("pdid")="GL"&fkgl&getcode(6)
rs8("up")=lkid
rs8("gpa")=1
rs8("bf2")=gmmj/10
rs8("gmdate")=now()
rs8.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs9 = Server.CreateObject("ADODB.Recordset")
sql9= "SELECT * FROM ejbk"
rs9.open sql9,conn0,2,3
rs9.addnew
rs9("pdid")="GL"&fkgl&getcode(6)
rs9("up")=lkid
rs9("gpa")=1
rs9("bf2")=gmmj/10
rs9("gmdate")=now()
rs9.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs10 = Server.CreateObject("ADODB.Recordset")
sql10= "SELECT * FROM ejbk"
rs10.open sql10,conn0,2,3
rs10.addnew
rs10("pdid")="GL"&fkgl&getcode(6)
rs10("up")=lkid
rs10("gpa")=1
rs10("bf2")=gmmj/10
rs10("gmdate")=now()
rs10.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs11 = Server.CreateObject("ADODB.Recordset")
sql11= "SELECT * FROM ejbk"
rs11.open sql11,conn0,2,3
rs11.addnew
rs11("pdid")="GL"&fkgl&getcode(6)
rs11("up")=lkid
rs11("gpa")=1
rs11("bf2")=gmmj/10
rs11("gmdate")=now()
rs11.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs12 = Server.CreateObject("ADODB.Recordset")
sql12= "SELECT * FROM ejbk"
rs12.open sql12,conn0,2,3
rs12.addnew
rs12("pdid")="GL"&fkgl&getcode(6)
rs12("up")=lkid
rs12("gpa")=1
rs12("bf2")=gmmj/10
rs12("gmdate")=now()
rs12.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs13 = Server.CreateObject("ADODB.Recordset")
sql13= "SELECT * FROM ejbk"
rs13.open sql13,conn0,2,3
rs13.addnew
rs13("pdid")="GL"&fkgl&getcode(6)
rs13("up")=lkid
rs13("gpa")=1
rs13("bf2")=gmmj/10
rs13("gmdate")=now()
rs13.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs14 = Server.CreateObject("ADODB.Recordset")
sql14= "SELECT * FROM ejbk"
rs14.open sql14,conn0,2,3
rs14.addnew
rs14("pdid")="GL"&fkgl&getcode(6)
rs14("up")=lkid
rs14("gpa")=1
rs14("bf2")=gmmj/10
rs14("gmdate")=now()
rs14.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs15 = Server.CreateObject("ADODB.Recordset")
sql15= "SELECT * FROM ejbk"
rs15.open sql15,conn0,2,3
rs15.addnew
rs15("pdid")="GL"&fkgl&getcode(6)
rs15("up")=lkid
rs15("gpa")=1
rs15("bf2")=gmmj/10
rs15("gmdate")=now()
rs15.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs16 = Server.CreateObject("ADODB.Recordset")
sql16= "SELECT * FROM ejbk"
rs16.open sql16,conn0,2,3
rs16.addnew
rs16("pdid")="GL"&fkgl&getcode(6)
rs16("up")=lkid
rs16("gpa")=1
rs16("bf2")=gmmj/10
rs16("gmdate")=now()
rs16.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs17 = Server.CreateObject("ADODB.Recordset")
sql17= "SELECT * FROM ejbk"
rs17.open sql17,conn0,2,3
rs17.addnew
rs17("pdid")="GL"&fkgl&getcode(6)
rs17("up")=lkid
rs17("gpa")=1
rs17("bf2")=gmmj/10
rs17("gmdate")=now()
rs17.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs18 = Server.CreateObject("ADODB.Recordset")
sql18= "SELECT * FROM ejbk"
rs18.open sql18,conn0,2,3
rs18.addnew
rs18("pdid")="GL"&fkgl&getcode(6)
rs18("up")=lkid
rs18("gpa")=1
rs18("bf2")=gmmj/10
rs18("gmdate")=now()
rs18.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs19 = Server.CreateObject("ADODB.Recordset")
sql19= "SELECT * FROM ejbk"
rs19.open sql19,conn0,2,3
rs19.addnew
rs19("pdid")="GL"&fkgl&getcode(6)
rs19("up")=lkid
rs19("gpa")=1
rs19("bf2")=gmmj/10
rs19("gmdate")=now()
rs19.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
else
set rs20 = Server.CreateObject("ADODB.Recordset")
sql20= "SELECT * FROM ejbk"
rs20.open sql20,conn0,2,3
rs20.addnew
rs20("pdid")="GL"&fkgl&getcode(6)
rs20("up")=lkid
rs20("gpa")=1
rs20("bf2")=gmmj/10
rs20("gmdate")=now()
rs20.update
rs("lksl")=rs("lksl")-1
rs.update
end if
%>
<%
if rs("lksl")=0 or rs("lksl")<0 then
   response.Write "<script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='/vip/dltj.asp'</script>"
   response.end
end if   
%>