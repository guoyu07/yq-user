<%
if request.cookies("regid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")   
end if
%>
<!--#include file="../ct0618.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gpjy where Now()>dqdate+0.0006 and jy=2"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("jy")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
rsTest.close
Set rsTest=Nothing
%>
<title>�� �� �� �� �� ϸ</title>
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
<DIV class=box_title>�� �� �� �� �� ϸ</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"><p align="center"><strong><font size="3" color="#000000">�� �� �� �� �� ϸ</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2"><br> 
<%
dim sql
dim rs
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where username = '"&regid&"' order by id desc" 
rs.open sql,conn2,1,1
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
            showpage totalput,MaxPerPage,"gpjy.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"gpjy.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gpjy.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gpjy.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gpjy.asp" 
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
   
%><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="143" align="center" height="28" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><strong style="font-weight: 400">�û���</strong></font></td>
          <td width="80" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"> <strong style="font-weight: 400">��������</strong></font></td>
          <td width="78" align="center" height="28" bgcolor="#FFE1FF"><font color="#FF0000">��������</font></td>
          <td width="87" align="center" height="28" bgcolor="#FFE1FF"><p><font face="Arial" color="#000000">ʣ������</font></td>
          <td width="150" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">����ʱ��</font></td>
          <td width="52" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">����</font></td>
          <td width="66" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">���׶�</font></td>
          <td width="266" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">״̬</font></td>
          <td width="140" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">�Է�</font></td>
          <td width="189" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000">�ɽ�ʱ��</font></td>
          </tr>
        <%do while not rs.eof%>
          <tr> 
          <td height="23" width="143" align="center"><p><font color="#000000"><%=regid%></font></td>
          <td valign="middle" width="80" align="center"><p><font color="#000000"><%if rs("mcsl")>0 then%>-<%=rs("mcsl")%><%else%><%=rs("mcsl")%><%end if%></font></td>
          <td valign="middle" align="center" width="78"><font color="#FF0000"><%=rs("mysl")%></font></td>
          <td valign="middle" align="left" width="87"><p align="center"><%=rs("sysl")%></td>
          <td valign="middle" align="center" width="150"><font color="#000000"><%=rs("abdate")%></font></td>
          <td valign="middle" align="center" width="52"><font color="#0000FF"><%if rs("pay")<1 then%>0<%=rs("pay")%><%else%><%=rs("pay")%><%end if%></font></td>
          <td valign="middle" align="center" width="66"><font color="#FF0000"><%=rs("jypay")%></font></td>
          <td valign="middle" align="center" width="266"><p><font color="#000000"><%=rs("bz")%></font></td>
          <td valign="middle" align="center" width="140"><%=rs("dfuser")%></td>
          <td valign="middle" align="center" width="189"><font color="#000000"><%=rs("cgdate")%></font></td>
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
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
</body> 
</html>