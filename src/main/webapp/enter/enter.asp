<!--#include file="../ct0618.asp"-->
<!--#include file="../th.asp"-->
<%
Function my_request(ParaName,ParaType)
    Dim ParaValue
    ParaValue=Request(ParaName)
    If ParaType=1 Then
        ErrMsg=""
        If Not isNumeric(ParaValue) Then
            FoundErr=True
	        ErrMsg="<li>�Ƿ�������</li>"
	        call WriteErrMsg(ErrMsg)
            response.end
        end if
    Else
        ParaValue=replace(ParaValue,"'","''")
    End if
    my_request=ParaValue
End function

sub ok(txt,url)
    response.write "<script language='javascript'>"
    response.write "alert('"&txt&"');"
    response.write "location.href='"&url&"';"
    response.write "</script>"
end sub
%>
<%
if request("tjjz")<>"" then
if request("pa2j")<>"hdbm2015" then
   response.write "<script language='javascript'>"
   response.write "alert('��������������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
    call userz()   
end if
end if
sub userz()
tuser=my_request("bmuid",0)
checkIndex=my_request("checkIndex",0)
'Response.write "tuser:"&tuser&"---"&ubound(split(tuser,","))
'tjzpay=my_request("tpay",0)
if checkIndex<>"" then
pp=ubound(split(checkIndex,","))+1 '�ж�����bmuid�й��м�ά
for v=1 to pp
b=split(checkIndex,",")(v-1)
tuser=request("bmuid")(b)
'tjzpay=request("tpay")(b)  
'Response.write "tuser_B:"&tuser
sql2="select * from enter where id = "&tuser&"" 
Set rs2= Server.CreateObject("ADODB.Recordset")
rs2.open sql2,connth,1,3
rs2("audit")=1
rs2.update
next
call ok("���ѳɹ�����ˣ�","enter.asp")
else
call ok("������ѡ��һ����Ҫ��˵��û�����лл��","enter.asp")
end if
end sub
%>
<p><a href="?sh=0" style="text-decoration: none">δ��������</a>&nbsp;<a href="?sh=1" style="text-decoration: none">�ѳ���δ��������</a>&nbsp;<a href="?sh=2" style="text-decoration: none">��ȫ��˳ɹ�����</a>&nbsp;<a href="enter.asp" style="text-decoration: none">ȫ������</a>
<select size="1" name="dqldr" onchange="javascript:location=this.options[this.selectedIndex].value;">
			<option selected value="0">==��ѡ��==</option>
			<option value="?dqldr=���ڣ��Ĵ����ݣ�">���ڣ��Ĵ����ݣ�</option>
			<option value="?dqldr=���������Ĵ����ݣ�">���������Ĵ����ݣ�</option>
			<option value="?dqldr=�ս��ࣨ���죩">�ս��ࣨ���죩</option>
			<option value="?dqldr=�����٣����ϣ�">�����٣����ϣ�</option>
			<option value="?dqldr=�����������ϣ�">�����������ϣ�</option>
			<option value="?dqldr=�������ϣ�">�������ϣ�</option>
			<option value="?dqldr=�����������ݣ�">�����������ݣ�</option>
			<option value="?dqldr=�����ɣ�������">�����ɣ�������</option>
			<option value="?dqldr=�밮ΰ���㶫/�㽭��">�밮ΰ���㶫/�㽭��</option>
			<option value="?dqldr=�밮�̣��㶫/�㽭��">�밮�̣��㶫/�㽭��</option>
			<option value="?dqldr=�����£�������">�����£�������</option>
			<option value="?dqldr=�챦����������">�챦����������</option>
			<option value="?dqldr=�����磨�Ϻ���">�����磨�Ϻ���</option>
			<option value="?dqldr=�����������գ�">�����������գ�</option>
			<option value="?dqldr=�Ⱞ�������գ�">�Ⱞ�������գ�</option>
			<option value="?dqldr=��������ɽ���ൺ��������">��������ɽ���ൺ��������</option>
			<option value="?dqldr=����Ƽ��ɽ���ൺ�б�����">����Ƽ��ɽ���ൺ�б�����</option>
			<option value="?dqldr=����ģ�ɽ�����ϣ�">����ģ�ɽ�����ϣ�</option>
			<option value="?dqldr=��������ɽ�����ޣ�">��������ɽ�����ޣ�</option>
			<option value="?dqldr=�Խܣ�ɽ��˷�ݣ�">�Խܣ�ɽ��˷�ݣ�</option>
			<option value="?dqldr=����ϼ��ɽ����ͬ��">����ϼ��ɽ����ͬ��</option>
			<option value="?dqldr=��꿣�ɽ�����䣩">��꿣�ɽ�����䣩</option>
			<option value="?dqldr=����ڣ�ɽ��̫ԭ��">����ڣ�ɽ��̫ԭ��</option>
			<option value="?dqldr=�����㣨���ɰ�ͷ�ƺ�����">�����㣨���ɰ�ͷ�ƺ�����</option>
			<option value="?dqldr=��±������ɰ�ͷ/���ͺ��أ�">��±������ɰ�ͷ/���ͺ��أ�</option>
			<option value="?dqldr=���񻪣��ӱ���ɽ��">���񻪣��ӱ���ɽ��</option>
			<option value="?dqldr=����ӱ�ʯ��ׯ��">����ӱ�ʯ��ׯ��</option>
			<option value="?dqldr=�������ӱ�����/������">�������ӱ�����/������</option>
			<option value="?dqldr=���������ӱ�������">���������ӱ�������</option>
			<option value="?dqldr=�����磨���">�����磨���</option>
			<option value="?dqldr=�����Σ�������">�����Σ�������</option>
			<option value="?dqldr=���¿�������">���¿�������</option>
			<option value="?dqldr=��������������">��������������</option>
			<option value="?dqldr=��ϲ�����������ݣ�">��ϲ�����������ݣ�</option>
			<option value="?dqldr=������������«����">������������«����</option>
			<option value="?dqldr=ʤ����������ɽ��">ʤ����������ɽ��</option>
			<option value="?dqldr=���磨����������">���磨����������</option>
			<option value="?dqldr=��褣���������">��褣���������</option>		
			</select></p>
<script language = "JavaScript"> 
//ȫѡ����    
function CheckAll(form) {
 for (var i=0;i<form.elements.length;i++) {
 var e = form.elements[i];
 if (e.name != 'chkall') e.checked = form.chkall.checked;
 }
 }
</script>
<%
   const MaxPerPage=15
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
<form method="POST" action="enter.asp?tjjz=abcd188" name="form">
<font size="2" face="����">
<%
if request("dqldr")<>"" then
   shaudit="where addldr='"&request("dqldr")&"'"
   lb="dqldr="&Request("dqldr")&""
else
   shaudit=""
   lb=""
end if

if request("sh")<>"" then
if request("sh")=0 then
   shaudit="where audit=0"
   lb="sh="&Request("sh")&""
elseif request("sh")=1 then
   shaudit="where audit=1 and audit2=0"
   lb="sh="&Request("sh")&""
elseif request("sh")=2 then
   shaudit="where audit=1 and audit2=1"
   lb="sh="&Request("sh")&""
else
   shaudit=""
   lb=""
end if
end if
Set rsb= Server.CreateObject("ADODB.Recordset")
sqlb="select * from enter "&shaudit&" order by id asc" 
rsb.open sqlb,connth,1,1
  if rsb.eof and rsb.bof then 
       response.write "<p align='center'>��û����Ҫ��˵��û���</p>"
   else
	  totalPut=rsb.recordcount
      totalPut=rsb.recordcount
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
            showpage totalput,MaxPerPage,"enter.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rsb.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rsb.bookmark 
           showpage totalput,MaxPerPage,"enter.asp" 
            showContent 
             showpage totalput,MaxPerPage,"enter.asp" 
        else 
	        currentPage=1
           showpage totalput,MaxPerPage,"enter.asp" 
           showContent 
           showpage totalput,MaxPerPage,"enter.asp" 
	      end if 
	   end if 
   rsb.close 
   end if 
	         
   set rsb=nothing   
   connth.close 
   set connth=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></font>
<table border="1" width="100%" id="table3" style="border-collapse: collapse" height="80%">
	<tr>
		<td align="center" bgcolor="#FFFFC4"><b>ѡ��</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>�û���</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>����</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>�Ա�</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>���֤</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>�����쵼��</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>״̬</b></td>
	</tr>
     <%
	 b=0
	 do while not rsb.eof%>
	<tr>
		<td align="center"><%if rsb("audit")<>1 then%><%b=b+1%><input type="hidden" value="<%=rsb("id")%>" name="bmuid" readonly><input type="checkbox" name="checkIndex" value="<%=b%>"><%end if%></td>
		<td align="center"><%=rsb("user")%></td>
		<td align="center"><%=rsb("jb")%></td>
		<td align="center"><%=rsb("xb")%></td>
		<td align="center"><%=left(rsb("userid"),6)%>******<%=right(rsb("userid"),6)%></td>
		<td align="center"><%=rsb("addldr")%></td>
		<td align="center"><font color="#FF0000"><b><%if rsb("audit")=1 then%><a target="_blank" href="audit.asp?reuser=<%=rsb("user")%>" style="text-decoration: none">����ͨ����δ����</a><%elseif rsb("audit")=1 and rsb("audit2")=1 then%>��ȫ��˳ɹ�<%else%>δ���<%end if%></b></font></td>
	</tr>
    <% i=i+1 
	   if i>=MaxPerPage then exit do 
	   rsb.movenext 
	   loop 
	%>	
	<tr>
		<td align="center" bgcolor="#C0C0C0"><input type='checkbox' name=chkall onclick='CheckAll(this.form)'>ȫѡ</td>
		<td align="center" colspan="5" bgcolor="#C0C0C0"><p align="left">�������룺<input type="password" name="pa2j" size="15"> <input type="submit" value="�ύ���" name="B1" onClick="{if(confirm('��ȷ������?')){this.style.visibility='hidden';return true;}return false;}">���˴���Ϊ����<b><a style="text-decoration: none" target="_blank" href="audit.asp">����������</a></b>��</td>
		<td align="center" colspan="5" bgcolor="#C0C0C0"></td>
	</tr>
</table>
<font size="2" face="����"><% 
   end sub  
 
function showpage(totalnumber,maxperpage,filename) 
  dim n 
  if totalnumber mod maxperpage=0 then 
     n= totalnumber \ maxperpage 
  else 
     n= totalnumber \ maxperpage+1 
  end if 
  response.write "<form method=Post action="&filename&"?"&lb&">" 
  response.write "<p align='center'>&gt;&gt;��ҳ&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>��ҳ ��һҳ</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&"&lb&">��ҳ</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&"&"&lb&">��һҳ</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>��һҳ βҳ</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1)&"&"&lb
    response.write ">��һҳ</a> <a href="&filename&"?page="&n&"&"&lb&">βҳ</a>" 
  end if 
   response.write "&nbsp;ҳ�Σ�<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>ҳ " 
    response.write "&nbsp;��<b>"&totalnumber&"</b>�� <b>"&maxperpage&"</b>��/ҳ " 
   response.write " ת����<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function
 
%>
</font>
</form>