<%
if request.cookies("regid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")   
end if
%>
<!--#include file="../ct0618.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>Credit Market</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<%
   const MaxPerPage=35
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
</head>
</body>
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="85" id="table1">
    <tr>
     <td width="100%" height="25"><p align="center"><p align="center"><strong><font color="#008000" size="5">Sell</font></strong><p align="center"></td> 
  </tr>
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="62" bgcolor="#D7FFE3">
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where jy=0 and mcsl>0 order by pay,id " 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>No disposal of records</p>" 
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
            showpage totalput,MaxPerPage,"gpjymc.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"gpjymc.asp" 
            showContent 
            showpage totalput,MaxPerPage,"gpjymc.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gpjymc.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gpjymc.asp" 
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
   
%><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="58" id="table2">
          <tr> 
          <td width="200" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2"><strong>Number of items sold</strong></font></td>
          <td width="160" align="center" height="30" bgcolor="#FFE1FF"><b><font size="2">Unit price</font></b></td>
          <td width="200" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2"><strong>Turnover</strong></font></td>
          <td width="180" align="center" height="30" bgcolor="#FFE1FF"><b><font color="#000000" size="2">Release party</font></b></td>
          <td width="238" align="center" height="30" bgcolor="#FFE1FF"><b><font size="2">Operating</font></b></td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
          <td align="center" width="200" height="32"><b><font color="#000000" size="2"><%=rs("mcsl")%></font></b></td>
          <td align="center" width="160" height="32"><b><font color="#FF0000" size="2"><%if rs("pay")<1 then%>0<%=rs("pay")%><%else%><%=rs("pay")%><%end if%></font></b></td>
          <td align="center" width="200" height="32"><font size="2" color="#614039"><%=rs("jypay")%></font></td>
          <td align="center" width="180" height="32"><font size="2"><%=rs("username")%></font></td>
          <td align="center" width="238" height="32"><%if rs("mcsl")>0 then%><b><a onClick="return confirm('Tip: Are you sure it?')" target="main" href="wymy.asp?id=<%=rs("id")%>&pay=<%=rs("jypay")%>"><font color="#FF0000" style="font-size: 11pt">I want to buy</font></a></b><%end if%></td>
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
        
end function
%> 
</tr> 
</table> 
</html>