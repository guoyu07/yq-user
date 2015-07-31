<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
Set rs_qi= Server.CreateObject("ADODB.Recordset")
sql_qi="select top 1 * from epkjdate order by kid desc"
rs_qi.open sql_qi,conn7,1,1
%>
<%
dim rs_bd,sql_bd
set rs_bd = Server.CreateObject("ADODB.Recordset")
sql_bd="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs_bd.open sql_bd,conn2,1,1
if rs_bd.eof and rs_bd.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<% 
t = Now()
y = Year(t)
mo = Month(t)
d = Day(t)
h = Hour(t)
m = Minute(t)
s = Second(t)
sm = right("0" & m,2)
sm = cdbl(left(sm,1) & "9")
%>
<script type="text/javascript">
	var startTime = new Date();
	startTime.setFullYear(<%= y %>, <%= mo - 1 %>, <%= d %>);
	startTime.setHours(<%= h %>);
	startTime.setMinutes(<%= sm %>);
	startTime.setSeconds(59);
	startTime.setMilliseconds(999);
	var EndTime=startTime.getTime();
	function GetRTime(){
		var NowTime = new Date();
		var nMS = EndTime - NowTime.getTime();
		var nD = Math.floor(nMS/(1000 * 60 * 60 * 24));
		var nH = Math.floor(nMS/(1000*60*60)) % 24;
		var nM = Math.floor(nMS/(1000*60)) % 60;
		var nS = Math.floor(nMS/1000) % 60;
		if (nMS < 0){
			//window.location.reload();
			window.location.href="epkjz.asp";
			$("#dao").hide();
			$("#daoend").show();
		}else{
		   $("#dao").show();
		   $("#daoend").hide();
		   //$("#RemainD").text(nD);
		   //$("#RemainH").text(nH);
		   $("#RemainM").text(nM);
		   $("#RemainS").text(nS); 
		}
	}
	
	$(document).ready(function () {
		var timer_rt = window.setInterval("GetRTime()", 1000);
	});
</script>
<script language="JavaScript"> 
 function checkdate()  { 
  if (Form.tzlb.value==0) {      alert("Please select the quiz items!");      return false;    }
  if (Form.tzsl.value=="") {      alert("Please write the number of coins bet one!");      return false;    }
  if (Form.tzsl.value<10) {      alert("Betting a number of not less than 10 credits");      return false;    }
  if (Form.tzsl.value><%=rs_bd("pay")%>) {      alert("Betting a number of coins that you can not be greater than the number of remaining <%=rs_bd("pay")%> Oh!");    return false;    }
  if (!chkinteger(Form.tzsl.value)){
	alert('A currency bets only for the whole word!');
	document.Form.tzsl.focus;
	return (false);
 }
 function chkinteger(checkStr) {
var checkOK = "0123456789";
var allValid = true;
for (i=0; i<checkStr.length; i++) {
ch = checkStr.charAt(i);
if (checkOK.indexOf(ch) == -1) {
allValid = false;
break;
}
if ((ch == '+' || ch == '-') && i>0) {
allValid = false;
break;
}
}
return (allValid);
}
   return true;  }
</script>
<html>
<title>A currency quiz Records</title>
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
<div align="center"><b><form method="POST" action="eptzok.asp" name="Form" onSubmit="return checkdate()">
		<table border="0" width="100%" id="table4" height="60" bgcolor="#FFFF66">
			<tr>
		<td width="330" rowspan="2"><b><p>&nbsp;Distance<font color="#FF0000">Section <%=rs_qi("kid")%></font>A currency lottery are:<!--<span id="RemainD">&nbsp;</span>天<span id="RemainH">&nbsp;</span>时--><span id="RemainM">&nbsp;</span>Minute<span id="RemainS">&nbsp;</span>Second</td>
		<td width="165" align="right"><b>Select the quiz items:</b></td>
		<td><b><select size="1" name="tzlb">
			<option selected value="0">=Select the quiz items=</option>
			<option value="1">-Single-</option>
			<option value="2">-Double-</option>
			<option value="3">-Big-</option>
			<option value="4">-Small-</option>
			</select></td>
		<td width="75" rowspan="2"><p align="center"><b><input type="submit" value="Submit" name="B3" style="font-family: 宋体; font-size: 12pt; font-weight: bold" onClick="return confirm('Tip: Are you sure it?')"></td>
		<td width="500" rowspan="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体"><font color="#FF0000" size="2"><b></b></font><b><font color="#FF0000" size="2">Tips:</font></b></font><font face="宋体" size="2">Guessing game is not 100% winning, the bet - a currency - whether or not in the middle, are not revoked, the game is not gambling, please keep a good game mentality and capabilities.</font></td>
			</tr>
			<tr>
		<td width="165" align="right"><b>A number of coins bet:</b></td>
		<td><input type="text" name="tzsl" size="15"></td>
			</tr>
		</table>
	</form>
  	<table border="0" width="100%" id="table1" height="100%" cellspacing="0" cellpadding="0">
		<tr>
		<td width="15%" valign="top"><iframe name="I1" src="epkjjl.asp" marginwidth="1" marginheight="1" align="top" border="0" frameborder="0" scrolling="no" height="100%" width="100%"></iframe></td>
		<td width="85%" valign="top"><b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#FF6600" id="table2">
        <tr> 
        <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
        <font face="宋体"><b>A currency - Guess Records</b><font size="2"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datepay where username ='"&username&"' and kjqi>0 order by id desc" 
rs.open sql,conn9,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>Guess no one currency Record!</p>" 
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
            showpage totalput,MaxPerPage,"epjqks.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"epjqks.asp" 
            showContent 
             showpage totalput,MaxPerPage,"epjqks.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"epjqks.asp" 
           showContent 
           showpage totalput,MaxPerPage,"epjqks.asp" 
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
   
%></font></font></p>
	<div align="center">    
      <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="55" id="table3">
        <tr>        
     <td width="103" align="center" height="26" bgcolor="#E8E8FF"><b>
		<font size="2" face="宋体">Issue</font></b></td>                
     <td width="157" align="center" height="26" bgcolor="#E8E8FF"> <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> <font face="宋体" color="#800000" size="2"><strong>Guess player</strong></font></td><b>
     <td width="117" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>Bet a currency</strong></font></td></b>                
     <td width="118" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>Income a currency</strong></font></td>
     <td width="108" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000" face="宋体" size="2">The remaining one currency</font></b></td><b>
     <td width="220" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b> <font color="#FF0000" face="宋体" size="2">Auction time</font></b></td></b>
     <td width="216" align="center" height="26" bgcolor="#E8E8FF"> <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="宋体" size="2">Remark</font></b></td>
        </tr>
      <%do while not rs.eof%>
        <tr> 
     <td height="32" width="103" align="center" bgcolor="#DFFFEF"><b><font size="2" face="宋体"><%=rs("kjqi")%></font></b></td>
     <td height="32" width="157" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000" face="宋体" size="2" style="font-weight: 700"><%=rs("username")%></font></td><b>
     <td valign="middle" width="117" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" size="2"><%if rs("jc")>0 then%>-<%=rs("jc")%><%else%><%=rs("jc")%><%end if%></font></td></b>
     <td valign="middle" width="118" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" size="2"><%=rs("syjz")%></font></td>
     <td valign="middle" align="center" width="108" bgcolor="#DFFFEF"><font face="宋体" size="2"><%=rs("pay")%></font></td><b>
     <td valign="middle" align="center" width="220" bgcolor="#DFFFEF"><font size="2" face="宋体"><%=rs("abdate")%></font></td></b>
     <td valign="middle" align="center" width="216" bgcolor="#DFFFEF"><font size="2" face="宋体"><%=rs("regid")%></font></td>
         </tr>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
        </table> 
</div><font size="2" face="宋体"><% 
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
</font>
</tr> 
</table> 
</td>
</tr>
</table>
</div> 
</body> 
</html>