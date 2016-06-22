<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('操作密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('此订单号已经处理过，请不要重复！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('转入的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('您好，不能转给自己，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您好，您转账一币不能小于零，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您好，您转账一币不能大于您剩余一币 ${gcuser.pay} ，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，权限不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！转账成功！');location.replace('/datepay');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<script language="JavaScript"> 
 function checkdate(){  
  if (Form.jzpay.value=="") {      alert("请填写您要转账的一币!");      return false;    } 
  if (Form.jzpay.value<0) {      alert("转账的一币必须大于0!");      return false;    } 
  if (Form.jzuser.value=="") {      alert("请填写您要转入的用户名!");      return false;    }
  if (Form.adgl.value=="") {      alert("请写入操作密码!");      return false;    }
  if (Form.dbz.value=="" && document.getElementById("C1").checked) { alert("请写入商城订单号，必须为数字!"); return false;  }
 }

 
function dbz_show(){
	if (document.getElementById("C1").checked)
		document.getElementById("dbz").style.display="";
	else{
		document.getElementById("dbz").style.display="none";
		document.getElementById("dbz").value="";
	}
}   

</script>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/yblc.jsp" %>
				
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>商城退款</span>
					</div>
					<div class="content-form">				 
						<p class="f-tk c-g">您的用户名是 <span class="c-r">${userName}</span></p>
						<p class="z-b" style="padding-left:70px;">您的一币为：<b class="c-r">${gcuser.pay}</b></p>
						<form class="form form4 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="/glpay?status=1">
						    <p><label class="c-r">转出用户名：</label><input type="text" name="fromUser" size="15" maxlength="20"></p>
							<p><label class="c-r">转入用户名：</label><input type="text" name="jzuser" size="15" maxlength="20"></p>
							<p><label>转账金额：</label><input style="width:100px;" type="text" name="jzpay" size="15"></p>
							<p><label>操作密码：</label><input type="password" name="pa3" size="15"></p>
							<p><label>转账原由：</label><input type="text" name="yy" size="20"></p>
							<p><label>选择折扣：</label>
							<select name="ration">
							   <option value="0.9" selected>0.9</option>
							   <option value="0.95">0.95</option>
							   <option value="0">无折扣</option>
							</select>
							<p><label><input type="checkbox" name="C1" id="C1" onclick="dbz_show()" value="1" style="width:auto; vertical-align: middle;border:none;"> 退款订单号：</label><input type="text" name="dbz" id="dbz" size="20"></p>
							<p><label></label><button class="but1" type=submit value="确 定 转 账" name=submit2  onClick="return confirm('提示：您确定了吗？')">确 定 转 账</button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script language="JavaScript">dbz_show()</script>