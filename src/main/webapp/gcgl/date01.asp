<!--#include file="../cxshop.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ʾ�û���Ϣ</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<link rel="stylesheet" type="text/css" href="../css.css">
</head>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=200,height=120');
    }
//-->
</SCRIPT>
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

<body bgcolor="#C9D8AD" topmargin="5" leftmargin="5">
<div align="center">

  <table border="0" cellspacing="1" width="100%" bgcolor="#FFFFFF">
    <tr>
      <td width="97%" height="25"> 
        <p align="center"><strong><font color="#FF0000"><span style="font-size: 14px">��</span></font><font color="#FF0000" style="font-size: 14px"> �� �� ʽ �� Ա �� Ϣ</font></strong>(�����Ա�����޸Ļ�Ա����)</td> 
  </tr> 
   
 
  <tr> 
      <td width="97%" bgcolor="#C9D8AD"><br>
        <% 
dim sql 
dim rs 
sql="select * from cfuser where DateDiff('d',date(),regtime)=0 order by regtime desc" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn1,1,1 
  if rs.eof and rs.bof then 
       response.write "<p align='center'> �� û �� �� ʽ �� �� ��</p>" 
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
           showpage totalput,MaxPerPage,"date01.asp" 
            showContent 
            showpage totalput,MaxPerPage,"date01.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"date01.asp" 
            showContent 
             showpage totalput,MaxPerPage,"date01.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"date01.asp" 
           showContent 
           showpage totalput,MaxPerPage,"date01.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn1.close 
   set conn=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%><div align="center"><center>
            <table border="1" cellspacing="0" width="100%" bgcolor="#C9D8AD" style="border-collapse: collapse" cellpadding="0">
              <tr bgcolor="#7bb5de"> 
                <td width="68" align="center" height="28" bgcolor="#C3DAF9"> 
				<font face="Arial"><strong style="font-weight: 400">ID</strong></font></td>
                <td width="131" align="center" height="28" bgcolor="#C3DAF9"> 
				<strong style="font-weight: 400">�û���</strong></td>
                <td width="90" align="center" height="28" bgcolor="#C3DAF9"> 
				<strong style="font-weight: 400">����</strong></td>
                <td width="133" align="center" height="28" bgcolor="#C3DAF9"> 
                  <align="center"><div align="center"><font face="Arial">QQ</font></div>
                </td>
				<td width="197" align="center" height="28" bgcolor="#C3DAF9"> 
                  <div align="center"><font face="Arial">ע��ʱ��</font></div>
                </td>
				<td width="184" align="center" height="28" bgcolor="#C3DAF9"> 
                  <div align="center"><font face="Arial">����ʱ��</font></div>
                </td>
                <td width="180" align="center" height="28" bgcolor="#C3DAF9"> 
                �Ƽ���</td>
                <td width="88" align="center" height="28" bgcolor="#C3DAF9"> 
                  Ӷ��</td>
              </tr>
              <%do while not rs.eof%>
              <tr bgcolor="#7bb5de"> 
                <td height="23" style="border-bottom: 1px solid #C9D8AD" bgcolor="#C3DAF9"> 
                  <p align="center"><%=rs("id")%></td>
                <td style="border-bottom: 1px solid #C9D8AD" bgcolor="#C3DAF9"> 
                  <p align="center"><a target="_blank" href="/member/up2.asp?up=<%=rs("username")%>" style="text-decoration: none"><%=rs("username")%></a></td>
                <td style="border-bottom: 1px solid #C9D8AD" bgcolor="#C3DAF9"> 
                  <p align="center"><%=rs("name")%>�� 
                </td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" bgcolor="#C3DAF9"> 
                  <div align="center"><%=rs("qq")%></div>
                </td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" bgcolor="#C3DAF9"> 
                  <div align="left"><%=rs("regtime")%></div>
                </td>
                                <td align="center" style="border-bottom: 1px solid #C9D8AD" bgcolor="#C3DAF9"> 
                  <div align="left"><font color="#FF0000"><%=rs("gwdate")%></font></div>
                </td><td align="center" style="border-bottom: 1px solid #C9D8AD" bgcolor="#C3DAF9">
				<font color="#800000"><%=rs("up")%></font></td>
                                <td align="center" style="border-bottom: 1px solid #C9D8AD" bgcolor="#C3DAF9"> 
                  ��<font color="#0000FF"><%=rs("pay")%></font>Ԫ</td>
              </tr>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
            </table> 
    </center></div><% 
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
</td> 
  </tr> 
</table> 
</div> 
</body> 
</html>