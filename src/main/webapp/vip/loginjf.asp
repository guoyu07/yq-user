<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<HTML>
<title></title>
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
<BODY bgcolor="#FFFFFF" >
<DIV class="top_bg cBlue">
<DIV style="POSITION: relative; HEIGHT: 10px">
��</DIV>��</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV style="DISPLAY: none" class=Location>��ǰλ�ã�<SPAN id=mTitle>��ҳ</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="90%" height="54%" id="AutoNumber1">
    <tr>
      <td width="93%" height="100%">
		<form method="POST" action="chkloginjf.asp" name="form">
			  <font size="3">
			  <div align="center"><b>���־��¹���</b><table border="0" width="75%" id="table1">
					<tr>
						<td><p align="left"><font size="2" face="����">һ�����¹������ֽ��������˫����С����ϵͳÿ10���ӿ���һ�ν������������Ի��Ͷע���1.9�����������Ͷע������100��&nbsp; �֣��������Ϊ��������Ϊ���У��ɻ�190���֣����Ͷע����100���֣��������Ϊ������Ϊ���У��ɻ�190���֣��Դ����ơ�</font><p align="left"><font face="����" size="2">��������Ͷעÿע���Ϊ20������</font><p align="left"><font face="����" size="2">����������Ϸ��û��100%���н�����Ͷע�Ļ��ֲ�����Ӯ�����޷�����������Ϸ���ǶĲ����뱣�����õ���Ϸ��̬���������С�</font></td>
					</tr>
				</table>
				</div>
				<p align="center">
				<p align="center">
				<p align="center">
				</font><div align="center">
                    <center>
                  <table border="0" cellpadding="0" style="border:1px solid #008000; border-collapse: collapse" width="50%" id="AutoNumber4" height="112" bgcolor="#FFD7D7">
                    <tr> 
                      <td width="42%" height="40" align="right" bgcolor="#FFD7D7"> 
                      <font style="font-size: 11pt">�û�����</font></td>
                      <td width="57%" height="40" align="left" bgcolor="#FFD7D7"> 
						<font size="3"> <span style="font-size: 11pt"> 
						<INPUT name="m_username" size=12 value="<%=username%>" readonly></span></font></td>
                    </tr>
                    <tr> 
                      <td width="42%" height="40" align="right"> 
                      <font style="font-size: 11pt">�������룺</font></td>
                      <td width="57%" height="40" align="left"> 
						<font size="3"> <span style="font-size: 11pt"> 
						<INPUT name="password3" size=12 type="password" ></span></font></td>
                    </tr>
                    <tr><td width="70%" height="40" align="center" colspan="2" bgcolor="#FFD7D7"> 
						<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						<font size="3"> 
                        <span style="font-size: 11pt"> 
                        <input type="submit" value="ͬ����� " name="login" class="lkbtn"></span></font></td>
                    </tr>
                    </table>
                    </center>
              </div>
                </form>      
      </td>
    </tr>
  </table>
  </center>
</div></div>
</BODY>
</HTML>