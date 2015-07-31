<!--#include file="../ct0618.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; chars_serchet=gb2312">
<title>Display user information</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table border="0" cellspacing="1" width="100%" bgcolor="#7bb5de" height="111">
    <tr>
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
        <p align="center"><font color="#000000" style="font-size: 14px"><strong>Search Results play home information</strong></font>
      </td> 
  </tr>
  <tr> 
      <td width="100%" bgcolor="#D9E6FF">   <div align="center"><center>
 <%
   const MaxPerPage=10
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
<% 
dim sql_serch 
dim rs_serch 
lkid=request.Form("lkid")
sql_serch="select * from gcuser where username = '"&lkid&"' or name = '"&lkid&"' or call = '"&lkid&"' or qq = '"&lkid&"'"
Set rs_serch= Server.CreateObject("ADODB.Recordset") 
rs_serch.open sql_serch,conn2,1,1
  if rs_serch.eof and rs_serch.bof then 
      response.write "<p align='center'> <br></p>" 
      response.write "<p align='center'> Without this username!</p>" 
   else 
   id=rs_serch("username")
   pa=rs_serch("password") 
	  totalPut=rs_serch.recordcount 
      totalPut=rs_serch.recordcount 
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
           showpage totalput,MaxPerPage,"glfk002.asp" 
            showContent 
            showpage totalput,MaxPerPage,"glfk002.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs_serch.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs_serch.bookmark 
           showpage totalput,MaxPerPage,"glfk002.asp" 
            showContent 
             showpage totalput,MaxPerPage,"glfk002.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"glfk002.asp" 
           showContent 
           showpage totalput,MaxPerPage,"glfk002.asp" 
	      end if 
	   end if 
   end if 
   
   rs_serch.close 	         
   set rs_serch=nothing   
   conn2.close 
   set conn2=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%> 
            <table border="1" cellspacing="0" width="100%" bgcolor="#F6F6EC" style="border-collapse: collapse" cellpadding="0" height="68">
              <tr bgcolor="#7bb5de"> 
                <td width="130" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2"><strong>Username</strong></font></td>
                <td width="80" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2"><strong style="font-weight: 400">Name</strong></font></td>
                <td width="113" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="宋体" size="2">Recommended</font></div></td>
                <td width="113" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2">QQ</font></td>
                <td width="172" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="Arial" size="2">Registration Time</font></div></td>
                <td width="87" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="Arial" size="2">Cumulative consumption</font></div></td>
                <td width="177" align="center" height="33" bgcolor="#D9E6FF"><font face="Arial" size="2">Recent spending time</font></td>
                <td width="236" align="center" height="33" bgcolor="#D9E6FF" colspan="2">　</td>
              </tr>
              <%do while not rs_serch.eof%>
              <tr bgcolor="#7bb5de"> 
                <td style="border-bottom: 1px solid #C9D8AD" width="130" align="center" bgcolor="#D9E6FF"><p align="center"><font size="2"><%=rs_serch("username")%></font></td>
                <td style="border-bottom: 1px solid #C9D8AD" width="80" align="center" bgcolor="#D9E6FF"><p align="center"><font size="2"><%=rs_serch("name")%></font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="113" bgcolor="#D9E6FF"><div align="center"><font color="#FF0000" size="2"><%=rs_serch("up")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="113" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("qq")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="172" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("regtime")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="87" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("cjtj")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="177" bgcolor="#D9E6FF"><font size="2"><%=rs_serch("gmdate")%></font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="139" bgcolor="#D9E6FF"><b><a href="glfk003.asp?lkid=<%=rs_serch("username")%>" style="text-decoration: none">Confirmation e-cards</a></b></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="92" bgcolor="#D9E6FF">　</td>
				</tr>
		<% i=i+1 
	    if i>=MaxPerPage then exit do 
        rs_serch.movenext 
	   loop 
		  %>
		     </table>
		  </div>	
        <% 
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
</div> <p align="center"><b><a href="glfk001.asp" style="text-decoration: none"><font color="#FF0000" size="6">Back to Search</font></a></b></p>
</body> 
</html>