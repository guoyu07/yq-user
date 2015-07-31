<%
if request.cookies("regid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")   
end if
%>
<!--#include file="../ct0618.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gpjy where Now()>dqdate+0.0006 and jy=2"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("jy")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
rsTest.close
Set rsTest=Nothing
%>
<title>积 分 交 易 明 细</title>
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
<DIV class=box_title>积 分 交 易 明 细</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"><p align="center"><strong><font size="3" color="#000000">积 分 交 易 明 细</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2"><br> 
<%
dim sql
dim rs
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where username = '"&regid&"' order by id desc" 
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
   
%><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="143" align="center" height="28" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><strong style="font-weight: 400">用户名</strong></font></td>
          <td width="80" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"> <strong style="font-weight: 400">卖出数量</strong></font></td>
          <td width="78" align="center" height="28" bgcolor="#FFE1FF"><font color="#FF0000">买入数量</font></td>
          <td width="87" align="center" height="28" bgcolor="#FFE1FF"><p><font face="Arial" color="#000000">剩余数量</font></td>
          <td width="150" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">挂牌时间</font></td>
          <td width="52" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">单价</font></td>
          <td width="66" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">交易额</font></td>
          <td width="266" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">状态</font></td>
          <td width="140" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">对方</font></td>
          <td width="189" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">成交时间</font></td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="23" width="143" align="center"><p><font color="#000000"><%=regid%></font></td>
          <td valign="middle" width="80" align="center"><p><font color="#000000"><%if rs("mcsl")>0 then%>-<%=rs("mcsl")%><%else%><%=rs("mcsl")%><%end if%></font></td>
          <td valign="middle" align="center" width="78"><font color="#FF0000"><%=rs("mysl")%></font></td>
          <td valign="middle" align="left" width="87"><p align="center"><%=rs("sysl")%></td>
          <td valign="middle" align="center" width="150"><font color="#000000"><%=rs("abdate")%></font></td>
          <td valign="middle" align="center" width="52"><font color="#0000FF"><%if rs("pay")<1 then%>0<%=rs("pay")%><%else%><%=rs("pay")%><%end if%></font></td>
          <td valign="middle" align="center" width="66"><font color="#FF0000"><%=rs("jypay")%></font></td>
          <td valign="middle" align="center" width="266"><p><font color="#000000"><%=rs("bz")%></font></td>
          <td valign="middle" align="center" width="140"><%=rs("dfuser")%></td>
          <td valign="middle" align="center" width="189"><font color="#000000"><%=rs("cgdate")%></font></td>
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
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
</html>