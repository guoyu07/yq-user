<!--#include file="../dt0618.asp"-->
<html>
<title>History issuing records</title>
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
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#F4F7E8">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">Agency / Business<font color="#FF0000"><%=request("dl")%></font>History issuing records</span></b><span style="font-size: 11pt"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datepay where username ='"&request("fk")&"'and bz="&request("lb")&" order by id desc" 
rs.open sql,conn9,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>History has not been issuing record!</p>" 
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
            showpage totalput,MaxPerPage,"fkjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"fkjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"fkjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"fkjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"fkjl.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn9.close 
   set conn9=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr>        
     <td width="104" align="center" height="26" bgcolor="#E8E8FF"><b><font size="2">Id</font></b></td>                
     <td width="191" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> <font face="宋体" color="#800000" size="2"><strong>Operating agency / business</strong></font></td>                
          <td width="302" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>Operating issuing time</strong></font></td>
          <td width="288" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000" face="宋体" size="2">Spending a currency</font></b></td>
          <td width="193" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FF0000" face="宋体" size="2">Remark</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
          <td height="24" width="104" align="center" bgcolor="#DFFFEF"><b><font size="2" face="宋体"><%=rs("id")%></font></b></td>
          <td height="24" width="191" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000" face="宋体" size="2" style="font-weight: 700"><%=rs("username")%></font></td>
          <td valign="middle" width="302" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" size="2"><%=rs("date")%></font></td>
          <td valign="middle" align="center" width="288" bgcolor="#DFFFEF"><font face="宋体" size="2"><%=rs("jc")%></font></td>
          <td valign="middle" align="center" width="193" bgcolor="#DFFFEF"><%=rs("regid")%></td>
              </tr>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
            </table> 
</div><font size="2"><% 
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
</table> 
</div> 
</body> 
</html>