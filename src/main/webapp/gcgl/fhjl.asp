<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
sql2="select * from fhdate order by id desc" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn7,2,3
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT sum(pdlb) as jt FROM mqfh where DateDiff('d',date(),pddate)=0 "
rs1.open sql1,conn7,1,1
%>
<html>
<title>历史分红记录</title>
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
  	<p><%'if date()-rs2("date")=2 then%><a onClick="return confirm('提示：您确定了吗？ ')" href="jsfh.asp" style="text-decoration: none">执行昨天计算</a><%'end if%></p>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#FFFFC1">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">历史分红记录&nbsp; 今天目前新增激活股权<font color="#FF0000"><%=rs1("jt")%></font>个<font color="#FF0000"></font></span></b><span style="font-size: 11pt"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from fhdate order by id desc" 
rs.open sql,conn7,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>还没有历史分红记录！</p>" 
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
            showpage totalput,MaxPerPage,"fhjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"fhjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"fhjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"fhjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"fhjl.asp" 
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
   
%></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr>        
     <td width="65" align="center" height="26" bgcolor="#E8E8FF"> 
	<b><font size="2" face="宋体">编号</font></b></td>                
     <td width="129" align="center" height="26" bgcolor="#E8E8FF"> 
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#800000" size="2">
				<strong>结算日期</strong></font></td>                
              <td width="113" align="center" height="26" bgcolor="#E8E8FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#800000" face="宋体" size="2"> <strong>盈利额(元)</strong></font></td>
              <td width="119" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000" face="宋体" size="2">参与股权(个)</font></b></td>
              <td width="97" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="宋体" size="2">双区会员</font></td>
              <td width="99" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="宋体" size="2">普通会员</font></td>
              <td width="87" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="宋体" size="2">统计昨天</font></td>
              <td width="107" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#FF0000" face="宋体" size="2">统计目前</font></b></td>
              <td width="282" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b><font color="#800000" face="宋体" size="2">状态</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="24" width="65" align="center" bgcolor="#DFFFEF"><b>
				<font size="2" face="宋体"><%=rs("id")%></font></b></td>
                <td height="24" width="129" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#008000" face="宋体" size="2" style="font-weight: 700"><%=rs("date")%></font></td>
                <td valign="middle" width="113" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2"><%=rs("zly")%></font></td>
                <td valign="middle" align="center" width="119" bgcolor="#DFFFEF"><font face="宋体" size="2"><%=rs("fhk")%></font></td>
                <td valign="middle" align="center" width="97" bgcolor="#DFFFEF"><font face="宋体" size="2"><%if rs("vipfhpay")<1 then%>0<%=rs("vipfhpay")%><%else%><%=rs("vipfhpay")%><%end if%></font></td>
                <td valign="middle" align="center" width="99" bgcolor="#DFFFEF"><font face="宋体" size="2"><%if rs("fhpay")<1 then%>0<%=rs("fhpay")%><%else%><%=rs("fhpay")%><%end if%></font></td>
                <td valign="middle" align="center" width="87" bgcolor="#DFFFEF">
				<font face="宋体" size="2"><%=rs("tjjt")%></font></td>
                <td valign="middle" align="center" width="107" bgcolor="#DFFFEF">
				<font face="宋体" size="2"><%=rs("tjmq")%></font></td>
                <td valign="middle" align="center" width="282" bgcolor="#DFFFEF">
				<font face="宋体" size="2" color="#0000FF"><%if rs("bz")>1 then%>发放成功<%elseif rs("bz")=0 then%> <a onClick="return confirm('提示：您确定了吗？ ')" href="jsvipfh.asp?pdid=<%=rs("id")%>&fh=<%=rs("vipfhpay")%>" style="text-decoration: none">双区会员分红</a> <%elseif rs("bz")=1 then%><a onClick="return confirm('提示：您确定了吗？ ')" href="jsptfh.asp?pdid=<%=rs("id")%>&fh=<%=rs("fhpay")%>" style="text-decoration: none">普通会员分红</a> <%end if%></font></td>
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