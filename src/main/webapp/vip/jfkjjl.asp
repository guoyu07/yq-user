<!--#include file="../mq0618.asp"-->
<html>
<title>���ֿ�����¼</title>
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
<body topmargin="0">
<div align="center"><b><table border="0" cellspacing="1" width="100%" cellpadding="0" height="75">
  <tr> 
 <td width="87%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73" bgcolor="#808000"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font face="����"><b>���ֿ�����¼</b><font size="2"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from jfkjdate where bz=1 order by kid desc" 
rs.open sql,conn7,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>��û�п�����¼��</p>" 
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
            showpage totalput,MaxPerPage,"jfkjjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"jfkjjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"jfkjjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"jfkjjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"jfkjjl.asp" 
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
   
%></font></font></p>
	<div align="center">    
          <table border="0" cellspacing="0" width="100%" cellpadding="0" height="50" bgcolor="#000000">
            <tr>        
     <td width="400" align="center" height="28" bgcolor="#000000" bordercolor="#000000"><b><font size="2" color="#FF0000" face="����">�ں�</font></b></td>                
     <td width="400" align="center" height="28" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#FF0000" size="2"><strong>��˫</strong></font></td>                
     <td width="400" align="center" height="28" bgcolor="#000000" bordercolor="#000000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" face="����" size="2"> <strong>��С</strong></font></td>
           </tr>
              <%do while not rs.eof%>
              <tr> 
      <td height="24" width="425" align="center"><b><font size="2" face="����" color="#FFFFFF"><%=rs("kid")%></font></b></td>
      <td height="24" width="412" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FFFFFF" face="����" size="2" style="font-weight: 700"><%if rs("dskj")=1 then%>��<%elseif rs("dskj")=2 then%>˫<%end if%></font></td>
      <td valign="middle" width="394" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FFFFFF" face="����" size="2"><%if rs("kdxj")=3 then%>��<%elseif rs("kdxj")=4 then%>С<%end if%></font></b></td>
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