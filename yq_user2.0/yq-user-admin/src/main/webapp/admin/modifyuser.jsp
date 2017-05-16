<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('国际编码不存在！');location.href='/admin/modifyaabuser?userid=${userid}';</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('用户资料修改成功！');location.href='/admin/modifyaabuser?userid=${userid}';</script></c:if>
<c:if test="${erroCodeNum==777}"><script language=javascript>alert('含非法字符！');location.href='/admin/modifyaabuser?userid=${userid}';</script></c:if>
<html><head><title>会员资料查看</title>
<style>
<!--
p{color:000000;FONT-FAMILY: "??"; font-size: 9pt ;line-height: 20px;}
p{color:000000;FONT-FAMILY: "宋体"; font-size: 9pt ;line-height: 18px;}
-->
</style>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">

</body>
</html>
<div align="center">
<font face="宋体" style="font-size: 11pt">
</font><form name="form" METHOD="POST" action="/admin/modifyaabuser?userid=${userid}&status=1">
    <div align="center">
      <center>
    　<table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="359">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> <b><font style="font-size: 11pt">修改会员信息</font></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="29" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF">
		<b><font size="3">用户名：</font></b></td>
        <td width="62%" align="left" height="29" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF">
		<font color="#FF0000" size="3"><b>${gcuser.username}&nbsp;&nbsp; </b> </font>
		<b><font size="3">推荐人：</font><font color="#000080" size="3">${gcuser.up}</font></b></td>
      </tr>
      
      
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">登录密码：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input name="password" size="20"></span></font><font style="font-size: 11pt"><font color="#FF0000">**不修改请留空</font> </font> </td>
      </tr>
      <c:if test="${role.roleLevel<6}">
            <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">验证码：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体">
        <c:if test="${gcuser.vipsq=='252493618'}">无</c:if><c:if test="${gcuser.vipsq!='252493618'}"><%-- ${gcuser.vipsq} --%></c:if>----所属vip服务中心：${gcuser.vipname}
        </font><font style="font-size: 11pt"></font> </td>
      </tr>
 <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">提现密码：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input name="password3" value="${gcuser.password3}" size="20"></span></font><font color="#FF0000" style="font-size: 11pt"> **必须填写</font><font style="font-size: 11pt"></font></td>
      </tr>
      </c:if>
                  <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">之前送的报单币：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体">${gcuser.syep}</font><font style="font-size: 11pt"></font> </td>
      </tr>
      
                        <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">服务中心转：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体">${gcuser.vippay}</font><font style="font-size: 11pt"></font> </td>
      </tr>
      
                        <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">可开户报单币：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体">${gcuser.sybdb}</font><font style="font-size: 11pt"></font> </td>
      </tr>
      
                        <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">金币：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体">${gcuser.jydb}</font><font style="font-size: 11pt"></font> </td>
      </tr>
      
                        <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">积分：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体">${gcuser.jyg}</font><font style="font-size: 11pt"></font> </td>
      </tr>
      
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">姓 名：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt"><input name="name" value="${gcuser.name}" size="20"></font> <c:if test="${gcuser.vip==0}">普通用户</c:if><c:if test="${gcuser.vip==3}">小vip</c:if><c:if test="${gcuser.vip==2}">【大vip】</c:if></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">开户行：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><select size="1" name="bank">
		<option selected>${gcuser.bank}</option>
		<option>工商银行</option>
		<option>建设银行</option>
		<option>农业银行</option>
		<option>中国银行</option>
		<option>贝宝</option>
		<option>支付宝</option>
		</select>-------------
		<c:if test="${gcuser.sjb>0}"><b>双区会员：<font color="#FF0000">${gcuser.sjb}</font>单</b></span></font></c:if>
		</td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">银行卡号：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=32 name="card" size="30" value="${gcuser.card}"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><b><font style="font-size: 11pt">Email</font></b><font style="font-size: 11pt">：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=64 name="email" value="${gcuser.email}" size="30"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font color="#FF0000" style="font-size: 11pt"><b>QQ：</b></font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=12 name="qq" value="${gcuser.qq}" size="30" style="background-color: #E1FFF3"></span></font><font style="font-size: 11pt"></font></td>
      </tr>
       <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">电话号码：</font>
        <select  id="areaCode" name="areaCode">
							<option selected= "selected" value="${interRegionCode.country}">${interRegionCode.country_name}</option>
							   <s:iterator  var="data" value="areaCodeList">
									<option  value="${data.country}">${data.country_name}</option>
								</s:iterator>
		</select>
		</td>
        <!-- <td align="right" width="10%" height="30">
							</td> -->
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=12 name="call" value="${gcuser.call}" size="22" style="padding:0; background-color: #FFFFFF; color:#0000FF">&nbsp;<b>继承人：</b><input type="text" name="jcname" size="10" value="${gcuser.jcname}"></span></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt" color="#FF0000">身份证号码：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=19 name="userid2" value="${gcuser.userid}" size="22" style="padding:0; background-color: #FFFFFF; color:#FF0000">&nbsp;<b>身份证：</b><input type="text" name="jcuserid" size="22" value="${gcuser.jcuserid}"></span></font></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">地址：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=64 name="address" value="${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}" size="50"></span></font><font style="font-size: 11pt"></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">会员注册日期：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" name="regtime" size="30" value="${gcuser.regtime}" readonly></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">成为管理时间：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=20 name="dldate" value="${gcuser.dldate}" size="30" readonly>&nbsp;</span><c:if test="${fcxt.id==1||fcxt.id==2}"><b><font style="font-size: 11pt"><a target="_blank" href="dluser?uid=${gcuser.username}" style="text-decoration: none">管理设置</a></font></b></c:if></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#C9D8AD"><font style="font-size: 11pt">最近登录时间：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#C9D8AD"> <font face="宋体"><span style="font-size: 11pt">
		<input type="text" maxlength=20 name="dldate1" value="${gcuser.logtime}" size="30" readonly></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">级别：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> <font face="宋体"><span style="font-size: 11pt"><input type="text" name="jb" size="10" value="${gcuser.jb}" readonly><font color="#FF0000">&nbsp;</font></span></font><font color="#0000FF" style="font-size: 11pt">2省级管理 3市级管理 4区级管理 5合作商家</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">充值累计：</span></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" name="cjtj" size="15" value="${gcuser.cjtj}" >最近一次充值时间：${gcuser.gmdate}</span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">累计收入：</span></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" name="cbpay" size="15" value="${gcuser.cbpay}" readonly></span></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">余额：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" name="pay" size="15" value="${gcuser.pay}" readonly></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">已提现：</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=6 name="txpay" value="${gcuser.txpay}" size="15"></span></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">提现限制：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=6 name="payok" value="${gcuser.payok}" size="15"><input type="checkbox" maxlength=6 name="updateAllDown" value="ok" />（勾选则更新其下所有同名账号的提现限制） 机票限制：<input type="text" name="pwdate" size="12" value="${gcuser.pwdate}"></span></font></td>
      </tr>
       <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">第三方资料更新：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="checkbox" maxlength=6 name="updateAllDownProperty" value="ok" checked="checked" /></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">诚信指数：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=6 name="cxt" value="${gcuser.cxt}" size="15"></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">协议客户：</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="宋体"><span style="font-size: 11pt"><input type="text" maxlength=6 name="txbl" value="${gcuser.txlb}" size="15">1为是，0为不是--------- <c:if test="${gcuser.sjb>0}"><b>双区会员：<font color="#FF0000">${gcuser.sjb}</font>单</b></span></font></c:if> <a target="_blank" href="http://128b.zgybe.com/shop/index.php?act=seller_login&op=zgybe_viplogin&login_name=${gcuser.username}&sign=${sign}&md5pass=${md5pass}" style="text-decoration: none">进入商家</a></td>
      </tr>
      <tr> 
       <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="22"> 
       <div align="center">
       <c:if test="${role.roleLevel<6}">
       <font face="宋体"><span style="font-size: 11pt"><input type="submit" value="提 交 修 改" name="B1" style="font-weight: bold; font-size:12pt"></span></font>
       </c:if>
       <font face="黑体"><b>
     	<%-- <c:if test="${role.roleLevel<3}"> --%>
		<a style="text-decoration: none" target="_blank" href="<c:if test="${test==1}">http://localhost:8081</c:if><c:if test="${test==0}">http://vip.zgyce.com</c:if>/adminlogin?pa=${gcuser.password}&id=${gcuser.username}">
		<font color="#FF00FF" size="3">登录</font></a></b><font size="3">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</font></font><font color="#FF0000" size="3">&nbsp;&nbsp; </font><a href="/admin/searchuser">
		<font color="#FF0000" size="3">返回搜索</font></a><font color="#FF0000" size="3">&nbsp;&nbsp;&nbsp; </font>
		<b><font size="3">&nbsp;&nbsp;&nbsp;</font>
		<c:if test="${fcxt.id==1||fcxt.id==2}"><a href="usercj?id=${gcuser.username}" style="text-decoration: none"><font color="#000000" size="3">充值</font></a>
		</c:if>
		</b></font>
		<font size="3">&nbsp;&nbsp;&nbsp;</font>
		 <c:if test="${role.roleLevel<6}">
		<a href="updateuservip?user=${gcuser.username}" style="text-decoration: none"><font color="#000000" size="3">【修改vip】</font></a>
		</c:if>
		</b></font>
		<c:if test="${role.roleLevel<2}">
		<a href="updateuserpayok?user=${gcuser.username}" style="text-decoration: none"><font color="#000000" size="3">【修改团队下提现限制】</font></a>
        <a href="modifyaabuserupdateUserAqOrBq?user=${gcuser.username}" style="text-decoration: none"><font color="#000000" size="3">【修改用户可结算区】</font></a>
		</c:if>
		<c:if test="${role.roleLevel<10}">
			<a href="queryDownAllVip?user=${gcuser.username}" style="text-decoration: none"><font color="#FF00FF" size="3">【查看小vip】</font></a>
		</c:if>


		</div>
		
        </td>
      </tr>
    </table>+
      </center>
    </div>
</div>
</form></font>

<table border="1" width="100%" id="table1">
	<tr>
		<td align="center"><c:if test="${role.roleLevel<2}"><iframe name="I4" width="100%" height="200" border="0" frameborder="0" src="jzbdb?jzid=${userid}"></iframe></c:if></td>
		<td align="center"><c:if test="${role.roleLevel<8}"><iframe name="I6" width="100%" height="200" border="0" frameborder="0" src="vipcjb?sfid=${userid}"></iframe></c:if></td>
	</tr>
	<tr>
		<td align="center"><c:if test="${role.roleLevel<2}"><iframe name="I7" width="100%" height="200" border="0" frameborder="0" src="bcjb?bcid=${userid}"></iframe></c:if></td>
		<td align="center"><c:if test="${role.roleLevel<2}"><iframe name="I8" width="100%" height="200" border="0" frameborder="0" src="bcjf?bcid=${userid}"></iframe></c:if></td>
	</tr>
		<tr>
		<td align="center"><c:if test="${role.roleLevel<3}"><iframe name="I9" width="100%" height="200" border="0" frameborder="0" src="epsf?uid=${userid}"></iframe></c:if></td>
		<td align="center"><c:if test="${role.roleLevel<2}"><iframe name="I10" width="100%" height="200" border="0" frameborder="0" src="btpay?uid=${userid}"></iframe></c:if></td>
	</tr>
		<tr>
		<td align="center"><c:if test="${role.roleLevel<2}"><iframe name="I11" width="100%" height="200" border="0" frameborder="0" src="bdbpay?uid=${userid}"></iframe></c:if></td>
		<td align="center"><c:if test="${role.roleLevel<8}"><iframe name="I10" width="100%" height="200" border="0" frameborder="0" src="modifylegalperson?uid=${userid}"></iframe></c:if></td>
	</tr>	
</table>


