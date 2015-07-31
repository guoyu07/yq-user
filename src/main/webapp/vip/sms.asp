<!--#include file="../ct0618.asp"-->
<%
Response.Charset="GB2312"
post = Request.Form()
If (post = "") Then
	Response.Write("fail-1")
	Response.End()
End If

Function getCode(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "01235678abcde"
     k=Len(arrChar)
     Randomize
     For i=1 to iCount
          j=Int(k * Rnd )+1
          strCode = strCode & Mid(arrChar,j,1)
     Next
     getCode = strCode
End Function

set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&request("user")&"'" 
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
	Response.Write("fail-2")
	Response.End()
else
   rs("vipsq")=getcode(6)
   rs.update
end if
if request("remark")=0 then
'aremarkb="测试"
aremarkb="%E6%B5%8B%E8%AF%95"
elseif request("remark")=1 then
'aremarkb="更新资料"
aremarkb="%E6%9B%B4%E6%96%B0%E8%B5%84%E6%96%99"
elseif request("remark")=2 then
'aremarkb="修改资料"
aremarkb="%E4%BF%AE%E6%94%B9%E8%B5%84%E6%96%99"
elseif request("remark")=3 then
'aremarkb="开户"
aremarkb="%E5%BC%80%E6%88%B7"
elseif request("remark")=4 then
'aremarkb="卖一币"
aremarkb="%E5%8D%96%E4%B8%80%E5%B8%81"
elseif request("remark")=5 then
'aremarkb="确认收款"
aremarkb="%E7%A1%AE%E8%AE%A4%E6%94%B6%E6%AC%BE"
elseif request("remark")=6 then
'aremarkb="卖积分"
aremarkb="%E5%8D%96%E7%A7%AF%E5%88%86"
elseif request("remark")=7 then
'aremarkb="购金币"
aremarkb="%E8%B4%AD%E9%87%91%E5%B8%81"
elseif request("remark")=8 then
'aremarkb="商城消费"
aremarkb="%E5%95%86%E5%9F%8E%E6%B6%88%E8%B4%B9"
elseif request("remark")=9 then
'aremarkb="换购"
aremarkb="%E6%8D%A2%E8%B4%AD"
elseif request("remark")=10 then
'aremarkb="话费的充值"
aremarkb="%E8%AF%9D%E8%B4%B9%E7%9A%84%E5%85%85%E5%80%BC"
elseif request("remark")=11 then
'aremarkb="票务消费"
aremarkb="%E7%A5%A8%E5%8A%A1%E6%B6%88%E8%B4%B9"
elseif request("remark")=12 then
'aremarkb="商户消费"
aremarkb="%E5%95%86%E6%88%B7%E6%B6%88%E8%B4%B9"
elseif request("remark")=13 then
'aremarkb="活动报名"
aremarkb="%E6%B4%BB%E5%8A%A8%E6%8A%A5%E5%90%8D"
else
'aremarkb="非法"
aremarkb="%E9%9D%9E%E6%B3%95"
end if
post = post & "&mobiles="&rs("call")
post = post & "&username=qqcall2015&password=com#88abc@88"

msg = "尊敬的("&rs("username")&")玩家：您正在进行"&aremarkb&"操作，验证码为："&rs("vipsq")& "（为了您的账户安全，请勿将验证码告知他人）【积分游戏大平台】"
post = post & "&content=" & msg
url="http://www.282930.cn/SMSReceiver.aspx?" & post
resultHtml=getHTTPPage(url) 

if (Instr(resultHtml,",发送成功") = 0) Then
	Response.Write("fail-3")
	Response.End()
End If

Response.Write "success"
Response.End()

Function getHTTPPage(url) 
    dim objXML 
    set objXML=createobject("MSXML2.SERVERXMLHTTP.3.0")
	objXML.SetTimeOuts 10000,10000,10000,30000
    objXML.open "GET",url,false
    objXML.send()
    If objXML.ReadyState=4 And objXML.Status=200 then 
    getHTTPPage=bBytesToBstr(objXML.responseBody)
	Else 
	getHTTPPage="Post err"
	End if
    set objXML=nothing
End Function


Function bBytesToBstr(body) 
    dim objstream
    set objstream = CreateObject("adodb.stream")
    objstream.Type = 1 
    objstream.Mode =3 
    objstream.Open 
    objstream.Write body 
    objstream.Position = 0 
    objstream.Type = 2 
    objstream.Charset = "utf-8"
    bBytesToBstr = objstream.ReadText 
    objstream.Close 
    set objstream = nothing 
End Function

%>