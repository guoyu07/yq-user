<!--#include file="../zqcjimg.asp"-->
<html>
<title>�����ұ仯��ϸ</title>
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
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<font color="#000000" face="����"><strong>�� �� �� �� �� �� ϸ</strong></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2">
	<font face="����" size="2"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from bdbdate where zuser='xtgc001' and sybdb>0 order by id desc" 
rs.open sql,conn1,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> ��û��¼��</p>" 
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
            showpage totalput,MaxPerPage,"bdbdate_xtgc001.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"bdbdate_xtgc001.asp" 
            showContent 
             showpage totalput,MaxPerPage,"bdbdate_xtgc001.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"bdbdate_xtgc001.asp" 
           showContent 
           showpage totalput,MaxPerPage,"bdbdate_xtgc001.asp" 
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
   
%></font><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="120" align="center" height="27" bgcolor="#FFE1FF">
				<font face="����" color="#000000" size="2"><strong style="font-weight: 400">��Ա��</strong></font></td>
              <td width="97" align="center" height="27" bgcolor="#FFE1FF">
				<font color="#FF0000" face="����" size="2"> <strong style="font-weight: 400">����������</strong></font></td>
              <td width="99" align="center" height="27" bgcolor="#FFE1FF">
				<font face="����" color="#000000" size="2">������֧��</font></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF">
				<font color="#000000" face="����" size="2">ʣ�౨����</font></td>
              <td width="150" align="center" height="27" bgcolor="#FFE1FF">
				<font color="#000000" face="����" size="2">����ʱ��</font></td>
              <td width="404" align="center" height="27" bgcolor="#FFE1FF">
				<font color="#000000" face="����" size="2">��ע</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
              <td height="31" width="120" align="center"> <p>
				<font color="#000000" face="����" size="2"><%=rs("zuser")%></font></td>
              <td valign="middle" width="97" align="center"> <p>
				<font color="#FF0000" face="����" size="2"><%=rs("sy")%></font></td>
              <td valign="middle" align="left" width="99"><p align="center">
				<font face="����" size="2"><%if rs("jc")>0 then%>-<%=rs("jc")%><%else%><%=rs("jc")%><%end if%></font></td>
              <td valign="middle" align="center" width="95">
				<font color="#000000" face="����" size="2"><%=rs("sybdb")%></font></td>
              <td valign="middle" align="center" width="150">
				<font color="#000000" face="����" size="2"><%=rs("bfdate")%></font></td>
              <td valign="middle" align="center" width="404">
				<font color="#000000" face="����" size="2"><%=rs("bz")%></font></td>
              </tr>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
            </table> 
</div><font face="����" size="2"><% 
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
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
</body> 
</html>