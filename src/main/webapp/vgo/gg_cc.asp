<!--#include file=../zqcjimg.asp-->
<!--#include file=../ct0618.asp-->
<%
fhkok=request("jhid")
dqu=request("dq")
if dqu="0" or dqu="7" or dqu="2" or dqu="8" then
   cz01="�й�һ�����ٺš��ͷ�QQ��613697151"
   qq=613697151
   cz02="������"
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="�й�һ�����ںš��ͷ�QQ��613697152"
   qq=613697152
   cz02="������"
end if
%>
<%
if fhkok<>"" then
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&fhkok&"'"
rs.open sql,conn2,2,3
if rs("addsheng")="ɽ��ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="�Ϻ���" then
    rs("dqu")=0
    rs("add9dqu")="����һ��"
    rs.update
end if
if rs("addsheng")="����ʡ" or rs("addsheng")="�㽭ʡ" or rs("addsheng")="����ʡ" then
    rs("dqu")=1
    rs("add9dqu")="��������"
    rs.update
end if
if rs("addsheng")="�㶫ʡ" or rs("addsheng")="����׳��������" or rs("addsheng")="����ʡ" or rs("addsheng")="�Ĵ�ʡ" then
    rs("dqu")=2
    rs("add9dqu")="���ϵ���"
    rs.update
end if
if rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" then
    rs("dqu")=3
    rs("add9dqu")="���е���"
    rs.update
end if
if rs("addsheng")="������" or rs("addsheng")="�����" or rs("addsheng")="�ӱ�ʡ" or rs("addsheng")="�ӱ�ʡ" or rs("addsheng")="ɽ��ʡ" or rs("addsheng")="���ɹ�������" then
    rs("dqu")=4
    rs("add9dqu")="��������"
    rs.update
end if
if rs("addsheng")="���Ļ���������" or rs("addsheng")="�½�ά���������" or rs("addsheng")="�ຣʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" then
    rs("dqu")=5
    rs("add9dqu")="��������"
    rs.update
end if
if rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="����������" or rs("addsheng")="������" then
    rs("dqu")=6
    rs("add9dqu")="���ϵ���"
    rs.update
end if
if rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="������ʡ" then
    rs("dqu")=7
    rs("add9dqu")="��������"
    rs.update
end if
if rs("addsheng")="̨��ʡ" or rs("addsheng")="����ر�������" or rs("addsheng")="�����ر�������" then
    rs("dqu")=8
    rs("add9dqu")="�۰�̨����"
    rs.update
end if
end if
%>
<%
dim rs_rg,sql_rg
set rs_rg = Server.CreateObject("ADODB.Recordset")
sql_rg ="select * from txpay where dfuser ='"&fhkok&"' and ep=1 "
rs_rg.open sql_rg,conn1,2,3
if not rs_rg.eof then
   response.Write "<script language=javascript>alert('�����Ϲ�����һ�һ�û�и���뾡����ɸ��');location.replace('../vip/epmyjl.asp');</script>"
   response.end
end if
%>
<%
dim rs_qr,sql_qr
set rs_qr = Server.CreateObject("ADODB.Recordset")
sql_qr ="select * from txpay where payusername ='"&fhkok&"' and ep=2 "
rs_qr.open sql_qr,conn1,2,3
if not rs_qr.eof then
   response.Write "<script language=javascript>alert('����һ���������������չ�������������㾡����ղ���ʱȷ�ϣ�����������ϵ�ͷ���');location.replace('../vip/epmcjl.asp');</script>"
   response.end
end if
%>
<html>
<head>
<title>������Ϸƽ̨--�������</title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
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
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<body topmargin="5" leftmargin="5">
<div align="center">
      <div align="center">
      <table border="0" width="100%" id="table22" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
	<td align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">������ע���û�ʱѡ��ĵ���������������Ϊ���ṩ����ķ�������߰���Ч�ʣ�</span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">���κ���������ϵ��<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"></a></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">��<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">�����ŷ���������Ա�ֹ���һ���˲����ظ����ϣ���������ÿ����ͬһʱ����ѯͬһ������</font><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 11pt"><a href="javascript:openwindow('bank.asp?dq=<%=dqu%>')" style="text-decoration: none">�������������䱸ָ���Ŀͷ���Ա��ר�õ��տ��˺�����Ϊ��<b><font color="#FF0000"><%=cz02%></font></b>��--����鿴����˺�</a></font></td>
		</tr>
	</table>
		</div>
<table border="0" width="100%" bordercolor="#006699" height="29">
    <tr>
      <td width="100%" height="25" bgcolor="#D0FFF0"> <p align="center" style="margin-top: 0; margin-bottom: 0"><font face="����"><b>����Ա����</b></font></td> 
  </tr>  <tr> 
	<p style="margin-top: 0; margin-bottom: 0">
	<font face="����" size="2"><br> 
<% 
dim sql1
dim rs1
sql1="select * from dgag where check=0 order by id desc"
Set rs1= Server.CreateObject("ADODB.Recordset")
rs1.open sql1,conn1,1,1
  if rs1.eof and rs1.bof then
       response.write "<p align='center'> ��û�з�������</p>"
   else
	  totalPut=rs1.recordcount 
      totalPut=rs1.recordcount 
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
            showpage totalput,MaxPerPage,"gg.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs1.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs1.bookmark 
           showpage totalput,MaxPerPage,"gg.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gg.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gg.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gg.asp" 
	      end if 
	   end if 
   rs1.close 
   end if 
	         
   set rs1=nothing
   conn1.close 
   set conn1=nothing
 
   sub showContent
       dim i
	   i=0
   
%></font></p>
	<div align="center">
            
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="61">
            <tr> 
              <td width="68" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><strong><font face="����" style="font-size: 11pt">���</font></strong></td>
              <td width="112" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="����" style="font-size: 11pt"><strong>������</strong></font></td>
              <td width="504" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="����" style="font-size: 11pt"><b>�� �� �� ��</b></font></td>
              <td width="232" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="����" style="font-size: 11pt"><b>����ʱ��</b></font></td>
              <td width="100" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="����" style="font-size: 11pt"><b>����</b></font></td>
              </tr>
              <%do while not rs1.eof%>
              <tr> 
                <td valign="middle" height="34" width="68" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="����" style="font-size: 11pt"><%=rs1("id")%></font></td>
                <td valign="middle" width="112" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="����" style="font-size: 11pt">��˾</font></td>
                <td valign="middle" align="center" width="504"><font color="#000000" face="����" style="font-size: 11pt"><%=rs1("ggbt")%></font></td>
                <td valign="middle" align="center" width="232"><p style="margin-top: 0; margin-bottom: 0"><font face="����" style="font-size: 11pt"><%=rs1("ggdate")%></font></td>
                <td valign="middle" align="center" width="100"><font color="#000000" face="����" style="font-size: 11pt"><p style="margin-top: 0; margin-bottom: 0"><a href="ggck.asp?ck=<%=rs1("id")%>" style="text-decoration: none">�鿴</a>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs1.movenext
	   loop 
		  %></table> 
</div>
<font face="����" size="2"><% 
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
</font></td> 
</tr> 
</table> 
</div> 
</body> 
</html>