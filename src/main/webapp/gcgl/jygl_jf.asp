<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<% 
sqllj1="select sum(mcsl) as ljmc from gpjy where kjqi>0 " 
Set rslj1= Server.CreateObject("ADODB.Recordset") 
rslj1.open sqllj1,conn2,1,1
%>
<% 
sqllj2="select sum(mysl) as ljmy from gpjy where kjqi>0 " 
Set rslj2= Server.CreateObject("ADODB.Recordset") 
rslj2.open sqllj2,conn2,1,1
%>
<% 
sqljt1="select sum(mcsl) as jtmc from gpjy where kjqi>0 and DateDiff('d',date(),cgdate)=0" 
Set rsjt1= Server.CreateObject("ADODB.Recordset") 
rsjt1.open sqljt1,conn2,1,1
%>
<% 
sqljt2="select sum(mysl) as jtmy from gpjy where kjqi>0 and DateDiff('d',date(),cgdate)=0" 
Set rsjt2= Server.CreateObject("ADODB.Recordset") 
rsjt2.open sqljt2,conn2,1,1
%>
<% 
sqlzt1="select sum(mcsl) as ztmc from gpjy where kjqi>0 and DateDiff('d',date(),cgdate)=-1" 
Set rszt1= Server.CreateObject("ADODB.Recordset") 
rszt1.open sqlzt1,conn2,1,1
%>
<% 
sqlzt2="select sum(mysl) as ztmy from gpjy where kjqi>0 and DateDiff('d',date(),cgdate)=-1" 
Set rszt2= Server.CreateObject("ADODB.Recordset") 
rszt2.open sqlzt2,conn2,1,1
%>
<%
Set rs_qi= Server.CreateObject("ADODB.Recordset")
sql_qi="select top 1 * from jfkjdate where bz=0 order by kid desc" 
rs_qi.open sql_qi,conn7,2,3
if not rs_qi.eof then
bqitz=rs_qi("dan")+rs_qi("shuang")+rs_qi("da")+rs_qi("xiao")
end if
%>
<title>����-��������<%=bqitz%></title>
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
<p align="center">���ۼ����룺<font color="#FF0000"><%=rslj1("ljmc")%></font> �ۼ�֧����<font color="#FF0000"><%=rslj2("ljmy")%></font>��<font color="#0000FF">���������룺<%=rsjt1("jtmc")-bqitz%> ����֧����<%=rsjt2("jtmy")%>��</font><font color="#FF00FF">���������룺<%=rszt1("ztmc")%> ����֧����<%=rszt2("ztmy")%>��</font></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="����"> 
<% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where kjqi>0 order by id desc" 
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
            showpage totalput,MaxPerPage,"jygl_jf.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"jygl_jf.asp" 
            showContent 
             showpage totalput,MaxPerPage,"jygl_jf.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"jygl_jf.asp" 
           showContent 
           showpage totalput,MaxPerPage,"jygl_jf.asp" 
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
                
              <td width="75" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#000000" size="2"><strong style="font-weight: 400">���ױ��</strong></font></td>
              <td width="48" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong>���</strong></font></td>
              <td width="73" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">��������</strong></font></td>
              <td width="72" align="center" height="30" bgcolor="#FFE1FF"> <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="����"> <strong style="font-weight: 400">������</strong></font></td>
              <td width="50" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" face="����">����</font></td>
              <td width="68" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"> <strong style="font-weight: 400">���׶�</strong></font></td>
              <td width="132" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<b><font color="#000000" size="2" face="����">Ͷע�ں�</font></b></td>
              <td width="101" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����">������</font></td>
              <td width="125" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����" color="#008000" style="font-size: 11pt; ">�ɽ�ʱ��</font></td>
              <td width="105" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font face="����" color="#FF0000" size="2">ʣ�����</font></td>
              <td width="165" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����">��ע</font></td>
              </tr>
              <%do while not rs.eof%>
              <tr> 
                <td height="35" width="75" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("id")%></font></td>
                <td width="48" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="����"><%if rs("mcsl")>0 then%></font></font><font face="����"><font color="#FF0000" size="2">����</font><font size="2" color="#008000"><%else%>��<%end if%></font></font></b></td>
                <td valign="middle" width="73" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="����"><%=rs("mcsl")%></font></td>
                <td valign="middle" align="center" width="72"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="����"><%=rs("mysl")%></font></td>
                <td valign="middle" align="center" width="50"><b><font color="#FF0000" size="2" face="����"><%=rs("pay")%></font></b></td>
                <td valign="middle" align="center" width="68"><font size="2" face="����"><%=rs("jypay")%></font></td>
                <td valign="middle" align="center" width="132"><font color="#000000" size="2" face="����">
				<b><%=rs("kjqi")%></b></font></td>
                <td valign="middle" align="center" width="101"><font size="2" face="����"><%=rs("username")%></font></td>
                <td valign="middle" align="center" width="125"><font face="����" color="#008000" size="2"><%=rs("cgdate")%></font></td>
                <td valign="middle" align="center" width="105">
				<font face="����" size="2" color="#FF0000"><b><%=rs("sysl")%></b></font></td>
                <td valign="middle" align="center" width="165"><font face="����" size="2"><%=rs("bz")%></font></td>
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
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" face="����" size="2">������һҳ</font></a></p>
<font face="����" size="2">
</body>
</font>
<meta http-equiv=Refresh content="180; url=">
</html>