<!--#include file=../dt0618.asp-->
<!--#include file=../mq0618.asp-->
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
<title>ȫ�����ּ�¼</title>
<div align="center">
<TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" BGCOLOR="#B6E2FD" HEIGHT="114" style="border-collapse: collapse" bordercolor="#008BBB">
  <TR>
    <TD HEIGHT="25" width="100%" bgcolor="#C3DAF9" background="images/admin_bg_1.gif">
<p align="center"><b><span style="font-size: 11pt">Ա�����������嵥</span></b></TD></TR>
  <TR> 
    <TD VALIGN="TOP" width="100%" bgcolor="#C3DAF9">
<div align="center">
  <center>
<p align="center"><b><font size="2" color="#FF0000"><span style="background-color: #FFFFFF">ע�⿴ԭʼ�����������ֵ������Բ��Ե��ϣ���Բ����Ȳ�Ҫ����</span></font></b></p>
<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FFFFFF" style="border-collapse: collapse" height="64">
        <tr>
          <td width="79" bgColor="#C3DAF9" height="24" align="center">���ױ��</td>
          <td width="102" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><strong style="font-weight: 400">�û���</strong></div></td>
          <td width="79" bgColor="#AADAA3" height="24" align="center">ԭʼ����</td>
          <td width="84" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><strong>���ֶ�</strong></div></td>
          <td width="81" bgColor="#C3DAF9" height="24" align="center"><strong style="font-weight: 400">��������</strong></td>
          <td width="119" bgColor="#C3DAF9" height="24" align="center"><b><font face="��Բ" color="#008000">ʵ��</font></b></td>
          <td width="81" bgColor="#DFDFDF" height="24" align="center"><b><font color="#FF0000" size="2">����</font></b></td>
          <td width="159" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">����ʱ��</div></td>
          <td width="170" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">��������</div></td>
          <td width="166" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">�����˺�</div></td>
          <td width="73" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">����</div></td>
        </tr>
        <%
dim sql1 
dim rs1
dim i,intPage,page,pre,last,filepath
sql1="select * from txpay where payonoff = '��δת��' and txvip=1 order by payid" 
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
<%
   set rsf=server.createobject("adodb.recordset")
   sqlf="select * from sgxt where username = '" &rs1("payusername")& "'"
   rsf.open sqlf,conn7,1,1
%>
<% 
sql_ztx="select sum(paynum) as ljztx from txpay where payusername = '" &rs1("payusername")& "' and dfuser<>'����'" 
Set rs_ztx= Server.CreateObject("ADODB.Recordset") 
rs_ztx.open sql_ztx,conn1,1,1
%>
        <tr> 
          <td height="38" width="79" align="center"><%=rs1("payid")%></td>
          <td height="38" width="102" align="center"><font color="#008000"><%=rs1("payusername")%></font></td>
          <td height="38" width="79" align="center" bgcolor="#AADAA3"><b><%=rs2("name")%></b></td>
          <td height="38" width="84" align="center"><font color="#FF0000"><b><%=rs1("paynum9")%></b></font></td>
          <td height="38" width="81" align="center"><%=rs1("payname")%></td>
          <td height="38" width="119" align="center"><b><font color="#008000" face="��Բ"><%=rsf("mqfh")%>-<%=rsf("zfh")%></font></b></td>
          <td height="38" width="81" align="center" bgcolor="#DFDFDF"><b><font color="#FF0000" size="2"><%=rs_ztx("ljztx")%></font></b></td>
          <td height="38" width="159" align="center"><%=rs1("paytime")%></td>
          <td height="38" width="170" align="center"><%=rs1("paybank")%><%if rs1("ep")=1 then%><a href="syusers.asp?payep=<%=rs1("payid")%>&tx=w">-δ���</a><%end if%></td>
          <td height="38" width="166" align="center"><%=rs1("paycard")%></td>
          <td height="38" width="73" align="center"><%if rs1("ep")=0 and rs1("payonoff")="��δת��" then%><a href="xtql.asp?payep=<%=rs1("payid")%>&tx=w">ϵͳ����</a><%end if%></td>
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
    <td width="50%" align="right" valign="middle"> <a href="w.asp?page=1">��ҳ</a> | 
     <%if pre then%>
     <a href="w.asp?page=<%=intpage -1%>">��ҳ</a> | <%end if%>
     <%if last then%>
      <a href="w.asp?page=<%=intpage +1%>">��ҳ</a> |<%end if%>&nbsp;<a href="w.asp?page=<%=rs1.PageCount%>">βҳ</a> |&nbsp; ת����<select name="sel_page" onchange="javascript:location=this.options[this.selectedIndex].value;">
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