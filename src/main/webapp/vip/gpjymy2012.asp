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
StrSQL = "SELECT * FROM gpjy where Now()>dqdate+0.001 and jy=2"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
rsTest("jy")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<html>
<title>积分交易市场</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>
<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="首页";
  }
}

</SCRIPT>

<SCRIPT src="main/leftNo.js"></SCRIPT>

<SCRIPT type=text/javascript src="main/jquery-1.2.6.min.js"></SCRIPT>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$("#wenzhang>dd>dl>dd").hide();
	$.each($("#wenzhang>dd>dl>dt"), function(){
		$(this).click(function(){
			$("#wenzhang>dd>dl>dd ").not($(this).next()).slideUp();
			$(this).next().slideToggle(500);
			//$(this).next().toggle();
		});
	});
});


</SCRIPT>
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
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">个人信息</A> </LI>
  <LI><A>业绩查询</A> 
  </LI>
  <LI><A>财务管理</A> 
  </LI>
  <LI><A>消息管理</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">退出系统</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title>积 分 交 易 市 场</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<strong>
		<font color="#000000" size="6">积 分 交 易 市 场</font><font color="#000000" style="font-size: 20pt">（</font><font color="#008000" style="font-size: 20pt">求购信息</font><font color="#000000" style="font-size: 20pt">）</font></strong><p align="center">
		　<p align="center">
<font size="4">
<b><font color="#0000FF">当前交易价是 </font><font color="#FF0000"><%=rs1("jygj")%> </font></b></font><font color="#0000FF">系统每30秒刷新一次 </font><strong><font color="#000000" style="font-size: 20pt">（</font></strong><font face="黑体"><font color="#800000"><b><a href="gpjysc2012.asp" style="text-decoration: none; background-color:#FFFFFF"><font size="5" color="#800000">查看全部</font></a></b></font><font color="#000000"><font size="5">&nbsp; </font> <a href="gpjymc2012.asp" style="text-decoration: none; font-weight:700; background-color:#FFFFFF"><font size="5" color="#FF0000">查看出售</font></a></font></font><strong><font color="#000000" style="font-size: 20pt">）</font></strong><p align="center">
　<p align="center"> </td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<div align="center">
		<table border="1" width="85%" id="table1" bgcolor="#404020" bordercolor="#000000" height="60">
			<tr>
				<td align="center" width="150" bgcolor="#FFFFFF" rowspan="2"><font color="#800000" face="黑体"><b><a href="mcsl.asp" style="text-decoration: none; background-color:#FFFFFF">
				<font color="#800000" style="font-size: 16pt">发布卖出</font></a></b></font></td>
				<td align="center" width="66"><b><font color="#FFFF00" style="font-size: 11pt">开盘价</font></b></td>
				<td align="center" width="67"><font color="#FFFF00" style="font-size: 11pt"><b>最高价</b></font></td>
				<td align="center" width="85"><font color="#FFFF00" style="font-size: 11pt"><b>最低价</b></font></td>
				<td align="center" width="84"><font color="#FFFF00" style="font-size: 11pt"><b>现价</b></font></td>
				<td align="center" width="111"><font color="#FFFF00" style="font-size: 11pt"><b>交易范围</b></font></td>
				<td align="center"><font color="#FFFF00" style="font-size: 11pt"><b>成交量</b></font></td>
				<td align="center" width="150" bgcolor="#FFFFFF" rowspan="2"><font color="#000000" face="黑体"> <a href="mysl.asp" style="text-decoration: none; font-weight:700; background-color:#FFFFFF"><font color="#FF0000" style="font-size: 16pt">发布买入</font></a></font></td>
			</tr>
			<tr>
				<td align="center" width="60"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">1</span></font></td>
				<td align="center" width="60"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700"><%=rs1("zgj")%></span></font></td>
				<td align="center" width="85"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">0<%=rs1("zdj")%></span></font></td>
				<td align="center" width="84"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700"><%=rs1("jygj")%></span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700"><%=rs1("zgj")%>/0<%=rs1("zdj")%></span></font></td>
				<td align="center" width="120"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700"><%=rs1("jygsl")%></span></font></td>
			</tr>
		</table>
	</div>
	<p align="center"><font size="2">友情提醒：根据市场情况，电子积分单价会稳步上涨，到一定时候拆分。<br> 
	</font> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where jy=0 and mysl>0 order by pay,id " 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>暂无求购记录</p>"
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
            showpage totalput,MaxPerPage,"gpjymy2012.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"gpjymy2012.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gpjymy2012.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gpjymy2012.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gpjymy2012.asp" 
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
   
%></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
          <td width="111" align="center" height="30" bgcolor="#FFE1FF"><font face="Arial" color="#000000" size="2"><strong style="font-weight: 400">交易编号</strong></font></td>
          <td width="91" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2"> <strong>类别</strong></font></td>
          <td width="97" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2"> <strong style="font-weight: 400">出售数量</strong></font></td>
          <td width="94" align="center" height="30" bgcolor="#FFE1FF"><font color="#FF0000" size="2"> <strong style="font-weight: 400">求购数量</strong></font></td>
          <td width="64" align="center" height="30" bgcolor="#FFE1FF"><font size="2">单价</font></td>
          <td width="96" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2"> <strong style="font-weight: 400">交易额</strong></font></td>
          <td width="233" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2">挂牌时间</font></td>
          <td width="96" align="center" height="30" bgcolor="#FFE1FF"><font color="#000000" size="2">发布方</font></td>
          <td width="252" align="center" height="30" bgcolor="#FFE1FF"><b><font size="2">操作</font></b></td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
          <td height="35" width="111" align="center"><p><font color="#000000" size="2"><%=rs("id")%></font></td>
          <td width="91" align="center" bgcolor="#FAF8E6"> <b><font color="#008000"><font size="2"><%if rs("mcsl")>0 then%></font></font><font color="#FF0000" size="2">出售</font><font size="2" color="#008000"><%else%>求购<%end if%></font></b></td>
          <td valign="middle" width="97" align="center"><p><font color="#000000" size="2"><%=rs("mcsl")%></font></td>
          <td valign="middle" align="center" width="94"><p><font color="#0000FF" size="2"><%=rs("mysl")%></font></td>
          <td valign="middle" align="center" width="64"><b><font color="#FF0000" size="2"><%if rs("pay")<1 then%>0<%=rs("pay")%><%else%><%=rs("pay")%><%end if%></font></b></td>
          <td valign="middle" align="center" width="96"><font size="2"><%=rs("jypay")%></font></td>
          <td valign="middle" align="center" width="233"><font color="#000000" size="2"><%=rs("abdate")%></font></td>
          <td valign="middle" align="center" width="96"><font size="2"><%=rs("username")%></font></td>
          <td valign="middle" align="center" width="252">　</td>
          </tr>
          <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
            </table> 
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
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body>
<meta http-equiv=Refresh content="120; url=">
</html>