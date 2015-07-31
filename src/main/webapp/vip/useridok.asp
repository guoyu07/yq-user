<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   gwuser=request("sgid")
end if
%>
<%
If request.Form("userid")<>"zgycecom0000000000" then
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
e=Lcase(Request.Form("userid"))
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
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
elseif rs("username")<>gwuser then
   response.write "<script language='javascript'>"
   response.write "alert('您好，用户名有误，请重新登录，谢谢！');"
   response.write "top.location.replace('/index.asp?id="&gwuser&"');"
   response.write "</script>" 
   response.end
else
   rs("call")=request("call")
   rs("userid")=request("userid")
   rs.update
end if
%>
<%
response.redirect "manager.asp"
%>