<!--#include file="../zqcjimg.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM txpay where payonoff = '��δת��' and kjygid=0 and Now()>rgdate+0.001"
rsTest.Open StrSQL, Conn1,2,3
While Not rsTest.EOF
rsTest("ep")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<html>
<title>EP �� �� �� ��</title>
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
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
    <td width="100%" height="25"><p align="center"><strong><font color="#000000" size="5" face="����_GB2312">EP �� �� �� ��������</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7">
<font face="����" size="2">
<% 
dim sql
dim rs
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from txpay where payonoff = '��δת��' and ep=0 and vipname='88888a' order by pdid asc,jyid asc" 
rs.open sql,conn1,1,1
  if rs.eof and rs.bof then
      response.write "<p align='center'> ��û�н��׼�¼��</p>" 
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
            showpage totalput,MaxPerPage,"epjysc_gd.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
            showpage totalput,MaxPerPage,"epjysc_gd.asp" 
            showContent 
            showpage totalput,MaxPerPage,"epjysc_gd.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"epjysc_gd.asp" 
           showContent 
           showpage totalput,MaxPerPage,"epjysc_gd.asp" 
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
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="127" align="center" height="23" bgcolor="#FBFAEC"><font face="����" size="2"><b>���ױ��</b></font></td>
          <td width="142" align="center" height="23" bgcolor="#FBFAEC"><font face="����" color="#000000" size="2"><strong style="font-weight: 400">������</strong></font></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC">��</td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000" face="����" size="2">���ֽ��</font></td>
          <td width="184" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000" face="����" size="2">���ַ���ʱ��</font></td>
          <td width="161" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000" face="����" size="2">�Ϲ���ɻ�EP</font></td>
          <td width="167" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#008000" face="����" size="2">�Ϲ���ɻ���</font></b></td>
          <td width="260" align="center" height="23" bgcolor="#FBFAEC"><font face="����" size="2">����״̬</font></td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="28" width="127" align="center"><b><font face="����" size="2"><%=rs("payid")%></font></b></td>
          <td height="28" width="142" align="center"><p><font color="#000000" face="����" size="2"><%=rs("payusername")%></font></td>
          <td valign="middle" align="center" width="121"><%=rs("pdid")%></td>
          <td valign="middle" align="center" width="121"><font color="#FF0000" face="����" size="2"><%=rs("paynum9")%></font></td>
          <td valign="middle" align="center" width="184"><font color="#000000" face="����" size="2"><%=rs("paytime")%></font></td>
          <td valign="middle" align="center" width="161"><font color="#0000FF" face="����" size="2"><%=rs("paynum")%></font></td>
          <td valign="middle" align="center" width="167"><b><font color="#FF0000" face="����" size="2"><%if rs("paynum9")/rs("paynum")>0.88 then%><%=rs("paynum")-rs("paynum9")%><%else%></font><%=rs("paynum")-rs("paynum9")%></b><%end if%></td>
          <td valign="middle" align="center" width="260"><font face="����" size="2">�ȴ��Ϲ��С�����</font></td>
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
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" face="����" size="5">������һҳ</font></a></p>
<p align="center"></p>
<p align="center"></p>
<meta http-equiv=Refresh content="120; url=">
</body> 
</html>