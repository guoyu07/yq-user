<!--#include file="../ct0618.asp"-->
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gpjy where Now()>dqdate+0.0005 and jy=2"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
rsTest("jy")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
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
<p align="center"><a href="jymc.asp" style="text-decoration: none">�鿴<font color="#FF0000">����</font>��Ϣ</a>&nbsp;&nbsp;&nbsp;<a href="jygl.asp" style="text-decoration: none">�鿴<font color="#008000">ȫ��</font>��Ϣ</a></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
       
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="����"> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where mysl>0 order by id desc" 
rs.open sql,conn2,1,1
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
            showpage totalput,MaxPerPage,"jymy.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"jymy.asp" 
            showContent 
             showpage totalput,MaxPerPage,"jymy.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"jymy.asp" 
           showContent 
           showpage totalput,MaxPerPage,"jymy.asp" 
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
   
%></font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
                
              <td width="99" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="����" color="#000000" size="2">
				<strong style="font-weight: 400">���ױ��</strong></font></td>
                
              <td width="86" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="����"> <strong>���</strong></font></td>
                
              <td width="88" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="����"> <strong style="font-weight: 400">��������</strong></font></td>
                
              <td width="82" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#FF0000" size="2" face="����"> <strong style="font-weight: 400">������</strong></font></td>
                
              <td width="51" align="center" height="30" bgcolor="#FFE1FF">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="����">����</font></td>
                
              <td width="69" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="����"> <strong style="font-weight: 400">���׶�</strong></font></td>
                
              <td width="196" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="����">����ʱ��</font></td>
                
              <td width="85" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="����">������</font></td>
                
              <td width="195" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font face="����" color="#008000" style="font-size: 11pt; ">�ɽ�ʱ��</font></td>
                
              <td width="150" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b><font face="����">�Է�</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="99" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="����"><%=rs("id")%></font></td>
                <td width="86" align="center" bgcolor="#FAF8E6"> 
                  <b><font size="2" color="#008000">
					<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font face="����"><%if rs("mcsl")>0 then%></font></font><font face="����"><font color="#FF0000" size="2">����</font><font size="2" color="#008000"><%else%>��<%end if%></font></font></b></td>
                <td valign="middle" width="88" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="����"><%=rs("mcsl")%></font></td>
                <td valign="middle" align="center" width="82"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#0000FF" size="2" face="����"><%=rs("mysl")%></font></td>
                <td valign="middle" align="center" width="51"><b>
				<font color="#FF0000" size="2" face="����"><%=rs("pay")%></font></b></td>
                <td valign="middle" align="center" width="69">
				<font size="2" face="����"><%=rs("jypay")%></font></td>
                <td valign="middle" align="center" width="196">
				<font color="#000000" size="2" face="����"><%=rs("abdate")%></font></td>
                <td valign="middle" align="center" width="85">
				<font size="2" face="����"><%=rs("username")%></font></td>
                <td valign="middle" align="center" width="195">
				<font face="����" color="#008000" size="2"><%=rs("cgdate")%></font></td>
                <td valign="middle" align="center" width="150">
				<font face="����" size="2"><b><%=rs("dfuser")%></b></font></td>
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
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="����" size="2">������һҳ</font></a></p>
<font face="����" size="2">
</body>
</font>
<meta http-equiv=Refresh content="180; url=">
</html>