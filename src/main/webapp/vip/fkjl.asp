<!--#include file="../dt0618.asp"-->
<html>
<title>历史发卡记录</title>
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
	<b><span style="font-size: 11pt">代理/商家<font color="#FF0000"><%=request("dl")%></font>历史发卡记录</span></b><span style="font-size: 11pt"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datepay where username ='"&request("fk")&"'and bz="&request("lb")&" order by id desc" 
rs.open sql,conn9,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>还没有历史发卡记录！</p>" 
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
     <td width="104" align="center" height="26" bgcolor="#E8E8FF"><b><font size="2">编号</font></b></td>                
     <td width="191" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> <font face="宋体" color="#800000" size="2"><strong>操作代理/商家</strong></font></td>                
          <td width="302" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>操作发卡时间</strong></font></td>
          <td width="288" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000" face="宋体" size="2">支出一币</font></b></td>
          <td width="193" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FF0000" face="宋体" size="2">备注</font></b></td>
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
</body> 
</html>