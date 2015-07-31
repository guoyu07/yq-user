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
<!--#include file="../dt0618.asp"-->
<html>
<title>Award gold a currency change details</title>
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
<DIV class=box_title>Prize a currency change out fine</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<font color="#000000" face="楷体" size="5"><strong>Prize a currency change out fine</strong></font></td> 
  </tr>
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datepay where username = '"&regid&"' and newbz=1 order by id desc" 
rs.open sql,conn9,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> No one coin reward records, to refuel ah!</p>" 
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
            showpage totalput,MaxPerPage,"datepay_jj.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"datepay_jj.asp" 
            showContent 
             showpage totalput,MaxPerPage,"datepay_jj.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"datepay_jj.asp" 
           showContent 
           showpage totalput,MaxPerPage,"datepay_jj.asp" 
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
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="134" align="center" height="27" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><strong style="font-weight: 400">User name</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000"> <strong style="font-weight: 400">A currency income</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="Arial" color="#000000">A currency expenditures</font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000">Gold revenue</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF">Gold expenditure</td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000">The remaining one currency</font></td>
              <td width="112" align="center" height="27" bgcolor="#FFE1FF">The remaining coins</td>
              <td width="216" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000">Update</font></td>
              <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000">Remark</font></td>   
              </tr>
              <%do while not rs.eof%>
              <tr> 
              <td height="31" width="134" align="center"> <p><font color="#000000"><%=regid%></font></td>
              <td valign="middle" width="133" align="center"> <p><font color="#FF0000"><%=rs("syjz")%></font></td>
              <td valign="middle" align="left" width="133"><p align="center"><%if rs("jc")>0 then%>-<%=rs("jc")%><%else%><%=rs("jc")%><%end if%></td>
              <td valign="middle" align="center" width="120"> <font color="#FF0000"><%=rs("jyjz")%></font></td>
              <td valign="middle" align="center" width="118"><%if rs("dbjc")>0 then%>-<%=rs("dbjc")%><%else%><%=rs("dbjc")%><%end if%></td>
              <td valign="middle" align="center" width="118"><font color="#000000"><%=rs("pay")%></font></td>
              <td valign="middle" align="center" width="112"><%=rs("jydb")%></td>
              <td valign="middle" align="center" width="216"><font color="#000000"><%=rs("abdate")%></font></td>
              <td valign="middle" align="center" width="247"><font color="#000000"><%=rs("regid")%></font></td>
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
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a></p>
</body> 
</html>