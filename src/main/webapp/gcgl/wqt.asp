<!--#include file=../dt0618.asp-->
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
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<title>���ּ�¼-��������</title>
<div align="center">
<TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" BGCOLOR="#B6E2FD" HEIGHT="114" style="border-collapse: collapse" bordercolor="#008BBB">
  <TR>
    <TD HEIGHT="25" width="100%" bgcolor="#C3DAF9" background="images/admin_bg_1.gif">
<p align="center"><b><span style="font-size: 11pt">Ա�����������嵥-��������</span></b></TD></TR>
  <TR> 
    <TD VALIGN="TOP" width="100%" bgcolor="#C3DAF9">
<div align="center">
  <center>
<p align="center"><b><font size="2" color="#FF0000"><span style="background-color: #FFFFFF">ע�⿴ԭʼ�����������ֵ������Բ��Ե��ϣ���Բ����Ȳ�Ҫ����</span></font></b></p>
<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FFFFFF" style="border-collapse: collapse" height="64">
        <tr>
          <td width="70" bgColor="#C3DAF9" height="24" align="center">���ױ��</td>
          <td width="113" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><strong style="font-weight: 400">�����֣��û���</strong></div></td>
          <td width="87" bgColor="#AADAA3" height="24" align="center">ԭʼ����</td>
          <td width="72" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><strong>���ֶ�</strong></div></td>
          <td width="87" bgColor="#C3DAF9" height="24" align="center"><strong style="font-weight: 400">��������</strong></td>
          <td width="73" bgColor="#C3DAF9" height="24" align="center"><b><font face="��Բ" color="#008000">����ǰ</font></b></td>
          <td width="78" bgColor="#DFDFDF" height="24" align="center"><b><font color="#FF0000" size="2">���ֺ�</font></b></td>
          <td width="147" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">����ʱ��</div></td>
          <td width="114" bgColor="#C3DAF9" height="24" align="center"><b><font face="Arial" color="#0000FF">�Ϲ���</font></b></td>
          <td width="137" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">�Ϲ�ʱ��</div></td>
          <td width="195" bgColor="#C3DAF9" height="24" align="center"><font face="Arial">����״̬</font></td>
          <td width="91" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">����</div></td>
        </tr>
        <%
dim sql1 
dim rs1
dim i,intPage,page,pre,last,filepath
sql1="select * from txpay where payonoff = '��δת��' and paybank<>'ũҵ����' and paybank<>'��������' order by payid" 
Set rs1= Server.CreateObject("ADODB.Recordset") 
      rs1.PageSize = 20         //��Yoko:�����趨ÿҳ��ʾ�ļ�¼��
      rs1.CursorLocation = 3
      rs1.Open sql1,conn1,0,1,1   //��Yoko:'����ִ�����ѯSQL����ý����¼��
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
   sql2="select * from txifok where username = '" &rs1("payusername")& "'"
   rs2.open sql2,conn9,1,1
%>
        <tr> 
          <td height="38" width="70" align="center"><%=rs1("payid")%></td>
          <td height="38" width="113" align="center"><font color="#008000"><%=rs1("payusername")%></font></td>
          <td height="38" width="87" align="center" bgcolor="#AADAA3"><b><%=rs2("name")%></b></td>
          <td height="38" width="72" align="center"><font color="#FF0000"><b><%=rs1("paynum9")%></b></font></td>
          <td height="38" width="87" align="center"><%=rs1("payname")%></td>
          <td height="38" width="73" align="center"><b><font color="#008000" face="��Բ"><%=rs1("bankbz")%></font></b></td>
          <td height="38" width="78" align="center" bgcolor="#DFDFDF"><b><font color="#FF0000" size="2"><%=rs1("bz")%></font></b></td>
          <td height="38" width="147" align="center"><%=rs1("paytime")%></td>
          <td height="38" width="114" align="center"><b><font color="#0000FF"><%=rs1("dfuser")%></font></b></td>
          <td height="38" width="137" align="center"><%=rs1("rgdate")%></td>
          <td height="38" width="195" align="center"><%if rs1("ep")=1 then%>�ȴ��Ϲ�������<%elseif rs1("ep")=2 then%>�ȴ����ַ�ȷ��<%else%><font color="#FF0000">�ȴ��Ϲ���<%end if%></font></td>
          <td height="38" width="91" align="center"><%if rs1("ep")=1 and rs1("payonoff")="��δת��" then%><b><a onClick="return confirm('��ʾ����ȷ���������� ')" href="qxjy.asp?qx=<%=rs1("payid")%>&tx=wqt"><font color="#008000">��������</font></a></b><%else%><a href="xtql.asp?payep=<%=rs1("payid")%>&tx=wqt">ϵͳ����</a><%end if%></td>
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
          <table width="100%" border="0" cellpadding="2" cellspacing="2" borderColorLight=#808080 borderColorDark=#ffffff>
   <tr>
     <%if rs1.pagecount > 0 then%>
     <td width="50%" align="right" valign="middle">��ǰ��<font color="#FF0000"><%=intpage%></font>ҳ&nbsp;&nbsp; ��<font color="#FF0000"><%=rs1.PageCount%></font>ҳ,��<font color="#FF0000"><%=rs1.recordcount%></font>����¼,<font color="#FF0000"><%=rs1.pagesize%></font>����¼/ҳ</td>
     <%else%>
     <%end if%>
    <td width="50%" align="right" valign="middle"> <a href="wqt.asp?page=1">��ҳ</a> | 
     <%if pre then%>
     <a href="wqt.asp?page=<%=intpage -1%>">��ҳ</a> | <%end if%>
     <%if last then%>
      <a href="wqt.asp?page=<%=intpage +1%>">��ҳ</a> |<%end if%>&nbsp;<a href="wqt.asp?page=<%=rs1.PageCount%>">βҳ</a> |&nbsp; ת����<select name="sel_page" onchange="javascript:location=this.options[this.selectedIndex].value;">
      <%
       for i = 1 to rs1.PageCount
       if i = intpage then%>
       <option value="wqt.asp?page=<%=i%>" selected><%=i%></option>
     <%else%>
       <option value="wqt.asp?page=<%=i%>"><%=i%></option>
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