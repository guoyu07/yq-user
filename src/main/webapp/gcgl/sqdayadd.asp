<!--#include file="../ct0618.asp"-->
<title>��������-˫��������ϸ</title>
<%
   const MaxPerPage=120
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
sql_jt="select sum(sjb) as jt from gcuser where DateDiff('d',date(),bddate)=0 and sjb>19" 
Set rs_jt= Server.CreateObject("ADODB.Recordset") 
rs_jt.open sql_jt,conn2,1,1
%>
<% 
sql_zt="select sum(sjb) as zt from gcuser where DateDiff('d',date(),bddate)=-1 and sjb>19" 
Set rs_zt= Server.CreateObject("ADODB.Recordset") 
rs_zt.open sql_zt,conn2,1,1
%>

<% 
sql_ct="select sum(sjb) as ct from gcuser where DateDiff('d',date(),bddate)=-2 and sjb>19" 
Set rs_ct= Server.CreateObject("ADODB.Recordset") 
rs_ct.open sql_ct,conn2,1,1
%>

<% 
sql_dct="select sum(sjb) as dct from gcuser where DateDiff('d',date(),bddate)=-3 and sjb>19" 
Set rs_dct= Server.CreateObject("ADODB.Recordset") 
rs_dct.open sql_dct,conn2,1,1
%>

<p style="margin-top: 0; margin-bottom: 0"><font size="2">
<a href="?beizhu=0" style="text-decoration: none">���죺<font color="#FF00FF"><%=rs_jt("jt")/20%></font></a>&nbsp;<a href="?beizhu=-1" style="text-decoration: none">���죺</a></font><font size="2" color="#0000FF"><a href="?beizhu=-1" style="text-decoration: none"><font color="#008000"><%=rs_zt("zt")/20%></font></a>&nbsp;</font><font size="2"><a href="?beizhu=-2" style="text-decoration: none">ǰ�죺<font color="#FF0000"><%=rs_ct("ct")/20%></font></a><a href="?beizhu=-3" style="text-decoration: none">&nbsp;��ǰ�죺<font color="#000080"><%=rs_dct("dct")/20%></font></a><a href="sqdayadd.asp" style="text-decoration: none">&nbsp;ȫ��</a></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="70">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="70" bgcolor="#D7FFE3">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="����"> 
<%
if Request("beizhu")="" then
   bz=""
   bb="order by bddate desc"
else
   bz="and DateDiff('d',date(),bddate)="&Request("beizhu")&""
   bb="order by bddate desc"
end if
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where sjb>10 "&bz&" "&bb&""
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
            showpage totalput,MaxPerPage,"sqdayadd.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"sqdayadd.asp" 
            showContent 
             showpage totalput,MaxPerPage,"sqdayadd.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"sqdayadd.asp" 
           showContent 
           showpage totalput,MaxPerPage,"sqdayadd.asp" 
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
              <td width="79" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#000000" size="2"><strong style="font-weight: 400">���</strong></font></td>
              <td width="123" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong>�û���</strong></font></td>
              <td width="83" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">����</strong></font></td>
              <td width="142" align="center" height="30" bgcolor="#FFE1FF"><font size="2">�Ƽ���</font></td>
              <td width="142" align="center" height="30" bgcolor="#FFE1FF"><font size="2">����</font></td>
              <td width="304" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="����"> <strong style="font-weight: 400">��ַ</strong></font></td>
              <td width="164" align="center" height="30" bgcolor="#FFE1FF"><font size="2">�ֻ�</font></td>
              <td width="159" align="center" height="30" bgcolor="#FFE1FF"><font size="2">qq</font></td>
              <td width="168" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="����" size="2">����ʱ��</font></b></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="79" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("id")%></font></td>
                <td width="123" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����"><%=rs("username")%></font></font></b></td>
                <td valign="middle" width="83" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("sjb")/20%>��</font></td>
                <td align="center" width="142" bgcolor="#C0C0C0"><font size="2"><%=rs("up")%></font></td>
                <td valign="middle" align="center" width="142"><font size="2"><%=rs("name")%></font></td>
                <td valign="middle" align="center" width="304"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="����"><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%></font></td>
                <td valign="middle" align="center" width="164"><font size="2"><%=rs("call")%></font></td>
                <td valign="middle" align="center" width="159"><font size="2"><%=rs("qq")%></font></td>
                <td valign="middle" align="center" width="168"><font face="����" size="1"><b><%=rs("bddate")%></b></font></td>
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
</font>
</html>