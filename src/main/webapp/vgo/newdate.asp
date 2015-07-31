<!--#include file=../zqcjimg.asp-->
<title>登录日志</title>
<% 
sqllj="select count(id) as lj from dateip" 
Set rslj= Server.CreateObject("ADODB.Recordset") 
rslj.open sqllj,conn1,1,1
%>
<% 
sqljt="select count(id) as jt from dateip where DateDiff('d',date(),dldate)=0" 
Set rsjt= Server.CreateObject("ADODB.Recordset") 
rsjt.open sqljt,conn1,1,1
%>
<% 
sqlzt="select count(id) as zt from dateip where DateDiff('d',date(),dldate)=-1" 
Set rszt= Server.CreateObject("ADODB.Recordset") 
rszt.open sqlzt,conn1,1,1
%>
<% 
sqlqt="select count(id) as qt from dateip where DateDiff('d',date(),dldate)=-2" 
Set rsqt= Server.CreateObject("ADODB.Recordset") 
rsqt.open sqlqt,conn1,1,1
%>
<% 
sqldqt="select count(id) as dqt from dateip where DateDiff('d',date(),dldate)=-3" 
Set rsdqt= Server.CreateObject("ADODB.Recordset") 
rsdqt.open sqldqt,conn1,1,1
%>
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

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"><p align="center" style="margin-top: 0; margin-bottom: 0; line-height:150%"><font color="#000000" style="font-size: 11pt" face="宋体"><strong>登 录 记 录 明 细</strong></font>
      <p align="center" style="margin-top: 0; margin-bottom: 0; line-height:150%"><strong><font face="宋体" style="font-size: 11pt">（累计：<font color="#800080"><%=rslj("lj")%></font>）（今天：<font color="#800080"><%=rsjt("jt")%></font>）（昨天：<font color="#800080"><%=rszt("zt")%></font>）（前天：<font color="#800080"><%=rsqt("qt")%></font>）（大前天：<font color="#800080"><%=rsdqt("dqt")%></font>）</font></strong></td> 
  </tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9"><font face="宋体" style="font-size: 11pt"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from dateip order by id desc" 
rs.open sql,conn1,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'> 还没有登录记录！</p>" 
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
            showpage totalput,MaxPerPage,"newdate.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"newdate.asp" 
            showContent 
             showpage totalput,MaxPerPage,"newdate.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"newdate.asp" 
           showContent 
           showpage totalput,MaxPerPage,"newdate.asp" 
	      end if 
	   end if 
   end if
    
   Rs.close	         
   set rs=nothing   
   conn1.close
   set conn1=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></font><font face="宋体" style="font-size: 11pt"><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57" id="table1"><tr>
          <td width="230" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" color="#000000" size="2"><strong>用户名</strong></font></td>
          <td width="374" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" style="font-weight:700" face="宋体" size="2">最近登录时间</font></td>
          <td width="355" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" style="font-weight:700" face="宋体" size="2">退出时间</font></td>
          <td width="350" align="center" height="29" bgcolor="#C3DAF9">ip地址</td>
          <td width="350" align="center" height="29" bgcolor="#C3DAF9">相关操作</td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
          <td height="29" width="230" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" size="2"><%=rs("user")%></font></td>
          <td valign="middle" align="center" width="374"><%=rs("dldate")%></td>
          <td valign="middle" align="center" width="355"><font size="2" face="宋体"><%=rs("tcdate")%></font></td>
          <td valign="middle" align="center" width="350"><%=rs("dlip")%></td>
          <td valign="middle" align="center" width="350"><%=rs("dlfs")%></td>
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