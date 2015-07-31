<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>总站长公告管理</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<LINK 
href="adminstyle.css" type=text/css rel=StyleSheet>
</head>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=200,height=120');
    }
//-->
</SCRIPT>
<%
   const MaxPerPage=20
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

<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">

  <table border="1" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="143">
    <tr>
      <td width="100%" height="26" bgcolor="#C3DAF9" background="images/admin_bg_1.gif"> 
        <p align="center">
		<span style="font-size: 11pt"><b>管理</b></span><b><font style="font-size: 11pt">员公告</font></b></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 0px solid #E5EAC2; border-right: 0px solid #E5EAC2; border-bottom: 0px solid #E5EAC2" height="117" bgcolor="#C3DAF9"><br> 
<% 
dim sql 
dim rs 
sql="select * from gg " 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn,1,1 
  if rs.eof and rs.bof then 
       response.write "<p align='center'> 还没有发布公告</p>" 
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
            showpage totalput,MaxPerPage,"adslist.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"adslist.asp" 
            showContent 
             showpage totalput,MaxPerPage,"adslist.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"adslist.asp" 
           showContent 
           showpage totalput,MaxPerPage,"adslist.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn.close 
   set conn=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%> 
<div align="center">
            
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
                
              <td width="84" align="center" height="28" bgcolor="#C3DAF9"> 
				<strong><font face="Arial">序号</font></strong></td>
                
              <td width="100" align="center" height="28" bgcolor="#C3DAF9"> 
				<strong>发布人</strong></td>
                
              <td width="402" align="center" height="28" bgcolor="#C3DAF9"> 
                <div align="center"><b>公 告 标 题</b></div>
                </td>
                
              <td width="266" align="center" height="28" bgcolor="#C3DAF9"> 
                <b>发布时间</b></td>
                
              <td width="274" align="center" height="28" bgcolor="#C3DAF9"> 
                <b>操作</b></td>
                
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td valign="middle" height="23" width="84" align="center"> 
                  <p><font color="#000000" size="2"><%=rs("id")%> 
                </font> 
                </td>
                <td valign="middle" width="100" align="center"> 
                  <p><font color="#000000" size="2"> 
                	公司</font></td>
                <td valign="middle" align="center" width="402"> 
                  <div align="center"><font color="#000000" size="2">
					<a target="_blank" href="../vip/ggck.asp?regid=<%=rs("id")%>"><%=rs("ggbt")%></a></font></div>
                </td>
                <td valign="middle" align="center" width="266"> 
                  <font size="2">　<%=rs("ggdate")%></font></td>
                <td valign="middle" align="center" width="274"> 
                  <font color="#000000" size="2">
					<a href="modiads.asp?regid=<%=rs("id")%>">修改</a>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %></table> 
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
<p>　</td> 
  </tr> 
</table> 
</div> 
</body> 
</html>