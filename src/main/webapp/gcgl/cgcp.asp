<!--#include file="../dt0618.asp"-->
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
<p align="center">
<b>��Ʒ������¼</b></p>
<p align="center">
<b><a href="hfcg.asp?cp=1" style="text-decoration: none">�ָ���ˮ��</a></b></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="83">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="83" bgcolor="#D7FFE3">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="����"> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from cpuser order by cgid desc" 
rs.open sql,conn9,1,1
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
            showpage totalput,MaxPerPage,"cgcp.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"cgcp.asp" 
            showContent 
             showpage totalput,MaxPerPage,"cgcp.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"cgcp.asp" 
           showContent 
           showpage totalput,MaxPerPage,"cgcp.asp" 
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
   
%></font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
              <td width="55" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#000000" size="2"><strong style="font-weight: 400">���</strong></font></td>
              <td width="101" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong>�û���</strong></font></td>
              <td width="206" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">��Ʒ����</strong></font></td>
              <td width="171" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="����"> <strong style="font-weight: 400">�ɹ�ʱ��</strong></font></td>
              <td width="73" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" face="����">��Ʒ�ܷ�</font></td>
              <td width="94" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">������</strong></font></td>
              <td width="112" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����">QQ</font></td>
              <td width="115" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#008000" size="2">�绰</font></td>
              <td width="177" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2">�����ɹ�ʱ��</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="55" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("cgid")%></font></td>
                <td width="101" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����"><%=rs("cguser")%></font></font></b></td>
                <td valign="middle" width="206" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("cpmq")%></font></td>
                <td valign="middle" align="center" width="171"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="����"><%=rs("jydate")%></font></td>
                <td valign="middle" align="center" width="73"><b><font color="#FF0000" size="2" face="����"><%=rs("jyjf")%></font></b></td>
                <td valign="middle" align="center" width="94"><font size="2" face="����"><%=rs("jyname")%></font></td>
                <td valign="middle" align="center" width="112"><font color="#000000" size="2" face="����"><%=rs("jyqq")%></font></td>
                <td valign="middle" align="center" width="115"><font size="2" face="����"><%=rs("jycall")%></font></td>
                <td valign="middle" align="center" width="177"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2"><%if rs("fwdate")<>"" then%><%=rs("fwdate")%><%else%><a onClick="return confirm('��ʾ����ȷ�������ɹ����� ')" href="fwdate.asp?bh=<%=rs("cgid")%>" style="text-decoration: none">¼��</a><%end if%></font></td>
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