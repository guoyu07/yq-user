<!--#include file="../dt0618.asp"-->
<% 
sql_ljsy="select sum(syfh) as ljsy from gcfh where syfh>0 " 
Set rs_ljsy= Server.CreateObject("ADODB.Recordset") 
rs_ljsy.open sql_ljsy,conn9,1,1
%>
<% 
sql_ljjc="select sum(syfh) as ljjc from gcfh where syfh<0 " 
Set rs_ljjc= Server.CreateObject("ADODB.Recordset") 
rs_ljjc.open sql_ljjc,conn9,1,1
%>
<% 
sql_jtsy="select sum(syfh) as jtsy from gcfh where DateDiff('d',date(),abdate)=0 and syfh>0 " 
Set rs_jtsy= Server.CreateObject("ADODB.Recordset") 
rs_jtsy.open sql_jtsy,conn9,1,1
%>
<% 
sql_jtjc="select sum(syfh) as jtjc from gcfh where DateDiff('d',date(),abdate)=0 and syfh<0 " 
Set rs_jtjc= Server.CreateObject("ADODB.Recordset") 
rs_jtjc.open sql_jtjc,conn9,1,1
%>
<% 
sql_ztsy="select sum(syfh) as ztsy from gcfh where DateDiff('d',date(),abdate)=-1 and syfh>0 " 
Set rs_ztsy= Server.CreateObject("ADODB.Recordset") 
rs_ztsy.open sql_ztsy,conn9,1,1
%>
<% 
sql_ztjc="select sum(syfh) as ztjc from gcfh where DateDiff('d',date(),abdate)=-1 and syfh<0 " 
Set rs_ztjc= Server.CreateObject("ADODB.Recordset") 
rs_ztjc.open sql_ztjc,conn9,1,1
%>
<html>
<title>��������¼</title>
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
  <table border="1" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#C0C0C0" style="border-collapse: collapse">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����">���ۼ����룺<font color="#0000FF"><%=rs_ljsy("ljsy")%></font>&nbsp;�ۼ�֧����<font color="#0000FF"><%=rs_ljjc("ljjc")%></font>��<font color="#008000">���������룺</font><font color="#FF0000"><%=rs_jtsy("jtsy")%></font><font color="#008000">&nbsp;����֧����</font><font color="#FF0000"><%=rs_jtjc("jtjc")%></font><font color="#008000">��</font>���������룺<font color="#FF00FF"><%=rs_ztsy("ztsy")%></font>&nbsp;����֧����<font color="#FF00FF"><%=rs_ztjc("ztjc")%></font>��</font></b><font face="����" size="2"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gcfh where lb>0 order by id desc" 
rs.open sql,conn9,1,1
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
            showpage totalput,MaxPerPage,"ljsy.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"ljsy.asp" 
            showContent 
             showpage totalput,MaxPerPage,"ljsy.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"ljsy.asp" 
           showContent 
           showpage totalput,MaxPerPage,"ljsy.asp" 
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
    <table border="1" cellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse" cellpadding="0" height="57">
        <tr>        
     <td width="163" align="center" height="26" bgcolor="#E5EAC2"><b><font size="2" face="����">�û���</font></b></td>                
     <td width="187" align="center" height="26" bgcolor="#E5EAC2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#800000" size="2"><strong>����仯</strong></font></td>                
     <td width="179" align="center" height="26" bgcolor="#E5EAC2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="����" size="2"> <strong>�ۼ�����</strong></font></td>
     <td width="283" align="center" height="26" bgcolor="#E5EAC2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000" face="����" size="2">����ʱ��</font></b></td>
     <td width="419" align="center" height="26" bgcolor="#E5EAC2"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="����" size="2">��ע</font></td>
       </tr>
     <%do while not rs.eof%>
        <tr> 
      <td height="32" width="163" align="center" bgcolor="#FFFFFF"><b><font size="2" face="����"><%=rs("userid")%></font></b></td>
      <td height="32" width="187" align="center" bgcolor="#FFFFFF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" size="2" style="font-weight: 700"><%=rs("syfh")%></font></td>
      <td valign="middle" width="179" align="center" bgcolor="#FFFFFF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="����" size="2"><%=rs("ljfhtj")%></font></b></td>
      <td valign="middle" align="center" width="283" bgcolor="#FFFFFF"><font face="����" size="2"><b><%=rs("abdate")%></b></font></td>
      <td valign="middle" align="center" width="419" bgcolor="#FFFFFF"><font face="����" size="2"><b><%=rs("bz")%></b></font></td>
         </tr>
      <% i=i+1 
	    if i>=MaxPerPage then exit do 
	    rs.movenext 
	   loop 
	  %>
       </table> 
</div><font size="2" face="����"><% 
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