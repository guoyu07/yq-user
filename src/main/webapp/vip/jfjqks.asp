<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<script type="text/javascript" src="images/jquery.min.js"></script>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
Set rs_qi= Server.CreateObject("ADODB.Recordset")
sql_qi="select top 1 * from jfkjdate order by kid desc" 
rs_qi.open sql_qi,conn7,1,1
%>
<%
dim rs_bd,sql_bd
set rs_bd = Server.CreateObject("ADODB.Recordset")
sql_bd="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs_bd.open sql_bd,conn2,1,1
if rs_bd.eof and rs_bd.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<% 
t = Now()
y = Year(t)
mo = Month(t)
d = Day(t)
h = Hour(t)
m = Minute(t)
s = Second(t)
sm = right("0" & m,2)
sm = cdbl(left(sm,1) & "9")
%>
<script type="text/javascript">
	var startTime = new Date();
	startTime.setFullYear(<%= y %>, <%= mo - 1 %>, <%= d %>);
	startTime.setHours(<%= h %>);
	startTime.setMinutes(<%= sm %>);
	startTime.setSeconds(59);
	startTime.setMilliseconds(999);
	var EndTime=startTime.getTime();
	function GetRTime(){
		var NowTime = new Date();
		var nMS = EndTime - NowTime.getTime();
		var nD = Math.floor(nMS/(1000 * 60 * 60 * 24));
		var nH = Math.floor(nMS/(1000*60*60)) % 24;
		var nM = Math.floor(nMS/(1000*60)) % 60;
		var nS = Math.floor(nMS/1000) % 60;
		if (nMS < 0){
			//window.location.reload();
			window.location.href="jfkjz.asp";
			$("#dao").hide();
			$("#daoend").show();
		}else{
		   $("#dao").show();
		   $("#daoend").hide();
		   //$("#RemainD").text(nD);
		   //$("#RemainH").text(nH);
		   $("#RemainM").text(nM);
		   $("#RemainS").text(nS); 
		}
	}
	
	$(document).ready(function () {
		var timer_rt = window.setInterval("GetRTime()", 1000);
	});
</script>
<script language="JavaScript"> 
 function checkdate()  { 
  if (Form.tzlb.value==0) {      alert("请选择要的竞猜项目!");      return false;    }
  if (Form.tzsl.value=="") {      alert("请写入投注积分数量!");      return false;    }
  if (Form.tzsl.value<10) {      alert("投注积分数量不能小于10");      return false;    }
  if (Form.tzsl.value><%=rs_bd("jyg")%>) {      alert("投注积分数量不能大于您剩余的数量 <%=rs_bd("jyg")%> 哦!");      return false;    } 
  if (!chkinteger(Form.tzsl.value)){
	alert('积分投注只能为整字!');
	document.Form.tzsl.focus;
	return (false);
 }
 function chkinteger(checkStr) {
var checkOK = "0123456789";
var allValid = true;
for (i=0; i<checkStr.length; i++) {
ch = checkStr.charAt(i);
if (checkOK.indexOf(ch) == -1) {
allValid = false;
break;
}
if ((ch == '+' || ch == '-') && i>0) {
allValid = false;
break;
}
}
return (allValid);
}
   return true;  }
</script>
<html>
<title>积分竞猜记录</title>
</head>
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
<div align="center">
	<b>
  	<form method="POST" action="jftzok.asp" name="Form" onSubmit="return checkdate()">
		<table border="0" width="100%" id="table4" height="60" bgcolor="#FC273D">
			<tr>
		<td width="330" rowspan="2"><b><p>&nbsp;离<font color="#FFFFFF">第<%=rs_qi("kid")%>期</font>积分开奖还有：<!--<span id="RemainD">&nbsp;</span>天<span id="RemainH">&nbsp;</span>时--><span id="RemainM">&nbsp;</span>分<span id="RemainS">&nbsp;</span>秒</td>
		<td width="165" align="right"><b>选择竞猜项目：</b></td>
		<td><b><select size="1" name="tzlb">
			<option selected value="0">=选择竞猜项目=</option>
			<option value="1">-单-</option>
			<option value="2">-双-</option>
			<option value="3">-大-</option>
			<option value="4">-小-</option>
			</select></td>
		<td width="75" rowspan="2"><p align="center"><b><input type="submit" value="提交" name="B3" style="font-family: 宋体; font-size: 12pt; font-weight: bold" onClick="return confirm('提示：您确定了吗？')"></td>
		<td width="500" rowspan="2"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体"><font color="#FFFFFF" size="2"><b>友</b></font><b><font color="#FFFFFF" size="2">情提示：</font></b></font><font face="宋体" size="2">竞猜游戏中没有100%的中奖，所投注的积分不管中与不中，均无法撤销，本游戏不是赌博，请保持良好的游戏心态，量力而行。</font></td>
			</tr>
			<tr>
		<td width="165" align="right"><b>下注积分数量：</b></td>
		<td><input type="text" name="tzsl" size="15"></td>
			</tr>
		</table>
	</form>
  	<table border="0" width="100%" id="table1" height="100%" cellspacing="0" cellpadding="0">
		<tr>
		<td width="15%" valign="top"><iframe name="I1" src="jfkjjl.asp" marginwidth="1" marginheight="1" align="top" border="0" frameborder="0" scrolling="no" height="100%" width="100%"></iframe></td>
		<td width="85%" valign="top"><b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#008000" id="table2">
          <tr> 
        <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font face="宋体"><b>积分竞猜记录</b><font size="2"><% 
dim sql 
dim rs 
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from gpjy where username ='"&username&"' and kjqi>0 order by id desc" 
rs.open sql,conn2,1,1
  if rs.eof and rs.bof then 
       response.write "<p align='center'>还没有积分竞猜记录！</p>" 
   else
	  totalPut=rs.recordcount 
      totalPut=rs.recordcount 
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
            showpage totalput,MaxPerPage,"jfjqks.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"jfjqks.asp" 
            showContent 
             showpage totalput,MaxPerPage,"jfjqks.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"jfjqks.asp" 
           showContent 
           showpage totalput,MaxPerPage,"jfjqks.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   conn2.close 
   set conn2=nothing 
   
 
   sub showContent 
       dim i 
	   i=0 
   
%></font></font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="55" id="table3">
            <tr>        
     <td width="103" align="center" height="26" bgcolor="#E8E8FF"><b><font size="2" face="宋体">期号</font></b></td>                
     <td width="157" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> <font face="宋体" color="#800000" size="2"><strong>竞猜玩家</strong></font></td><b>
     <td width="117" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>投注积分</strong></font></td></b>                
     <td width="118" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>收入积分</strong></font></td>
     <td width="108" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#800000" face="宋体" size="2">剩余积分</font></b></td><b>
     <td width="220" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b> <font color="#FF0000" face="宋体" size="2">竞投时间</font></b></td></b>
     <td width="216" align="center" height="26" bgcolor="#E8E8FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="宋体" size="2">备注</font></b></td>
        </tr>
      <%do while not rs.eof%>
         <tr> 
     <td height="32" width="103" align="center" bgcolor="#DFFFEF"><b><font size="2" face="宋体"><%=rs("kjqi")%></font></b></td>
     <td height="32" width="157" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000" face="宋体" size="2" style="font-weight: 700"><%=rs("username")%></font></td><b>
     <td valign="middle" width="117" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" size="2"><%if rs("mcsl")>0 then%>-<%=rs("mcsl")%><%else%><%=rs("mcsl")%><%end if%></font></td></b>
     <td valign="middle" width="118" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" size="2"><%=rs("mysl")%></font></td>
     <td valign="middle" align="center" width="108" bgcolor="#DFFFEF"><font face="宋体" size="2"><%=rs("sysl")%></font></td><b>
     <td valign="middle" align="center" width="220" bgcolor="#DFFFEF"><font size="2" face="宋体"><%=rs("cgdate")%></font></td></b>
     <td valign="middle" align="center" width="216" bgcolor="#DFFFEF"><font size="2" face="宋体"><%=rs("bz")%></font></td>
         </tr>
              <% i=i+1 
	      if i>=MaxPerPage then exit do 
	      rs.movenext 
	   loop 
		  %>
        </table> 
</div><font size="2" face="宋体"><% 
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
   response.write " 转到：<input type='text' name='page' size=4 maxlength=5 class=smallInput value="&currentpage&">" 
   response.write "<input class=buttonface type='submit'  value=' Goto '  name='cndok'></span></p></form>" 
        
end function 
 
%>
</font>
</tr> 
</table> 
	</td>
</tr>
	</table>
</div> 
</body> 
</html>