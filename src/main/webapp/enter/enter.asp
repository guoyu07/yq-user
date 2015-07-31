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
<p><a href="?sh=0" style="text-decoration: none">未初审名单</a>&nbsp;<a href="?sh=1" style="text-decoration: none">已初审但未二审名单</a>&nbsp;<a href="?sh=2" style="text-decoration: none">完全审核成功名单</a>&nbsp;<a href="enter.asp" style="text-decoration: none">全部名单</a>
<select size="1" name="dqldr" onchange="javascript:location=this.options[this.selectedIndex].value;">
			<option selected value="0">==请选择==</option>
			<option value="?dqldr=瞿宗（四川达州）">瞿宗（四川达州）</option>
			<option value="?dqldr=刘晓兵（四川达州）">刘晓兵（四川达州）</option>
			<option value="?dqldr=陶锦余（重庆）">陶锦余（重庆）</option>
			<option value="?dqldr=崔向荣（云南）">崔向荣（云南）</option>
			<option value="?dqldr=崔珑枥（云南）">崔珑枥（云南）</option>
			<option value="?dqldr=马本礼（云南）">马本礼（云南）</option>
			<option value="?dqldr=朱龙敏（贵州）">朱龙敏（贵州）</option>
			<option value="?dqldr=刘锁成（广西）">刘锁成（广西）</option>
			<option value="?dqldr=齐爱伟（广东/浙江）">齐爱伟（广东/浙江）</option>
			<option value="?dqldr=齐爱绿（广东/浙江）">齐爱绿（广东/浙江）</option>
			<option value="?dqldr=黄亚勇（福建）">黄亚勇（福建）</option>
			<option value="?dqldr=徐宝华（福建）">徐宝华（福建）</option>
			<option value="?dqldr=张意社（上海）">张意社（上海）</option>
			<option value="?dqldr=丁兰美（江苏）">丁兰美（江苏）</option>
			<option value="?dqldr=吴爱华（江苏）">吴爱华（江苏）</option>
			<option value="?dqldr=刘美君（山东青岛城阳区）">刘美君（山东青岛城阳区）</option>
			<option value="?dqldr=杨素萍（山东青岛市北区）">杨素萍（山东青岛市北区）</option>
			<option value="?dqldr=金克文（山东济南）">金克文（山东济南）</option>
			<option value="?dqldr=李永利（山东德洲）">李永利（山东德洲）</option>
			<option value="?dqldr=赵杰（山西朔州）">赵杰（山西朔州）</option>
			<option value="?dqldr=郭银霞（山西大同）">郭银霞（山西大同）</option>
			<option value="?dqldr=高昕（山西宁武）">高昕（山西宁武）</option>
			<option value="?dqldr=吴成勤（山西太原）">吴成勤（山西太原）</option>
			<option value="?dqldr=李淑香（内蒙包头黄河区）">李淑香（内蒙包头黄河区）</option>
			<option value="?dqldr=李德宝（内蒙包头/呼和浩特）">李德宝（内蒙包头/呼和浩特）</option>
			<option value="?dqldr=刘振华（河北唐山）">刘振华（河北唐山）</option>
			<option value="?dqldr=刘宇（河北石家庄）">刘宇（河北石家庄）</option>
			<option value="?dqldr=马京敏（河北保定/曲阳）">马京敏（河北保定/曲阳）</option>
			<option value="?dqldr=崔树鹏（河北邯郸）">崔树鹏（河北邯郸）</option>
			<option value="?dqldr=靳宾社（天津）">靳宾社（天津）</option>
			<option value="?dqldr=张振涛（北京）">张振涛（北京）</option>
			<option value="?dqldr=林月宽（北京）">林月宽（北京）</option>
			<option value="?dqldr=赵利明（北京）">赵利明（北京）</option>
			<option value="?dqldr=杨喜春（辽宁锦州）">杨喜春（辽宁锦州）</option>
			<option value="?dqldr=李振玉（辽宁葫芦岛）">李振玉（辽宁葫芦岛）</option>
			<option value="?dqldr=胜利（辽宁鞍山）">胜利（辽宁鞍山）</option>
			<option value="?dqldr=王虹（辽宁大连）">王虹（辽宁大连）</option>
			<option value="?dqldr=王瑜（黑龙江）">王瑜（黑龙江）</option>		
			</select></p>
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
	 b=0
	 do while not rsb.eof%>
	<tr>
		<td align="center"><%if rsb("audit")<>1 then%><%b=b+1%><input type="hidden" value="<%=rsb("id")%>" name="bmuid" readonly><input type="checkbox" name="checkIndex" value="<%=b%>"><%end if%></td>
		<td align="center"><%=rsb("user")%></td>
		<td align="center"><%=rsb("jb")%></td>
		<td align="center"><%=rsb("xb")%></td>
		<td align="center"><%=left(rsb("userid"),6)%>******<%=right(rsb("userid"),6)%></td>
		<td align="center"><%=rsb("addldr")%></td>
		<td align="center"><font color="#FF0000"><b><%if rsb("audit")=1 then%><a target="_blank" href="audit.asp?reuser=<%=rsb("user")%>" style="text-decoration: none">初审通过但未二审</a><%elseif rsb("audit")=1 and rsb("audit2")=1 then%>完全审核成功<%else%>未审核<%end if%></b></font></td>
	</tr>
    <% i=i+1 
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
  response.write "<form method=Post action="&filename&"?"&lb&">" 
  response.write "<p align='center'>&gt;&gt;分页&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>首页 上一页</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&"&lb&">首页</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&"&"&lb&">上一页</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>下一页 尾页</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1)&"&"&lb
    response.write ">下一页</a> <a href="&filename&"?page="&n&"&"&lb&">尾页</a>" 
  end if 
   response.write "&nbsp;页次：<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>页 " 
    response.write "&nbsp;共<b>"&totalnumber&"</b>条 <b>"&maxperpage&"</b>条/页 " 
   response.write " 转到：<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function
 
%>
</font>
</form>