<!--#include file="../ct0618.asp"-->
<!--#include file="../vip/cfvip.asp"-->
<!--#include file="../th.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
Function getCode(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "01235678abcde"
     k=Len(arrChar)
     Randomize
     For i=1 to iCount
          j=Int(k * Rnd )+1
          strCode = strCode & Mid(arrChar,j,1)
     Next
     getCode = strCode
End Function
%>
<%
   userreg=request("user")
   gpa2j1=LCase(request("newpa2j1"))
   ypa2j=request("ypa2j")
   ceiduser=request("ceid")
   mycode=request("newcode")
dim rs2,sql2
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2="select * from gcuser where username ='"&username&"'"
rs2.open sql2,conn2,1,1
if rs2.eof and rs2.bof then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您输入的用户名不存在或有误，请重新输入，谢谢！');"
   response.write "top.location.replace('../index.asp');"
   response.write "</script>"
   response.end
else
dim rsb,sqlb
set rsb = Server.CreateObject("ADODB.Recordset")
sqlb="select top 1 * from gcuser where name ='"&rs2("name")&"' and userid='"&rs2("userid")&"' order by id"
rsb.open sqlb,conn2,1,1
end if
dim rs2b,sql2b
set rs2b = Server.CreateObject("ADODB.Recordset")
sql2b="select * from enter where user ='"&rsb("username")&"'"
rs2b.open sql2b,connth,1,1
if not rs2b.eof then
response.redirect "revise.asp?user="&rsb("username")&""
end if
%>
</head>
<script type="text/javascript" src="../vip/images/jquery.min.js"></script>
<script type="text/ecmascript" src="../vip/images/md5.js"></script>
<script language="JavaScript"> 
function CheckIfEnglish( str )
{  
if(/[a-z]/.test(str)&&/[0-9]/.test(str)){
return true;
}else{
return false;
}
}
function checkdate()  {

  if (Form.name.value=="") {      alert("请输入姓名！");Form.name.focus();      return false;    }
  if (Form.name.value!=="<%=rsb("name")%>") {      alert("您输入的姓名与您所登记的不相符！");Form.name.focus();      return false;    }
  if (Form.R1.value=="") {      alert("请选择姓别！");Form.R1.focus();      return false;    }
  if (Form.dqldr.value==0) {      alert("请选择领导人，如有疑问请联系推荐人！");Form.dqldr.focus();      return false;    }
  if (Form.ypa2j.value=="") {      alert("请填入您的二级密码！");  Form.ypa2j.focus();      return false;    } 
  if (hex_md5(Form.ypa2j.value) != "<%=md5(rsb("password3"))%>") {      alert("您填入的二级密码与您所登记的不相符！");  Form.ypa2j.focus();      return false;    }
  if (Form.gaqq.value=="") {      alert("请输入QQ！");Form.gaqq.focus();      return false;    }
  if (Form.gaqq.value!=="<%=rsb("qq")%>") {      alert("您输入的qq与您所登记的不相符！");Form.gaqq.focus();      return false;    }
  if (Form.ceid.value=="") {      alert("请填入您的身份证号码！");  Form.ceid.focus();      return false;    }
  if (hex_md5(Form.ceid.value) != "<%=md5(rsb("userid"))%>") {      alert("您填入的身份证号码与您所登记的不相符！");  Form.ceid.focus();      return false;    }

	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("../vip/sms.asp", data, function(data) {
		$("#btn").removeAttr("disabled");
		if (data != "success") { alert("手机验证码发送失败"); return false; }
		alert("手机验证码发送成功");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.newcode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.newcode.focus();   return false;    }
  return true;
}
</script>
<%
if userreg<>"" and ypa2j<>"" and mycode<>"" then
if rsb("password3")<>ypa2j then
   response.write "<script language='javascript'>"
   response.write "alert('您填入的二级密码与您所登记的不相符，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rsb("userid")<>ceiduser then
   response.write "<script language='javascript'>"
   response.write "alert('您填入的身份证号码与您所登记的不相符！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rsb("vipsq")<>mycode then
   response.write "<script language='javascript'>"
   response.write "alert('您填入的手机验证码不正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
  set rs_d1 = Server.CreateObject("ADODB.Recordset")
  sql_d1 = "SELECT * FROM enter where user='"&rsb("username")&"'"
  rs_d1.open sql_d1,connth,2,3
  If rs_d1.eof or rs_d1.bof Then
  rs_d1.addnew
  rs_d1("user")=rsb("username")
  rs_d1("jb")=rsb("sjb")
  rs_d1("userup")=rsb("up")
  rs_d1("name")=rsb("name")
  rs_d1("xb")=request("r1")
  rs_d1("userid")=rsb("userid")
  rs_d1("call")=rsb("call")
  rs_d1("qq")=rsb("qq")
  rs_d1("addsheng")=rsb("addsheng")
  rs_d1("addshi")=rsb("addshi")
  rs_d1("addldr")=request("dqldr")
  rs_d1.update
  End if
Response.Write "<script language=""JavaScript"">alert('报名成功，请等待审核！');location.replace('revise.asp?user="&rsb("username")&"');</script>"
Response.End  
end if
end if
%>
<body topmargin="0">
<form method="POST" action="bmuser.asp" name="Form" id="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="remark" size="5" value="13" readonly>
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	<p>　</p>
	<p><b><font color="#FF0000">请核对您的报名信息！</font></b></p>
	<table border="0" id="table1" height="396" width="70%">
		<tr>
			<td width="186" align="right">用户名：</td>
			<td width="433" align="left"><input type="text" name="user" size="12" value="<%=rsb("username")%>" readonly><font size="2" color="#000080">此处显示您第一个用户名</font></td>
		</tr>
		<tr>
			<td width="186" align="right">姓名：</td>
			<td width="433" align="left"><input type="text" name="name" size="20"><%=left(rsb("name"),1)%>**</td>
		</tr>
		<tr>
			<td width="186" align="right">姓别：</td>
			<td width="433" align="left"><input type="radio" value="男" name="R1">男<input type="radio" name="R1" value="女">女</td>
		</tr>
		<tr>
			<td width="186" align="right">目前地区：</td>
			<td width="433" align="left"><%=rsb("addsheng")%><%=rsb("addshi")%></td>
		</tr>
		<tr>
			<td width="186" align="right">所属领导人：</td>
			<td width="433" align="left"><select size="1" name="dqldr">
			<option selected value="0">==请选择==</option>
			<option value="瞿宗（四川达州）">瞿宗（四川达州）</option>
			<option value="刘晓兵（四川达州）">刘晓兵（四川达州）</option>
			<option value="陶锦余（重庆）">陶锦余（重庆）</option>
			<option value="崔向荣（云南）">崔向荣（云南）</option>
			<option value="崔珑枥（云南）">崔珑枥（云南）</option>
			<option value="马本礼（云南）">马本礼（云南）</option>
			<option value="朱龙敏（贵州）">朱龙敏（贵州）</option>
			<option value="刘锁成（广西）">刘锁成（广西）</option>
			<option value="齐爱伟（广东/浙江）">齐爱伟（广东/浙江）</option>
			<option value="齐爱绿（广东/浙江）">齐爱绿（广东/浙江）</option>
			<option value="黄志成（福建）">黄志成（福建）</option>
			<option value="徐宝华（福建）">徐宝华（福建）</option>
			<option value="张意社（上海）">张意社（上海）</option>
			<option value="丁兰美（江苏）">丁兰美（江苏）</option>
			<option value="吴爱华（江苏）">吴爱华（江苏）</option>
			<option value="刘美君（山东青岛城阳区）">刘美君（山东青岛城阳区）</option>
			<option value="杨素萍（山东青岛市北区）">杨素萍（山东青岛市北区）</option>
			<option value="金克文（山东济南）">金克文（山东济南）</option>
			<option value="李永利（山东德洲）">李永利（山东德洲）</option>
			<option value="赵杰（山西朔州）">赵杰（山西朔州）</option>
			<option value="郭银霞（山西大同）">郭银霞（山西大同）</option>
			<option value="高昕（山西宁武）">高昕（山西宁武）</option>
			<option value="吴成勤（内蒙包头）">吴成勤（山西太原）</option>
			<option value="李淑香（内蒙包头黄河区）">李淑香（内蒙包头黄河区）</option>
			<option value="李德宝（内蒙包头/呼和浩特）">李德宝（内蒙包头/呼和浩特）</option>
			<option value="刘振华（河北唐山）">刘振华（河北唐山）</option>
			<option value="刘宇（河北石家庄）">刘宇（河北石家庄）</option>
			<option value="马京敏（河北保定/曲阳）">马京敏（河北保定/曲阳）</option>
			<option value="崔树鹏（河北邯郸）">崔树鹏（河北邯郸）</option>
			<option value="靳宾社（天津）">靳宾社（天津）</option>
			<option value="张振涛（北京）">张振涛（北京）</option>
			<option value="林月宽（北京）">林月宽（北京）</option>
			<option value="赵利明（北京）">赵利明（北京）</option>
			<option value="杨喜春（辽宁锦州）">杨喜春（辽宁锦州）</option>
			<option value="李振玉（辽宁葫芦岛）">李振玉（辽宁葫芦岛）</option>
			<option value="胜利（辽宁鞍山）">胜利（辽宁鞍山）</option>
			<option value="王虹（辽宁大连）">王虹（辽宁大连）</option>
			<option value="王瑜（黑龙江）">王瑜（黑龙江）</option>		
			</select><b><font color="#FF0000" size="2"> **请认真选择领导人（地区为参考）</font></b></td>
		</tr>
		<tr>
			<td width="186" align="right">二级密码：</td>
			<td width="433" align="left"><input type="password" name="ypa2j" size="20"></td>
		</tr>
		<tr>
			<td width="186" align="right">联系手机：</td>
			<td width="433" align="left"><%=left(rsb("call"),3)%>*****<%=right(rsb("call"),3)%></td>
		</tr>
		<tr>
			<td width="186" align="right">联系QQ：</td>
			<td width="433" align="left"><input type="text" name="gaqq" size="20" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="12" ><%=left(rsb("qq"),3)%>***<%=right(rsb("qq"),3)%></td>
		</tr>
		<tr>
			<td width="186" align="right">身份证号码：</td>
			<td width="433" align="left"><font color="#0000FF"><input type="text" name="ceid" size="20" maxlength="19"></font><%=left(rsb("userid"),4)%>**********<%=right(rsb("userid"),4)%></td>
		</tr>
		<tr>
			<td width="186" align="right">手机验证码：</td>
			<td width="433" align="left"><input type="text" name="newcode" size="10" onKeyUp="value=value.replace(/[\W]/g,'')"> <input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></td>
		</tr>
		<tr>
			<td width="186" align="right" height="43"><p align="center">　</td>
			<td width="433" align="right" height="43"><span style="font-size: 9pt"><font size="1"><input type="submit" value="提交报名" name="B1" style="font-family: 楷体_GB2312; font-size: 12pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	<p><b><font color="#FF0000" size="6">报名须知</font></b></p>
	<p><font color="#0000FF">选择领导人是选择最接近您的上级领导人（不可乱选，否则不能通过审核），请先联系您的推荐老师再报名；</font></p>
	<p><font color="#FF00FF">未满十八周岁不得参加，超过六十周岁不得参加，公司会议不得儿戏，不得携带孩子老人全家参加；</font></p>
	<p><font color="#FF00FF">报名前请先认真阅读《<a target="_blank" href="2015缘聚暹罗-活动调查问卷.doc">活动调查问卷</a>》，报名审核通过后方可定票，请打印该问卷并亲自填写，出行时随身携带。</font></div>
</form>