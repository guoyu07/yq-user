<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
sql2="select * from fhdate order by id desc" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn7,2,3
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT sum(pdlb) as jt FROM mqfh where DateDiff('d',date(),pddate)=0 "
rs1.open sql1,conn7,1,1
%>
<html>
<title>��ʷ�ֺ��¼</title>
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
  	<p><%'if date()-rs2("date")=2 then%><a onClick="return confirm('��ʾ����ȷ������ ')" href="jsfh.asp" style="text-decoration: none">ִ���������</a><%'end if%></p>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#FFFFC1">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">��ʷ�ֺ��¼&nbsp; ����Ŀǰ���������Ȩ<font color="#FF0000"><%=rs1("jt")%></font>��<font color="#FF0000"></font></span></b><span style="font-size: 11pt"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from fhdate order by id desc" 
rs.open sql,conn7,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>��û����ʷ�ֺ��¼��</p>" 
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
            showpage totalput,MaxPerPage,"fhjl.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"fhjl.asp" 
            showContent 
             showpage totalput,MaxPerPage,"fhjl.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"fhjl.asp" 
           showContent 
           showpage totalput,MaxPerPage,"fhjl.asp" 
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
   
%></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr>        
     <td width="65" align="center" height="26" bgcolor="#E8E8FF"> 
	<b><font size="2" face="����">���</font></b></td>                
     <td width="129" align="center" height="26" bgcolor="#E8E8FF"> 
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="����" color="#800000" size="2">
				<strong>��������</strong></font></td>                
              <td width="113" align="center" height="26" bgcolor="#E8E8FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#800000" face="����" size="2"> <strong>ӯ����(Ԫ)</strong></font></td>
              <td width="119" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000" face="����" size="2">�����Ȩ(��)</font></b></td>
              <td width="97" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="����" size="2">˫����Ա</font></td>
              <td width="99" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="����" size="2">��ͨ��Ա</font></td>
              <td width="87" align="center" height="26" bgcolor="#E8E8FF"> 
                <b> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#800000" face="����" size="2">ͳ������</font></td>
              <td width="107" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#FF0000" face="����" size="2">ͳ��Ŀǰ</font></b></td>
              <td width="282" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b><font color="#800000" face="����" size="2">״̬</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="24" width="65" align="center" bgcolor="#DFFFEF"><b>
				<font size="2" face="����"><%=rs("id")%></font></b></td>
                <td height="24" width="129" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#008000" face="����" size="2" style="font-weight: 700"><%=rs("date")%></font></td>
                <td valign="middle" width="113" align="center" bgcolor="#DFFFEF"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="����" size="2"><%=rs("zly")%></font></td>
                <td valign="middle" align="center" width="119" bgcolor="#DFFFEF"><font face="����" size="2"><%=rs("fhk")%></font></td>
                <td valign="middle" align="center" width="97" bgcolor="#DFFFEF"><font face="����" size="2"><%if rs("vipfhpay")<1 then%>0<%=rs("vipfhpay")%><%else%><%=rs("vipfhpay")%><%end if%></font></td>
                <td valign="middle" align="center" width="99" bgcolor="#DFFFEF"><font face="����" size="2"><%if rs("fhpay")<1 then%>0<%=rs("fhpay")%><%else%><%=rs("fhpay")%><%end if%></font></td>
                <td valign="middle" align="center" width="87" bgcolor="#DFFFEF">
				<font face="����" size="2"><%=rs("tjjt")%></font></td>
                <td valign="middle" align="center" width="107" bgcolor="#DFFFEF">
				<font face="����" size="2"><%=rs("tjmq")%></font></td>
                <td valign="middle" align="center" width="282" bgcolor="#DFFFEF">
				<font face="����" size="2" color="#0000FF"><%if rs("bz")>1 then%>���ųɹ�<%elseif rs("bz")=0 then%> <a onClick="return confirm('��ʾ����ȷ������ ')" href="jsvipfh.asp?pdid=<%=rs("id")%>&fh=<%=rs("vipfhpay")%>" style="text-decoration: none">˫����Ա�ֺ�</a> <%elseif rs("bz")=1 then%><a onClick="return confirm('��ʾ����ȷ������ ')" href="jsptfh.asp?pdid=<%=rs("id")%>&fh=<%=rs("fhpay")%>" style="text-decoration: none">��ͨ��Ա�ֺ�</a> <%end if%></font></td>
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