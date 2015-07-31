<!--#include file=../zqcjimg.asp-->
<%
cfkf=request("kf")
if cfkf="cfhkf01" then
   cz01="中国一川【①号】客服QQ：613697151"
   cz02="陈文娟"
elseif cfkf="cfhkf02" then
   cz01="中国一川【②号】客服QQ：613697152"
   cz02="陈文娟"
end if
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT sum(dqcj) as jt FROM datecj where cz = '"&cfkf&"' and DateDiff('d',date(),qldate)=0"
rs1.open sql1,conn1,1,1
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT sum(dqcj) as zt FROM datecj where cz = '"&cfkf&"'and DateDiff('d',date(),qldate)=-1"
rs2.open sql2,conn1,1,1
%>
<%
set rs3 = Server.CreateObject("ADODB.Recordset")
sql3 = "SELECT sum(dqcj) as ct FROM datecj where cz = '"&cfkf&"'and DateDiff('d',date(),qldate)=-2"
rs3.open sql3,conn1,1,1
%>
<%
set rs4 = Server.CreateObject("ADODB.Recordset")
sql4 = "SELECT sum(dqcj) as lj FROM datecj where cz = '"&cfkf&"'"
rs4.open sql4,conn1,1,1
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

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="145">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0; line-height:150%">
		<strong>
		<font color="#008000" style="font-size: 11pt" face="宋体"><%=cz01%></font><font color="#000000" style="font-size: 11pt" face="宋体"> 编号：</font><font color="#FF0000" style="font-size: 11pt" face="宋体"><%=cfkf%></font><font color="#000000" style="font-size: 11pt" face="宋体"> 充 值 记 录 明 细</font></strong><p align="center" style="margin-top: 0; margin-bottom: 0; line-height:150%">
		<strong>
		<font color="#FF00FF" face="宋体" size="2"> 提示：本服务中心收款名字为“</font><font color="#000080" face="宋体" size="2"><%=cz02%></font><font color="#FF00FF" face="宋体" size="2">”</font></strong><table border="1" width="100%" id="table2" style="border-collapse: collapse" height="30" bgcolor="#F0F3DC">
			<tr>
				<td align="center"><font size="2">今天：<font color="#FF0000"><%=rs1("jt")%></font></font></td>
				<td align="center"><font size="2">昨天：<%=rs2("zt")%></font></td>
				<td align="center"><font size="2">前天：<%=rs3("ct")%></font></td>
				<td align="center"><font size="2">累计：<font color="#FF0000"><%=rs4("lj")%></font></font></td>
			</tr>
		</table>
		</td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="100" bgcolor="#C3DAF9">
	<font face="宋体" style="font-size: 11pt"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datecj where cz = '"&cfkf&"' order by id desc" 
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
            showpage totalput,MaxPerPage,"czkf.asp?kf="&cfkf&"" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"czkf.asp?kf="&cfkf&"" 
            showContent 
             showpage totalput,MaxPerPage,"czkf.asp?kf="&cfkf&"" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"czkf.asp?kf="&cfkf&"" 
           showContent 
           showpage totalput,MaxPerPage,"czkf.asp?kf="&cfkf&"" 
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
   
%><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="67" id="table1">
            <tr>
          <td width="169" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font face="宋体" color="#000000" size="2"><strong>用户名</strong></font></td>
          <td width="121" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" face="宋体" size="2"> <strong>最近充值</strong></font></td>
          <td width="122" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font face="宋体" color="#000000" style="font-weight:700" size="2">累计充值</font></td>
          <td width="200" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值时间</font></td>
          <td width="149" align="center" height="34" bgcolor="#C3DAF9">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值方式</font></td>
          <td width="129" align="center" height="34" bgcolor="#FFF7FF">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">操作员</font></td>
          <td width="225" align="center" height="34" bgcolor="#C3DAF9">
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">ip地址</td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
          <td height="34" width="169" align="center">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" face="宋体" size="2"><%=rs("cjuser")%></font></td>
          <td valign="middle" width="121" align="center">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font color="#000000" face="宋体" size="2"><%=rs("dqcj")%></font></td>
          <td valign="middle" align="center" width="122">
			<p style="margin-top: 0; margin-bottom: 0; line-height:150%">
			<font size="2" face="宋体">　<%=rs("ljcj")%></font></td>
          <td valign="middle" align="center" width="200"><%=rs("qldate")%></td>
          <td valign="middle" align="center" width="149">
			<font size="2" face="宋体"><%=rs("cjfs")%></font></td>
          <td valign="middle" align="center" width="129" bgcolor="#FFF7FF"><%=rs("cz")%></td>
          <td valign="middle" align="center" width="225"><%=rs("ip")%></td>
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
</html>