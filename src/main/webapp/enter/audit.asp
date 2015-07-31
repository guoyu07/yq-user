<!--#include file="../ct0618.asp"-->
<!--#include file="../th.asp"-->
<%
cjpaa=request("cjpa")
reusera=request("reuser")
%>
<form method="POST" name="form" action="audit.asp">
<p align="center">操作密码：<input type="password" name="cjpa" size="10" value="<%=cjpaa%>"> 搜索用户名：<input type="text" name="reuser" size="15" value="<%=reusera%>"><input type="submit" value="提交" name="B1">
</form>
<%
set rs= Server.CreateObject("ADODB.Recordset")
sql= "SELECT * FROM enter where user='"&request("reuser")&"'and audit=1 "
rs.open sql,connth,1,3
if rs.eof or rs.bof Then
   response.write "<script language='javascript'>"
   response.write "alert('输入的用户名有误或未经过初审，请重新输入！-"&request("reuser")&"');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif request("cjpa")<>"hdbm2015" then
   response.write "<script language='javascript'>"
   response.write "alert('操作密码不正确，请重新输入！aaa');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif request("act")<>"" then
if request("cjpa")<>"hdbm2015" then
   response.write "<script language='javascript'>"
   response.write "alert('操作密码不正确，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif request("R1")=2 then
   rs("audit")=0
   rs("audit2")=0
   rs.update
   Response.Write "<script language=""JavaScript"">alert('设置[不通过二次审核]成功！');location.href='javascript:self.close()';</script>"
   Response.End
elseif request("R1")=1 then
   rs("audit2")=1
   rs("addldr")=request("adqldr")
   rs("dicadd")=request("dicadd")
   rs("huzhao")=request("huzhao")
   rs("dictgc")=request("dictgc")
   rs("dictnumber")=request("dictnumber")
   rs("qucheng")=request("qucheng")
   rs("hucheng")=request("hucheng")
   rs("auditbz")=request("auditbz")
   rs.update
   Response.Write "<script language=""JavaScript"">alert('设置[通过二次审核]或[修改信息]成功！');location.replace('audit.asp?reuser="&request("reuser")&"');</script>"
   Response.End
end if
end if
%>
<script language="JavaScript">
function checkdate()  {

  if (Form.dicadd.value==0) {      alert("请选择您已买票的出发机场，如未买票请不要选择！");  Form.dicadd.focus();      return false;    } 
  if (Form.huzhao.value=="") {      alert("请填入您的护照号码，如未买票请不要填写！");  Form.huzhao.focus();      return false;    } 
  if (Form.dictgc.value=="") {      alert("请填入您已买票的航空公司，如未买票请不要填写！");  Form.dictgc.focus();      return false;    } 
  if (Form.dictnumber.value=="") {      alert("请填入您已买票的航班编号，如未买票请不要填写！");  Form.dictnumber.focus();      return false;    }
  if (Form.qucheng.value=="") {      alert("请填入您航班出发起飞XX时XX分，如未买票请不要填写！");  Form.qucheng.focus();      return false;    }
  if (Form.hucheng.value=="") {      alert("请填入您航班回程起飞XX时XX分，如未买票请不要填写！");  Form.hucheng.focus();      return false;    }
  if (Form.R1.value=="") {      alert("请选择审核类别！");    return false;    }
  
  return true;  } 

</script>
	</p>
<form method="POST" action="audit.asp?act=1828" name="Form" onSubmit="return checkdate()">
<div align="center">
	<table border="0" width="50%" id="table2" height="100%">
		<tr>
			<td align="right">用户名：</td>
			<td align="left"><%=rs("user")%><input type="hidden" name="reuser" size="15" value="<%=rs("user")%>"></td>
		</tr>
		<tr>
			<td align="right">姓名：</td>
			<td align="left"><%=rs("name")%></td>
		</tr>
		<tr>
			<td align="right">性别：</td>
			<td align="left"><%=rs("xb")%></td>
		</tr>
		<tr>
			<td align="right">身份证号码：</td>
			<td align="left"><%=rs("userid")%></td>
		</tr>
		<tr>
			<td align="right">开户地区：</td>
			<td align="left"><%=rs("addsheng")%><%=rs("addshi")%></td>
		</tr>
		<tr>
			<td align="right">联系手机：</td>
			<td align="left"><%=rs("call")%></td>
		</tr>
		<tr>
			<td align="right">QQ：</td>
			<td align="left"><%=rs("qq")%></td>
		</tr>
		<tr>
			<td align="right">所属于领导人：</td>
			<td align="left"><select size="1" name="adqldr">
			<option selected value="<%=rs("addldr")%>"><%=rs("addldr")%></option>
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
			</select></td>
		</tr>
		<tr>
			<td align="right">出发机场：</td>
			<td align="left">
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
			<td align="right">护照号码：</td>
			<td align="left"><input type="text" name="huzhao" size="20" value="<%=rs("huzhao")%>" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td align="right">航空公司：</td>
			<td align="left"><input type="text" name="dictgc" size="20" value="<%=rs("dictgc")%>"></td>
		</tr>
		<tr>
			<td align="right">航班编号：</td>
			<td align="left"><input type="text" name="dictnumber" size="20" value="<%=rs("dictnumber")%>" onKeyUp="value=value.replace(/[\W]/g,'')"><input type="hidden" name="cjpa" size="10" value="<%=request("cjpa")%>"></td>
		</tr>
		<tr>
			<td align="right">出发起飞时间：</td>
			<td align="left">2015年07月11日<input type="text" name="qucheng" size="5" value="<%=rs("qucheng")%>" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="4" ><font size="2" color="#FF0000">24小时制如：0920</font></td>
		</tr>
		<tr>
			<td align="right">回程起飞时间：</td>
			<td align="left">2015年07月15日<input type="text" name="hucheng" size="5" value="<%=rs("hucheng")%>" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="4" ><font size="2" color="#FF0000">24小时制如：0920</font></td>
		</tr>
		<tr>
			<td align="right">二次审核状态：</td>
			<td align="left"><font color="#0000FF"><%if rs("audit2")=1 then%>完全通过<%else%>等待二审，尽快填写机票信息。<%end if%></font></td>
		</tr>
		<tr>
			<td align="right">备注：</td>
			<td align="left"><textarea rows="3" name="auditbz" cols="35"><%=rs("auditbz")%></textarea></td>
		</tr>
		<tr>
			<td align="right">二次审核操作：</td>
			<td align="left"><input type="radio" name="R1" value="2">不通过二次审核<input type="radio" value="1" name="R1" <%if rs("audit2")=1 then%>checked<%end if%>>通过二次审核</td>
		</tr>
		<tr>
			<td align="right">　</td>
			<td align="left"><input type="submit" value="提交" name="B1" onClick="return confirm('提示：您确定了吗？')" ></td>
		</tr>
	</table>
</div>
</form>