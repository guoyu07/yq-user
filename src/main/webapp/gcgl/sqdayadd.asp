<!--#include file="../ct0618.asp"-->
<title>各地区！-双区进单明细</title>
<%
   const MaxPerPage=120
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
sql_jt="select sum(sjb) as jt from gcuser where DateDiff('d',date(),bddate)=0 and sjb>19" 
Set rs_jt= Server.CreateObject("ADODB.Recordset") 
rs_jt.open sql_jt,conn2,1,1
%>
<% 
sql_zt="select sum(sjb) as zt from gcuser where DateDiff('d',date(),bddate)=-1 and sjb>19" 
Set rs_zt= Server.CreateObject("ADODB.Recordset") 
rs_zt.open sql_zt,conn2,1,1
%>

<% 
sql_ct="select sum(sjb) as ct from gcuser where DateDiff('d',date(),bddate)=-2 and sjb>19" 
Set rs_ct= Server.CreateObject("ADODB.Recordset") 
rs_ct.open sql_ct,conn2,1,1
%>

<% 
sql_dct="select sum(sjb) as dct from gcuser where DateDiff('d',date(),bddate)=-3 and sjb>19" 
Set rs_dct= Server.CreateObject("ADODB.Recordset") 
rs_dct.open sql_dct,conn2,1,1
%>

<p style="margin-top: 0; margin-bottom: 0"><font size="2">
<a href="?beizhu=0" style="text-decoration: none">今天：<font color="#FF00FF"><%=rs_jt("jt")/20%></font></a>&nbsp;<a href="?beizhu=-1" style="text-decoration: none">昨天：</a></font><font size="2" color="#0000FF"><a href="?beizhu=-1" style="text-decoration: none"><font color="#008000"><%=rs_zt("zt")/20%></font></a>&nbsp;</font><font size="2"><a href="?beizhu=-2" style="text-decoration: none">前天：<font color="#FF0000"><%=rs_ct("ct")/20%></font></a><a href="?beizhu=-3" style="text-decoration: none">&nbsp;大前天：<font color="#000080"><%=rs_dct("dct")/20%></font></a><a href="sqdayadd.asp" style="text-decoration: none">&nbsp;全部</a></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="70">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="70" bgcolor="#D7FFE3">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
<%
if Request("beizhu")="" then
   bz=""
   bb="order by bddate desc"
else
   bz="and DateDiff('d',date(),bddate)="&Request("beizhu")&""
   bb="order by bddate desc"
end if
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where sjb>10 "&bz&" "&bb&""
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
            showpage totalput,MaxPerPage,"sqdayadd.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"sqdayadd.asp" 
            showContent 
             showpage totalput,MaxPerPage,"sqdayadd.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"sqdayadd.asp" 
           showContent 
           showpage totalput,MaxPerPage,"sqdayadd.asp" 
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
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
              <td width="79" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">编号</strong></font></td>
              <td width="123" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong>用户名</strong></font></td>
              <td width="83" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">单数</strong></font></td>
              <td width="142" align="center" height="30" bgcolor="#FFE1FF"><font size="2">推荐人</font></td>
              <td width="142" align="center" height="30" bgcolor="#FFE1FF"><font size="2">姓名</font></td>
              <td width="304" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">地址</strong></font></td>
              <td width="164" align="center" height="30" bgcolor="#FFE1FF"><font size="2">手机</font></td>
              <td width="159" align="center" height="30" bgcolor="#FFE1FF"><font size="2">qq</font></td>
              <td width="168" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="宋体" size="2">升级时间</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="79" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"><%=rs("id")%></font></td>
                <td width="123" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体"><%=rs("username")%></font></font></b></td>
                <td valign="middle" width="83" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"><%=rs("sjb")/20%>万</font></td>
                <td align="center" width="142" bgcolor="#C0C0C0"><font size="2"><%=rs("up")%></font></td>
                <td valign="middle" align="center" width="142"><font size="2"><%=rs("name")%></font></td>
                <td valign="middle" align="center" width="304"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="宋体"><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%></font></td>
                <td valign="middle" align="center" width="164"><font size="2"><%=rs("call")%></font></td>
                <td valign="middle" align="center" width="159"><font size="2"><%=rs("qq")%></font></td>
                <td valign="middle" align="center" width="168"><font face="宋体" size="1"><b><%=rs("bddate")%></b></font></td>
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
</div> </div>
</font>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body>
</font>
</font>
</html>