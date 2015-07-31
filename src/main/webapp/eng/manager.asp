<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('User name or password is incorrect!');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   ygid=request.cookies("regid")
   password=request.cookies("password") 
end if
%>
<!--#include file="../ct0618.asp"-->
<%
sql="select * from gcuser where username = '" & ygid & "'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
If rs("gwuid")=0 then
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
e=Lcase(rs("userid"))
If (IDCheck(e)) Then
	'Response.Write"<script>alert('您填写的身份证号码 " & e & " 正确！');history.go(-1);</script>"
Else
   response.write "<script language='javascript'>"
   response.write "alert('Note: Your registration ID number is not lawful or errors, please re-enter after the operation!');"
   response.write "location.replace('userid.asp?sgid="&ygid&"');"
   response.write "</script>"
   response.end
End If
End IF
%>
<html>
<head>
<title>China Yi Chuan (Macau) International Ltd.--Integral games, consumer value-added platform, clearing-house staff salaries, office, games, financial and entertainment platform</title>
</head>
<frameset cols="188,*" framespacing="0" border="false"> 
<frame name="carnoc"  scrolling="auto" marginwidth="0" marginheight="0" src="admin_menu.asp">
<frame name="main" scrolling="auto" src="/vgo/gg_eng.asp?jhid=<%=ygid%>&dq=<%=rs("dqu")%>"></frameset>
<noframes></noframes>
</html>