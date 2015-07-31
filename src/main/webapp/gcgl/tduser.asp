<!--#include file="../ct0618.asp"-->
<%
if request("cjpa")="yc2015td" and request("tid")<>"" then
Set rsg= Server.CreateObject("ADODB.Recordset")
sqlg="select * from tduser where id="&request("tid")&"" 
rsg.open sqlg,conn2,1,1
tdname=rsg("tdname")
tduserid=rsg("tduserid")
tduser=rsg("tduser")
tdcall=rsg("tdcall")
tdqq=rsg("tdqq")
cjbz=rsg("id")
cjbz2=1
end if
%>
<%
if request("cjpa")="yc2015td" and request("cjbz")<>"" then
Set rsg= Server.CreateObject("ADODB.Recordset")
sqlg="select * from tduser where id="&request("cjbz")&"" 
rsg.open sqlg,conn2,1,3
rsg("tdname")=request("tdname")
rsg("tduserid")=request("tduserid")
rsg("tduser")=request("tduser")
rsg("tdcall")=request("tdcall")
rsg("tdqq")=request("tdqq")
rsg.update
response.Write "<script language=javascript>alert('修改成功！');</script>"
end if
%>
<%
if request("cjpa")="yc2015td" and request("cjbz2")="add" and request("tdname")<>"" and request("tduserid")<>"" and request("tduser")<>"" and request("tdcall")<>"" and request("tdqq")<>"" then
Set rsg= Server.CreateObject("ADODB.Recordset")
sqlg="select * from tduser where tduserid = '"&request("tduserid")&"'"
rsg.open sqlg,conn2,1,3
if not rsg.eof then
   response.write "<script language='javascript'>"
   response.write "alert('身份证号码["&request("tduserid")&"]已经存在，不能重复！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
rsg.addnew
rsg("tdname")=request("tdname")
rsg("tduserid")=request("tduserid")
rsg("tduser")=request("tduser")
rsg("tdcall")=request("tdcall")
rsg("tdqq")=request("tdqq")
rsg.update
end if
response.Write "<script language=javascript>alert('增加成功！');</script>"
end if
%>
<html>
<title>历史退户记录</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
</head>
<table border="0" width="1242" id="table1" cellspacing="0" cellpadding="0" height="114">
	<tr>
		<td width="324"><form method="POST" action="" name="form">操作密码：<input type="password" name="cjpa" size="15"> <input type="submit" value="提交" name="B1"></form></td>
		<td height="40" width="918"><form method="POST" action="" name="form1">任意数值：<input type="text" name="suser" size="20"><input type="hidden" name="cjpa" size="20" value="<%=request("cjpa")%>" readonly> <input type="submit" value="搜索" name="B2"></form></td>
	</tr>
	<tr>
		<td height="74" align="center" colspan="2">
		<form method="POST" action="" name="form2">
			<table border="1" width="100%" id="table2" cellspacing="1" style="border-collapse: collapse" height="55">
				<tr>
					<td align="center">姓名</td>
					<td align="center">身份证</td>
					<td align="center">用户名</td>
					<td align="center">手机</td>
					<td align="center">QQ</td>
					<td align="center" width="278"><input type="hidden" name="cjpa" size="10" value="<%=request("cjpa")%>" readonly></td>
				</tr>
				<tr>
					<td align="center"><input type="text" name="tdname" size="15" value="<%=tdname%>"></td>
					<td align="center"><input type="text" name="tduserid" size="20" value="<%=tduserid%>"></td>
					<td align="center"><input type="text" name="tduser" size="20" value="<%=tduser%>"></td>
					<td align="center"><input type="text" name="tdcall" size="20" value="<%=tdcall%>"></td>
					<td align="center"><input type="text" name="tdqq" size="20" value="<%=tdqq%>"></td>
					<td align="center" width="278"><input type="hidden" name="<%if cjbz<>"" then%>cjbz<%else%>cjbz2<%end if%>" size="3" value="<%if cjbz<>"" then%><%=cjbz%><%else%>add<%end if%>" readonly><input type="submit" value="<%if cjbz2=1 then%>确定修改<%else%>新增<%end if%>" name="B3"></td>
				</tr>
			</table>
		</form>
		</td>
		</tr>
</table>
<%if request("cjpa")="yc2015td" then%>
<%
   const MaxPerPage=100
   dim totalPut   
   dim CurrentPage
   dim TotalPages
   dim i,j

   if not isempty(request("page")) then
      currentPage=cint(request("page"))
   else
      currentPage=1
   end if
   
%>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="1" width="100%" height="28">
    <tr>
      <td width="100%" height="26"><p align="center"><font color="#000000" face="楷体" size="5"><strong>已记录的名单</strong></font></td> 
  </tr>
</table>
	<font face="宋体" size="2">
<%
if request("suser")<>"" then
   adduser="where tdname='"&request("suser")&"' or tduserid='"&request("suser")&"' or tduser='"&request("suser")&"' or tdcall='"&request("suser")&"' or tdqq='"&request("suser")&"'"
end if
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from tduser "&adduser&" order by id desc" 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> 还没记录！</p>" 
   else 
	  totalPut=rs.recordcount
      totalPut=rs.recordcount
      if currentpage<1 then 
          currentpage=1 
      end if 
      if (currentpage-1)*MaxPerPage>totalput then 
	   if (totalPut mod MaxPerPage)=0 then 
	     currentpage= totalPut \ MaxPerPage 
	   else 
	      currentpage= totalPut \ MaxPerPage + 1 
	   end if 
 
      end if 
       if currentPage=1 then 
                       showContent 
            showpage totalput,MaxPerPage,"tduser.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"tduser.asp" 
            showContent 
             showpage totalput,MaxPerPage,"tduser.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"tduser.asp" 
           showContent 
           showpage totalput,MaxPerPage,"tduser.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn2.close 
   set conn2=nothing 
   sub showContent 
       dim i 
	   i=0 
   
%></font>    
          <table width="100%" border="1" height="80" style="border-collapse: collapse">
            <tr> 
              <td align="center" bgcolor="#C0C0C0"><b>编号</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>姓名</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>身份证</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>用户名</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>手机</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>QQ</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>添加时间</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>操作</b></td>
             
              </tr>
              <%do while not rs.eof%>
              <tr> 
              <td align="center" height="30"><%=rs("id")%></td>
              <td align="center" height="30"><%=rs("tdname")%></td>
              <td align="center" height="30"><%=rs("tduserid")%></td>
              <td align="center" height="30"><%=rs("tduser")%></td>
              <td align="center" height="30"><%=rs("tdcall")%></td>
              <td align="center" height="30"><%=rs("tdqq")%></td>
              <td align="center" height="30"><%=rs("tddate")%></td>
              <td align="center" height="30"><form method="POST" action="" name="form3"><input type="hidden" name="cjpa" size="10" value="<%=request("cjpa")%>" readonly><input type="hidden" name="tid" size="5" value="<%=rs("id")%>" readonly><input type="submit" value="修 改" name="B4"></form></td>
              </tr>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
     </table> 
</div><font face="宋体" size="2"><% 
   end sub  
 
function showpage(totalnumber,maxperpage,filename) 
  dim n 
  if totalnumber mod maxperpage=0 then 
     n= totalnumber \ maxperpage 
  else 
     n= totalnumber \ maxperpage+1 
  end if 
  response.write "<form method=Post action="&filename&">" 
  response.write "<p align='center'>&gt;&gt;分页&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>首页 上一页</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&>首页</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&">上一页</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>下一页 尾页</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1) 
    response.write ">下一页</a> <a href="&filename&"?page="&n&">尾页</a>" 
  end if 
   response.write "&nbsp;页次：<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>页 " 
    response.write "&nbsp;共<b>"&totalnumber&"</b>条 <b>"&maxperpage&"</b>条/页 " 
   response.write " 转到：<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function 
 
  
%> 
</font>
<%end if%></body></html>