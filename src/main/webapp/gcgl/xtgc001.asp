<!--#include file="../ct0618.asp"-->
<html>
<title>��������ת����ϸ</title>
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
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">��������ת����ϸ</span></b><span style="font-size: 11pt"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from vipxtgc where vipname='xtgc001' order by vipid desc" 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>��û����ʷ��¼��</p>" 
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
            showpage totalput,MaxPerPage,"xtgc001.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"xtgc001.asp" 
            showContent 
             showpage totalput,MaxPerPage,"xtgc001.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"xtgc001.asp" 
           showContent 
           showpage totalput,MaxPerPage,"xtgc001.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn2.close 
   set conn2=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
           <tr>        
     <td width="91" align="center" height="26" bgcolor="#E8E8FF"><b><font size="2" face="����">���</font></b></td>                
     <td width="146" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#800000" size="2"><strong>ͳ������</strong></font></b></td>                
     <td width="111" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="����" size="2"> <strong>�û���</strong></font></b></td>
     <td width="136" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="����" size="2">֧��һ�ұ�</font></b></td>
     <td width="161" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="����" size="2">ʵ��90%</font></b></td>
     <td width="163" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="����" size="2">֧��������</font></b></td>
     <td width="172" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="����" size="2">ʵ��90%</font></td>
            </tr>
              <%do while not rs.eof%>
             <tr> 
      <td height="24" width="91" align="center" bgcolor="#DFFFEF"><b><font size="2" face="����"><%=rs("vipid")%></font></b></td>
      <td height="24" width="146" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000" face="����" size="2" style="font-weight: 700"><%=rs("vipdate")%></font></td>
      <td valign="middle" width="111" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" face="����" size="2"><%=rs("vipname")%></font></td><b>
      <td valign="middle" align="center" width="136" bgcolor="#DFFFEF"><font face="����" size="2"><%=rs("jcyb")%></font></td></b>
      <td valign="middle" align="center" width="161" bgcolor="#DFFFEF"><font face="����" size="2"><font color="#FF0000"><b><%=rs("jcyb")*0.9%></b></font></font></td><b>
      <td valign="middle" align="center" width="163" bgcolor="#DFFFEF"><font face="����" size="2"><%=rs("jcbdb")%></font></td></b>
      <td valign="middle" align="center" width="172" bgcolor="#DFFFEF"><font face="����" size="2" color="#FF0000"><b><%=rs("jcbdb")*0.9%></b></font></td>
              </tr>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
            </table> 
</div><font size="2"><% 
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