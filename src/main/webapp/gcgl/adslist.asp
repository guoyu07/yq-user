<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��վ���������</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<LINK 
href="adminstyle.css" type=text/css rel=StyleSheet>
</head>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=200,height=120');
    }
//-->
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

<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">

  <table border="1" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="143">
    <tr>
      <td width="100%" height="26" bgcolor="#C3DAF9" background="images/admin_bg_1.gif"> 
        <p align="center">
		<span style="font-size: 11pt"><b>����</b></span><b><font style="font-size: 11pt">Ա����</font></b></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 0px solid #E5EAC2; border-right: 0px solid #E5EAC2; border-bottom: 0px solid #E5EAC2" height="117" bgcolor="#C3DAF9"><br> 
<% 
dim sql 
dim rs 
sql="select * from gg " 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn,1,1 
  if rs.eof and rs.bof then 
       response.write "<p align='center'> ��û�з�������</p>" 
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
            showpage totalput,MaxPerPage,"adslist.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"adslist.asp" 
            showContent 
             showpage totalput,MaxPerPage,"adslist.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"adslist.asp" 
           showContent 
           showpage totalput,MaxPerPage,"adslist.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn.close 
   set conn=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%> 
<div align="center">
            
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
                
              <td width="84" align="center" height="28" bgcolor="#C3DAF9"> 
				<strong><font face="Arial">���</font></strong></td>
                
              <td width="100" align="center" height="28" bgcolor="#C3DAF9"> 
				<strong>������</strong></td>
                
              <td width="402" align="center" height="28" bgcolor="#C3DAF9"> 
                <div align="center"><b>�� �� �� ��</b></div>
                </td>
                
              <td width="266" align="center" height="28" bgcolor="#C3DAF9"> 
                <b>����ʱ��</b></td>
                
              <td width="274" align="center" height="28" bgcolor="#C3DAF9"> 
                <b>����</b></td>
                
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td valign="middle" height="23" width="84" align="center"> 
                  <p><font color="#000000" size="2"><%=rs("id")%> 
                </font> 
                </td>
                <td valign="middle" width="100" align="center"> 
                  <p><font color="#000000" size="2"> 
                	��˾</font></td>
                <td valign="middle" align="center" width="402"> 
                  <div align="center"><font color="#000000" size="2">
					<a target="_blank" href="../vip/ggck.asp?regid=<%=rs("id")%>"><%=rs("ggbt")%></a></font></div>
                </td>
                <td valign="middle" align="center" width="266"> 
                  <font size="2">��<%=rs("ggdate")%></font></td>
                <td valign="middle" align="center" width="274"> 
                  <font color="#000000" size="2">
					<a href="modiads.asp?regid=<%=rs("id")%>">�޸�</a>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %></table> 
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
  response.write "<p align='center'>&gt;&gt;��ҳ&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>��ҳ ��һҳ</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&>��ҳ</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&">��һҳ</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>��һҳ βҳ</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1) 
    response.write ">��һҳ</a> <a href="&filename&"?page="&n&">βҳ</a>" 
  end if 
   response.write "&nbsp;ҳ�Σ�<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>ҳ " 
    response.write "&nbsp;��<b>"&totalnumber&"</b>�� <b>"&maxperpage&"</b>��/ҳ " 
   response.write " ת����<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function 
 
  
%> 
<p>��</td> 
  </tr> 
</table> 
</div> 
</body> 
</html>