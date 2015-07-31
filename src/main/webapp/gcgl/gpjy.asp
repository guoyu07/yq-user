<%
userid=request("userid")
jylb=request("jylb")
%>
<!--#include file="../ct0618.asp"-->
<html>
<title>股 票 交 易 明 细</title>
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
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<font color="#000000" face="宋体" size="2"><strong>股 票 交 易 明 细</strong></font></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2">
	<font face="宋体" size="2"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where "&jylb&" = '"&userid&"' order by id desc" 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'> 还没有交易记录！</p>" 
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
            showpage totalput,MaxPerPage,"gpjy.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"gpjy.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gpjy.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gpjy.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gpjy.asp" 
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
   
%></font><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="143" align="center" height="28" bgcolor="#FFE1FF">
			<font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">会员名(发布方)</strong></font></td>
          <td width="116" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2"> <strong style="font-weight: 400">卖出数量</strong></font></td>
          <td width="144" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#FF0000" face="宋体" size="2">买入数量</font></td>
          <td width="151" align="center" height="28" bgcolor="#FFE1FF"><p>
			<font face="宋体" color="#000000" size="2">剩余数量</font></td>
          <td width="173" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">挂牌时间</font></td>
          <td width="155" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">交易额</font></td>
          <td width="123" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">状态</font></td>
          <td width="133" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">对方</font></td>
          <td width="234" align="center" height="28" bgcolor="#FFE1FF">
			<font color="#000000" face="宋体" size="2">成交时间</font></td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="23" width="143" align="center"><p>
			<font color="#000000" face="宋体" size="2"><%=rs("username")%></font></td>
          <td valign="middle" width="116" align="center"><p>
			<font color="#000000" face="宋体" size="2"><%=rs("mcsl")%></font></td>
          <td valign="middle" align="center" width="144">
			<font color="#FF0000" face="宋体" size="2"><%=rs("mysl")%></font></td>
          <td valign="middle" align="left" width="151"><p align="center">
			<font face="宋体" size="2"><%=rs("sysl")%></font></td>
          <td valign="middle" align="center" width="173">
			<font color="#000000" face="宋体" size="2"><%=rs("abdate")%></font></td>
          <td valign="middle" align="center" width="155">
			<font color="#FF0000" face="宋体" size="2"><%=rs("jypay")%></font></td>
          <td valign="middle" align="center" width="123"><p>
			<font color="#000000" face="宋体" size="2"><%=rs("bz")%></font></td>
          <td valign="middle" align="center" width="133">
			<font face="宋体" size="2"><%=rs("dfuser")%></font></td>
          <td valign="middle" align="center" width="234">
			<font color="#000000" face="宋体" size="2"><%=rs("cgdate")%></font></td>
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
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body> 
</font> 
</html>