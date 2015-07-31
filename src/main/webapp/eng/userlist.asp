<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('../index.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")   
end if
sql1="select * from gcuser where username = '"&regid&"'" 
Set rs1= Server.CreateObject("ADODB.Recordset") 
rs1.open sql1,conn2,1,1
%>
<html>
<title>With the name of the account</title>
</head>
<%
   const MaxPerPage=20
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
<body topmargin="0">
<div align="center"><b>
	<table border="0" cellspacing="1" width="100%" cellpadding="0" height="90">
  <tr> 
<td width="87%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="90" bgcolor="#808000"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>
<font face="宋体" size="4">With the name of the account</font></b><font size="2" face="宋体"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where name='"&rs1("name")&"' and userid='"&rs1("userid")&"' order by id asc" 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>You do not!</p>" 
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
            showpage totalput,MaxPerPage,"userlist.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"userlist.asp" 
            showContent 
             showpage totalput,MaxPerPage,"userlist.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"userlist.asp" 
           showContent 
           showpage totalput,MaxPerPage,"userlist.asp" 
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
   
%></font></p>
	<div align="center">    
        <table border="1" cellspacing="1" width="100%" height="60" bgcolor="#000000" bordercolor="#C0C0C0" style="border-collapse: collapse">
     <tr>        
     <td width="231" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><b><font color="#FF0000" face="宋体">User name</font></b></td>                
     <td width="144" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#FF0000"><strong>name</strong></font></td><b>                
     <td width="146" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" face="宋体"> <strong>Game level</strong></font></b></td>
     <td width="159" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" face="宋体"> <strong>Available a currency</strong></font></td>
     <td width="204" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" face="宋体"> <strong>Number of points</strong></font></td>
     <td width="204" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" face="宋体"> <strong>Available gold</strong></font></td>
     <td width="326" align="center" height="27" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" face="宋体"> <strong>Registration Time</strong></font></b></td>
        </tr>
     <%do while not rs.eof%>
        <tr> 
      <td height="22" width="231" align="center"><font face="宋体" color="#FFFFFF"><a target="_top" href="chuserlist.asp?ygid=<%=rs("username")%>&pa=<%=rs("password")%>" style="text-decoration: none"><b><font color="#FFFFFF"><%=rs("username")%><%if regid=rs("username") then%></font></b><font color="#FF00FF">(Current)</font><b><font color="#FFFFFF"><%end if%></font></b></a></font></td>
      <td height="22" width="144" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FFFFFF" face="宋体" style="font-weight: 700"><%=rs("name")%></font></td>
      <td valign="middle" width="146" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" face="宋体"><%=rs("sjb")%></font></b></td>
      <td valign="middle" width="159" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" face="宋体"><%=rs("pay")%></font></b></td>
      <td valign="middle" width="204" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" face="宋体"><%=rs("jyg")%></font></b></td>
      <td valign="middle" width="204" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" face="宋体"><%=rs("jydb")%></font></b></td>
      <td valign="middle" width="326" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" face="宋体"><%=rs("regtime")%></font></b></td>
      </tr>
    <% i=i+1 
	   if i>=MaxPerPage then exit do 
	   rs.movenext 
	   loop 
	%>
  </table> 
</div><font size="2" face="宋体"><% 
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
</html>