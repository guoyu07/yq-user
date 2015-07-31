<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('../index.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")   
end if
dim sql 
dim rs 
sql="select * from gcuser where username = '" & regid & "'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
%>
<title>New User Registration</title>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script language="JavaScript"> 
function Check()
{
	if ( Form.gguser.value==""){
		alert ("Tip:\n\nPlease fill in the user ID needs to query!");
		Form.gguser.focus();
		return false;
	}
	 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 12 || Form.gguser.value.length < 4) {
		alert("Tip:\n\nYour user ID does not meet specifications, must be 4-12 lowercase letters + numbers!");
		Form.gguser.focus();
		return false;
	}
var uName=document.Form.gguser.value;
window.open("checkreg.asp?gguser="+uName,"check","width=100,height=100,left=300,top=200");
}
function CheckIfEnglish( String )
{ 
    var Letters = "abcdefghijklmnopqrstuvwxyz0123456789";
     var i;
     var c;
      if(String.charAt( 0 )=='-')
	return false;
      if( String.charAt( String.length - 1 ) == '-' )
          return false;
     for( i = 0; i < String.length; i ++ )
     {
          c = String.charAt( i );
	  if (Letters.indexOf( c ) < 0)
	     return false;
     }
     return true;
}

 function checkdate()  {  
  if (Form.gguser.value=="") {      alert("Username can not be empty!"); Form.gguser.focus();     return false;    } 
  	        if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("Tip:\n\nYour username does not meet specifications, must be 4-10 lowercase letters + numbers!");
		Form.gguser.focus();
		return false;
	}
 
  if (Form.sfz.value==0) {      alert("Please carefully check agreements and declarations, and only agreed to before you can continue");      return false;    } 
return true;  }  
</script>
<body background="../image/regbg.gif">
<div align="center">
<form method="POST" action="reg2.asp" name="Form" onSubmit="return checkdate()">
		<p style="margin-top: 0; margin-bottom: 0">¡¡</p>
		<p style="margin-top: 0; margin-bottom: 0"><img border="0" src="../image/bg01_eng.jpg" width="60%"></p>
		<table border="0" width="60%" id="table1" height="365" cellpadding="5" bgcolor="#FFFFFF">
			<tr>
				<td align="left" colspan="2">
				<table border="2" width="100%" id="table2" cellspacing="1" bordercolor="#FF0000" style="border-collapse: collapse" cellpadding="4">
					<tr>
						<td><p style="line-height: 150%"><font color="#FF0000">&nbsp;&nbsp; Sign up here for the currently logged in account</font><font color="#0000FF">Adding a new user with the name of the shortcut</font><font color="#FF0000">Use, only need to customize a new user name, and other information with the currently logged in account the same!&nbsp;</font><font color="#008000" size="2">If you need to register a new user go to a different name</font><a target="_top" href="../reg_eng.asp"><img src="../images/a02_y_eng.png"></a></td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Username:</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="gguser" size="15" maxlength="12"><font size="2" color="#FF0000">**</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">A password:</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2">The same as the currently logged in account</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Two passwords:</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2">The same as the currently logged in account</font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Name:</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><%=rs("name")%></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Receivables Bank:</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><%=rs("bank")%></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Bank account:</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><%=rs("card")%></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">ID number:</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><%=left(rs("userid"),4)%>**********<%=right(rs("userid"),4)%></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Bank location:</font></b></td>
				<td width="66%"><font size="2"><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Cell phone:</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><%=rs("call")%></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">QQ£º</font></b></td>
				<td width="66%"><p style="margin-top: 0; margin-bottom: 0"><font size="2"><%=rs("qq")%></font></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Recommended by:</font></b></td>
			    <td width="66%"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#FF0000"><%=regid%></font></b></td>
			</tr>
			<tr>
				<td width="31%" align="right"><p style="margin-top: 0; margin-bottom: 0"><b><font color="#808000" size="2">Agreements and declarations:</font></b></td>
				<td width="66%"><font size="2" color="#FF0000">
				<span style="font-size: 11pt">
				<select size="1" name="sfz">
				<option selected value="0">==Choose whether or not consent agreements and declarations==</option>
				<option value="0">Do not agree!</option>
				<option value="1">Consent agreement and statement of voluntary participation!</option>
				</select></span></font><font color="#FF0000" style="font-size: 11pt"> </font> 
				<font color="#008000" style="font-size: 11pt" size="2">&nbsp;</font><font color="#FF0000"><a href="javascript:openwindow('../sfz.asp?id=<%=id%>')" style="text-decoration: none; font-weight: 700; "><font color="#008000" size="3">See Agreement and Declaration</font></a></font></td>
			</tr>
		</table>
		<p style="margin-top: 0; margin-bottom: 0"></p>
		<p style="margin-top: 0; margin-bottom: 0">¡¡</p>
		<p style="margin-top: 0; margin-bottom: 0"><input type="submit" value="Submitted for registration" name="submit" style="font-size: 12pt; font-weight: bold"></p>
		<p style="margin-top: 0; margin-bottom: 0" align="right"></p>
        </form>
<p style="margin-top: 0; margin-bottom: 0">¡¡</div>