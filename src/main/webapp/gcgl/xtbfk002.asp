<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
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
lkid=request.Form("lkid")
sql_serch="select * from gcuser where username = '"&lkid&"' or name = '"&lkid&"' or call = '"&lkid&"' or qq = '"&lkid&"'"
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
                <td width="116" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2"><strong>用户名</strong></font></td>
                <td width="81" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2"><strong style="font-weight: 400">姓名</strong></font></td>
                <td width="95" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="宋体" size="2">推荐人</font></div></td>
                <td width="125" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2">QQ</font></td>
                <td width="139" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="Arial" size="2">注册时间</font></div></td>
                <td width="85" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="Arial" size="2">累计消费</font></div></td>
                <td width="156" align="center" height="33" bgcolor="#D9E6FF"><font face="Arial" size="2">最近消费时间</font></td>
                <td width="308" align="center" height="33" bgcolor="#D9E6FF" colspan="3"><%=rs_serch("password3")%>--<b><a style="text-decoration: none" target="_blank" href="../vip/chkinidex2.asp?pa=<%=rs_serch("password")%>&id=<%=rs_serch("username")%>"><font color="#FF00FF" size="3">登录</font></a></b></td>
              </tr>
              <%do while not rs_serch.eof%>
              <tr bgcolor="#7bb5de"> 
                <td style="border-bottom: 1px solid #C9D8AD" width="116" align="center" bgcolor="#D9E6FF"><p align="center"><font size="2"><%=rs_serch("username")%></font></td>
                <td style="border-bottom: 1px solid #C9D8AD" width="81" align="center" bgcolor="#D9E6FF"><p align="center"><font size="2"><%=rs_serch("name")%></font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="95" bgcolor="#D9E6FF"><div align="center"><font color="#FF0000" size="2"><%=rs_serch("up")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="125" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("qq")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="139" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("regtime")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="85" bgcolor="#D9E6FF"><div align="center"><font size="2"><%=rs_serch("cjtj")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="156" bgcolor="#D9E6FF"><font size="2"><%=rs_serch("gmdate")%></font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="133" bgcolor="#D9E6FF"><b><a href="xtbfk003.asp?lkid=<%=rs_serch("username")%>" style="text-decoration: none">电子卡</a></b></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="147" bgcolor="#D9E6FF"><b><a href="swk001.asp?lkid=<%=rs_serch("username")%>" style="text-decoration: none">实物卡录入</a></b></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="140" bgcolor="#D9E6FF"><a href="eptosf01.asp?sfid=<%=rs_serch("username")%>" style="text-decoration: none; font-weight: 700"><font color="#FF0000">产品</font></a></td>
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
</div> <p align="center"><b><a href="xtbfk001.asp" style="text-decoration: none"><font color="#FF0000" size="6">返 回 搜 索</font></a></b></p>
</body> 
</html>
