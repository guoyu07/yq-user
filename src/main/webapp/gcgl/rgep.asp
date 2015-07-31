<!--#include file="../ct0618.asp"-->
<% 
sqljt1="select sum(mcsl) as jtmc from gpjy where newjy=1 and DateDiff('d',date(),cgdate)=0" 
Set rsjt1= Server.CreateObject("ADODB.Recordset") 
rsjt1.open sqljt1,conn2,1,1
%>
<% 
sqlzt1="select sum(mcsl) as ztmc from gpjy where newjy=1 and DateDiff('d',date(),cgdate)=-1" 
Set rszt1= Server.CreateObject("ADODB.Recordset") 
rszt1.open sqlzt1,conn2,1,1
%>
<% 
sqlct1="select sum(mcsl) as ctmc from gpjy where newjy=1 and DateDiff('d',date(),cgdate)=-2" 
Set rsct1= Server.CreateObject("ADODB.Recordset") 
rsct1.open sqlct1,conn2,1,1
%>
<% 
sqldct1="select sum(mcsl) as dctmc from gpjy where newjy=1 and DateDiff('d',date(),cgdate)=-3" 
Set rsdct1= Server.CreateObject("ADODB.Recordset") 
rsdct1.open sqldct1,conn2,1,1
%>
<title>认购EP-交易市场</title>
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
<p align="center"><font color="#0000FF">（今天：<%=rsjt1("jtmc")%>）</font><font color="#FF00FF">（昨天：<%=rszt1("ztmc")%>）</font>（前天：<font color="#FF0000"><%=rsct1("ctmc")%></font>）（大前天：<font color="#FF0000"><%=rsdct1("dctmc")%></font>）</p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
       
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where newjy=1 order by id desc" 
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
            showpage totalput,MaxPerPage,"rgep.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"rgep.asp" 
            showContent 
             showpage totalput,MaxPerPage,"rgep.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"rgep.asp" 
           showContent 
           showpage totalput,MaxPerPage,"rgep.asp" 
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
                
              <td width="75" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#000000" size="2">
				<strong style="font-weight: 400">交易编号</strong></font></td>
                
              <td width="48" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong>类别</strong></font></td>
                
              <td width="73" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">出售数量</strong></font></td>
                
              <td width="72" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">求购数量</strong></font></td>
                
              <td width="50" align="center" height="30" bgcolor="#FFE1FF">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体">单价</font></td>
                
              <td width="68" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">交易额</strong></font></td>
                
              <td width="132" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="宋体">挂牌时间</font></td>
                
              <td width="101" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="宋体">发布方</font></td>
                
              <td width="125" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font face="黑体" color="#008000" style="font-size: 11pt; ">成交时间</font></td>
                
              <td width="105" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b><font face="黑体">对方</font></b></td>
                
              <td width="165" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font face="黑体">备注</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="75" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体"><%=rs("id")%></font></td>
                <td width="48" align="center" bgcolor="#FAF8E6"> 
                  <b><font size="2" color="#008000">
					<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font face="宋体"><%if rs("mcsl")>0 then%></font></font><font face="宋体"><font color="#FF0000" size="2">出售</font><font size="2" color="#008000"><%else%>求购<%end if%></font></font></b></td>
                <td valign="middle" width="73" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体"><%=rs("mcsl")%></font></td>
                <td valign="middle" align="center" width="72"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#0000FF" size="2" face="宋体"><%=rs("mysl")%></font></td>
                <td valign="middle" align="center" width="50"><b>
				<font color="#FF0000" size="2" face="宋体"><%=rs("pay")%></font></b></td>
                <td valign="middle" align="center" width="68">
				<font size="2" face="宋体"><%=rs("jypay")%></font></td>
                <td valign="middle" align="center" width="132">
				<font color="#000000" size="2" face="宋体"><%=rs("abdate")%></font></td>
                <td valign="middle" align="center" width="101">
				<font size="2" face="宋体"><%=rs("username")%></font></td>
                <td valign="middle" align="center" width="125">
				<font face="黑体" color="#008000" size="2"><%=rs("cgdate")%></font></td>
                <td valign="middle" align="center" width="105">
				<font face="黑体" size="2"><b><%=rs("dfuser")%></b></font></td>
                <td valign="middle" align="center" width="165">
				<font face="黑体" size="2"><%=rs("bz")%></font></td>
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
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body>
</font>
<meta http-equiv=Refresh content="180; url=">
</html>