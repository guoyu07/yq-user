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
      <td width="93%" height="100%"><form method="POST" action="chkloginmc.asp" name="form">
			  <font size="3">
			  <div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font size="5" color="#FF0000" face="����_GB2312">һ��-��ƽ��׹���</font></p>
			  <table border="0" width="100%" id="table1">
					<tr>
						<td>
						<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						һ���Ϲ��������������<br>
						1��������2Сʱ��û�гɹ����������ָ�������˺ţ�ϵͳ��û���ݿ������ĳ��Ž𣬽�����������ƣ��������û�����ɴ˽��ס�<br>
						2����û�гɹ����������ָ�������˺ţ���ǰ��������������Ӱ�������������̣�ϵͳ��û���ݿ������ĳ��Ž𣬽�����������ƣ��������û�����ɴ˽��ס�<br>
						�����������������տ�����ַ�������<br>
						1������������ɹ����տʵ���յ���Ӧ��������ڡ�48Сʱ���ڵ�¼ƽ̨�㡰һ��-��ơ��¡�һ��-������ϸ���鿴�ñʽ���״̬�����С������յ�����-֪ͨϵͳ���Ϲ���������Ӧ��һ��-���Ĳ�����<br>
						2���������������֣�ǰ����ȷ���Լ����տ��˺�������ʹ�ã��������տ��˺Ŵ��������ԭ���������տӰ�츶���������ʱ�䣬��������ͷ�������ߣ��ñʽ��׽�緷���<br>
						3��Ϊ�˽��׹�ƽ����������˫����һ����Լ����ϵͳ�������Ƿ�����ÿ���û���ʼΪ��5�ǡ���ÿΥ��һ�ν��׹���۳���1�ǡ�����ʣ�¡�3�ǡ����������Ʒ������Ϲ�һ���ڣ���ʣ�¡�2�ǡ����������Ʒ������Ϲ������ڣ��������ڽ����ܻ��ƽ�⽱�𣬵�ʣ�¡�1�ǡ����������Ʒ������Ϲ������ڣ��������ڽ����ܻ��ƽ�⽱����쵼���𣬵�ʣ�¡�0�ǡ����������Ʒ������Ϲ�60�죬60���ڽ����ܻ��ƽ�⽱����쵼����</td>
					</tr>
				</table>
				</b>
				</div>
				<p align="center">
				<p align="center">
				<p align="center">
				</font><div align="center">
                    <center>
                  <table border="0" cellpadding="0" style="border:1px solid #008000; border-collapse: collapse" width="50%" id="AutoNumber4" height="112" bgcolor="#FFD7D7">
                    <tr> 
                      <td width="42%" height="40" align="right" bgcolor="#FFD7D7"><font style="font-size: 11pt">�û�����</font></td>
                      <td width="57%" height="40" align="left" bgcolor="#FFD7D7"><font size="3"> <span style="font-size: 11pt"><INPUT name="m_username" size=12 value="<%=username%>" readonly></span></font></td>
                    </tr>
                    <tr> 
                      <td width="42%" height="40" align="right"><font style="font-size: 11pt">�������룺</font></td>
                      <td width="57%" height="40" align="left"><font size="3"> <span style="font-size: 11pt"><INPUT name="password3" size=12 type="password" ></span></font></td>
                    </tr>
                    <tr><td width="70%" height="40" align="center" colspan="2" bgcolor="#FFD7D7"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="3"><span style="font-size: 11pt"><input type="submit" value="ͬ����� " name="login" class="lkbtn"></span></font></td>
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