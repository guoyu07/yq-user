<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<title>��Ϸ������ϸ</title>
<%
   const MaxPerPage=50
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
sql_jt="select sum(sjb) as jt from sgxt where DateDiff('d',date(),bddate)=0 and new=1 " 
Set rs_jt= Server.CreateObject("ADODB.Recordset") 
rs_jt.open sql_jt,conn7,1,1
%>
<% 
sql_zt="select sum(sjb) as zt from sgxt where DateDiff('d',date(),bddate)=-1 and new=1 " 
Set rs_zt= Server.CreateObject("ADODB.Recordset") 
rs_zt.open sql_zt,conn7,1,1
%>
<% 
sql_cb="select sum(zfh) as ljcb from sgxt where new=1 " 
Set rs_cb= Server.CreateObject("ADODB.Recordset") 
rs_cb.open sql_cb,conn7,1,1
%>
<% 
sql_mq="select sum(mqfh) as ljmq from sgxt where new=1 " 
Set rs_mq= Server.CreateObject("ADODB.Recordset") 
rs_mq.open sql_mq,conn7,1,1
%>
<% 
sql_zd="select sum(sjb) as ljzd from sgxt where new=1 " 
Set rs_zd= Server.CreateObject("ADODB.Recordset") 
rs_zd.open sql_zd,conn7,1,1
%>
<p><font size="2">���죺<font color="#FF00FF"><%=rs_jt("jt")/20%></font>&nbsp; ���죺</font><font size="2" color="#0000FF"><%=rs_zt("zt")/20%> </font><font size="2">��1����<font color="#FF00FF"><%=rs_zd("ljzd")*500%></font>&nbsp; ��1.5����<font color="#FF0000"><%=rs_cb("ljcb")%></font> �ۼ��ѷ�<font color="#FF0000"><%=rs_mq("ljmq")%></font> δ����<font color="#FF0000"><%=rs_cb("ljcb")-rs_mq("ljmq")%></font></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="83">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="83" bgcolor="#D7FFE3">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="����"> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from sgxt where new=1 order by id" 
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
            showpage totalput,MaxPerPage,"sqzfb.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"sqzfb.asp" 
            showContent 
             showpage totalput,MaxPerPage,"sqzfb.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"sqzfb.asp" 
           showContent 
           showpage totalput,MaxPerPage,"sqzfb.asp" 
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
              <td width="77" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#000000" size="2"><strong style="font-weight: 400">���</strong></font></td>
              <td width="90" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong>�û���</strong></font></td>
              <td width="49" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">����</strong></font></td>
              <td width="83" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="����"> <strong style="font-weight: 400">����</strong></font></td>
              <td width="186" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" face="����">��ַ</font></td>
              <td width="111" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">�绰</strong></font></td>
              <td width="116" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����">QQ</font></td>
              <td width="103" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="����" size="2" color="#008000">�Ƽ���</font></b></td>
              <td width="78" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="����"> <strong style="font-weight: 400">��1��</strong></font></td>
              <td width="65" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" face="����">��1.5��</font></td>
              <td width="67" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">�ѷ�</strong></font></td>
              <td width="71" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����">δ��</font></td>
              <td width="135" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="����" size="2">����ʱ��</font></b></td>
              </tr>
              <%do while not rs.eof%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM gcuser where username='"&rs("username")&"'"
rs2.open sql2,conn2,1,1
%>
              <tr> 
                <td height="35" width="77" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("id")%></font></td>
                <td width="90" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����"><%=rs("username")%></font></font></b></td>
                <td valign="middle" width="49" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("sjb")%></font></td>
                <td valign="middle" align="center" width="83"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="����"><%=rs2("name")%></font></td>
                <td valign="middle" align="center" width="186"><font color="#FF0000" size="2" face="����"><%=rs2("addsheng")%><%=rs2("addshi")%><%=rs2("addqu")%></font></td>
                <td valign="middle" align="center" width="111"><font size="2" face="����"><%=rs2("call")%></font></td>
                <td valign="middle" align="center" width="116"><font color="#000000" size="2" face="����"><%=rs2("qq")%></font></td>
                <td valign="middle" align="center" width="103"><font face="����" size="2" color="#008000"><b><%=rs2("up")%></b></font></td>
                <td valign="middle" align="center" width="78"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="����"><%=rs("sjb")*500%></font></td>
                <td valign="middle" align="center" width="65"><b><font color="#FF0000" size="2" face="����"><%=rs("zfh")%></font></b></td>
                <td valign="middle" align="center" width="67"><font size="2" face="����"><%=rs("mqfh")%></font></td>
                <td valign="middle" align="center" width="71"><font color="#000000" size="2" face="����"><%=rs("zfh")-rs("mqfh")%></font></td>
                <td valign="middle" align="center" width="135"><font face="����" size="1"><b><%=rs("bddate")%></b></font></td>
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