<!--#include file="../zqcjimg.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('��ʱ���ܲ�ѯ��');"
   response.write "history.go(-1);" 
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
'if username="15880805512" then
   'response.redirect "epjysc_qz.asp"
'end if
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM txpay where payonoff = '��δת��' and kjygid=0 and Now()>rgdate+0.001 "
rsTest.Open StrSQL, Conn1,2,3
While Not rsTest.EOF
rsTest("ep")=0
rsTest("kjygid")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
rsTest.close
Set rsTest=Nothing
%>
<html>
<title>һ �� �� �� �� ��</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="��ҳ";
  }
}

</SCRIPT>

<SCRIPT src="main/leftNo.js"></SCRIPT>

<SCRIPT type=text/javascript src="main/jquery-1.2.6.min.js"></SCRIPT>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$("#wenzhang>dd>dl>dd").hide();
	$.each($("#wenzhang>dd>dl>dt"), function(){
		$(this).click(function(){
			$("#wenzhang>dd>dl>dd ").not($(this).next()).slideUp();
			$(this).next().slideToggle(500);
			//$(this).next().toggle();
		});
	});
});


</SCRIPT>
</head>
<%
   const MaxPerPage=10
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
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>��</LI>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">������Ϣ</A> </LI>
  <LI><A>ҵ����ѯ</A> 
  </LI>
  <LI><A>�������</A> 
  </LI>
  <LI><A>��Ϣ����</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">�˳�ϵͳ</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>��ǰλ�ã�<SPAN id=mTitle>��ҳ</SPAN></DIV></DIV></DIV>
<DIV class=box_title>һ �� �� �� �� ��</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center"><strong><font color="#000000" size="5" face="����">һ �� �� �� �� ��</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
<%
sql="select * from txpay where payonoff = '��δת��' and ep=0 order by jyid asc" 
Set rs = conn1.execute(sql)
  if rs.eof and rs.bof then
       response.write "<p align='center'> ��û�н��׼�¼��</p>" 
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
            showpage totalput,MaxPerPage,"epjysc.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"epjysc.asp" 
            showContent 
             showpage totalput,MaxPerPage,"epjysc.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"epjysc.asp" 
           showContent 
           showpage totalput,MaxPerPage,"epjysc.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn1.close 
   set conn1=nothing 
   sub showContent 
       dim i 
	   i=0 
   
%><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="127" align="center" height="23" bgcolor="#FBFAEC"><b>��ˮ��</b></td>
          <td width="142" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400">������</strong></font></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#FF00FF">������</font></b></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000">���ֽ��</font></td>
          <td width="161" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000">�Ϲ���ɻ�һ��</font></td>
          <td width="167" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#008000">�Ϲ���ɻ���</font></b></td>
          <td width="260" align="center" height="23" bgcolor="#FBFAEC">����״̬</td>
          <td width="177" align="center" height="23" bgcolor="#FBFAEC">����</td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="28" width="127" align="center"><b>***<%=right(rs("payid"),2)%></b></td>
          <td height="28" width="142" align="center"><p><font color="#000000"><%=rs("payusername")%></font></td>
          <td valign="middle" align="center" width="121"><font color="#FF00FF"><b><%=rs("cxt")%></b></font></td>
          <td valign="middle" align="center" width="121"><font color="#FF0000"><%=rs("paynum9")%></font></td>
          <td valign="middle" align="center" width="161"><font color="#0000FF"><%=rs("paynum")%></font></td>
          <td valign="middle" align="center" width="167"><b><font color="#0000FF"></font><font color="#FF0000"><%if rs("paynum9")/rs("paynum")>0.88 then%><%=rs("paynum")-rs("paynum9")%><%else%></font><%=rs("paynum")-rs("paynum9")%></b><%end if%></td>
          <td valign="middle" align="center" width="260"><%if rs("payusername")=username then%><b><a onClick="return confirm('��ʾ����ȷ������')" href="qxepmc.asp?qx=<%=rs("payid")%>"><font color="#FF0000">��������</font></a></b><%else%>�ȴ��Ϲ��С�����<%end if%></td>
          <td valign="middle" align="center" width="177"><a onClick="return confirm('��ʾ���Է�ʹ�õ��տʽ�ǡ�<%=rs("paybank")%>����ȷ���Ϲ�����')" href="epmy.asp?ep=<%=rs("payid")%>"><font color="#FF0000" size="2">��Ҫ�Ϲ�</font></a></td>
          </tr>
          <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
            </table> 
</div><% 
   end sub  
 
function showpage(totalnumber,maxperpage,filename) 
  dim n 
  if totalnumber mod maxperpage=0 then 
     n= totalnumber \ maxperpage 
  else 
     n= totalnumber \ maxperpage+1 
  end if
        
end function 

%> 
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epmcjl.asp"><font color="#0000FF">��һ��-������ϸ</font></a>---<a href="epmyjl.asp"><font color="#008000">��һ��-�Ϲ���ϸ</font></a></font></p>
<p align="center"></p>
<p align="center"></p>
<p align="center"></p>
<meta http-equiv=Refresh content="80; url=">
</body> 
</html>