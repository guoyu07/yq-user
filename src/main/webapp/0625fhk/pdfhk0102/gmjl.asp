<%
response.cookies("gopay")=""
response.cookies("pdid")=""
response.cookies("pdpa")=""
response.cookies("gopay")=""
%>
<%
if request.cookies("regid")="" then
   session.timeout=30
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误，请重新登录！');"
   response.write "window.location.replace('logtgs.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")   
end if
%>
<!--#include file="../shopmfh.asp"-->
<%
sql2="select * from cfuser where username = '"&regid&"'" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn1,2,3
%>
<%
sql3="select * from fhdate where DateDiff('d',date(),date)=-1 order by id desc" 
Set rs3= Server.CreateObject("ADODB.Recordset") 
rs3.open sql3,conn1,1,1
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT sum(pdlbtj) as tjmj FROM pdfh  where username = '"&regid&"'"
rs1.open sql1,conn1,2,3
%>
<%
set rs_jl = Server.CreateObject("ADODB.Recordset")
sql_jl = "SELECT sum(pdlb) as mjjl FROM pdfh  where username = '"&regid&"'"
rs_jl.open sql_jl,conn1,2,3
%>
<%
set rs5 = Server.CreateObject("ADODB.Recordset")
sql5 = "SELECT sum(mqpay) as tjmq FROM pdfh  where username = '"&regid&"'"
rs5.open sql5,conn1,2,3
if rs5("tjmq")>0 then
rs2("fhpay")=rs5("tjmq")
rs2.update
else
rs2("fhpay")=0
rs2.update
end if
%>
<html>
<title>2012年-05月01-之前的消费返还记录</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<LINK 
href="adminstyle.css" type=text/css rel=StyleSheet>
</head>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=750,height=350');
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
<div align="center">
	<b>
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="137">
    <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="109">
	<div align="center">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>系统业务情况</b></p>
		<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<iframe name="I1" marginwidth="1" marginheight="1" width="75%" align="center" border="0" frameborder="0" src="fhjl.asp" height="126" scrolling="no"></iframe></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0; line-height:200%">
	<span style="background-color: #FFFFFF">
	<font size="4" color="#008000">您的用户名(推广商编号)为 </font><font size="4"><b><font color="#FF0000"><%=regid%> </font></b>
	</font></span><b><font size="4"><%if rs2("jb")=1 then%><font color="#FF0000">(合作商家)</font><%elseif rs2("jb")=2 then%><font color="#008000">(省级代售点)</font><font color="#0000FF"><%elseif rs2("jb")=3 then%></font><font color="#FF00FF">(市级代售点)</font><font color="#0000FF"><%elseif rs2("jb")=4 then%></font><font color="#800000">(区级代售点)<%elseif rs2("jb")=5 then%></font><font color="#000080">(镇级代售点)</font><font color="#0000FF"><%else%>(业务员)<%end if%></font>的统计报表</span></font></font></p>
</b><p align="center" style="line-height: 200%; margin-top: 0; margin-bottom: 0">　</p>
	<p align="center" style="line-height: 200%; margin-top: 0; margin-bottom: 0"><b>
  	<font color="#0000FF"><span style="font-weight:700">
	<a href="gmjh.asp" style="text-decoration: none; background-color: #FFE1FF">
	<font size="4" color="#FF0000">继续激活返还卡</font></a></span></font></b></p>
	<p align="center" style="line-height: 200%; margin-top: 0; margin-bottom: 0">　</p>
		<table border="0" width="90%" id="table1" height="20">
			<tr>
				<b>
			<td align="left" width="346" bgcolor="#FFFFFF">
				<b>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<font face="黑体" style="font-size: 11pt">当前总累计收益：<font color="#0000FF"><%if rs2("fhpay")>1 then%><%=rs2("fhpay")%><%else%>0<%=rs2("fhpay")%><%end if%></font></font></font></font></b></td>
			<td align="left" width="284" bgcolor="#FFFFFF">
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<font face="黑体" style="font-size: 11pt">已提现：<font color="#0000FF"><%if rs2("txfh")>0 then%></font><b><font color="#0000FF"><%=rs2("txfh")%></font></b><font color="#0000FF"><%else%></font><b><font color="#0000FF">0</font></b><font color="#0000FF"><%end if%></font></font></font></font></td>
			<td align="left" width="292" bgcolor="#FFFFFF"><b>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<font face="黑体">
			<a href="login6j.asp" style="text-decoration: none">
			<font color="#FF0000" style="font-size: 11pt">我要提现</font></a><font style="font-size: 11pt">余额：<font color="#0000FF"><%=rs2("fhpay")-rs2("txfh")%></font></font></font></b></td>
			<td align="left" width="114" bgcolor="#B3B3B3">
			<p align="center">
			<font face="黑体" style="font-size: 11pt">
			<a href="vip001.asp?mn=<%=rs2("fhpay")-rs2("txfh")%>&gm=<%=rs2("username")%>" style="text-decoration: none; font-weight: 700">我要消费</a></font></td>
				</b>
			</tr>
			<tr>
			<td align="left" width="716" colspan="4">
			<b>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">累计激活消费面值共<font color="#FF0000"><%=rs1("tjmj")%>00元&nbsp; </font>每100元面值获得一个分红点 每点分红满100元为止，已完成消费面值共<font color="#FF0000"><%=rs1("tjmj")-rs_jl("mjjl")%>00</font>元</font><font face="宋体" style="font-size: 11pt">
	<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from pdfh where username = '"&regid&"' order by pdid desc" 
rs.open sql,conn1,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'> 您还没有2012年05月01之前的成功的消费记录！</p>" 
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
            showpage totalput,MaxPerPage,"gmjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"gmjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gmjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gmjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gmjl.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn1.close 
   set conn1=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></font></p>
</b> 
				</td>
			</tr>
		</table>
	</div>
	<div align="center">    
          <table border="1" cellspacing="0" width="90%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="50">
            <tr> 
              <td width="76" align="center" height="25" bgcolor="#F9F4E8"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#800000" size="2">
				<strong style="font-weight: 400">消费编号</strong></font></td>
              <td width="125" align="center" height="25" bgcolor="#F9F4E8"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#800000" size="2" face="宋体"> 
				<strong style="font-weight: 400">激活时间</strong></font></td>
              <td width="130" align="center" height="25" bgcolor="#DDFFDD"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" size="2" face="宋体">累计消费面值</font></td><b>
              <td width="129" align="center" height="25" bgcolor="#F9F4E8"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" size="2" face="宋体">剩余面值</font></td>
              <td width="124" align="center" height="25" bgcolor="#F9F4E8"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" size="2" face="宋体">昨天每点分红</font></td>
              <td width="90" align="center" height="25" bgcolor="#F9F4E8"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" size="2" face="宋体">昨天收益</font></td>
              <td width="103" align="center" height="25" bgcolor="#F9F4E8"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" size="2" face="宋体">前天累计收益</font></td>
              <td width="112" align="center" height="25" bgcolor="#DDFFDD"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" size="2" face="宋体">累计收益</font></td></b>
              <td width="121" align="center" height="25" bgcolor="#F9F4E8"><b>
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" size="2" face="宋体">状态</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="25" width="76" align="center" bgcolor="#E3E0DF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#008000" size="2" face="宋体" style="font-weight: 700"><%=rs("pdid")%></font></td>
                <td valign="middle" width="125" align="center" bgcolor="#E3E0DF" height="25"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体"><%=rs("pddate")%></font></td>
                <td align="center" width="130" bgcolor="#DDFFDD" height="25">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体"><%=rs("pdlbtj")%>00</font></td><b>
                <td align="center" width="129" bgcolor="#FFE1FF" height="25">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体"><%=rs("pdlb")%>00</font></td>
                <td align="center" width="124" bgcolor="#E3E0DF" height="25">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体"><%if rs("mqpay")=0 then%>今天未计算<%elseif rs3("fhpay")<1 then%>0<%=rs3("fhpay")%><%else%><%=rs3("fhpay")%><%end if%></font></td>
                <td align="center" width="90" bgcolor="#E3E0DF" height="25">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体"><%if rs("mqpay")=0 then%>0<%else%><%=rs3("fhpay")*rs("pdlb")%><%end if%></font></td>
                <td valign="middle" align="center" width="103" bgcolor="#E8E8FF" height="25">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体"><%if rs("ctpay")<1 then%>0<%=rs("ctpay")%><%else%><%=rs("ctpay")%><%end if%></font></td>
                <td valign="middle" align="center" width="112" bgcolor="#DDFFDD" height="25">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" face="宋体"><%if rs("mqpay")<1 then%>0<%=rs("mqpay")%><%else%><%=rs("mqpay")%><%end if%></font></td>
                </b>
                <td valign="middle" align="center" width="121" bgcolor="#E8E8FF" height="25"><font color="#FF0000" size="2" face="宋体"><%if rs("mqpay")<rs("pdlb")*100 then%>收益中<%else%>完成<%end if%></font></td>
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
</b>
</div>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
　</p>
</body> 
</html>