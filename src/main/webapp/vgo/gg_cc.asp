<!--#include file=../zqcjimg.asp-->
<!--#include file=../ct0618.asp-->
<%
fhkok=request("jhid")
dqu=request("dq")
if dqu="0" or dqu="7" or dqu="2" or dqu="8" then
   cz01="中国一川【①号】客服QQ：613697151"
   qq=613697151
   cz02="曾世剑"
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="中国一川【②号】客服QQ：613697152"
   qq=613697152
   cz02="曾世剑"
end if
%>
<%
if fhkok<>"" then
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&fhkok&"'"
rs.open sql,conn2,2,3
if rs("addsheng")="山东省" or rs("addsheng")="江苏省" or rs("addsheng")="上海市" then
    rs("dqu")=0
    rs("add9dqu")="华东一区"
    rs.update
end if
if rs("addsheng")="安徽省" or rs("addsheng")="浙江省" or rs("addsheng")="福建省" then
    rs("dqu")=1
    rs("add9dqu")="华东二区"
    rs.update
end if
if rs("addsheng")="广东省" or rs("addsheng")="广西壮族自治区" or rs("addsheng")="海南省" or rs("addsheng")="四川省" then
    rs("dqu")=2
    rs("add9dqu")="华南地区"
    rs.update
end if
if rs("addsheng")="湖北省" or rs("addsheng")="湖南省" or rs("addsheng")="河南省" or rs("addsheng")="江西省" then
    rs("dqu")=3
    rs("add9dqu")="华中地区"
    rs.update
end if
if rs("addsheng")="北京市" or rs("addsheng")="天津市" or rs("addsheng")="河北省" or rs("addsheng")="河北省" or rs("addsheng")="山西省" or rs("addsheng")="内蒙古自治区" then
    rs("dqu")=4
    rs("add9dqu")="华北地区"
    rs.update
end if
if rs("addsheng")="宁夏回族自治区" or rs("addsheng")="新疆维吾尔自治区" or rs("addsheng")="青海省" or rs("addsheng")="陕西省" or rs("addsheng")="甘肃省" then
    rs("dqu")=5
    rs("add9dqu")="西北地区"
    rs.update
end if
if rs("addsheng")="云南省" or rs("addsheng")="贵州省" or rs("addsheng")="西藏自治区" or rs("addsheng")="重庆市" then
    rs("dqu")=6
    rs("add9dqu")="西南地区"
    rs.update
end if
if rs("addsheng")="辽宁省" or rs("addsheng")="吉林省" or rs("addsheng")="黑龙江省" then
    rs("dqu")=7
    rs("add9dqu")="东北地区"
    rs.update
end if
if rs("addsheng")="台湾省" or rs("addsheng")="香港特别行政区" or rs("addsheng")="澳门特别行政区" then
    rs("dqu")=8
    rs("add9dqu")="港澳台地区"
    rs.update
end if
end if
%>
<%
dim rs_rg,sql_rg
set rs_rg = Server.CreateObject("ADODB.Recordset")
sql_rg ="select * from txpay where dfuser ='"&fhkok&"' and ep=1 "
rs_rg.open sql_rg,conn1,2,3
if not rs_rg.eof then
   response.Write "<script language=javascript>alert('您有认购他人一币还没有付款，请尽快完成付款！');location.replace('../vip/epmyjl.asp');</script>"
   response.end
end if
%>
<%
dim rs_qr,sql_qr
set rs_qr = Server.CreateObject("ADODB.Recordset")
sql_qr ="select * from txpay where payusername ='"&fhkok&"' and ep=2 "
rs_qr.open sql_qr,conn1,2,3
if not rs_qr.eof then
   response.Write "<script language=javascript>alert('您的一币卖出已有他人收购并给您付款，请你尽快查收并及时确认，如有问题联系客服！');location.replace('../vip/epmcjl.asp');</script>"
   response.end
end if
%>
<html>
<head>
<title>积分游戏平台--公告管理</title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
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
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<body topmargin="5" leftmargin="5">
<div align="center">
      <div align="center">
      <table border="0" width="100%" id="table22" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
	<td align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">有任何事情请联系：<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题</font><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 11pt"><a href="javascript:openwindow('bank.asp?dq=<%=dqu%>')" style="text-decoration: none">本服务中心已配备指定的客服人员，专用的收款账号名字为“<b><font color="#FF0000"><%=cz02%></font></b>”--点击查看汇款账号</a></font></td>
		</tr>
	</table>
		</div>
<table border="0" width="100%" bordercolor="#006699" height="29">
    <tr>
      <td width="100%" height="25" bgcolor="#D0FFF0"> <p align="center" style="margin-top: 0; margin-bottom: 0"><font face="宋体"><b>管理员公告</b></font></td> 
  </tr>  <tr> 
	<p style="margin-top: 0; margin-bottom: 0">
	<font face="宋体" size="2"><br> 
<% 
dim sql1
dim rs1
sql1="select * from dgag where check=0 order by id desc"
Set rs1= Server.CreateObject("ADODB.Recordset")
rs1.open sql1,conn1,1,1
  if rs1.eof and rs1.bof then
       response.write "<p align='center'> 还没有发布公告</p>"
   else
	  totalPut=rs1.recordcount 
      totalPut=rs1.recordcount 
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
            showpage totalput,MaxPerPage,"gg.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs1.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs1.bookmark 
           showpage totalput,MaxPerPage,"gg.asp" 
            showContent 
             showpage totalput,MaxPerPage,"gg.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"gg.asp" 
           showContent 
           showpage totalput,MaxPerPage,"gg.asp" 
	      end if 
	   end if 
   rs1.close 
   end if 
	         
   set rs1=nothing
   conn1.close 
   set conn1=nothing
 
   sub showContent
       dim i
	   i=0
   
%></font></p>
	<div align="center">
            
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="61">
            <tr> 
              <td width="68" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><strong><font face="宋体" style="font-size: 11pt">序号</font></strong></td>
              <td width="112" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><strong>发布人</strong></font></td>
              <td width="504" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>公 告 标 题</b></font></td>
              <td width="232" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>发布时间</b></font></td>
              <td width="100" align="center" height="28" bgcolor="#C0C0C0"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><b>操作</b></font></td>
              </tr>
              <%do while not rs1.eof%>
              <tr> 
                <td valign="middle" height="34" width="68" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" style="font-size: 11pt"><%=rs1("id")%></font></td>
                <td valign="middle" width="112" align="center"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" style="font-size: 11pt">公司</font></td>
                <td valign="middle" align="center" width="504"><font color="#000000" face="宋体" style="font-size: 11pt"><%=rs1("ggbt")%></font></td>
                <td valign="middle" align="center" width="232"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" style="font-size: 11pt"><%=rs1("ggdate")%></font></td>
                <td valign="middle" align="center" width="100"><font color="#000000" face="宋体" style="font-size: 11pt"><p style="margin-top: 0; margin-bottom: 0"><a href="ggck.asp?ck=<%=rs1("id")%>" style="text-decoration: none">查看</a>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs1.movenext
	   loop 
		  %></table> 
</div>
<font face="宋体" size="2"><% 
   end sub  
 
function showpage(totalnumber,maxperpage,filename) 
  dim n 
  if totalnumber mod maxperpage=0 then 
     n= totalnumber \ maxperpage 
  else 
     n= totalnumber \ maxperpage+1 
  end if 
  response.write "<form method=Post action="&filename&">" 
  response.write "<p align='center'>&gt;&gt;分页&nbsp;" 
  if CurrentPage<2 then 
    response.write "<font color='999966'>首页 上一页</font>&nbsp;" 
  else 
    response.write "<a href="&filename&"?page=1&>首页</a>&nbsp;" 
    response.write "<a href="&filename&"?page="&CurrentPage-1&">上一页</a>&nbsp;" 
  end if 
  if n-currentpage<1 then 
    response.write "<font color='999966'>下一页 尾页</font>" 
  else 
    response.write "<a href="&filename&"?page="&(CurrentPage+1)
    response.write ">下一页</a> <a href="&filename&"?page="&n&">尾页</a>" 
  end if 
   response.write "&nbsp;页次：<strong><font color=red>"&CurrentPage&"</font>/"&n&"</strong>页 " 
    response.write "&nbsp;共<b>"&totalnumber&"</b>条 <b>"&maxperpage&"</b>条/页 " 
   response.write " 转到：<input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function 
 
  
%> 
</font></td> 
</tr> 
</table> 
</div> 
</body> 
</html>