<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<title>一币变化明细</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
</head>
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
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <form method="POST" action="datepay.asp" name="form">
			<table border="0" width="100%" id="table1">
				<tr>
					<td width="521"><p align="right"><font color="#000000" face="楷体" size="5"><strong>一 币 变 化 明 细</strong></font></td>
					<td width="10">　</td>
					<td width="113"><select size="1" name="beizhu">
					<option selected value="0">全部</option>
					<option value="1">平衡奖</option>
					<option value="2">认购一币</option>
					<option value="3">卖出一币</option>
					<option value="4">一币换购</option>
					<option value="5">商品交易收入</option>
					<option value="6">一币互转</option>
					<option value="7">话费充值</option>
					<option value="8">辅导奖</option>
					<option value="9">推广奖</option>
					<option value="10">购物支出</option>
					<option value="11">票务支出</option>
					<option value="12">一币支付</option>
					</select></td>
					<td><input type="submit" value="提交" name="B1"></td>
				</tr>
			</table>
		</form>
		</td>
  </tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2">
	<font face="宋体" size="2"><br> 
<%
if Request("beizhu")<>"" then
if Request("beizhu")=7 then
   response.redirect "telpay.asp"
elseif Request("beizhu")=0 then
   bz=""
else
   bz="where newbz="&Request("beizhu")&""
end if
end if
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datepay "&bz&" order by id desc" 
rs.open sql,conn9,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> 还没一币奖励记录，要加油啊！</p>" 
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
            showpage totalput,MaxPerPage,"datepay.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"datepay.asp" 
            showContent 
             showpage totalput,MaxPerPage,"datepay.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"datepay.asp" 
           showContent 
           showpage totalput,MaxPerPage,"datepay.asp" 
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
   
%></font><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="134" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">用户名</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">一币收入</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2">一币支出</font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="宋体">金币收入</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">金币支出</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">剩余一币</font></td>
              <td width="112" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">剩余金币</font></td>
              <td width="216" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">更新时间</font></td>
              <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">备注</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
              <td height="31" width="134" align="center"> <p><font color="#000000" size="2" face="宋体"><%=rs("username")%></font></td>
              <td valign="middle" width="133" align="center"> <p><font color="#FF0000" size="2" face="宋体"><%=rs("syjz")%></font></td>
              <td valign="middle" align="left" width="133"><p align="center"><font size="2" face="宋体"><%if rs("jc")>0 then%>-<%=rs("jc")%><%else%><%=rs("jc")%><%end if%></font></td>
              <td valign="middle" align="center" width="120"> <font color="#FF0000" size="2" face="宋体"><%=rs("jyjz")%></font></td>
              <td valign="middle" align="center" width="118"><font size="2" face="宋体"><%if rs("dbjc")>0 then%>-<%=rs("dbjc")%><%else%><%=rs("dbjc")%><%end if%></font></td>
              <td valign="middle" align="center" width="118"><font color="#000000" size="2" face="宋体"><%=rs("pay")%></font></td>
              <td valign="middle" align="center" width="112"><font size="2" face="宋体"><%=rs("jydb")%></font></td>
              <td valign="middle" align="center" width="216"><font color="#000000" size="2" face="宋体"><%=rs("abdate")%></font></td>
              <td valign="middle" align="center" width="247"><font color="#000000" size="2" face="宋体"><%=rs("regid")%></font></td>
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
  response.write "<form method=Post action="&filename&"?beizhu="&Request("beizhu")&">" 
  response.write "<p align='center'>&gt;&gt;分页&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>首页 上一页</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&beizhu="&Request("beizhu")&">首页</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&"&beizhu="&Request("beizhu")&">上一页</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>下一页 尾页</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1)&"&beizhu="&Request("beizhu")
    response.write ">下一页</a> <a href="&filename&"?page="&n&"&beizhu="&Request("beizhu")&">尾页</a>" 
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
					<font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
</html>