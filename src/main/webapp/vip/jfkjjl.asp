<!--#include file="../mq0618.asp"-->
<html>
<title>积分开奖记录</title>
</head>
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
<body topmargin="0">
<div align="center"><b><table border="0" cellspacing="1" width="100%" cellpadding="0" height="75">
  <tr> 
 <td width="87%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73" bgcolor="#808000"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font face="宋体"><b>积分开奖记录</b><font size="2"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from jfkjdate where bz=1 order by kid desc" 
rs.open sql,conn7,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>还没有开奖记录！</p>" 
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
            showpage totalput,MaxPerPage,"jfkjjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"jfkjjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"jfkjjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"jfkjjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"jfkjjl.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn7.close 
   set conn7=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></font></font></p>
	<div align="center">    
          <table border="0" cellspacing="0" width="100%" cellpadding="0" height="50" bgcolor="#000000">
            <tr>        
     <td width="400" align="center" height="28" bgcolor="#000000" bordercolor="#000000"><b><font size="2" color="#FF0000" face="宋体">期号</font></b></td>                
     <td width="400" align="center" height="28" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#FF0000" size="2"><strong>单双</strong></font></td>                
     <td width="400" align="center" height="28" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" face="宋体" size="2"> <strong>大小</strong></font></td>
           </tr>
              <%do while not rs.eof%>
              <tr> 
      <td height="24" width="425" align="center"><b><font size="2" face="宋体" color="#FFFFFF"><%=rs("kid")%></font></b></td>
      <td height="24" width="412" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FFFFFF" face="宋体" size="2" style="font-weight: 700"><%if rs("dskj")=1 then%>单<%elseif rs("dskj")=2 then%>双<%end if%></font></td>
      <td valign="middle" width="394" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" face="宋体" size="2"><%if rs("kdxj")=3 then%>大<%elseif rs("kdxj")=4 then%>小<%end if%></font></b></td>
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
</tr> 
</table> 
</div> 
</html>