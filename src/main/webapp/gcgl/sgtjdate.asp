<!--#include file="../ct0618.asp"-->
<title>交易市场</title>
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
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="59">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="59" bgcolor="#F1F3DE">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from sgtj order by sgid desc" 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>暂无记录</p>" 
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
            showpage totalput,MaxPerPage,"sgtjdate.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"sgtjdate.asp" 
            showContent 
             showpage totalput,MaxPerPage,"sgtjdate.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"sgtjdate.asp" 
           showContent 
           showpage totalput,MaxPerPage,"sgtjdate.asp" 
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
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="56">
            <tr> 
        <td width="46" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><strong style="font-weight: 400">期号</strong></font></td>
        <td width="148" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2">结算时间</font></td>
        <td width="67" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">总单</strong></font></td>
        <td width="55" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">新单</strong></font></td>
        <td width="62" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">左区存</strong></font></td>
        <td width="61" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">右区存</strong></font></td>
        <td width="70" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2"> <strong style="font-weight: 400">本期拨出</strong></font></td>
        <td width="71" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2">总碰数</font></td>
        <td width="61" align="center" height="30" bgcolor="#C0C0C0"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"> <strong style="font-weight: 400">领导奖</strong></font></td>
		<td align="center" bgcolor="#ECECFF" width="103"><b><font size="2" color="#008000">全部</font></b></td>
		<td align="center" bgcolor="#ECECFF" width="92"><font size="2">奖金</font></td>
		<td align="center" bgcolor="#ECECFF" width="89"><font size="2">已提</font></td>
		<td align="center" bgcolor="#ECECFF" width="87"><font size="2">实提</font></td>
		<td align="center" bgcolor="#ECECFF" width="80"><font size="2">金币</font></td>
		<td align="center" bgcolor="#ECECFF" width="80"><font size="2">积分</font></td>
		<td align="center" bgcolor="#ECECFF" width="76"><font size="2">分红股</font></td>
		<td align="center" bgcolor="#ECECFF" width="70"><font size="2">总分红</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
        <td height="27" width="46" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><%=rs("sgid")%></font></td>
        <td valign="middle" align="center" width="148"><font color="#000000" size="2"><%=rs("jsdate")%></font></td>
        <td valign="middle" width="67" align="center"><font size="2"><%=rs("zd")%></font></td>
        <td valign="middle" width="55" align="center"><font size="2"><%=rs("nd")%></font></td>
        <td valign="middle" width="62" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><%=rs("aq")%></font></td>
        <td valign="middle" width="61" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2"><%=rs("bq")%></font></td>
        <td valign="middle" align="center" width="70"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2"><%=rs("zpay")%></font></td>
        <td valign="middle" align="center" width="71"><b><font color="#FF0000" size="2"><%=rs("abp")%></font></b></td>
        <td valign="middle" align="center" width="61"><font size="2"><%=rs("ldpay")%></font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="103"><b><font color="#008000" size="2"><%=rs("ljcb")%></font></b></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="92"><font size="2"><%=rs("ljpa")%></font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="89"><font color="#800000" size="2"><%=rs("ljtx")%></font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="87"><font size="2"><%=rs("ljztx")%></font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="80"><font size="2"><%=rs("ljdb")%></font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="80"><font size="2"><%=rs("ljyg")%></font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="76"><font size="2"><%=rs("ljfhg")%></font></td>
		<td align="center" height="39" bgcolor="#ECECFF" width="70"><font size="2"><%=rs("ljzfh")%></font></td>
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
<font face="宋体" size="2">
</body>
</font>
</html>