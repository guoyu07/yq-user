<%
if request.cookies("regid")="" or request.cookies("password")="" then
   session.timeout=30
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "window.location.replace('lgotgs.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<!--#include file="../shopmfh.asp"-->
<% 
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from cfuser where username ='"&regid&"'"
rs.open sql,conn1,1,1
if rs("jb")<3 then 
   response.write"<script>alert('ע�⣺ֻ�д����̲ſ��Խ��д˲�����лл��');history.go(-1);</script>"
end if
%>
<% 
response.cookies("lsyh")="120"
%>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.sjuser.value=="") {      alert("��д�빺���̼ҵ��û���(�ƹ��̱��)!");      return false;    } 
  if (Form.dlgm.value==0) {      alert("��ѡ����Ҫ¼�������!");      return false;    } 
  if (Form.dlgm.value><%=rs("dlgmjl")%>)    {   alert("¼���������ܴ������п������!");      return false;    } 
  return true;  }  
 </script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center">

                      <b>
						��<p align="center" style="margin-top: 0; margin-bottom: 0">
	<span style="background-color: #FFFFFF">
	<font size="4" color="#008000">�����û���(�ƹ��̱��)Ϊ </font>
	<font color="#FF0000" size="4"><%=regid%> </font></span><font size="4"><%if rs("jb")=1 then%><font color="#FF0000">(�����̼�)</font><%elseif rs("jb")=2 then%><font color="#008000">(ʡ������)</font><font color="#0000FF"><%elseif rs("jb")=3 then%></font><font color="#FF00FF">(�м�����)</font><font color="#0000FF"><%elseif rs("jb")=4 then%></font><font color="#800000">(��������)<%elseif rs("jb")=5 then%></font><font color="#000080">(�򼶴���)</font><font color="#0000FF"><%else%>(�ƹ�Ա)<%end if%></font>��ҵ��ͳ�Ʊ���</span></font></font></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">
	��</p>
						<table width="483" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="483"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="dllyk.asp">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="87%" border=0 cellSpacing=1 height="105">
  <TBODY>
    <TR class=content> 
      <TD width="422" bgColor=#ffffff align="right" height="31" colspan="2">
                      <p align="center">
						<font color="#0000FF" style="font-size: 11pt"><b>
						��������̼Ҵ���¼���������Ͳ���Ҫ�ظ���¼</b></font></TD>
    </TR>
    <TR class=content> 
      <TD width="161" bgColor=#ffffff align="right" height="31">
                      <b><font style="font-size: 11pt">��д���̼ұ�ţ�</font></b></TD>
      <TD width="261" bgColor=#ffffff height="31">  
						<input type="text" name="sjuser" size="15"><font color="#FF0000" size="3"><b></b>**</font></TD>
    </TR>
    <TR class=content> 
      <TD width="161" bgColor=#ffffff align="right" height="41">
		<b>
		<font style="font-size: 11pt"><font face="Tahoma">¼������</font>��</font></b></TD>
      <TD width="261" bgColor=#ffffff height="41">  
              <font color="#FF0000" size="3"> 
				<select size="1" name="dlgm">
				<option selected value="0">==��ѡ��==</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
				<option value="32">32</option>
				<option value="33">33</option>
				<option value="34">34</option>
				<option value="35">35</option>
				<option value="36">36</option>
				<option value="37">37</option>
				<option value="38">38</option>
				<option value="39">39</option>
				<option value="40">40</option>
				<option value="41">41</option>
				<option value="42">42</option>
				<option value="43">43</option>
				<option value="44">44</option>
				<option value="45">45</option>
				<option value="46">46</option>
				<option value="47">47</option>
				<option value="48">48</option>
				<option value="49">49</option>
				<option value="50">50</option>
				<option value="60">60</option>
				<option value="70">70</option>
				<option value="80">80</option>
				<option value="90">90</option>
				<option value="100">100</option>
				</select> 
				**</font></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=2 align=middle bgColor=#ffffff width="413" height="29"> 
              <p style="margin-top: 0; margin-bottom: 0"> 
              <INPUT class=normalButton type=submit value="ȷ �� ¼ ��" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
		</div>
</form>
    </td>
    </tr>
  </table>
   <p style="margin-top: 0; margin-bottom: 0">��</p>
						<table border="0" width="50%" id="table1" cellspacing="1">
							<tr><td><p align="center">�㵱ǰ�ۼƽ���Ϊ<b><font color="#FF0000"><%=rs("dlgmtj")%></font></b>��&nbsp;&nbsp;&nbsp;��ʣ��<b><font color="#FF0000"><%=rs("dlgmjl")%></font></b>��δʹ��&nbsp;&nbsp;&nbsp;���ͣ���</td>
							</tr>
						</table>
						</div>
</body>
</html>