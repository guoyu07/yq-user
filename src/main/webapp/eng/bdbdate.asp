<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM txpay where ep=1 and Now()>rgdate "
rsTest.Open StrSQL,Conn1,2,3
While Not rsTest.EOF
if rsTest("payonoff")="尚未转账" and rsTest("dfuser")<>"" then
set rst = Server.CreateObject("ADODB.Recordset")
sqlt ="select * from gpjy where username ='"&rsTest("dfuser")&"' and dfuser='"&rsTest("payid")&"' "
rst.open sqlt,conn2,2,3
if not rst.eof then
set rsk = Server.CreateObject("ADODB.Recordset")
sqlk ="select * from gcuser where username ='"&rsTest("dfuser")&"' "
rsk.open sqlk,conn2,2,3
   rsk("cxt")=rsk("cxt")-1
   rsk.update
   rsTest("ep")=0
   rsTest("rgdate")=abcd
   rsTest("dfuser")=""
   rsTest("kjygid")=0
   rsTest.update
   rst("bz")="Unpaid overtime - and pulled a good faith star - Remaining"&rsk("cxt")
   'rst("dfuser")="一币系统"
   rst("cgdate")=Now()
   rst("newjy")=0
   rst.Update
end if
end if
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
Dim StrSQL_qr,rs_qr
Set rs_qr = server.CreateObject("ADODB.Recordset")
StrSQL_qr = "SELECT * FROM txpay where ep=2 and Now()>rgdate and clip<>'已扣' "
rs_qr.Open StrSQL_qr,Conn1,2,3
While Not rs_qr.EOF
if rs_qr("payonoff")="尚未转账" and rs_qr("dfuser")<>"" then
   rs_qr("clip")="已扣"
set rs_kx = Server.CreateObject("ADODB.Recordset")
sql_kx ="select * from gcuser where username ='"&rs_qr("payusername")&"' "
rs_kx.open sql_kx,conn2,2,3
if not rs_kx.eof then
   rs_kx("cxt")=rs_kx("cxt")-1
   rs_kx.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs_qr("payusername")
rs_d1("regid")="Confirmed receiving overtime - and pulled a good faith star - Remaining"&rs_kx("cxt")
rs_d1("pay")=rs_kx("pay")
rs_d1("jydb")=rs_kx("jydb")
rs_d1.update   
end if
end if
rs_qr.MoveNext
Wend
rs_qr.UpdateBatch
%>
<html>
<title>Declaration currency - change details</title>
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
  <LI><A>Personal information</A> </LI>
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
<DIV class=box_title>Reported single currency change out fine</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> <p align="center"><font color="#000000" face="楷体" size="5"><strong>Reported single currency change out fine</strong></font></td> 
  </tr>
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2"><br> 
<%
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from bdbdate where zuser = '"&regid&"'order by id desc" 
rs.open sql,conn1,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> No records!</p>" 
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
            showpage totalput,MaxPerPage,"bdbdate.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"bdbdate.asp" 
            showContent 
             showpage totalput,MaxPerPage,"bdbdate.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"bdbdate.asp" 
           showContent 
           showpage totalput,MaxPerPage,"bdbdate.asp" 
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
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="123" align="center" height="27" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><strong style="font-weight: 400">User name</strong></font></td>
              <td width="84" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000"> <strong style="font-weight: 400">Currency income declaration</strong></font></td>
              <td width="84" align="center" height="27" bgcolor="#FFE1FF"><font face="Arial" color="#000000">Currency expenditure declarations</font></td>
              <td width="101" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000">The remaining coins declaration</font></td>
              <td width="172" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000">Update Time</font></td>
              <td width="421" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000">Remark</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
              <td height="31" width="123" align="center"> <p><font color="#000000"><%=regid%></font></td>
              <td valign="middle" width="84" align="center"> <p><font color="#FF0000"><%=rs("sy")%></font></td>
              <td valign="middle" align="left" width="84"><p align="center"><%if rs("jc")>0 then%>-<%=rs("jc")%><%else%><%=rs("jc")%><%end if%></td>
              <td valign="middle" align="center" width="101"><font color="#000000"><%=rs("sybdb")%></font></td>
              <td valign="middle" align="center" width="172"><font color="#000000"><%=rs("bfdate")%></font></td>
              <td valign="middle" align="center" width="421"><font color="#000000"><%=rs("bz")%></font></td>
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
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a></p>
</body> 
</html>