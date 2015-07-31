<!--#include file=../zqcjimg.asp-->
<!--#include file=../ct0618.asp-->
<%
fhkok=request("jhid")
dqu=request("dq")
if dqu="0" or dqu="7" or dqu="2" or dqu="8" then
   cz01="China Yichuan [No.] ① Service QQ：613697151"
   qq=613697151
   cz02="陈文娟"
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="China Yichuan [No.] ② Service QQ：613697152"
   qq=613697152
   cz02="陈文娟"
end if
%>
<%
if fhkok<>"" then
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&fhkok&"'"
rs.open sql,conn2,2,3
if rs("addsheng")="山东省" or rs("addsheng")="江苏省" or rs("addsheng")="上海市" then
    rs("dqu")=0
    rs("add9dqu")="华东一区"
    rs.update
end if
if rs("addsheng")="安徽省" or rs("addsheng")="浙江省" or rs("addsheng")="福建省" then
    rs("dqu")=1
    rs("add9dqu")="华东二区"
    rs.update
end if
if rs("addsheng")="广东省" or rs("addsheng")="广西壮族自治区" or rs("addsheng")="海南省" or rs("addsheng")="四川省" then
    rs("dqu")=2
    rs("add9dqu")="华南地区"
    rs.update
end if
if rs("addsheng")="湖北省" or rs("addsheng")="湖南省" or rs("addsheng")="河南省" or rs("addsheng")="江西省" then
    rs("dqu")=3
    rs("add9dqu")="华中地区"
    rs.update
end if
if rs("addsheng")="北京市" or rs("addsheng")="天津市" or rs("addsheng")="河北省" or rs("addsheng")="河北省" or rs("addsheng")="山西省" or rs("addsheng")="内蒙古自治区" then
    rs("dqu")=4
    rs("add9dqu")="华北地区"
    rs.update
end if
if rs("addsheng")="宁夏回族自治区" or rs("addsheng")="新疆维吾尔自治区" or rs("addsheng")="青海省" or rs("addsheng")="陕西省" or rs("addsheng")="甘肃省" then
    rs("dqu")=5
    rs("add9dqu")="西北地区"
    rs.update
end if
if rs("addsheng")="云南省" or rs("addsheng")="贵州省" or rs("addsheng")="西藏自治区" or rs("addsheng")="重庆市" then
    rs("dqu")=6
    rs("add9dqu")="西南地区"
    rs.update
end if
if rs("addsheng")="辽宁省" or rs("addsheng")="吉林省" or rs("addsheng")="黑龙江省" then
    rs("dqu")=7
    rs("add9dqu")="东北地区"
    rs.update
end if
if rs("addsheng")="台湾省" or rs("addsheng")="香港特别行政区" or rs("addsheng")="澳门特别行政区" then
    rs("dqu")=8
    rs("add9dqu")="港澳台地区"
    rs.update
end if
end if
%>
<%
dim rs_rg,sql_rg
set rs_rg = Server.CreateObject("ADODB.Recordset")
sql_rg ="select * from txpay where dfuser ='"&fhkok&"' and ep=1 "
rs_rg.open sql_rg,conn1,1,1
if not rs_rg.eof then
   response.Write "<script language=javascript>alert('You have to subscribe for a coin yet another payment, please complete the payment as soon as possible!');location.replace('../vip/epmyjl.asp');</script>"
   response.end
end if
%>
<%
dim rs_qr,sql_qr
set rs_qr = Server.CreateObject("ADODB.Recordset")
sql_qr ="select * from txpay where payusername ='"&fhkok&"' and ep=2 "
rs_qr.open sql_qr,conn1,1,1
if not rs_qr.eof then
   response.Write "<script language=javascript>alert('You have to sell a currency to acquire others and give your payment, please check and promptly confirm, any questions contact customer service as soon as possible!');location.replace('../vip/epmcjl.asp');</script>"
   response.end
end if
%>
<html>
<head>
<title>Integral gaming platform - Announcement Management</title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.pdid.value=="") {      alert("Consumption numbers can not be empty!");      return false;    } 
  if (Form.pdpa.value=="") {      alert("Login password can not be empty!");      return false;    }  
  if (Form.fwid.value=="") {      alert("Security code can not be empty!");    return false;    } 
  if (Form.sfz.value==0) {      alert("Please carefully view the consumer agreement, and only agreed to before you can continue!");      return false;    }
  return true;  }  
 </script>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script>
  //alert("系统有新功能，详细请看-[业绩查询]-下的-[添加同名账户]！");
</script>
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
<body topmargin="5" leftmargin="5">
<div align="center">
      <div align="center">
      <form method="POST" name="Form" action="0625fhk/pdfhk0102/chklogin.asp" onSubmit="return checkdate()">
      <table border="0" width="100%" id="table22" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
	<td align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">According to district chose when you registered users, this service center to provide you with personal service, in order to improve efficiency!</span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">There is anything, please contact:<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="Click here to send me a message" title="Click here to send me a message"></a></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">Each department service center personnel division, a person can not repeat plus, not a problem to consult with everyone in the same period</font><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 11pt"><a href="javascript:openwindow('bank.asp?dq=<%=dqu%>')" style="text-decoration: none">The service center has been equipped with designated customer service staff, a dedicated collection account name "<b><font color="#FF0000"><%=cz02%></font></b>"- Click to view Remittances</a></font></td>
		</tr>
		</table>
      <TABLE width="503" border=0 cellPadding=3 id="table20" height="170">
  <TBODY>
    <TR class=content> 
      <TD width="147" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="29"><p style="margin-top: 0; margin-bottom: 0"><b><font size="3" color="#000000">Consumer Code:</font></b></TD>
      <TD width="338" bgColor=#ffffff style="color: #304618; font-size: 12px" height="29"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><span style="font-size: 9pt"><font size="3"><input type="text" maxlength="20" name="pdid" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><input type="hidden" name="jbk" size="10" value="<%=fhkok%>" readonly></font></span></font></TD>
    </TR>
    <TR class=content> 
      <TD width="147" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="28"><p style="margin-top: 0; margin-bottom: 0"><b><font size="3" color="#000000">Password:</font></b></TD>
      <TD width="338" bgColor=#ffffff style="color: #304618; font-size: 12px" height="28"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><span style="font-size: 9pt"><font size="3"><input type="text" maxlength=15 name="pdpa" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></font></span></font></TD>
    </TR>
    <TR class=content> 
      <TD width="147" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" height="29"><p style="margin-top: 0; margin-bottom: 0"><b><font size="3" color="#000000">Security code:</font></b></TD>
      <TD width="338" bgColor=#ffffff style="color: #304618; font-size: 12px" height="29"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><span style="font-size: 9pt"><font size="3"><input type="text" maxlength=15 name="fwid" size="18" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" <%=call0%>></font></span></font></TD>
    </TR>
    <TR class=content> 
    <TD width="495" bgColor=#ffffff align="right" style="color: #304618; font-size: 12px" colspan="2" height="53">
	<table border="0" width="88%" id="table21" cellspacing="0" cellpadding="0" height="37">
	<tr>
	<td><p align="center" style="margin-top: 0; margin-bottom: 0"><font size="2" color="#FF0000"><select size="1" name="sfz">
		<option selected value="0">==Please choose whether consumer consent agreement==</option>
		<option value="0">Do not agree, I do not want to participate, I want the card lost ...</option>
		<option value="1">Consent agreement, I have to buy the products they want!</option>
		</select>
		<a href="javascript:openwindow('/sfz_eng.asp')" style="text-decoration: none; font-weight: 700"><font color="#008000" size="3">View user agreement</font></a></font></td>
			</tr>
		</table>
		</TD>
    </TR>
    <TR class=content> 
      <TD width="495" bgColor=#ffffff align="center" style="color: #304618; font-size: 12px" colspan="2"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="Sure" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
		</form>
</div>
<table border="0" width="100%" bordercolor="#006699" height="29">
    <tr>
      <td width="100%" height="25" bgcolor="#D0FFF0"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font face="宋体"><b>Administrators Notice</b></font></td> 
  </tr>  <tr> 
	<p style="margin-top: 0; margin-bottom: 0">
	<font face="宋体" size="2"><br> 
<% 
dim sql1
dim rs1
sql1="select * from dgag where check=0 order by id desc"
Set rs1= Server.CreateObject("ADODB.Recordset")
rs1.open sql1,conn1,1,1
  if rs1.eof and rs1.bof then
       response.write "<p align='center'> No announcement</p>"
   else
	  totalPut=rs1.recordcount 
      totalPut=rs1.recordcount 
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
            showpage totalput,MaxPerPage,"gg.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs1.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs1.bookmark 
           showpage totalput,MaxPerPage,"gg.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gg.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gg.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gg.asp" 
	      end if 
	   end if 
   rs1.close 
   end if 
	         
   set rs1=nothing
   conn1.close 
   set conn1=nothing
 
   sub showContent
       dim i
	   i=0
   
%></font></p>
	<div align="center">
            
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="61">
            <tr> 
              <td width="68" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><strong><font face="宋体" style="font-size: 11pt">ID</font></strong></td>
              <td width="112" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><strong>Publisher</strong></font></td>
              <td width="504" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>Notice Title</b></font></td>
              <td width="232" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>Published</b></font></td>
              <td width="100" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>Operation</b></font></td>
              </tr>
              <%do while not rs1.eof%>
              <tr> 
                <td valign="middle" height="34" width="68" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" style="font-size: 11pt"><%=rs1("id")%></font></td>
                <td valign="middle" width="112" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" style="font-size: 11pt">The company</font></td>
                <td valign="middle" align="center" width="504"><font color="#000000" face="宋体" style="font-size: 11pt"><%=rs1("ggbt")%></font></td>
                <td valign="middle" align="center" width="232"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><%=rs1("ggdate")%></font></td>
                <td valign="middle" align="center" width="100"><font color="#000000" face="宋体" style="font-size: 11pt"><p style="margin-top: 0; margin-bottom: 0"><a href="ggck.asp?ck=<%=rs1("id")%>" style="text-decoration: none">Check out</a>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs1.movenext
	   loop 
		  %></table> 
</div>
<font face="宋体" size="2"><% 
   end sub  
 
function showpage(totalnumber,maxperpage,filename) 
  dim n 
  if totalnumber mod maxperpage=0 then 
     n= totalnumber \ maxperpage 
  else 
     n= totalnumber \ maxperpage+1 
  end if 
  response.write "<form method=Post action="&filename&">" 
  response.write "<p align='center'>&gt;&gt;Pagination&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>First Previous</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&>First</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&">Previous</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>Next Last</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1)
    response.write ">Next</a> <a href="&filename&"?page="&n&">Last</a>" 
  end if 
   response.write "&nbsp;Page：<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>Page " 
    response.write "&nbsp;Altogether<b>"&totalnumber&"</b>Number <b>"&maxperpage&"</b>Number/Page " 
   response.write " Go to:<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function 
 
  
%> 
</font></td> 
</tr> 
</table> 
</div> 
</body> 
</html>