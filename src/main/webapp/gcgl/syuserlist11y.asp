<!--#include file="../ct0618.asp"-->
<html>
<head>
<title>��ʾ�û���Ϣ</title>
</head>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table border="0" cellspacing="1" width="100%" bgcolor="#7bb5de" height="146">
    <tr>
      <td width="97%" height="26" background="/meme/images/admin_bg_1.gif"><p align="center"><font color="#000000" style="font-size: 14px"><strong>Э �� �� �� �� Ϣ �� ��</strong></font></td> 
  </tr>
  <tr> 
      <td width="97%" bgcolor="#D9E6FF"><div align="center"><center>
 <%
   const MaxPerPage=100
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
<% 
dim sql_serch 
dim rs_serch 
temuser=request.Form("user")
sql_serch="select * from gcuser where txlb=2 order by id desc"
Set rs_serch= Server.CreateObject("ADODB.Recordset") 
rs_serch.open sql_serch,conn2,1,1 
  if rs_serch.eof and rs_serch.bof then 
      response.write "<p align='center'> <br></p>" 
      response.write "<p align='center'> û������û�����</p>" 
   else 
	  totalPut=rs_serch.recordcount 
      totalPut=rs_serch.recordcount 
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
           showpage totalput,MaxPerPage,"userlist11y.asp" 
            showContent 
            showpage totalput,MaxPerPage,"userlist11y.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs_serch.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs_serch.bookmark 
           showpage totalput,MaxPerPage,"userlist11y.asp" 
            showContent 
             showpage totalput,MaxPerPage,"userlist11y.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"userlist11y.asp" 
           showContent 
           showpage totalput,MaxPerPage,"userlist11y.asp" 
	      end if 
	   end if 
   rs_serch.close 
   end if 
	         
   set rs_serch=nothing   
   conn2.close 
   set conn2=nothing
   sub showContent 
       dim i 
	   i=0
%> 
            <table border="1" cellspacing="0" width="100%" bgcolor="#F6F6EC" style="border-collapse: collapse" cellpadding="0" height="59">
              <tr bgcolor="#7bb5de"> 
                <td width="118" align="center" height="23" bgcolor="#D9E6FF"><font face="����"><strong>�û���</strong></font></td>
                <td width="99" align="center" height="23" bgcolor="#D9E6FF"><font face="����"><strong>����</strong></font></td>
                <td width="51" align="center" height="23" bgcolor="#D9E6FF"><font color="#0000FF">����</font></td>
                <td width="89" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><b><font face="����">�Ƽ���</font></b></div></td>
                <td width="120" align="center" height="23" bgcolor="#D9E6FF"><b><font face="����">QQ</font></b></td>
                <td width="144" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><b><font face="Arial">ע��ʱ��</font></b></div></td>
                <td width="90" align="center" height="23" bgcolor="#D9E6FF"><b>���׹�</b></td>
                <td width="66" align="center" height="23" bgcolor="#D9E6FF"><b><font face="Arial">���</font></b></td>
                <td width="96" align="center" height="23" bgcolor="#D9E6FF"><b>ȫ������</b></td>
                <td width="102" align="center" height="23" bgcolor="#D9E6FF"><b>ʣ�ཱ��</b></td>
              </tr>
              <%do while not rs_serch.eof%>
              <tr bgcolor="#7bb5de"> 
                <td style="border-bottom: 1px solid #C9D8AD" width="118" align="center" bgcolor="#D9E6FF"><p align="center"><%=rs_serch("username")%></td>
                <td style="border-bottom: 1px solid #C9D8AD" width="99" align="center" bgcolor="#D9E6FF"><p align="center"><%=rs_serch("name")%></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="51" bgcolor="#D9E6FF"><font color="#0000FF"><%=rs_serch("sjb")%></font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="89" bgcolor="#D9E6FF"><div align="center"><font color="#FF0000"><%=rs_serch("up")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="120" bgcolor="#D9E6FF"><div align="center"><%=rs_serch("qq")%></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="144" bgcolor="#D9E6FF"><div align="center"><%=rs_serch("regtime")%></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="90" bgcolor="#D9E6FF"><%=rs_serch("jyg")%></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="66" bgcolor="#D9E6FF"><%=rs_serch("jydb")%></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="96" bgcolor="#D9E6FF"><%=rs_serch("cbpay")%></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="102" bgcolor="#D9E6FF"><%=rs_serch("pay")%></td>
				</tr>
		<% i=i+1 
	    if i>=MaxPerPage then exit do 
        rs_serch.movenext 
	   loop 
		  %>
		     </table>
		  </div>	
        <% 
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
  </tr> 
</table>
</div>
<p align="center"><b><a href="searchg0701.asp" style="text-decoration: none"><font color="#FF0000" size="6">�� �� �� ��</font></a></b></p>
</body>
</html>