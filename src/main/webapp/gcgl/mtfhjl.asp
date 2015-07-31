<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
sql2="select * from mtfhtj order by tjid desc" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn2,1,1
%>
<% 
sql_nd="select sum(sjb) as ljnd from sgxt where DateDiff('d',date(),bddate)=0  and new>0" 
Set rs_nd= Server.CreateObject("ADODB.Recordset") 
rs_nd.open sql_nd,conn7,1,1
%>
<% 
sql_cb="select sum(zfh) as ljcb from sgxt where new>0 " 
Set rs_cb= Server.CreateObject("ADODB.Recordset") 
rs_cb.open sql_cb,conn7,1,1
%>
<% 
sql_mq="select sum(mqfh) as ljmq from sgxt where new>0 " 
Set rs_mq= Server.CreateObject("ADODB.Recordset") 
rs_mq.open sql_mq,conn7,1,1
%>
<% 
sql_zd="select sum(sjb) as ljzd from sgxt where new>0 " 
Set rs_zd= Server.CreateObject("ADODB.Recordset") 
rs_zd.open sql_zd,conn7,1,1
%>
<html>
<title>历史返本记录</title>
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
  	<p><%if date()-rs2("fhdate")<>1 then%><a onClick="return confirm('提示：您确定了吗？ ')" href="sgnew.asp" style="text-decoration: none">执行返本计算</a><%end if%></p>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#FFFFC1">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">历史记录按1倍算<font color="#FF00FF"><%=rs_zd("ljzd")*500%></font>&nbsp; 今天目前新<font color="#FF0000"><%=rs_nd("ljnd")*500%></font>个 总应返<font color="#FF0000"><%=rs_cb("ljcb")%></font> 累计已返<font color="#FF0000"><%=rs_mq("ljmq")%></font> 未返<font color="#FF0000"><%=rs_cb("ljcb")-rs_mq("ljmq")%></font></span></b><span style="font-size: 11pt"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from mtfhtj order by tjid desc" 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>还没有历史记录！</p>" 
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
            showpage totalput,MaxPerPage,"mtfhjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"mtfhjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"mtfhjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"mtfhjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"mtfhjl.asp" 
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
   
%></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr>        
     <td width="104" align="center" height="26" bgcolor="#E8E8FF"> 
	<b><font size="2" face="宋体">编号</font></b></td>                
     <td width="185" align="center" height="26" bgcolor="#E8E8FF"> 
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#800000" size="2">
				<strong>结算日期</strong></font></td>                
              <td width="291" align="center" height="26" bgcolor="#E8E8FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#800000" face="宋体" size="2"> <strong>新单(元)</strong></font></td>
              <td width="199" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000" face="宋体" size="2">累计需返</font></b></td>
              <td width="189" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="宋体" size="2">目前已返</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="24" width="104" align="center" bgcolor="#DFFFEF"><b>
				<font size="2" face="宋体"><%=rs("tjid")%></font></b></td>
                <td height="24" width="185" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#008000" face="宋体" size="2" style="font-weight: 700"><%=rs("fhdate")%></font></td>
                <td valign="middle" width="291" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2"><%=rs("newd")%></font></td>
                <td valign="middle" align="center" width="199" bgcolor="#DFFFEF"><font face="宋体" size="2"><%=rs("zfh")%></font></td>
                <td valign="middle" align="center" width="189" bgcolor="#DFFFEF"><font face="宋体" size="2"><%=rs("mqfh")%></font></td>
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
</html>