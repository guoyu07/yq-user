<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<% 
sqllj1="select sum(jc) as ljmc from datepay where kjqi>0 " 
Set rslj1= Server.CreateObject("ADODB.Recordset") 
rslj1.open sqllj1,conn9,1,1
%>
<% 
sqllj2="select sum(syjz) as ljmy from datepay where kjqi>0 " 
Set rslj2= Server.CreateObject("ADODB.Recordset") 
rslj2.open sqllj2,conn9,1,1
%>
<% 
sqljt1="select sum(jc) as jtmc from datepay where kjqi>0 and DateDiff('d',date(),abdate)=0" 
Set rsjt1= Server.CreateObject("ADODB.Recordset") 
rsjt1.open sqljt1,conn9,1,1
%>
<% 
sqljt2="select sum(syjz) as jtmy from datepay where kjqi>0 and DateDiff('d',date(),abdate)=0" 
Set rsjt2= Server.CreateObject("ADODB.Recordset") 
rsjt2.open sqljt2,conn9,1,1
%>
<% 
sqlzt1="select sum(jc) as ztmc from datepay where kjqi>0 and DateDiff('d',date(),abdate)=-1" 
Set rszt1= Server.CreateObject("ADODB.Recordset") 
rszt1.open sqlzt1,conn9,1,1
%>
<% 
sqlzt2="select sum(syjz) as ztmy from datepay where kjqi>0 and DateDiff('d',date(),abdate)=-1" 
Set rszt2= Server.CreateObject("ADODB.Recordset") 
rszt2.open sqlzt2,conn9,1,1
%>
<%
Set rs_qi= Server.CreateObject("ADODB.Recordset")
sql_qi="select top 1 * from epkjdate where bz=0 order by kid desc" 
rs_qi.open sql_qi,conn7,2,3
if not rs_qi.eof then
bqitz=rs_qi("dan")+rs_qi("shuang")+rs_qi("da")+rs_qi("xiao")
end if
%>
<html>
<title>һ��-��������</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
</head>
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
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"><p align="center">���ۼ����룺<font color="#FF0000"><%=rslj1("ljmc")%></font> �ۼ�֧����<font color="#FF0000"><%=rslj2("ljmy")%></font>��<font color="#0000FF">���������룺<%=rsjt1("jtmc")-bqitz%> ����֧����<%=rsjt2("jtmy")%>��</font><font color="#FF00FF">���������룺<%=rszt1("ztmc")%> ����֧����<%=rszt2("ztmy")%>��</font></p>
		</td> 
  </tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2">
	<font face="����" size="2"><br> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datepay where kjqi>0 order by abdate desc" 
rs.open sql,conn9,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> ��ûEP������¼��Ҫ���Ͱ���</p>" 
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
            showpage totalput,MaxPerPage,"datepay_ep.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"datepay_ep.asp" 
            showContent 
             showpage totalput,MaxPerPage,"datepay_ep.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"datepay_ep.asp" 
           showContent 
           showpage totalput,MaxPerPage,"datepay_ep.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn9.close 
   set conn9=nothing 
   sub showContent 
       dim i 
	   i=0 
   
%></font><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="134" align="center" height="27" bgcolor="#FFE1FF"><font face="����" color="#000000" size="2"><strong style="font-weight: 400">��Ա��</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="����"> <strong style="font-weight: 400">EP ����</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="����" color="#000000" size="2">EP ֧��</font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="����">�������</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="����">���֧��</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="����">ʣ�� EP</font></td>
              <td width="112" align="center" height="27" bgcolor="#FFE1FF"><b><font size="2" face="����">Ͷע�ں�</font></b></td>
              <td width="216" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="����">����ʱ��</font></td>
              <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="����">��ע</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
              <td height="31" width="134" align="center"><p><font color="#000000" size="2" face="����"><%=rs("username")%></font></td>
              <td valign="middle" width="133" align="center"><p><font color="#FF0000" size="2" face="����"><%=rs("syjz")%></font></td>
              <td valign="middle" align="left" width="133"><p align="center"><font size="2" face="����"><%if rs("jc")>0 then%>-<%=rs("jc")%><%else%><%=rs("jc")%><%end if%></font></td>
              <td valign="middle" align="center" width="120"><font color="#FF0000" size="2" face="����"><%=rs("jyjz")%></font></td>
              <td valign="middle" align="center" width="118"><font size="2" face="����"><%if rs("dbjc")>0 then%>-<%=rs("dbjc")%><%else%><%=rs("dbjc")%><%end if%></font></td>
              <td valign="middle" align="center" width="118"><font color="#000000" size="2" face="����"><%=rs("pay")%></font></td>
              <td valign="middle" align="center" width="112"><font size="2" face="����">
				<b><%=rs("kjqi")%></b></font></td>
              <td valign="middle" align="center" width="216"><font color="#000000" size="2" face="����"><%=rs("abdate")%></font></td>
              <td valign="middle" align="center" width="247"><font color="#000000" size="2" face="����"><%=rs("regid")%></font></td>
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
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
</body>
<meta http-equiv=Refresh content="60; url="> 
</html>