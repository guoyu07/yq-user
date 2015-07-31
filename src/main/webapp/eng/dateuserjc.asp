<!--#include file="../ct0618.asp"-->
<%
username=request.cookies("regid")
password=request.cookies("password")
%>
<%
dim action
action=request.QueryString("action")
'//±£´æÐÅÏ¢
if action="save" then
  Dim rs2,sql2
  Set rs2= Server.CreateObject("ADODB.Recordset") 
  sql2="select * from gcuser where username = '"&username&"'" 
  rs2.open sql2,conn2,2,3
  rs2("jcname")=request("jcname")
  rs2("jcuserid")=request("jcuserid")
  rs2.update
  response.Write "<script language=javascript>alert('Heir added successfully!');history.go(-1);</script>"
  response.end
end if
%>
<%
  Set rs= Server.CreateObject("ADODB.Recordset") 
  sql="select * from gcuser where username = '"&username&"'" 
  rs.open sql,conn2,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {
  if (Form.jcname.value=="") {      alert("Please fill in the name of the heir!");  Form.jcname.focus();    return false;    }
  if (Form.jcname.value.length<2) {      alert("Name at least two heirs characters!");   Form.jcname.focus();     return false;    } 
  if (Form.jcname.value.length>8) {      alert("Heir name up to four characters!");   Form.jcname.focus();     return false;    }
  if (Form.jcuserid.value=="") {      alert("Please fill heir ID number!");  Form.jcuserid.focus();      return false;    }
  if (Form.jcuserid.value.length<18) {      alert("Heir ID number at least 18 digits!"); Form.jcuserid.focus();     return false;    } 
  if (Form.jcuserid.value.length>19) {      alert("Heir ID number up to 19 digits!"); Form.jcuserid.focus();     return false;    }
return true;  }  
</script>
<html>
<head>
<title>Modify Personal Information</title>
<link rel="stylesheet" type="text/css" href="css.css">
</head>
<body topmargin="5" leftmargin="5">
<div align="center">
  <form  METHOD="POST" action="dateuserjc.asp?action=save" name="Form" onSubmit="return checkdate()">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="140">
      <tr>
        <td align="right" width="1105" height="30" style="border-left: 1px solid #C9D8AD" bgcolor="#C9D8AD" colspan="2"><p align="center"><b><font color="#0000FF">By filling will not be heir modify, careful fill!</font></b></td>
      </tr>
      <tr>
        <td align="right" width="495" height="30" style="border-left: 1px solid #C9D8AD" bgcolor="#FFDDFF"><b>Heir name:</b></td>
        <td width="738" align="left" style="border-right: 1px solid #C9D8AD" bgcolor="#FFDDFF"><input type="text" maxlength=32 name="jcname" value="<%=rs("jcname")%>" size="16" <%if rs("jcname")<>"" then%>readonly<%end if%>><font color="#FF0000"> **Mandatory</font></td>
      </tr>
		<tr>
		<td align="right" width="495" height="31" style="border-left: 1px solid #C9D8AD" bgcolor="#FFDDFF"><b><font face="Arial">Heir ID number:</font></b></td>
        <td width="738" align="left" style="border-right: 1px solid #C9D8AD" bgcolor="#FFDDFF"><input type="text" maxlength=19 name="jcuserid" value="<%=rs("jcuserid")%>" size="22" <%if rs("jcuserid")<>"" then%>readonly<%end if%>><font color="#FF0000"> **Mandatory</font></td>
      </tr>
      <tr>
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD;" height="38" bgcolor="#FFFFDD"><div align="center"></div><div align="center"><input type="submit" name="submit" width="34" height="20" alt="Submit" size="20" value="Determine the increase heir" class="lkbtn" style="font-size: 12pt"></div></td>
      </tr>
    </table>
    </div>
</div>
</form>
</body>
</html>