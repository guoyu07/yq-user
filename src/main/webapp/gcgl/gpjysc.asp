<!--#include file="../ct0618.asp"-->
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
%>
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
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font color="#000000" size="5" face="����"><strong>�� �� �� �� �� Ʊ �� �� �� ��</strong></font><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<font face="����">
<font size="2">
<b><font color="#0000FF">��ǰ���׼��� </font><font color="#FF0000"><%=rs1("jygj")%>Ԫ </font></b></font>
<font color="#0000FF" size="2">ϵͳÿ30��ˢ��һ��&nbsp; </font>
<font color="#800000"><b>
		<a href="mcsl.asp" style="text-decoration: none; background-color:#FFFFFF">
<font size="2" color="#800000">��������</font></a></b></font><font color="#000000"><font size="2">&nbsp; 
</font> <a href="mysl.asp" style="text-decoration: none; font-weight:700; background-color:#FFFFFF">
<font size="2" color="#FF0000">��������</font></a></font></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<div align="center">
		<table border="1" width="60%" id="table1" bgcolor="#404020" bordercolor="#000000" height="60">
			<tr>
				<td align="center" width="90">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>
				<font color="#FFFF00" face="����" size="2">���̼�</font></b></td>
				<td align="center" width="94">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="����" size="2"><b>��߼�</b></font></td>
				<td align="center" width="98">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="����" size="2"><b>��ͼ�</b></font></td>
				<td align="center" width="98">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="����" size="2"><b>�ּ�</b></font></td>
				<td align="center" width="170">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="����" size="2"><b>���׷�Χ</b></font></td>
				<td align="center">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="����" size="2"><b>�ɽ���</b></font></td>
			</tr>
			<tr>
				<td align="center" width="90">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFFFF" face="����" size="2">
				<span style="font-weight:700">1</span></font></td>
				<td align="center" width="94">
				<font color="#FFFFFF" face="����" size="2">
				<span style="font-weight:700"><%=rs1("zgj")%></span></font></td>
				<td align="center" width="98">
				<font color="#FFFFFF" face="����" size="2">
				<span style="font-weight:700"><%=rs1("zdj")%></span></font></td>
				<td align="center" width="98">
				<font color="#FFFFFF" face="����" size="2">
				<span style="font-weight:700"><%=rs1("jygj")%></span></font></td>
				<td align="center" width="170">
				<font color="#FFFFFF" face="����" size="2">
				<span style="font-weight:700">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs1("zgj")%>/<%=rs1("zdj")%></span></font></td>
				<td align="center" width="150"><font color="#FFFFFF" face="����" size="2">
				<span style="font-weight:700"><%=rs1("jygsl")%></span></font></td>
			</tr>
		</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="����">�������ѣ������г���������ӹɵ��ۻ��Ȳ����ǣ���һ��ʱ���֡�<br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy order by id desc" 
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
            showpage totalput,MaxPerPage,"gpjysc.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"gpjysc.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gpjysc.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gpjysc.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gpjysc.asp" 
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