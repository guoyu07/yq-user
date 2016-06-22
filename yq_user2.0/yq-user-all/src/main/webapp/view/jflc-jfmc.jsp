<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('游戏收益未完成，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('请于开户后第二天再进行卖出操作，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('卖出单价不能小于 ${fcxt.zdj} ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('卖出单价不能大于${fcxt.jygj+0.03}  哦！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，您卖出数量不能小于零，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('您好，为了提供更公平公证的交易规则，累计挂牌最高20笔，待交易完成后才可以继续发布，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('您好，您卖出数量不能大于您剩余数量 ${gcuser.jyg} ，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('交易市场已有求购信息，请按需求点击 [我要卖给] ！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('单笔卖出数量不能大于 1000 哦!');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
<script language="JavaScript">
 function checkdate()  {  
  if (Form.jygj.value=="") {      alert("请输入需要卖出的单价!");  Form.jygj.focus();    return false;    } 
  if (Form.jygj.value<${fcxt.zdj}) {      alert("卖出单价不能小于 ${fcxt.zdj} !");  Form.jygj.focus();    return false;    }
  if (Form.jygj.value>${fcxt.jygj}) {      alert("卖出单价不能大于 ${fcxt.jygj} 哦!");  Form.jygj.focus();    return false;    } 
    if (!chkinteger1(Form.jygj.value)){
	alert('卖出单价只能为数字!');
	document.Form.jygj.focus;
	return (false);
 }
function chkinteger1(checkStr1)
{
var re=/^(0|[1-9]+)\.\d{0,2}$|^(0|[1-9]+)$/;
return re.test(checkStr1)
}
  if (Form.txpay.value=="") {      alert("请输入需要卖出的数量!");  Form.txpay.focus();    return false;    } 
  if (Form.txpay.value==0) {      alert("卖出数量不能为零!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('卖出数量只能为整字!');
	document.Form.txpay.focus;
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
  if (Form.txpay.value<10) {      alert("卖出数量不能小于10积分!");      return false;    }
  if (Form.txpay.value>3000) {      alert("单笔卖出数量不能大于3000积分!");      return false;    }
  if (Form.txpay.value>${gcuser.jyg}) {      alert("你的卖出数量不能大于你剩余的数量 ${gcuser.jyg} 哦!");      return false;    } 
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");   Form.pa3.focus();   return false;    } 
  return true;  }  
 </script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>

				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>发布积分卖出</span>
					</div>
					<div class="content-form">
						<p>您当前的积分剩余：:<strong>${gcuser.jyg}</strong>，当前的交易价为：<strong><c:if test="${fcxt.jygj<1}">${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1}">${fcxt.jygj}</c:if></strong></p>
						<form class="form form1 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="mcsl?status=1">
							<p><label>用户名：</label>${userName}</p>
							<p><label>卖出单价：</label><input type="text" name="jygj" size="10" maxlength="4"></p>
							<p><label>卖出数量：</label><input type="text" name="txpay"><font style="font-size: 9pt" color="#FF0000"> ** 可卖出为：</font><font style="font-size: 9pt" color="#008000">${gcuser.jyg}</font></p>
							<p><label>二级密码：</label><input type="password" name="pa3"></p>
							<p><label></label><button class="but1 but2"  type=submit>确 定 卖 出</button></p>
						</form>
						<p class="z-tc">提示：如写入卖出的单价过高，买家可能会不接受，容易导致出售不成功，请慎重发布！</p>
					</div>
				</div>
				<div class="content-box2 mt10">
					<div class="content-title">
						<span>当前求购明细</span>
					</div>
					<c:if test="${empty dataList}">
						<div class="content-tisp">
							<h5>暂无记录</h5>
						</div>
					</c:if>
					<c:if test="${not empty dataList}">
					<div class="content-table">
						<table>
							<tr>
								<th width="75">用户名</th>
								<th>卖出</th>
								<th>剩余</th>
								<th>挂牌时间</th>
								<th>当前价格</th>
								<th>修改价格</th>
								<th>操作</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td>${data.mcsl}</td>
								<td>${data.sysl}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td>${data.pay}</td>
			                    <td><a href="/diyjygj?sgid=${data.id}">修改价格</a></td>
			                    <td><c:if test="${data.newjy!=3}"><a href="qxyjg?qxid=${data.id}" style="text-decoration: none">撒销</a></c:if></td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag /></p>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>