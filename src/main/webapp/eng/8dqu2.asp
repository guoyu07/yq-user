<!--#include file="../mq0618.asp"-->
<html>
<title>Show southern China</title>
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
	<table border="0" cellspacing="0" width="100%" cellpadding="0" height="45">
		<tr>
			<td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="45">
			<font size="2" face="黑体">
			<%
sql="select * from addsheng order by id desc"
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn7,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'></p>" 
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
            showpage totalput,MaxPerPage,"8dqu2.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"8dqu2.asp" 
            showContent 
             showpage totalput,MaxPerPage,"8dqu2.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"8dqu2.asp" 
           showContent 
           showpage totalput,MaxPerPage,"8dqu2.asp" 
	      end if 
	   end if 
   end if 
	         
   Rs.close
   set rs=nothing   
   conn7.close 
   set conn7=nothing 
   sub showContent 
       dim i 
	   i=0 
   
%></font><div align="center">
		<table border="1" cellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse" cellpadding="0" height="45">
		<tr>
		<td width="340" align="center" height="24" bgcolor="#E5EAC2"><font color="#000000" size="2" face="黑体">Time</font></td>
		<td width="266" align="center" height="24" bgcolor="#E5EAC2"><font color="#000000" size="2" face="黑体">Guangdong Province</font></td>
		<td width="265" align="center" height="24" bgcolor="#E5EAC2"><font color="#000000" size="2" face="黑体">Guangxi Province</font></td>
		<td width="239" align="center" height="24" bgcolor="#E5EAC2"><font color="#000000" size="2" face="黑体">Hainan Province</font></td>
		<td width="266" align="center" height="24" bgcolor="#E5EAC2"><font color="#000000" size="2" face="黑体">Sichuan Province</font></td>
		</tr>
        <%do while not rs.eof%>
        <tr>
		<td width="340" align="center" bgcolor="#FFE6E6"><font color="#000000" size="2" face="黑体"><%=rs("date")%></font></td>
		<td width="266" align="center" bgcolor="#FFE6E6"><font color="#000000" size="2" face="黑体"><%=rs("gd")%></font></td>
		<td width="265" align="center" bgcolor="#FFE6E6"><font color="#000000" size="2" face="黑体"><%=rs("gx")%></font></td>
		<td width="239" align="center" bgcolor="#FFE6E6"><font color="#000000" size="2" face="黑体"><%=rs("nn")%></font></td>
		<td align="center" width="266" bgcolor="#FFE6E6"><font color="#000000" size="2" face="黑体"><%=rs("xc")%></font></td>
		</tr>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
        </table></div><font size="2" face="黑体"><% 
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
</font> 
</tr>
</table></div>
</body> 
</html>