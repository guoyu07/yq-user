<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<title>�����г�</title>
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
<p>
<iframe name="I1" width="100%" marginwidth="1" marginheight="1" border="0" frameborder="0" src="sgtjdate.asp">
</iframe></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="83">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="83" bgcolor="#D7FFE3">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="����"> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from sgxt order by id desc" 
rs.open sql,conn7,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>���޼�¼</p>" 
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
            showpage totalput,MaxPerPage,"outday.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"outday.asp" 
            showContent 
             showpage totalput,MaxPerPage,"outday.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"outday.asp" 
           showContent 
           showpage totalput,MaxPerPage,"outday.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn7.close 
   set conn7=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
              <td width="55" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#000000" size="2"><strong style="font-weight: 400">���</strong></font></td>
              <td width="112" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong>�û���</strong></font></td>
              <td width="56" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">����</strong></font></td>
              <td width="71" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="����"> <strong style="font-weight: 400">�ܷ�</strong></font></td>
              <td width="53" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" face="����">���</font></td>
              <td width="75" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">����</strong></font></td>
              <td width="69" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����">����</font></td>
              <td width="54" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#008000" size="2">��ʣ</font></td>
              <td width="54" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#008000" size="2">��ʣ</font></td>
              <td width="117" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2">�����</font></td>
              <td width="107" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2">���ұ�</font></td>
              <td width="56" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2">�ۼ�</font></td>
              <td width="61" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2">����</font></td>
              <td width="159" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="����" size="2">����ʱ��</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="55" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("id")%></font></td>
                <td width="112" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����"><%=rs("username")%></font></font></b></td>
                <td valign="middle" width="56" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("sjb")%></font></td>
                <td valign="middle" align="center" width="71"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="����"><%=rs("fdpay")%></font></td>
                <td valign="middle" align="center" width="53"><b><font color="#FF0000" size="2" face="����"><%=rs("cfd")%></font></b></td>
                <td valign="middle" align="center" width="75"><font size="2" face="����"><%=rs("zaq")%></font></td>
                <td valign="middle" align="center" width="69"><font color="#000000" size="2" face="����"><%=rs("zbq")%></font></td>
                <td valign="middle" align="center" width="54"><font size="2" face="����"><%=rs("aq")%></font></td>
                <td valign="middle" align="center" width="54"><font face="����" color="#008000" size="2"><%=rs("bq")%></font></td>
                <td valign="middle" align="center" width="117"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2">��<%=rs("auid")%></font></td>
                <td valign="middle" align="center" width="107"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2">��<%=rs("buid")%></font></td>
                <td valign="middle" align="center" width="56"><font face="����" size="2"><%=rs("cbpay")%></font></td>
                <td valign="middle" align="center" width="61"><font face="����" size="2"><%=rs("pay")%></font></td>
                <td valign="middle" align="center" width="159"><font face="����" size="1"><b><%=rs("bddate")%></b></font></td>
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
<font face="����" size="2"> 
</div> </div>
</font>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">��</p>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="����" size="2">������һҳ</font></a></p>
<font face="����" size="2">
</body>
</font>
</html>