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
	        ErrMsg="<li>非法操作！</li>"
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
   response.write "alert('操作密码错误，请检查输入是否正确！');"
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
pp=ubound(split(checkIndex,","))+1 '判断数组bmuid中共有几维
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
call ok("您已成功初审核！","enter.asp")
else
call ok("您至少选择一个需要审核的用户名，谢谢！","enter.asp")
end if
end sub
%>
<p><a href="?sh=0" style="text-decoration: none">未初审名单</a>&nbsp;<a href="?sh=1" style="text-decoration: none">已初审但未二审名单</a>&nbsp;<a href="?sh=2" style="text-decoration: none">完全审核成功名单</a>&nbsp;<a href="enter.asp" style="text-decoration: none">全部名单</a></p>
<script language = "JavaScript"> 
//全选操作    
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
<font size="2" face="宋体">
<%
if request("sh")<>"" then
if request("sh")=0 then
   shaudit="where audit=0"
elseif request("sh")=1 then
   shaudit="where audit=1 and audit2=0"
elseif request("sh")=2 then
   shaudit="where audit=1 and audit2=1"
else
   shaudit=""
end if
end if
Set rsb= Server.CreateObject("ADODB.Recordset")
sqlb="select * from enter "&shaudit&" order by id asc" 
rsb.open sqlb,connth,1,1
  if rsb.eof and rsb.bof then 
       response.write "<p align='center'>还没有需要审核的用户！</p>"
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
		<td align="center" bgcolor="#FFFFC4"><b>选择</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>用户名</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>单数</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>性别</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>身份证</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>所属领导人</b></td>
		<td align="center" bgcolor="#FFFFC4"><b>状态</b></td>
	</tr>
     <%
	 b=1
	 do while not rsb.eof%>
	<tr>
		<td align="center"><%if rsb("audit")<>1 then%><input type="hidden" value="<%=rsb("id")%>" name="bmuid" readonly><input type="checkbox" name="checkIndex" value="<%=b%>"><%end if%></td>
		<td align="center"><%=rsb("user")%></td>
		<td align="center"><%=rsb("jb")%></td>
		<td align="center"><%=rsb("xb")%></td>
		<td align="center"><%=left(rsb("userid"),6)%>******<%=right(rsb("userid"),6)%></td>
		<td align="center"><%=rsb("addldr")%></td>
		<td align="center"><font color="#FF0000"><b><%if rsb("audit")=1 then%><a target="_blank" href="audit.asp?reuser=<%=rsb("user")%>" style="text-decoration: none">初审通过但未二审</a><%elseif rsb("audit")=1 and rsb("audit2")=1 then%>完全审核成功<%else%>未审核<%end if%></b></font></td>
	</tr>
    <% i=i+1 
	b=b+1
	   if i>=MaxPerPage then exit do 
	   rsb.movenext 
	   loop 
	%>	
	<tr>
		<td align="center" bgcolor="#C0C0C0"><input type='checkbox' name=chkall onclick='CheckAll(this.form)'>全选</td>
		<td align="center" colspan="5" bgcolor="#C0C0C0"><p align="left">操作密码：<input type="password" name="pa2j" size="15"> <input type="submit" value="提交审核" name="B1" onClick="{if(confirm('您确定了吗?')){this.style.visibility='hidden';return true;}return false;}">（此处仅为初审，<b><a style="text-decoration: none" target="_blank" href="audit.asp">点击进入二审</a></b>）</td>
		<td align="center" colspan="5" bgcolor="#C0C0C0"></td>
	</tr>
</table>
<font size="2" face="宋体"><% 
   end sub  
 
function showpage(totalnumber,maxperpage,filename) 
  dim n 
  if totalnumber mod maxperpage=0 then 
     n= totalnumber \ maxperpage 
  else 
     n= totalnumber \ maxperpage+1 
  end if 
  response.write "<form method=Post action="&filename&"?sh="&Request("sh")&">" 
  response.write "<p align='center'>&gt;&gt;分页&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>首页 上一页</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&sh="&Request("sh")&">首页</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&"&sh="&Request("sh")&">上一页</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>下一页 尾页</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1)&"&sh="&Request("sh")
    response.write ">下一页</a> <a href="&filename&"?page="&n&"&sh="&Request("sh")&">尾页</a>" 
  end if 
   response.write "&nbsp;页次：<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>页 " 
    response.write "&nbsp;共<b>"&totalnumber&"</b>条 <b>"&maxperpage&"</b>条/页 " 
   response.write " 转到：<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function
 
%>
</font>
</form>