<!--#include file=../zqcjimg.asp-->
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
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>充 值 记 录 明 细</strong></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
	<font face="宋体" style="font-size: 11pt"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datecj where cjuser = '"&request("cj")&"' order by id desc" 
rs.open sql,conn1,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'> 还没有充值记录！</p>" 
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
            showpage totalput,MaxPerPage,"cjjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"cjjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"cjjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"cjjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"cjjl.asp" 
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
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57" id="table1">
            <tr>
          <td width="154" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>用户名</strong></font></td>
          <td width="91" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong>最近充值</strong></font></td>
          <td width="105" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" style="font-weight:700" size="2">累计充值</font></td>
          <td width="203" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值时间</font></td>
          <td width="198" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值方式</font></td>
          <td width="124" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原购买者</font></td>
          <td width="229" align="center" height="29" bgcolor="#C3DAF9">ip地址</td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
          <td height="29" width="154" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"><%=rs("cjuser")%></font></td>
          <td valign="middle" width="91" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"><%=rs("dqcj")%></font></td>
          <td valign="middle" align="center" width="105"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">　<%=rs("ljcj")%></font></td>
          <td valign="middle" align="center" width="203"><%=rs("qldate")%></td>
          <td valign="middle" align="center" width="198">
			<font size="2" face="宋体"><%=rs("cjfs")%></font></td>
          <td valign="middle" align="center" width="124"><%=rs("bz")%></td>
          <td valign="middle" align="center" width="229"><%=rs("ip")%></td>
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