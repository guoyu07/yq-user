<!--#include file="../shopmfh.asp"-->
<html>
<title>金币卡转赠记录</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<LINK href="adminstyle.css" type=text/css rel=StyleSheet>
<%
   const MaxPerPage=50
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
<body style="text-align: center">
<div align="center">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="85">
    <tr>
    <td width="100%" height="25" bgcolor="#FFFFB9"><p align="center" style="margin-top: 0; margin-bottom: 0"><font face="宋体"><b>金币卡转赠记录</b></font></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="60">
<font face="宋体" size="2">
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from jbkzj order by id desc" 
rs.open sql,conn0,1,1
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
            showpage totalput,MaxPerPage,"gmzj.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"gmzj.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gmzj.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gmzj.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gmzj.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn0.close 
   set conn0=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%>
	</font>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="59">
            <tr>
              <td width="152" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" color="#800000" size="2"><strong>消费编号</strong></font></td>
              <td width="57" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>面值</strong></font></td>
              <td width="123" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>生成时间</strong></font></td>
              <td width="114" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">原购</font></td>
              <td width="165" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转1</font></td>
              <td width="156" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转2</font></td>
              <td width="160" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转3</font></td>
              <td width="140" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转4</font></td>
              <td width="158" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转5</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="152" align="center" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font color="#008000" size="2" style="font-weight: 700" face="宋体"><%=rs("pdid")%></font></td>
                <td valign="middle" width="57" align="center" bgcolor="#E8E8FF"><font color="#FF0000" face="宋体" size="2"><p style="margin-top: 0; margin-bottom: 0"><%=rs("mj")%>0</font></td>
                <td valign="middle" width="123" align="center" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"><%=rs("gmdate")%></font></td>
                <td valign="middle" align="center" width="114" bgcolor="#E8E8FF"><font face="宋体" size="2"><%=rs("yuser")%></font></td>
                <td valign="middle" align="center" width="165" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF"><%=rs("user01")%></font>-<%=rs("zjdate01")%></font></td>
                <td valign="middle" align="center" width="156" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF"><%=rs("user02")%></font>-<%=rs("zjdate02")%></font></td>
                <td valign="middle" align="center" width="160" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF"><%=rs("user03")%></font>-<%=rs("zjdate03")%></font></td>
                <td valign="middle" align="center" width="140" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF"><%=rs("user04")%></font>-<%=rs("zjdate04")%></font></td>
                <td valign="middle" align="center" width="158" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF"><%=rs("user05")%></font>-<%=rs("zjdate05")%></font></td>
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
    response.write "<a href="&filename&"&page=1&>首页</a>&nbsp;" 
    response.write "<a href="&filename&"&page="&CurrentPage-1&">上一页</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>下一页 尾页</font>" 
  else 
    response.write "<a href="&filename&"&page="&(CurrentPage+1) 
    response.write ">下一页</a> <a href="&filename&"&page="&n&">尾页</a>" 
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