<!--#include file="conn.asp"-->
<%
'开始找空位安置myid
tuser=request("up")
myid=request("my")
sjb=request("sjb")
%>
<%
if sjb=1 then
   fd=2000
elseif sjb=3 then   
   fd=6000
elseif sjb=7 then   
   fd=14000
elseif sjb=14 then   
   fd=28000
elseif sjb=28 then   
   fd=56000
elseif sjb=56 then   
   fd=112000
end if
%>
<%
'开始在新表sgxtuser搜索上级
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxtuser where username = '"&tuser&"'"
rs.open sql,conn,2,3
if rs.eof and rs.bof or tuser="0001" then
'搜索最后一个用户名
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT top 1 * FROM sgxtuser order by id desc"
rs0.open sql0,conn,1,1
   myup=rs0("username")
else
   myup=rs("username")
end if
%>
<%
'取最终得到上级myup的记录
set rs_myup = Server.CreateObject("ADODB.Recordset")
sql_myup = "SELECT * FROM sgxtuser where username = '"&myup&"'"
rs_myup.open sql_myup,conn,2,3
%>
<%
'然后检测这个上级推荐人左右有没有满人
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT * FROM sgxtuser where username = '"&myup&"'"
rs1.open sql1,conn,2,3
if rs1("auid")<>"" and rs1("buid")<>"" then'如果两边都不等于空也就是有人了
   tj1=rs1("auid")'先取左边的用户名作推荐
   tj2=rs1("buid")'右边的用户名备用
elseif rs1("auid")="" then'否则如果左边等于空，那myid就放在myup左边
    rs1("auid")=myid
    rs1.update
else'否则myid放在myup右边
    rs1("buid")=myid
    rs1.update
end if

'现在问题来了，如果每次myup下面都没有满就上面成立了会很顺利，但基本上是满了，所以得开始刚才（“tj1=rs1("auid")'先取左边的用户名作推荐”）
'需要检测我左边第一个tj1的左边和边边情况了，安排myid的位置，再不行得检测（“tj2=rs1("buid")'右边的用户名备用”）来安排myid的位置
'就这样检测下去。。直到放置成功。
%>
<%
'上面安置安置好后，在新表sgxtuser里增加我的一条记录
set rs_myid = Server.CreateObject("ADODB.Recordset")
sql_myid = "SELECT * FROM sgxtuser where username='"&myid&"'"
rs_myid.open sql_myid,conn,2,3
'If rs_myid.eof Or rs_myid.bof Then
rs_myid.addnew
rs_myid("username")=myid
rs_myid("sjb")=sjb '我的单数
rs_myid("fdpay")=fd'我的封顶奖金
rs_myid.update
%>


<%
	Call CalculateQ(myid)

Function CalculateQ(userName)
	set rs_Calculate = Server.CreateObject("ADODB.Recordset")
	sql_Calculate = "SELECT * FROM sgxtuser where auid = '"&userName&"' or buid='"&userName&"'"
	'Response.write sql_Calculate&"<br>"

	rs_Calculate.open sql_Calculate,conn,2,3
	If rs_Calculate.eof Or rs_Calculate.bof Then
	Exit Function
	End If
	
	if rs_Calculate("auid")=userName Then
	rs_Calculate("zaq")=rs_Calculate("zaq")+sjb'myup的左边(A)总单数+
	rs_Calculate("aq")=rs_Calculate("aq")+sjb'myup的左边目前单数+
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	ElseIf  rs_Calculate("buid")=userName then'如果两边都不等于0也就是有人了
	rs_Calculate("zbq")=rs_Calculate("zbq")+sjb'myup的右边(B)总单数+
	rs_Calculate("bq")=rs_Calculate("bq")+sjb'myup的右边目前单数+
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'错误的逻辑
	End if
 
End Function

'最后一个就是我在最终的上级左边安置好，这个上级的左边区增加我的单数，如果我在上级的右边，这个上级的右边增加我的单数sjb
'同时，我的这个上级所在是谁的下面（他的上级）他又在他的上级的左或右，并且也在左或右增加单数sjb
'同时，再上级一层呢？也需要这样算。。。。。
'rs_myup("zaq")=rs_myup("zaq")+sjb'myup的左边(A)总单数+
'rs_myup("aq")=rs_myup("aq")+sjb'myup的左边目前单数+
'rs_myup.date
'rs_myup("zbq")=rs_myup("zbq")+sjb'myup的右边(B)总单数+
'rs_myup("bq")=rs_myup("bq")+sjb'myup的右边目前单数+
'rs_myup.date
%>






















