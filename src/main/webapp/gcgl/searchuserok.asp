<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<title>��ʾ�û���Ϣ</title>
</head>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">

  <table border="0" cellspacing="1" width="100%" bgcolor="#7bb5de" height="184">
    <tr>
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
        <p align="center"><font color="#000000" style="font-size: 14px"><strong>�� �� �� Ա �� Ϣ �� ��</strong></font>
      </td> 
  </tr> 
  <tr> 
      <td width="100%" bgcolor="#D9E6FF">   <div align="center"><center>

 <%
   const MaxPerPage=200
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
sql_serch="select * from gcuser where username = '"&temuser&"' or name = '"&temuser&"' or call = '"&temuser&"' or qq = '"&temuser&"' or userid = '"&temuser&"'"
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
           showpage totalput,MaxPerPage,"searchuserok.asp" 
            showContent 
            showpage totalput,MaxPerPage,"searchuserok.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs_serch.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs_serch.bookmark 
           showpage totalput,MaxPerPage,"searchuserok.asp" 
            showContent 
             showpage totalput,MaxPerPage,"searchuserok.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"searchuserok.asp" 
           showContent 
           showpage totalput,MaxPerPage,"searchuserok.asp" 
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
            <table border="1" cellspacing="0" width="100%" bgcolor="#F6F6EC" style="border-collapse: collapse" cellpadding="0" height="62">
              <tr bgcolor="#7bb5de"> 
                <td width="144" align="center" height="23" bgcolor="#D9E6FF"><font face="����"><strong>�û���</strong></font></td>
                <td width="84" align="center" height="23" bgcolor="#D9E6FF"><font face="����"><strong style="font-weight: 400">����</strong></font></td>
                <td width="131" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="����">�Ƽ���</font></div></td>
                <td width="156" align="center" height="23" bgcolor="#D9E6FF"><font face="����">QQ</font></td>
                <td width="210" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="Arial">ע��ʱ��</font></div></td>
                <td width="127" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="Arial">ԭʼ��</font></div></td>
                <td width="118" align="center" height="23" bgcolor="#D9E6FF">���׹�</td>
                <td width="115" align="center" height="23" bgcolor="#D9E6FF"><font face="Arial">���</font></td>
                <td width="120" align="center" height="23" bgcolor="#D9E6FF">ȫ������</td>
                <td width="115" align="center" height="23" bgcolor="#D9E6FF">ʣ�ཱ��</td>
              </tr>
              <%do while not rs_serch.eof%>
              <tr bgcolor="#7bb5de"> 
                <td style="border-bottom: 1px solid #C9D8AD" width="144" align="center" bgcolor="#D9E6FF"><p align="center"><%=rs_serch("username")%></td>
                <td style="border-bottom: 1px solid #C9D8AD" width="84" align="center" bgcolor="#D9E6FF"><p align="center"><%=rs_serch("name")%></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="131" bgcolor="#D9E6FF"> <div align="center"><font color="#FF0000"><%=rs_serch("up")%></font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="156" bgcolor="#D9E6FF"><div align="center"><%=rs_serch("qq")%></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="210" bgcolor="#D9E6FF"><div align="center"><%=rs_serch("regtime")%></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="127" bgcolor="#D9E6FF"><div align="center"><%=rs_serch("gdgc")%></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="118" bgcolor="#D9E6FF"><%=rs_serch("jyg")%></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="115" bgcolor="#D9E6FF"><%=rs_serch("jydb")%></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="120" bgcolor="#D9E6FF"><%=rs_serch("cbpay")%></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="115" bgcolor="#D9E6FF"><%=rs_serch("pay")%></td>
				</tr>
		     </table>
		  <table border="1" width="90%" id="table1" height="42" style="border-collapse: collapse">
			<tr>
		<td align="center" width="304">�����ֵʱ�䣺<b><font color="#FF0000"><%=rs_serch("gmdate")%></font></b></td>
		<td align="center" width="172"><a href="modifyaabuser.asp?userid=<%=rs_serch("username")%>" style="text-decoration: none">�鿴����</a></td>
		<td align="center"><%if rs_serch("gwuid")=0 then%><a onClick="return confirm('��ʾ����ȷ������')" href="gngw.asp?diyid=<%=rs_serch("username")%>&sjid=1" style="text-decoration: none">��Ϊ�������</a><%else%><a onClick="return confirm('��ʾ����ȷ������')" href="gngw.asp?diyid=<%=rs_serch("username")%>&sjid=0" style="text-decoration: none">��Ϊ�������</a><%end if%></td>
		<td align="center" width="189"><a href="pmcj01.asp?id=<%=rs_serch("username")%>" style="text-decoration: none"><b><font color="#000000">�ر��ܲ�Ҫ��</font></b></a></td>
		<td align="center" width="88"><a href="usercj.asp?id=<%=rs_serch("username")%>" style="text-decoration: none">��ֵ</a></td>
		<td align="center" width="143"><a href="bsreg.asp?my=<%=rs_serch("username")%>" style="text-decoration: none">��ѡλ��</a></td>
		<td align="center" width="78"><%if rs_serch("jb")>0 or rs_serch("sjb")>0 or rs_serch("pay")>0 or rs_serch("jyg")>0 then%><%else%><a href="delusersave.asp?del=<%=rs_serch("username")%>" style="text-decoration: none"><font color="#FF0000">ɾ��</font></a><%end if%></td>
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