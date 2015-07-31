<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
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
<%
dim sql2
dim rs2
sql2="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn2,1,1
if rs2.eof and rs2.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM txpay where payonoff = 'Not yet forwarded' and kjygid=0 and Now()>rgdate+0.001 "
rsTest.Open StrSQL, Conn9,2,3
While Not rsTest.EOF
rsTest("ep")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<html>
<title>EP Traded Market</title>
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
  <LI>¡¡</LI>
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
<DIV class=box_title>A currency trading market</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <form method="POST" action="epjysc_user.asp" name="fomr">
			<table border="0" width="100%" id="table1">
				<tr>
				<td width="448"> <p align="center"><strong><font color="#000000" size="5" face="¿¬Ìå">A currency trading market</font></strong></td>
				<td width="110"><p align="center"><font size="2">Username:</font></td>
				<td width="149"><input type="text" name="user" size="15"></td>
				<td width="541"><input type="submit" value="Find a user name" name="B3"></td>
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
sql="select * from txpay where payonoff = 'Not yet forwarded' and ep=0 and txlb=0 order by jyid asc,payid asc" 
rs.open sql,conn9,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'> No transaction records!</p>" 
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
   conn9.close 
   set conn9=nothing 
   sub showContent 
       dim i 
	   i=0 
   
%><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="127" align="center" height="23" bgcolor="#FBFAEC"><b>Serial number</b></td>
          <td width="142" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400">Sell side</strong></font></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000">Find the amount of cash</font></td>
          <td width="161" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000">After the subscription of a convertible currency</font></td>
          <td width="167" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#008000">Subscription profitable</font></b></td>
          <td width="260" align="center" height="23" bgcolor="#FBFAEC">Transaction status</td>
          <td width="177" align="center" height="23" bgcolor="#FBFAEC">Operating</td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="28" width="127" align="center"><b><%=rs("payid")%></b></td>
          <td height="28" width="142" align="center"><p><font color="#000000"><%=rs("payusername")%></font></td>
          <td valign="middle" align="center" width="121"><font color="#FF0000"><%=rs("paynum9")%></font></td>
          <td valign="middle" align="center" width="161"><font color="#0000FF"><%=rs("paynum")%></font></td>
          <td valign="middle" align="center" width="167"><b><font color="#0000FF"></font><font color="#FF0000"><%if rs("paynum9")/rs("paynum")>0.88 then%><%=rs("paynum")-rs("paynum9")%><%else%></font><%=rs("paynum")-rs("paynum9")%></b><%end if%></td>
          <td valign="middle" align="center" width="260"><%if rs("payusername")=username then%><b><a onClick="return confirm('Tip: Are you sure it?')" href="qxepmc.asp?qx=<%=rs("payid")%>"><font color="#FF0000">Revocation sell</font></a></b><%else%>Call waiting in. . .<%end if%></td>
          <td valign="middle" align="center" width="177"><a onClick="return confirm('Tip: use the other payment methods¡°<%=rs("paybank")%>¡±Are you sure you subscribed yet?')" href="epmy.asp?ep=<%=rs("payid")%>"><font color="#FF0000" size="2">I want to subscribe</font></a></td>
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
   response.write "&nbsp;Page£º<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>Page " 
    response.write "&nbsp;Altogether<b>"&totalnumber&"</b>Number <b>"&maxperpage&"</b>Number/Page " 
   response.write " Go to:<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>"
        
end function 
 

%> 
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epmcjl.asp"><font color="#0000FF">To EP-Details are now seeking</font></a>---<a href="epmyjl.asp"><font color="#008000">To EP-subscription details</font></a></font></p>
<p align="center">
¡¡</p>
<p align="center"></p>
<p align="center"></p>
<meta http-equiv=Refresh content="180; url=">
</body> 
</html>