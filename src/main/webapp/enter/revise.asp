<!--#include file="../ct0618.asp"-->
<!--#include file="../vip/cfvip.asp"-->
<!--#include file="../th.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
   bmuser=request("user")
   gpa2j1=LCase(request("newpa2j1"))
   ypa2j=request("ypa2j")
   ceiduser=request("ceid")
   mycode=request("newcode")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from enter where user ='"&bmuser&"'"
rs.open sql,connth,1,3
If rs.eof or rs.bof Then
   response.write "<script language='javascript'>"
   response.write "alert('请先报名！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2="select * from gcuser where username ='"&bmuser&"'"
rs2.open sql2,conn2,1,1
if rs2.eof and rs2.bof then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您的用户名不存在或有误，请重新输入，谢谢！');"
   response.write "top.location.replace('../index.asp');"
   response.write "</script>"
   response.end
end if
%>
<%
if request("user")<>"" and ypa2j<>"" and mycode<>"" then
if rs2("password3")<>ypa2j then
   response.write "<script language='javascript'>"
   response.write "alert('您填入的二级密码与您所登记的不相符，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs2("userid")<>ceiduser then
   response.write "<script language='javascript'>"
   response.write "alert('您填入的身份证号码与您所登记的不相符！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs2("vipsq")<>mycode then
   response.write "<script language='javascript'>"
   response.write "alert('您填入的手机验证码不正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   rs("dicadd")=request("dicadd")
   rs("huzhao")=request("huzhao")
   rs("dictgc")=request("dictgc")
   rs("dictnumber")=request("dictnumber")
   rs("qucheng")=request("qucheng")
   rs("hucheng")=request("hucheng")
   rs.update
Response.Write "<script language=""JavaScript"">alert('资料更新成功，请等待第二次审核！');location.replace('revise.asp?user="&rs("user")&"');</script>"
Response.End   
end if
end if
%>
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

  if (Form.dicadd.value==0) {      alert("请选择您已买票的出发机场，如未买票请不要选择！");  Form.dicadd.focus();      return false;    } 
  if (Form.huzhao.value=="") {      alert("请填入您的护照号码，如未买票请不要填写！");  Form.huzhao.focus();      return false;    } 
  if (Form.dictgc.value=="") {      alert("请填入您已买票的航空公司，如未买票请不要填写！");  Form.dictgc.focus();      return false;    } 
  if (Form.dictnumber.value=="") {      alert("请填入您已买票的航班编号，如未买票请不要填写！");  Form.dictnumber.focus();      return false;    }
  if (Form.qucheng.value=="") {      alert("请填入您航班出发起飞XX时XX分，如未买票请不要填写！");  Form.qucheng.focus();      return false;    }
  if (Form.hucheng.value=="") {      alert("请填入您航班回程起飞XX时XX分，如未买票请不要填写！");  Form.hucheng.focus();      return false;    }
  if (Form.ypa2j.value=="") {      alert("请填入您的二级密码！");  Form.ypa2j.focus();      return false;    } 
  if (hex_md5(Form.ypa2j.value) != "<%=md5(rs2("password3"))%>") {      alert("您填入的二级密码与您所登记的不相符！");  Form.ypa2j.focus();      return false;    }
  if (Form.gaqq.value=="") {      alert("请输入QQ！");Form.gaqq.focus();      return false;    }
  if (Form.gaqq.value!=="<%=rs2("qq")%>") {      alert("您输入的qq与您所登记的不相符！");Form.gaqq.focus();      return false;    }
  if (Form.ceid.value=="") {      alert("请填入您的身份证号码！");  Form.ceid.focus();      return false;    }
  if (hex_md5(Form.ceid.value) != "<%=md5(rs2("userid"))%>") {      alert("您填入的身份证号码与您所登记的不相符！");  Form.ceid.focus();      return false;    }

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
<%if rs("audit")=0 then%>
<p>　</p>
<p align="center"><b>您的报名信息正在审核中，请常登录关注最新状态。</b></p>
<p align="center"><font color="#FF00FF">请再次认真阅读《<a target="_blank" href="2015缘聚暹罗-活动调查问卷.doc">活动调查问卷</a>》，报名审核通过后，系统会给您提示方可自行购机票并请打印该问卷并亲自填写，出行时随身携带。</font>
<p align="center"><font color="#FF00FF">报名审核通过后需要准备以下资料：</font><font color="#0000FF">护照，机票。</font>
<%elseif rs("audit")=2 then%>
<p align="center"><b>您的报名信息不能通过，详细请联系客服或市场助理。</b></p>
<%elseif rs("audit")=1 then%>
<p align="center"><font color="#FF00FF">恭喜您的报名已通过初审，请再次认真阅读《<a target="_blank" href="2015缘聚暹罗-活动调查问卷.doc">活动调查问卷</a>》，可自行购机票并请打印该问卷并亲自填写，出行时随身携带。</font>
<p align="center"><b>机票买到泰国曼谷的素万那普国际机场；请购买往返机票，出发前请将机票往返行程单都打印好。</b></p>
<p align="center"><font color="#008000"><b>出发时间：2015年07月11日 返程时间：2015年07月15日</b></font></p>
<form method="POST" action="revise.asp" name="Form" id="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="remark" size="5" value="13" readonly>
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
<div align="center">
	<table border="0" width="50%" id="table2" height="102%">
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">用户名：</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><b><font color="#FF0000" size="2"><%=rs("user")%></font></b><input type="hidden" name="user" size="15" value="<%=rs("user")%>" readonly></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">姓名：</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><font size="2"><%=left(rs("name"),1)%>*<%=right(rs("name"),1)%></font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">性别：</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><font size="2"><%=rs("xb")%></font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">开户地区：</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><font size="2"><%=rs("addsheng")%><%=rs("addshi")%></font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">所属于领导人：</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><font size="2"><%=rs("addldr")%></font></td>
		</tr>
		<tr>
			<td align="right" colspan="2" bgcolor="#E0E0E0"><p align="center"><b><font color="#FF0000">以下信息非常重要，请您对照您已买票的票面信息认真填写！</font></b></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">出发机场：</td>
			<td align="left" width="65%" bgcolor="#E0E0E0">
			<select size="1" name="dicadd">
			<option selected value="<%if rs("dicadd")<>"" then%><%=rs("dicadd")%><%else%>0<%end if%>"><%if rs("dicadd")<>"" then%><%=rs("dicadd")%><%else%>==请买票后才能选择==<%end if%></option>
			<option value="北京（PEK）首都机场">北京（PEK）首都机场</option>
			<option value="天津（TSN）滨海机场">天津（TSN）滨海机场</option>
			<option value="上海（SHA）浦东机场">上海（SHA）浦东机场</option>
			<option value="重庆（CKG）江北机场">重庆（CKG）江北机场</option>
			<option value="广东省深圳（SZX）宝安机场">广东省深圳（SZX）宝安机场</option>
			<option value="广东省广州（CAN）白云机场">广东省广州（CAN）白云机场</option>
			<option value="广东省揭阳（SWA）潮汕机场">广东省揭阳（SWA）潮汕机场</option>
			<option value="云南省昆明（KMG）长水机场">云南省昆明（KMG）长水机场</option>
			<option value="湖南省长沙（CSX）黄花机场">湖南省长沙（CSX）黄花机场</option>
			<option value="广西省南宁（NNG）吴圩机场">广西省南宁（NNG）吴圩机场</option>
			<option value="广西省桂林（KWL）两江机场">广西省桂林（KWL）两江机场</option>
			<option value="陕西省西安（XIY）咸阳机场">陕西省西安（XIY）咸阳机场</option>
			<option value="湖北省武汉（WUH）天河机场">湖北省武汉（WUH）天河机场</option>
			<option value="海南省海口（HAK）美兰机场">海南省海口（HAK）美兰机场</option>
			<option value="福建省福州（FOC）长乐机场">福建省福州（FOC）长乐机场</option>
			<option value="四川省成都（CTU）双流机场">四川省成都（CTU）双流机场</option>
			<option value="福建省厦门（XMN）高崎机场">福建省厦门（XMN）高崎机场</option>
			<option value="安徽省合肥（HFE）新桥机场">安徽省合肥（HFE）新桥机场</option>
			<option value="辽宁省大连（DLC）周水子机场">辽宁省大连（DLC）周水子机场</option>
			<option value="河南省郑州（CGO）新郑机场">河南省郑州（CGO）新郑机场</option>
			<option value="贵州省贵阳（KWE）龙洞堡机场">贵州省贵阳（KWE）龙洞堡机场</option>
			<option value="浙江省宁波（NGB）栎社机场">浙江省宁波（NGB）栎社机场</option>
			<option value="江苏省无锡（WUX）苏南硕放机场">江苏省无锡（WUX）苏南硕放机场</option>
			<option value="山东省济南（TNA）遥墙机场">山东省济南（TNA）遥墙机场</option>
			<option value="浙江省杭州（HGH）萧山机场">浙江省杭州（HGH）萧山机场</option>
			<option value="黑龙江哈尔滨（HRB）太平机场">黑龙江哈尔滨（HRB）太平机场</option>
			<option value="江西省南昌（KHN）昌北机场">江西省南昌（KHN）昌北机场</option>
			<option value="宁夏省银川（INC）河东机场">宁夏省银川（INC）河东机场</option>
			<option value="内蒙古包头（BAV）二里半机场">内蒙古包头（BAV）二里半机场</option>
			<option value="山东省青岛（TAO）流亭机场">山东省青岛（TAO）流亭机场</option>
			</select></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">护照号码：</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><input type="text" name="huzhao" size="20" value="<%=rs("huzhao")%>" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">航空公司：</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><input type="text" name="dictgc" size="20" value="<%=rs("dictgc")%>"></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">航班编号：</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><input type="text" name="dictnumber" size="20" value="<%=rs("dictnumber")%>" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">出发起飞时间：</td>
			<td align="left" width="65%" bgcolor="#E0E0E0">2015年07月11日<input type="text" name="qucheng" size="5" value="<%=rs("qucheng")%>" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="4" ><font size="2" color="#FF0000">24小时制如：0920</font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">回程起飞时间：</td>
			<td align="left" width="65%" bgcolor="#E0E0E0">2015年07月15日<input type="text" name="hucheng" size="5" value="<%=rs("hucheng")%>" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="4" ><font size="2" color="#FF0000">24小时制如：0920</font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">审核状态：</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><font color="#0000FF"><%if rs("audit2")=1 then%>完全通过(请不要再修改机票信息)<%else%>等待二审，尽快填写机票信息。<%end if%></font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">二审备注：</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><%=rs("auditbz")%></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">二级密码：</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><input type="password" name="ypa2j" size="20"></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">联系手机：</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><%=left(rs("call"),3)%>*****<%=right(rs("call"),3)%></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">联系QQ：</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><input type="text" name="gaqq" size="20" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="12" ><%=left(rs("qq"),3)%>***<%=right(rs("qq"),3)%></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">身份证号码：</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><font color="#0000FF"><input type="text" name="ceid" size="20" maxlength="19"></font><%=left(rs("userid"),6)%>******<%=right(rs("userid"),6)%></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">手机验证码：</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><input type="text" name="newcode" size="10" onKeyUp="value=value.replace(/[\W]/g,'')"> <input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B3"></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">　</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><input type="submit" value="提交更新" name="B2" onClick="return confirm('提示：您确定了吗？')" ></td>
		</tr>
	</table>
</div>
</form>
<%end if%>