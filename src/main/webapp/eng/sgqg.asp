<%
if request.cookies("regid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")   
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<title>>Seeking modification options</title>
<%
   const MaxPerPage=15
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
<p align="center">
		<strong>
		<font color="#000000">When options before seeking out fine</font></strong></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datepay where username = '"&regid&"' and dbjc>0 and regid='BUY listed in' order by id desc" 
rs.open sql,conn9,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>No records</p>" 
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
            showpage totalput,MaxPerPage,"sgqg.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"sgqg.asp" 
            showContent 
             showpage totalput,MaxPerPage,"sgqg.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"sgqg.asp" 
           showContent 
           showpage totalput,MaxPerPage,"sgqg.asp" 
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
   
%></font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="30">
            <tr> 
              <td width="265" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><strong style="font-weight: 400">User name</strong></font>
              <td width="289" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><strong style="font-weight: 400">Buy credit amount</strong></font></td>
              <td width="218" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">Coins needed</font></td>
              <td width="284" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">Buy Time</font></td>
              <td width="180" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2">Operating</font></td>
              </tr>
              <%do while not rs.eof%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT * FROM gpjy where username = '"&regid&"' and jyid="&rs("id")&""
rs1.open sql1,conn2,1,1
%>
              <tr> 
              <td height="35" width="265" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><%=regid%></font></td>
              <td valign="middle" width="289" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><%=rs1("mysl")%></font></td>
              <td valign="middle" align="center" width="218"><font size="2"><%=rs("dbjc")%></font></td>
              <td valign="middle" align="center" width="284"><font color="#000000" size="2"><%=rs("abdate")%></font></td>
			  <td align="center" width="180"><font size="2"><a href="qxqg.asp?qxid=<%=rs("id")%>" style="text-decoration: none">Revoked</a></font></td>
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
<font face="宋体" size="2"> 
</div> </div>
</font>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" face="宋体" size="2">Back to Previous Page</font></a></p>
<font face="宋体" size="2">
</body>
</font>
<meta http-equiv=Refresh content="180; url=">
</html>