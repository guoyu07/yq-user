<!--#include file="../zqcjimg.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Temporarily unable to check!');"
   response.write "history.go(-1);" 
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<html>
<title>A currency subscribe Ming fine</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="Home";
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
<DIV class="top_bg cBlue">
　</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">Personal information</A> </LI>
  <LI><A>Query results</A> 
  </LI>
  <LI><A>Financial Management</A> 
  </LI>
  <LI><A>Message Management</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">Exit the System</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>Current position:<SPAN id=mTitle>Home</SPAN></DIV></DIV></DIV>
<DIV class=box_title>A currency subscribe Ming fine</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<strong>
		<font color="#000000" face="楷体" size="5">A currency subscribe Ming fine</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from txpay where dfuser = '"&username&"'order by payid desc" 
rs.open sql,conn1,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'> Not a currency transaction!</p>" 
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
            showpage totalput,MaxPerPage,"epmyjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"epmyjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"epmyjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"epmyjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"epmyjl.asp" 
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
          <td width="110" align="center" height="23" bgcolor="#FBFAEC"><b>Serial number</b></td>
          <td width="120" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400">Sell side (own)</strong></font></td>
          <td width="95" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000">Call a number of coins</font></td>
          <td width="165" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000">Call time</font></td>
          <td width="120" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000">Sell side</font></td>
          <td width="450" align="center" height="23" bgcolor="#FBFAEC">Transaction status</td>
          <td width="250" align="center" height="23" bgcolor="#FBFAEC">Operating</td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="28" width="110" align="center"><b>***<%=right(rs("payid"),2)%></b></td>
          <td height="28" width="120" align="center"><p><font color="#000000"><%=rs("dfuser")%></font></td>
          <td valign="middle" align="center" width="95"><font color="#FF0000"><%=rs("paynum")%></font></td>
          <td valign="middle" align="center" width="165"><font color="#000000"><%=rs("rgdate")%></font></td>
          <td valign="middle" align="center" width="120"><%=rs("payusername")%></td>
          <td valign="middle" align="center" width="450"><%if rs("zftime")<>"" then%>Successful transactions - sell side<%=rs("payusername")%>Recognized.<%elseif rs("ep")=1 then%><font color="#FF00FF">You have orders, waiting for you</font><font color="#0000FF"><b><%=rs("rgdate")%></b></font><font color="#FF00FF">Before payment,<b><a target="_blank" href="fbbank.asp?fb=<%=rs("payid")%>"><font color="#008000">Click to view the sell side receivable account!</font></a></b></font><%elseif rs("ep")=2 then%><%=rs("dfuser")%>--Has been paid, wait sell side<%=rs("payusername")%>'s the confirmation. . .<%end if%></td>
          <td valign="middle" align="center" width="250"><a onClick="return confirm('Tip: Are you sure you have release party <%=rs("payusername")%> play money <%=rs("paynum9")%> yuan yet?')" href="myepok.asp?ep=<%=rs("payid")%>"><font color="#FF0000" size="2"><%if rs("ep")=1 then%>Have play money<%=rs("paynum9")%>yuan,notify sell side confirmation.<%end if%></font></a></td>
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
  response.write "<p align='center'>&gt;&gt;Paging&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>Home Previous</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&>Home</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&">Previous</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>Next End</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1) 
    response.write ">Next</a> <a href="&filename&"?page="&n&">End</a>" 
  end if 
   response.write "&nbsp;Page：<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>Page " 
    response.write "&nbsp;Altogether<b>"&totalnumber&"</b>Number <b>"&maxperpage&"</b>Number/Page " 
   response.write " Go to:<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function
%> 
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epjysc.asp"><font color="#0000FF">To a currency - trading market</font></a>---<a href="epmcjl.asp"><font color="#008000">To a currency - sell breakdown</font></a></font></p>
<p align="center"></p>
<p align="center"></p>
</body> 
</html>