<!--#include file="../zqcjimg.asp"-->
<!--#include file="checkadmin.asp"-->
<HTML>
<style><!--
        A:visited{TEXT-DECORATION: none}
        A:active{TEXT-DECORATION: none}
        A:hover{TEXT-DECORATION: underline overline}
        A:link{text-decoration: none;}
        TD { FONT-SIZE: 9pt;font-family:����}
.default-border-tlrb {
BORDER-RIGHT: #68bd5b 1px solid; BORDER-TOP: #68bd5b 1px solid; BORDER-LEFT: #68bd5b 1px solid; BORDER-BOTTOM: #68bd5b 1px solid
}
        --></style>

<HEAD>
<body bgcolor="#DDECFE" topmargin="5">
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=200,height=120');
    }
//-->
</SCRIPT>
<title><%=homes%></title>
<body leftmargin="5" topmargin="5">

<div align="center">

<TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" BGCOLOR="#7BB5DE" HEIGHT="95" style="border-collapse: collapse" bordercolor="#006699">
  <TR>
    <TD HEIGHT="25" width="100%" background="images/admin_bg_1.gif">
<p align="center">
<font style="font-size: 11pt"><b>ȫ����ת�ʼ�¼</b></font></TD>
  </TR>
  <TR> 
    <TD VALIGN="TOP" width="100%" bgcolor="#C3DAF9">
<div align="center">
  <center>
<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FFFFFF" style="border-collapse: collapse" height="48">
        <tr>
          <td width="87" bgColor="#C3DAF9" height="24" align="center">ID</td>
          <td width="104" bgColor="#C3DAF9" height="24" align="center"><font color="#008000">Ա����</font></td>
          <td width="49" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><font color="#FF0000"><strong style="font-weight: 400">����</strong></font></div></td>
          <td width="56" bgColor="#C3DAF9" height="24" align="center">����ǰ</td>
          <td width="50" bgColor="#C3DAF9" height="24" align="center"><font color="#800080">���</font></td>
          <td width="81" bgColor="#C3DAF9" height="24" align="center"><b>����</b></td>
          <td width="91" bgColor="#C3DAF9" height="24" align="center"><font face="Arial">��������</font></td>
          <td width="136" bgColor="#C3DAF9" height="24" align="center"><font face="Arial">�����ʺ�</font></td>
          <td width="131" bgColor="#C3DAF9" height="24" align="center">����ʱ��</td>
          <td width="129" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><font face="Arial">����ʱ��</font></div></td>
          <td width="31" bgColor="#C3DAF9" height="24" align="center">����</td>
        </tr>
        <%
dim sql1 
dim rs1 
sql1="select * from txpay where payonoff = '�Ѿ�ת��' order by paytime desc" 
Set rs1= Server.CreateObject("ADODB.Recordset") 
      rs1.PageSize = 50         //��Yoko:�����趨ÿҳ��ʾ�ļ�¼��
      rs1.CursorLocation = 3
      rs1.Open sql1,conn1,0,2,1   //��Yoko:'����ִ�����ѯSQL����ý����¼��
      if rs1.eof and rs1.bof then 
      response.write "<p align='center'><br></p>" 
      response.write "<p align='center'> �� û �� ת �� �� Ϣ ��</p>" 
      response.write "<p align='center'><br></p>" 
   else 
      pre = true
      last = true
      page = trim(Request.QueryString("page"))
      end if
      if len(page) = 0 then
                  intpage = 1
                  pre = false
      else
          if cint(page) =< 1 then
               intpage = 1
               pre = false
          else
              if cint(page) >= rs1.PageCount then
                  intpage = rs1.PageCount
                  last = false
              else
                   intpage = cint(page)
             end if
         end if
      end if
    if not rs1.eof then
         rs1.AbsolutePage = intpage
    end if
%>
<!--ѭ����ʼ-->
 <%    
   for i=1 to rs1.PageSize
     if rs1.EOF or rs1.BOF then exit for
  %>

        <tr> 
          <td height="24" width="87" align="center" bgcolor="#C3DAF9"><%=rs1("payid")%></td>
          <td height="24" width="104" align="center" bgcolor="#C3DAF9"><%=rs1("payusername")%></td>
          <td height="24" width="49" align="center" bgcolor="#C3DAF9"><font color="#FF0000"><%=rs1("paynum")%> </font> </td>
          <td height="24" width="56" align="center" bgcolor="#C3DAF9"><%=rs1("bankbz")%></td>
          <td height="24" width="50" align="center" bgcolor="#C3DAF9"><font color="#800080"><%=rs1("bz")%></font></td>
          <td height="24" width="81" align="center" bgcolor="#C3DAF9"><%=rs1("payname")%></td>
          <td height="24" width="91" align="center" bgcolor="#C3DAF9"><%=rs1("paybank")%></td>
          <td height="24" width="136" align="center" bgcolor="#C3DAF9"><%=rs1("paycard")%></td>
          <td height="24" width="131" align="center" bgcolor="#C3DAF9"><%=rs1("paytime")%></td>
          <td height="24" width="129" align="center" bgcolor="#C3DAF9"><%=rs1("zftime")%></td>
          <td height="24" width="31" align="center" bgcolor="#C3DAF9"><%=rs1("dqu")%></td>
        </tr>
   <%  
     rs1.movenext
    next
   %>  
      </table></center>
</div>
<br>
       <table width="100%" border="0" cellpadding="2" cellspacing="2" borderColorLight=#808080 borderColorDark=#ffffff>
   <tr><%if rs1.pagecount > 0 then%>
     <td width="45%" align="right" valign="middle">��ǰ��<font color="#FF0000"><%=intpage%></font>ҳ&nbsp;&nbsp; ��<font color="#FF0000"><%=rs1.PageCount%></font>ҳ,��<font color="#FF0000"><%=rs1.recordcount%></font>����¼,<font color="#FF0000"><%=rs1.pagesize%></font>����¼/ҳ</td><%else%><%end if%>
    <td width="50%" align="right" valign="middle"> <a href="ok.asp?page=1">��ҳ</a> | <%if pre then%><a href="ok.asp?page=<%=intpage -1%>">��ҳ</a> | <%end if%><%if last then%><a href="ok.asp?page=<%=intpage +1%>">��ҳ</a> |<%end if%>&nbsp;<a href="ok.asp?page=<%=rs1.PageCount%>">βҳ</a> |&nbsp; ת����
    <select name="sel_page" onchange="javascript:location=this.options[this.selectedIndex].value;">
      <%
       for i = 1 to rs1.PageCount
       if i = intpage then%>
       <option value="ok.asp?page=<%=i%>" selected><%=i%></option>
     <%else%>
       <option value="ok.asp?page=<%=i%>"><%=i%></option>
        <%
          end if
        next
        %>
     </select>ҳ</font> 
    </td>
    </tr>
   </table>
</div>
</BODY>
</HTML>
