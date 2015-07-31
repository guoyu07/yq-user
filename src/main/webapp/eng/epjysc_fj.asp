<!--#include file="../zqcjimg.asp"-->
<html>
<title>A currency trading market</title>
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
   const MaxPerPage=200
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
        <p align="center"><strong><font color="#000000" size="5" face="楷体">A currency trading market</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from txpay where payonoff = '尚未转账' and ep=0 and vipname='15880805512' order by payid asc" 
rs.open sql,conn1,1,1
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
            showpage totalput,MaxPerPage,"epjysc_fj.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"epjysc_fj.asp" 
            showContent 
             showpage totalput,MaxPerPage,"epjysc_fj.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"epjysc_fj.asp" 
           showContent 
           showpage totalput,MaxPerPage,"epjysc_fj.asp" 
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
          <td width="127" align="center" height="23" bgcolor="#FBFAEC"><b>Serial number</b></td>
          <td width="142" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400">Sell side</strong></font></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000">Find the amount of cash</font></td>
          <td width="192" align="center" height="23" bgcolor="#FBFAEC">Time</td>
          <td width="114" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000">After the subscription of a convertible currency</font></td>
          <td width="144" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#008000">Subscription profitable</font></b></td>
          <td width="171" align="center" height="23" bgcolor="#FBFAEC">Transaction status</td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="28" width="127" align="center"><b><%=rs("payid")%></b></td>
          <td height="28" width="142" align="center"><p><font color="#000000"><%=rs("payusername")%></font></td>
          <td valign="middle" align="center" width="121"><font color="#FF0000"><%=rs("paynum9")%></font></td>
          <td valign="middle" align="center" width="192"><%=rs("paytime")%></td>
          <td valign="middle" align="center" width="114"><font color="#0000FF"><%=rs("paynum")%></font></td>
          <td valign="middle" align="center" width="144"><b><font color="#0000FF"></font><font color="#FF0000"><%if rs("paynum9")/rs("paynum")>0.88 then%><%=rs("paynum")-rs("paynum9")%><%else%></font><%=rs("paynum")-rs("paynum9")%></b><%end if%></td>
          <td valign="middle" align="center" width="171"><%if rs("payusername")=username then%><b><a onClick="return confirm('Tip: Are you sure it?')" href="qxepmc.asp?qx=<%=rs("payid")%>"><font color="#FF0000">Revocation sell</font></a></b><%else%>Call waiting in. . .<%end if%></td>
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
        
end function 
 

%> 
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epmcjl.asp"><font color="#0000FF">To EP-Details are now seeking</font></a>---<a href="epmyjl.asp"><font color="#008000">To EP-subscription details</font></a></font></p>
<p align="center"></p>
<p align="center"></p>
<p align="center"></p>
<meta http-equiv=Refresh content="120; url=">
</body> 
</html>