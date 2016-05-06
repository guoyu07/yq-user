<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('发布一币数量有误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('您好，您发布的一币数量不能大于您剩余一币  ${gcuser.pay}，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，您有 ${gcuser.vippay}-一币是[服务中心转入]或[游戏收益部分]，此额度不提供卖出，仅用于开户使用，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('您好，您二级密码不正确，请重新输入！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您好，手机验证码不正确，请重新输入！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您好，您发布的一币数量不能小于100，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，您已发布成功过，请耐心等待处理完成后再发布第二笔，或认购方已向您付款，请先确认收款再发布第二笔，谢谢！');history.go(-1);</script></c:if>

<c:if test="${erroCodeNum==-1}"><script language=javascript>alert('您的发布已经成功提交，发布成功后如有认购一币方向您下单后2小时内打到您的收款账号上！请您及时查收！');location.replace('epmcjl');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.txpay.value==0) {      alert("请选择卖出一币的数量!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('卖出一币只能为整字!');
	document.Form.txpay.focus;
	return false;
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
 
  
  if (Form.txpay.value> ${gcuser.pay} ) { <c:if test="${transferType==1}"> alert("您的发布不能大于您可卖的${gcuser.pay-gcuser.vippay}一币哦!"); </c:if> <c:if test="${transferType==2}"> alert("您的发布不能大于您可卖的${gcuser.pay}一币哦!"); </c:if>     return false;    }
  if (Form.txpay.value<100) {      alert("您的发布不能小于100一币!");      return false;    } 
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
	
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=3", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("手机验证码发送失败"); return false; }
		settime($("#btn"));
		alert("手机验证码发送成功");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.ybcodeid.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.ybcodeid.focus();   return false;    }
  return true;
}
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
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
						<div class="z-l">
				<div class="content-box1 new7" style="height:190px;">
					<div class="content-title">
						<span>一币卖出</span>
					</div>
					<div class="content-form">
						 <h4>发布卖出说明:</h4>  
						 <p>1.最低100一币起就可以发布卖出，每次发布需等上一次处理（您确认收到款）了才可以发起第二次，发布成功后我们认购一币—方向下单后2小时内打到您的收款账号上！</p>
						<p style="color: red;">2.一币卖出低于500（含500），交易手续费为15%，高于500为10%。</p>
					</div>
				</div>
				<div class="content-box2 mt10"  style="height:350px;">
					<div style="color: #515151;">
						<p>尊敬的玩家<b style="font-size: 20px;">${gcuser.name}</b>您好！您申请发布后，认购一币-方向您下单后2小时内打到您的收款账号上</p>
						<p>您当前可卖一币为：<b style="color: red"><c:if test="${transferType==1}"><c:if test="${gcuser.pay<1}"> 0${gcuser.pay-gcuser.vippay} </c:if><c:if test="${gcuser.pay>=1}"> ${gcuser.pay-gcuser.vippay} </c:if></c:if><c:if test="${transferType==2}">${gcuser.pay}</c:if></b> 一币</p>
					</div>
					<div class="z-cb">
					<form class="form form3" style="width: 420px; float:left;" method="POST" name="Form" id="Form" onSubmit="return checkdate1()" action="userpay?status=1">
							<p><label>用户名：</label>${userName}</p>
							<p><label>卖出一币数量：</label><select size="1" name="txpay">
								<option selected value="0">=选择卖出数据=</option>
								<option value="100">100</option>
								<option value="200">200</option>
								<option value="500">500</option>
								<option value="1000">1000</option>
								<option value="2000">2000</option>
								<option value="5000">5000</option>
								<option value="10000">10000</option>
								</select></p>
							<p><label>二级密码：</label><INPUT name="pa3" size=15 type=password></p>
							<c:if test="${gcuser.ganew!=0}"><p><label>手机验证码：</label><span  style="width:600px; display: inline-block;margin-right:-600px;"><input type="text" name="ybcodeid" size="15"><input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></span></c:if>
							<p><label></label><button class="but1" type="submit" id="btn"  onClick="return confirm('提示：发布卖出的一币如低于500（含500）交易手续费为15%，高于500的则为10%，您确定了吗？')">发 布 卖 出</button></p>
					</form>
					<div style=" float:left; padding:30px 0 0 30px; ">
						<p>真实姓名：${gcuser.name}</p>
						<p>手机号码：${gcuser.simpleCall}</p>
						<p>收款方式：${gcuser.bank}</p>
						<p>　　账号：${gcuser.card}</p>
						<p>　开户行：${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}支行</p>
					</div>
					</div>
					<div style="color: #515151">
						<p>警告：请认真核对以下收款信息，如有错误请马上点<a href="login2j?inputUrl=login2j.jsp">修改个人资料</a>，再进行发布卖出！如不认真核对，造成付款不成功，
该笔卖出将冻结，申请解冻将加收20%手续费！</p>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"));
</script>