<!--#include file=../zqcjimg.asp-->
<!--#include file="../gcgl/checkadmin.asp"-->
<title>��ֵ��¼</title>
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
<div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="����"><strong>�� ֵ �� ¼ �� ϸ</strong></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
	<font face="����" style="font-size: 11pt"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datecj order by id desc" 
rs.open sql,conn1,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'> ��û�г�ֵ��¼��</p>" 
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
            showpage totalput,MaxPerPage,"cjjltj.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"cjjltj.asp" 
            showContent 
             showpage totalput,MaxPerPage,"cjjltj.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"cjjltj.asp" 
           showContent 
           showpage totalput,MaxPerPage,"cjjltj.asp" 
	      end if 
	   end if 
   end if
    
   Rs.close	         
   set rs=nothing   
   conn1.close
   set conn1=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></font><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr>
          <td width="69" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="����" color="#000000" size="2"><strong>���</strong></font></td>
          <td width="123" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="����" color="#000000" size="2"><strong>�û���</strong></font></td>
          <td width="67" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="����" size="2"> <strong>���</strong></font></td>
          <td width="71" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="����" color="#000000" style="font-weight:700" size="2">�ۼ�</font></td>
          <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="����" size="2">��ֵʱ��</font></td>
          <td width="190" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="����" size="2">��ֵ��ʽ</font></td>
          <td width="127" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="����" size="2">ԭ������</font></td>
          <td width="108" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="����" size="2">����Ա</font></td>
          <td width="210" align="center" height="29" bgcolor="#C3DAF9">ip��ַ</td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
          <td height="29" width="69" align="center"><b>
			<font color="#FF0000" size="2"><%=rs("id")%></font></b></td>
          <td height="29" width="123" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="����" size="2"><%=rs("cjuser")%></font></td>
          <td valign="middle" width="67" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="����" size="2"><%=rs("dqcj")%></font></td>
          <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="����"><%=rs("ljcj")%></font></td>
          <td valign="middle" align="center" width="178"><%=rs("qldate")%></td>
          <td valign="middle" align="center" width="190">
			<font size="2" face="����"><%=rs("cjfs")%></font></td>
          <td valign="middle" align="center" width="127"><%=rs("bz")%></td>
          <td valign="middle" align="center" width="108"><%=rs("cz")%></td>
          <td valign="middle" align="center" width="210"><%=rs("ip")%></td>
          </tr>
         <% i=i+1 
	      if i>=MaxPerPage then exit do
	      rs.movenext 
	   loop 
		  %>
            </table> 
</div><font face="����" style="font-size: 11pt"><% 
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
</font> 
</tr> 
</table> 
</div> 
</html>