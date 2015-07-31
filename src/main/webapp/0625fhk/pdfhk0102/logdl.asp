<!--#include file="../shopmfh.asp"-->
<!--#include file="lc_md5.asp"-->
<% 
dluser=request("dl")
dim sql1
dim rs1
sql1="select * from cfuser where username = '"&dluser&"'" 
Set rs1= Server.CreateObject("ADODB.Recordset") 
rs1.open sql1,conn1,1,1
%>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.dlpa1.value=="") {      alert("请输入代理商编号的登录密码!");      return false;    } 
  if (Form.dlpa2.value=="") {      alert("请输入代理商编号的二级密码!");      return false;    } 
  if (Form.dlpa2.value!=="<%=rs1("password3")%>") {      alert("代理商编号的二级密码不正确!");      return false;    } 
  if (Form.dlgm.value==0) {      alert("请选择你要录入的数量!");      return false;    } 
  if (Form.dlgm.value><%=rs1("dlgmjl")%>)    {   alert("录入数量不能大于现有库存数量!");      return false;    } 
  return true;  }  
 </script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center">

                      <b>
						<font color="#008000" face="方正大黑简体" style="font-size: 20pt">以下仅由当地代售商录入供货记录</font><table width="474" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="474"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="dlsjl.asp?id=<%=rs1("username")%>" target="main">
      <div align="center">
      <TABLE width="87%" border=0 cellSpacing=1 height="135">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="4" align="right" rowspan="5">
		<p align="center">　</TD>
    </TR>
    <TR class=content> 
      <TD width="138" bgColor=#ffffff align="right" height="24">
                      <b><font style="font-size: 11pt">供货代售商编号：</font></b></TD>
      <TD width="260" bgColor=#ffffff height="24"><b><font color="#FF0000"><%=rs1("username")%>&nbsp;</font><font color="#800080"><%=rs1("name")%></font></b></TD>
    </TR>
    <TR class=content> 
      <TD width="138" bgColor=#ffffff align="right" height="27">
                      <b><font style="font-size: 11pt">登录密码：</font></b></TD>
      <TD width="260" bgColor=#ffffff height="27">  
						<font size="3"> <span style="font-size: 11pt"> 
						<INPUT name="dlpa1" size=15 type="password"></span></font><font color="#FF0000" size="3"><b>
						</b></font><font style="font-size: 9pt" color="#FF0000">**  
              <font style="font-size: 9pt"> 
						仅</font>限代售商填写</font></TD>
    </TR>
    <TR class=content> 
      <TD width="138" bgColor=#ffffff align="right" height="27">
                      <font style="font-size: 11pt; font-weight:700">二级密码：</font></TD>
      <TD width="260" bgColor=#ffffff height="27">  
						<font size="3"> <span style="font-size: 11pt"> 
						<INPUT name="dlpa2" size=15 type=password></span></font><font color="#FF0000" size="3"><b>
						</b></font><font style="font-size: 9pt" color="#FF0000">**<font style="font-size: 9pt"> 
						仅</font>限代售商填写</font></TD>
    </TR>
    <TR class=content> 
      <TD width="138" bgColor=#ffffff align="right" height="27">
		<b>
		<font style="font-size: 11pt"><font face="Tahoma">录入数量</font>：</font></b></TD>
      <TD width="260" bgColor=#ffffff height="27">  
              <font color="#FF0000" size="3"> 
				<select size="1" name="dlgm">
				<option selected value="0">==请选择==</option>
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
				<option value="150">150</option>
				<option value="200">200</option>
				<option value="300">300</option>
				</select> 
				**</font></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=3 align=middle bgColor=#ffffff width="408"> 
              　<p style="margin-top: 0; margin-bottom: 0"> 
              <INPUT class=normalButton type=submit value="确 定 录 入" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
</div>
</body>
</html>