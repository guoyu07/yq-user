<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('logtgs.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
sql="select * from gcuser where username = '" & regid & "'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
%>
<%
sql_up ="select * from gcuser where username = '" & rs("up") & "'" 
Set rs_up = Server.CreateObject("ADODB.Recordset") 
rs_up.open sql_up,conn2,1,1
%>
<html>
<title>Promote information displayed</title>
</head>
<%
   const MaxPerPage=30
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
<div align="center">
  <p align="left">If you have questions, please contact me first time (Recommended):QQ：<font color="#FF0000"><%=rs_up("qq")%></font><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=rs_up("qq")%>&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=rs_up("qq")%>:41" alt="Click here to send me a message" title="Click here to send me a message"></font></a><font color="#FF0000"></font> Cell phone:<font color="#FF0000"><%=rs_up("call")%></font><font color="#0000FF"> <%=left(rs_up("name"),1)%>Mr / Miss</font></p>
  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25" background="images/admin_bg_1.gif"> 
      <p align="center"><font color="#000000" style="font-size: 14px"><strong>Direct promotion next record fine</strong></font></td> 
  </tr> 
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#C3DAF9"><br> 
<%
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where up = '"&regid&"' order by id desc" 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'> Not recommended recording, to refuel ah!</p>" 
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
            showpage totalput,MaxPerPage,"tgdown.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"tgdown.asp" 
            showContent 
             showpage totalput,MaxPerPage,"tgdown.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"tgdown.asp" 
           showContent 
           showpage totalput,MaxPerPage,"tgdown.asp" 
	      end if 
	   end if 
   end if
    
   Rs.close	         
   set rs=nothing   
   conn2.close
   set conn2=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%>
<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr>
          <td width="148" align="center" height="28" bgcolor="#C3DAF9"><font face="宋体" color="#000000" style="font-size: 11pt"><strong>Username</strong></font></td>
          <td width="168" align="center" height="28" bgcolor="#C3DAF9"><p><font face="宋体" color="#000000" style="font-size: 11pt; font-weight:700">QQ</font></td>
          <td width="202" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" face="宋体">Registration Time</font></td>
          <td width="116" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" face="宋体">Cumulative recharge</font></td>
          <td width="217" align="center" height="28" bgcolor="#C3DAF9"><font color="#000000" style="font-size: 11pt; font-weight:700" face="宋体">Recent recharge time</font></td>
          <td width="148" align="center" height="28" bgcolor="#C3DAF9">Dual-zone players</td>
          <td width="228" align="center" height="28" bgcolor="#C3DAF9"><font face="宋体"><span style="font-size: 11pt; font-weight:700">Upgrade Time</span></font></td>
          </tr>
          <%do while not rs.eof%>
<%
Set rs_sg= Server.CreateObject("ADODB.Recordset")
sql_sg="select * from sgxt where username = '"&rs("username")&"'" 
rs_sg.open sql_sg,conn7,1,1
%>
          <tr> 
          <td height="23" width="148" align="center"><p><font color="#000000" size="2"><%=rs("username")%></font></td>
          <td valign="middle" align="left" width="168"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=rs("qq")%>&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=rs("qq")%>:41" alt="Click here to send me a message" title="Click here to send me a message"></font></a><font size="2" color="#000000"><%=rs("qq")%></font></td>
          <td valign="middle" align="center" width="202"><font color="#000000" size="2"><%=rs("regtime")%></font></td>
          <td valign="middle" align="center" width="116"><b><font color="#FF0000" size="2"><%=rs("cjtj")%></font></b></td>
          <td valign="middle" align="center" width="217"><font color="#000000" size="2"><%=rs("gmdate")%></font></td>
          <td valign="middle" align="center" width="148"><%if rs("sjb")=0 then%>No<%else%><%=rs("sjb")%>Single<%end if%></td>
          <td valign="middle" align="center" width="228"><font size="2"><%if not rs_sg.eof then%><%=rs_sg("bddate")%><%end if%></font></td>
          </tr>
         <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
            </table> 
</div><% 
   end sub  
 
function showpage(totalnumber,maxperpage,filename) 
  dim n 
  if totalnumber mod maxperpage=0 then 
     n= totalnumber \ maxperpage 
  else 
     n= totalnumber \ maxperpage+1 
  end if 
  response.write "<form method=Post action="&filename&">" 
  response.write "<p align='center'>&gt;&gt;Paging&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>Home Previous</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&>Home</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&">Previous</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>Next End</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1) 
    response.write ">Next</a> <a href="&filename&"?page="&n&">End</a>" 
  end if 
   response.write "&nbsp;Page：<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>Page " 
    response.write "&nbsp;Altogether<b>"&totalnumber&"</b>Number <b>"&maxperpage&"</b>Number/Page " 
   response.write " Go to:<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function 
 
  
%> 
</tr> 
</table> 
</div> 
</body> 
</html>