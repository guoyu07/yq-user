<!--#include file="../ct0618.asp"-->
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
%>
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gpjy where Now()>dqdate+0.0005 and jy=2"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
rsTest("jy")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
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
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font color="#000000" size="5" face="宋体"><strong>集 团 内 部 股 票 交 易 市 场</strong></font><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<font face="宋体">
<font size="2">
<b><font color="#0000FF">当前交易价是 </font><font color="#FF0000"><%=rs1("jygj")%>元 </font></b></font>
<font color="#0000FF" size="2">系统每30秒刷新一次&nbsp; </font>
<font color="#800000"><b>
		<a href="mcsl.asp" style="text-decoration: none; background-color:#FFFFFF">
<font size="2" color="#800000">发布卖出</font></a></b></font><font color="#000000"><font size="2">&nbsp; 
</font> <a href="mysl.asp" style="text-decoration: none; font-weight:700; background-color:#FFFFFF">
<font size="2" color="#FF0000">发布买入</font></a></font></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<div align="center">
		<table border="1" width="60%" id="table1" bgcolor="#404020" bordercolor="#000000" height="60">
			<tr>
				<td align="center" width="90">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>
				<font color="#FFFF00" face="宋体" size="2">开盘价</font></b></td>
				<td align="center" width="94">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>最高价</b></font></td>
				<td align="center" width="98">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>最低价</b></font></td>
				<td align="center" width="98">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>现价</b></font></td>
				<td align="center" width="170">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>交易范围</b></font></td>
				<td align="center">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>成交量</b></font></td>
			</tr>
			<tr>
				<td align="center" width="90">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700">1</span></font></td>
				<td align="center" width="94">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700"><%=rs1("zgj")%></span></font></td>
				<td align="center" width="98">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700"><%=rs1("zdj")%></span></font></td>
				<td align="center" width="98">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700"><%=rs1("jygj")%></span></font></td>
				<td align="center" width="170">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs1("zgj")%>/<%=rs1("zdj")%></span></font></td>
				<td align="center" width="150"><font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700"><%=rs1("jygsl")%></span></font></td>
			</tr>
		</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体">友情提醒：根据市场情况，电子股单价会稳步上涨，到一定时候拆分。<br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy order by id desc" 
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
            showpage totalput,MaxPerPage,"gpjysc.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"gpjysc.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gpjysc.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gpjysc.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gpjysc.asp" 
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
                
              <td width="99" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#000000" size="2">
				<strong style="font-weight: 400">交易编号</strong></font></td>
                
              <td width="86" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong>类别</strong></font></td>
                
              <td width="88" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">出售数量</strong></font></td>
                
              <td width="82" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">求购数量</strong></font></td>
                
              <td width="51" align="center" height="30" bgcolor="#FFE1FF">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体">单价</font></td>
                
              <td width="69" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">交易额</strong></font></td>
                
              <td width="196" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="宋体">挂牌时间</font></td>
                
              <td width="85" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="宋体">发布方</font></td>
                
              <td width="195" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font face="黑体" color="#008000" style="font-size: 11pt; ">成交时间</font></td>
                
              <td width="150" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b><font face="黑体">对方</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="99" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体"><%=rs("id")%></font></td>
                <td width="86" align="center" bgcolor="#FAF8E6"> 
                  <b><font size="2" color="#008000">
					<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font face="宋体"><%if rs("mcsl")>0 then%></font></font><font face="宋体"><font color="#FF0000" size="2">出售</font><font size="2" color="#008000"><%else%>求购<%end if%></font></font></b></td>
                <td valign="middle" width="88" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体"><%=rs("mcsl")%></font></td>
                <td valign="middle" align="center" width="82"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#0000FF" size="2" face="宋体"><%=rs("mysl")%></font></td>
                <td valign="middle" align="center" width="51"><b>
				<font color="#FF0000" size="2" face="宋体"><%=rs("pay")%></font></b></td>
                <td valign="middle" align="center" width="69">
				<font size="2" face="宋体"><%=rs("jypay")%></font></td>
                <td valign="middle" align="center" width="196">
				<font color="#000000" size="2" face="宋体"><%=rs("abdate")%></font></td>
                <td valign="middle" align="center" width="85">
				<font size="2" face="宋体"><%=rs("username")%></font></td>
                <td valign="middle" align="center" width="195">
				<font face="黑体" color="#008000" size="2"><%=rs("cgdate")%></font></td>
                <td valign="middle" align="center" width="150">
				<font face="黑体" size="2"><b><%=rs("dfuser")%></b></font></td>
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