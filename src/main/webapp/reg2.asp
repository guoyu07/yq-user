<!--#include file="ctshop.asp"-->
<!--#include file="vip/cfvip.asp"-->
<%
if request.cookies("username")="" then
   response.write "<script language='javascript'>"
   response.write "alert('你已成功注册过，不需要重复操作！');"
   response.write "window.location.replace('reg.asp');"
   response.write "</script>"
   response.end
end if
%>
<% 
userds=request.Form("upvip")
user=LCase(userds)
temuser=request.Form("gguser")
%>
<%
   dim rs,sql
   set rs=server.createobject("adodb.recordset")
   sql="select * from gcuser where username = '"&temuser&"'"
   rs.open sql,conn2,1,1
   if not rs.eof then
   response.write "<script language='javascript'>"
   response.write "alert('此用户名已有人使用！请更换！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
   end if
%>
<%
   dim rs1,sql1
   set rs1=server.createobject("adodb.recordset")
   sql1="select * from gcuser where username = '"&user&"'"
   rs1.open sql1,conn2,1,1
   if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('没有这个推荐人账号，请重新写入！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
   end if
%>
<%
   dim rs2,sql2
   set rs2=server.createobject("adodb.recordset")
   sql2="select * from gcuser where name = '"&request.Form("ggname")&"' or userid='"&Request.Form("gguserid")&"' "
   rs2.open sql2,conn2,1,1
   if not rs2.eof then
   response.write "<script language='javascript'>"
   response.write "alert('该姓名["&request.Form("ggname")&"]及身份证号码["&Request.Form("gguserid")&"]已经被注册过，请您登录后在-[业务查询]下-[添加同名账户]！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
   end if
%>
<%
If request.Form("gguserid")<>"zgycecom0000000000" then
Function IDCheck(e)
	IDCheck = true
	arrVerifyCode = Split("1,0,x,9,8,7,6,5,4,3,2", ",")
	Wi = Split("7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2", ",")
	Checker = Split("1,9,8,7,6,5,4,3,2,1,1", ",")
	If Len(e) <> 18 Then
		'IDCheck= "身份证号必须有18位"
		IDCheck = False
		Exit Function
	End If
	Dim Ai
	Ai = Mid(e, 1, 17)
	If Not IsNumeric(Ai) Then
		'IDCheck= "身份证除最后一位外，必须为数字！"
		IDCheck = False
		Exit Function
	End If
	Dim strYear, strMonth, strDay
	strYear = CInt(Mid(Ai, 7, 4))
	strMonth = CInt(Mid(Ai, 11, 2))
	strDay = CInt(Mid(Ai, 13, 2))
	BirthDay = Trim(strYear) + "-" + Trim(strMonth) + "-" + Trim(strDay)
	If IsDate(BirthDay) Then
		If DateDiff("yyyy",Now,BirthDay)<-140 or cdate(BirthDay)>date() Then
			'IDCheck= "身份证输入错误！"
			IDCheck = False
			Exit Function
		End If
		If strMonth > 12 Or strDay > 31 Then
			'IDCheck= "身份证输入错误！"
			IDCheck = False
			Exit Function
		End If
	Else
		'IDCheck= "身份证输入错误！"
		IDCheck = False
		Exit Function
	End If
	Dim i, TotalmulAiWi
	For i = 0 To 16
		TotalmulAiWi = TotalmulAiWi + CInt(Mid(Ai, i + 1, 1)) * Wi(i)
	Next
	Dim modValue
	modValue = TotalmulAiWi Mod 11
	Dim strVerifyCode
	strVerifyCode = arrVerifyCode(modValue)
	Ai = Ai & strVerifyCode
	IDCheck = Ai
	If Len(e) = 18 And e <> Ai Then
		'IDCheck= "身份证号码输入错误！"
		IDCheck = False
		Exit Function
	End If
	IDCheck = True
End Function
e=Lcase(Request.Form("gguserid"))
If (IDCheck(e)) Then
	'Response.Write"<script>alert('您填写的身份证号码 " & e & " 正确！');history.go(-1);</script>"
Else
   response.write "<script language='javascript'>"
   response.write "alert('注意：您填写的身份证号码不合法或错误，请检查后再试！！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
End If
End IF
%>
<%
   dim rs3,sql3
   set rs3=server.createobject("adodb.recordset")
   sql3="select * from tduser where tdname = '"&request.Form("ggname")&"' or tduserid='"&Request.Form("gguserid")&"' "
   rs3.open sql3,conn2,1,1
   if not rs3.eof then
   response.write "<script language='javascript'>"
   response.write "alert('该姓名["&request.Form("ggname")&"]或身份证号码["&Request.Form("gguserid")&"]禁止注册！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
   end if
%>
<%
if request.Form("ProvinceName")="0" or request.Form("CityName")="0" or request.Form("AreaName")="0" then
   response.write "<script language='javascript'>"
   response.write "alert('所在地区不全！请重新选择！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<% 
dim pa,pa1
pa=request.Form("ggpa1")
password=LCase(pa)
%>
<%
if request.Form("ProvinceName")<>"" and request.Form("CityName")<>"" and request.Form("AreaName")<>"" then
set rs_links = Server.CreateObject("ADODB.Recordset")
sql_links = "SELECT * FROM gcuser"
rs_links.open sql_links,conn2,2,3
rs_links.addnew
rs_links("username")=request.Form("gguser")
rs_links("password")=md5(password)
rs_links("password3")=request.Form("ggpa3")
rs_links("name")=request.Form("ggname")
rs_links("bank")=request.Form("ggbank")
rs_links("card")=request.Form("ggcard")
rs_links("call")=request.Form("ggcall")
rs_links("qq")=request.Form("ggqq")
rs_links("up")=user
rs_links("userid")=request.Form("gguserid")
rs_links("addsheng")=request.Form("ProvinceName")
rs_links("addshi")=request.Form("CityName")
rs_links("addqu")=request.Form("AreaName")
rs_links.update
else
   response.write "<script language='javascript'>"
   response.write "alert('所在地区不全！请重新选择！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
response.cookies("username")=""
response.Write "<script language=javascript>alert('恭喜注册成功！请登录进行其它操作！');location.href='reg3.asp?id="&temuser&"'</script>"
%>