<!--#include file=../shopwe.asp-->
<!--#include file="che</SCRIPT>
<title><%=homes%></title>
<div align="center">
<TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" BGCOLOR="#B6E2FD" HEIGHT="114" style="border-collapse: collapse" bordercolor="#008BBB">
  <TR>
    <TD HEIGHT="25" width="100%" bgcolor="#C3DAF9" background="images/admin_bg_1.gif">
<p align="center">
<b><span style="font-size: 11pt">�û����������嵥</span></b></TD>
  </TR>
  <TR> 
    <TD VALIGN="TOP" width="100%" bgcolor="#C3DAF9">
<div align="center">
  <center>
<p align="center">��</p>
<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FFFFFF" style="border-collapse: collapse" height="60">
        <tr>
          <td width="50" bgColor="#C3DAF9" height="24" align="center">
          ����ID</td>
          <td width="65" bgColor="#C3DAF9" height="24" align="center">
          <div class="word2" align="center">
            <strong style="font-weight: 400">�û���</strong></div>
          </td>
          <td width="110" bgColor="#C3DAF9" height="24" align="center">
          ��ϵQQ</td>
          <td width="122" bgColor="#C3DAF9" height="24" align="center">
          ��ϵ�绰</td>
          <td width="78" bgColor="#C3DAF9" height="24" align="center">
          <div class="word2" align="center">
            <strong>���ֶ�</strong></div>
          </td>
          <td width="67" bgColor="#C3DAF9" height="24" align="center">
            <strong style="font-weight: 400">
                ����</strong></td>
          <td width="88" bgColor="#C3DAF9" height="24" align="center">
          <font face="Arial">��������</font></td>
          <td width="164" bgColor="#C3DAF9" height="24" align="center">
          <font face="Arial">�����ʺ�</font></td>
          <td width="127" bgColor="#C3DAF9" height="24" align="center">
          <font face="Arial">���е�ַ</font></td>
          <td width="146" bgColor="#C3DAF9" height="24" align="center">
          <div class="word2" align="center">
              ����ʱ��</div>
          </td>
          <td width="40" bgColor="#C3DAF9" height="24" align="center">
          <div class="word2" align="center">
            ����</div>
          </td>
        </tr>
        <%
dim sql1 
dim rs1
dim i,intPage,page,pre,last,filepath
sql1="select * from userpay where payonoff like '��δת��' order by payid" 
Set rs1= Server.CreateObject("ADODB.Recordset") 
      rs1.PageSize = 20         //��Yoko:�����趨ÿҳ��ʾ�ļ�¼��
      rs1.CursorLocation = 3
      rs1.Open sql1,conn,0,2,1   //��Yoko:'����ִ�����ѯSQL����ý����¼��
       if rs1.eof and rs1.bof then 
       response.write "<p align='center'><br></p>" 
       response.write "<p align='center'>��û������������Ϣ��</p>" 
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
<%
   set rs2=server.createobject("adodb.recordset")
   sql2="select * from cfuser where username like '" &rs1("payusername")& "'"
   rs2.open sql2,conn,2,2
%>
        <tr> 
          <td height="22" width="50" align="center"><%=rs1("payid")%></td>
          <td height="22" width="65" align="center"><font color="#008000"><%=rs1("payusername")%></font></td>
          <td height="22" width="110" align="center"><%=rs2("qq")%></td>
          <td height="22" width="122" align="center"><%=rs2("call")%></td>
          <td height="22" width="78" align="center"><font color="#FF0000"><b><%=rs1("paynum")%></b></font> Ԫ</td>
          <td height="22" width="67" align="center"><%=rs1("payname")%></td>
          <td height="22" width="88" align="center"><%=rs1("paybank")%></td>
          <td height="22" width="164" align="center"><%=rs1("paycard")%></td>
          <td height="22" width="127" align="center"><%=rs1("payaddress")%></td>
          <td height="22" width="146" align="center"><%=rs1("paytime")%></td>
          <td height="22" width="40" align="center">
                <a href="tixianyes.asp?payid=<%=rs1("payid")%>">����</a></td>
        </tr>
<!--ѭ�������
��ҳ���֣�-->
   <%  
     rs1.movenext
    next
   %>  
      </table></center>
</div>
<br>
<br>
          <table width="100%" border="0" cellpadding="2" cellspacing="2" borderColorLight=#808080 borderColorDark=#ffffff>
   <tr>
     <%if rs1.pagecount > 0 then%>
     <td width="50%" align="right" valign="middle">��ǰ��<font color="#FF0000"><%=intpage%></font>ҳ&nbsp;&nbsp; ��<font color="#FF0000"><%=rs1.PageCount%></font>ҳ,��<font color="#FF0000"><%=rs1.recordcount%></font>����¼,<font color="#FF0000"><%=rs1.pagesize%></font>����¼/ҳ</td>
     <%else%>
     <%end if%>
    <td width="50%" align="right" valign="middle"> <a href="w.asp?page=1">��ҳ</a> | 
     <%if pre then%>
     <a href="w.asp?page=<%=intpage -1%>">��ҳ</a> | <%end if%>
     <%if last then%>
      <a href="w.asp?page=<%=intpage +1%>">��ҳ</a> |<%end if%>&nbsp;<a href="w.asp?page=<%=rs1.PageCount%>">βҳ</a> |&nbsp; ת����
      <select name="sel_page" onchange="javascript:location=this.options[this.selectedIndex].value;">
      <%
       for i = 1 to rs1.PageCount
       if i = intpage then%>
       <option value="w.asp?page=<%=i%>" selected><%=i%></option>
     <%else%>
       <option value="w.asp?page=<%=i%>"><%=i%></option>
        <%
          end if
        next
        %>
     </select>ҳ</font> 
    </td>
    </tr>
   </table>

	</table>
</div>
</BODY>
</HTML>
