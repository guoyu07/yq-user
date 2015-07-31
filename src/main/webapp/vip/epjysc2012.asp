<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('暂时不能查询！');"
   response.write "history.go(-1);" 
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
dim sql2
dim rs2
sql2="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn2,1,1
if rs2.eof and rs2.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM txpay where payonoff = '尚未转账' and kjygid=0 and Now()>rgdate+0.001 "
rsTest.Open StrSQL, Conn1,2,3
While Not rsTest.EOF
rsTest("ep")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<html>
<title>EP 交 易 市 场</title>
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
</head>
<%
   const MaxPerPage=15
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
<DIV class=box_title>一 币 交 易 市 场</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <form method="POST" action="epjysc_user.asp" name="fomr">
			<table border="0" width="100%" id="table1">
				<tr>
				<td width="448"> <p align="center"><strong><font color="#000000" size="5" face="楷体">一 币 交 易 市 场</font></strong></td>
				<td width="110"><p align="center"><font size="2">用户名：</font></td>
				<td width="149"><input type="text" name="user" size="15"></td>
				<td width="541"><input type="submit" value="查找用户名" name="B3"></td>
					</tr>
				</table>
			</form>
		</td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from txpay where payonoff = '尚未转账' and ep=0 and txlb=0 order by jyid asc,payid asc" 
rs.open sql,conn1,1,1
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
            showpage totalput,MaxPerPage,"epjysc2012.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"epjysc2012.asp" 
            showContent 
             showpage totalput,MaxPerPage,"epjysc2012.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"epjysc2012.asp" 
           showContent 
           showpage totalput,MaxPerPage,"epjysc2012.asp" 
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
   
%><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="127" align="center" height="23" bgcolor="#FBFAEC"><b>流水号</b></td>
          <td width="142" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400">卖出方</strong></font></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000">求现金额</font></td>
          <td width="161" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000">认购后可换一币</font></td>
          <td width="167" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#008000">认购后可获利</font></b></td>
          <td width="260" align="center" height="23" bgcolor="#FBFAEC">交易状态</td>
          <td width="177" align="center" height="23" bgcolor="#FBFAEC">操作</td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="28" width="127" align="center"><b><%=rs("payid")%></b></td>
          <td height="28" width="142" align="center"><p><font color="#000000"><%=rs("payusername")%></font></td>
          <td valign="middle" align="center" width="121"><font color="#FF0000"><%=rs("paynum9")%></font></td>
          <td valign="middle" align="center" width="161"><font color="#0000FF"><%=rs("paynum")%></font></td>
          <td valign="middle" align="center" width="167"><b><font color="#0000FF"></font><font color="#FF0000"><%if rs("paynum9")/rs("paynum")>0.88 then%><%=rs("paynum")-rs("paynum9")%><%else%></font><%=rs("paynum")-rs("paynum9")%></b><%end if%></td>
          <td valign="middle" align="center" width="260"><%if rs("payusername")=username then%><b><a onClick="return confirm('提示：您确定了吗？')" href="qxepmc.asp?qx=<%=rs("payid")%>"><font color="#FF0000">撤销卖出</font></a></b><%else%>等待认购中。。。<%end if%></td>
          <td valign="middle" align="center" width="177"><a onClick="return confirm('提示：对方使用的收款方式是“<%=rs("paybank")%>”您确定认购了吗？')" href="epmy.asp?ep=<%=rs("payid")%>"><font color="#FF0000" size="2">我要认购</font></a></td>
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
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epmcjl.asp"><font color="#0000FF">到EP-求现明细</font></a>---<a href="epmyjl.asp"><font color="#008000">到EP-认购明细</font></a></font></p>
<p align="center">
　</p>
<p align="center"></p>
<p align="center"></p>
<meta http-equiv=Refresh content="180; url=">
</body> 
</html>