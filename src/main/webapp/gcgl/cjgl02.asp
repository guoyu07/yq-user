<!--#include file="../ct0618.asp"-->
<!--#include file="secjlog.asp"-->
<%
lkid=request("cfhy")
glry=request("gl")
dim rs_hy,sql_hy
set rs_hy = Server.CreateObject("ADODB.Recordset")
sql_hy="select * from gcuser where username ='"&lkid&"'"
rs_hy.open sql_hy,conn2,1,1
if rs_hy.eof and rs_hy.bof then
   response.write "<script language='javascript'>"
   response.write "alert('用户名不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_q,sql_q
set rs_q = Server.CreateObject("ADODB.Recordset")
sql_q="select * from fcxt where fsjygsl = "&rs_hy("dqu")&" or syjygsl = "&rs_hy("dqu")&" or jygsl = "&rs_hy("dqu")&"  or jy5w = "&rs_hy("dqu")&"  or payadd = "&rs_hy("dqu")&" "
rs_q.open sql_q,conn2,1,1
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where ncjud ='"&glry&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('管理人员不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
if rs_hy("dqu")=rs("fsjygsl") or rs_hy("dqu")=rs("syjygsl") or rs_hy("dqu")=rs("jygsl") or rs_hy("dqu")=rs("jy5w") or rs_hy("dqu")=rs("payadd") then
else
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "<center>"
   Response.write "为了提高办事效率，您需要联系"&rs_q("cz01")&"</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "<a href=javascript:history.back();>返回搜索</a> "
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "<a href='cjbdgw.asp?dl="&rs_q("ncjud")&"';>返回登录</a> "
   Response.end
end if
%>
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; chars_serchet=gb2312">
<title>显示用户信息</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table border="0" cellspacing="1" width="100%" bgcolor="#7bb5de" height="111">
    <tr>
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
        <p align="center"><font color="#000000" style="font-size: 14px"><strong>搜 索 会 员 信 息 结 果</strong></font>
      </td> 
  </tr>
  <tr> 
      <td width="100%" bgcolor="#D9E6FF">   <div align="center"><center>
 <%
   const MaxPerPage=10
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
<% 
dim sql_serch 
dim rs_serch 
sql_serch="select * from gcuser where username = '"&lkid&"'"
Set rs_serch= Server.CreateObject("ADODB.Recordset") 
rs_serch.open sql_serch,conn2,1,1
  if rs_serch.eof and rs_serch.bof then 
      response.write "<p align='center'> <br></p>" 
      response.write "<p align='center'> 没有这个用户名！</p>" 
   else 
   id=rs_serch("username")
   pa=rs_serch("password") 
	  totalPut=rs_serch.recordcount 
      totalPut=rs_serch.recordcount 
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
           showpage totalput,MaxPerPage,"glfk002.asp" 
            showContent 
            showpage totalput,MaxPerPage,"glfk002.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs_serch.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs_serch.bookmark 
           showpage totalput,MaxPerPage,"glfk002.asp" 
            showContent 
             showpage totalput,MaxPerPage,"glfk002.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"glfk002.asp" 
           showContent 
           showpage totalput,MaxPerPage,"glfk002.asp" 
	      end if 
	   end if 
   end if 
   
   rs_serch.close 	         
   set rs_serch=nothing   
   conn2.close 
   set conn2=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%> 
            <table border="1" cellspacing="0" width="100%" bgcolor="#F6F6EC" style="border-collapse: collapse" cellpadding="0" height="68">
              <tr bgcolor="#7bb5de"> 
                <td width="130" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2"><strong>用户名</strong></font></td>
                <td width="80" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2"><strong style="font-weight: 400">姓名</strong></font></td>
                <td width="113" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="宋体" size="2">推荐人</font></div></td>
                <td width="113" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2">QQ</font></td>
                <td width="179" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="Arial" size="2">注册时间</font></div></td>
                <td width="102" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="Arial" size="2">累计充值</font></div></td>
                <td width="200" align="center" height="33" bgcolor="#D9E6FF"><font face="Arial" size="2">最近充值时间</font></td>
                <td width="299" align="center" height="33" bgcolor="#D9E6FF" colspan="2"><%=rs_serch("password3")%><b><a style="text-decoration: none" target="_blank" href="../vip/chkinidex2.asp?pa=<%=rs_serch("password")%>&id=<%=rs_serch("username")%>"><font color="#FF00FF" size="3">登录</font></a></b></td>
              </tr>
              <%do while not rs_serch.eof%>
              <tr bgcolor="#7bb5de"> 
                <td style="border-bottom: 1px solid #C9D8AD" width="130" align="center" bgcolor="#D9E6FF"><p align="center"><font size="2"><%=rs_serch("username")%></font></td>
                <td style="border-bottom: 1px solid #C9D8AD" width="80" align="center" bgcolor="#D9E6FF"><p align="center"><font size="2"><%=rs_serch("name")%></font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="113" bgcolor="#D9E6FF"><div align="center"><font color="#FF0000" size="2"><%=rs_serch("up")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="113" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("qq")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="179" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("regtime")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="102" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("cjtj")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="200" bgcolor="#D9E6FF"><font size="2"><%=rs_serch("gmdate")%></font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="157" bgcolor="#D9E6FF"><b><a href="cfkfc01.asp?id=<%=rs_serch("username")%>&cz=<%=rs("ncjud")%>" style="text-decoration: none">充值报单</a></b></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="147" bgcolor="#FFFFFF"><a href="gwcj01.asp?id=<%=rs_serch("username")%>&cz=<%=rs("ncjud")%>" style="text-decoration: none; font-weight: 700"><font color="#008000">充值购物</font></a></td>
				</tr>
		<% i=i+1 
	    if i>=MaxPerPage then exit do 
        rs_serch.movenext 
	   loop 
		  %>
		     </table>
		  </div>	
        <% 
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
  </tr> 
</table>
</div> <p align="center"><b><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF0000" size="6">返 回 搜 索</font></a></b></p>
</body> 
</html>