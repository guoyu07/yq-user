<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script language="javascript"  src="/manage/scripts/jquery-1.7.2.min.js"></script>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('操作密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('转出用户不是商户！请先将转出用户设置成商户');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('转入的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('您好，不能转给自己，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您好，转出用户购物券不能小于零，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您好，转出用户购物券不足，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3001}"><script language=javascript>alert('您好，权限不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！转账成功！');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<script language="JavaScript"> 
 function checkdate(){  
  if (Form.jzpay.value=="") {      alert("请填写您要转账的购物券!");      return false;    } 
  if (Form.jzpay.value<0) {      alert("转账的购物券必须大于0!");      return false;    } 
  if (Form.jzuser.value=="") {      alert("请填写您要转入的用户名!");      return false;    }
  if (Form.adgl.value=="") {      alert("请写入操作密码!");      return false;    }
  if (Form.dbz.value=="" && document.getElementById("C1").checked) { alert("请写入商城订单号，必须为数字!"); return false;  }
 }

 function setmaller(txlb){  
	  if (Form.fromUser.value=="") {      alert("请填写您设置的商户名!");      return false;    } 
	  $("#btnn").attr("disabled","disabled");
		//var data = $("#Form").serialize();
		$.post("maller?fromUser="+Form.fromUser.value+"&txlb="+txlb, null, function(response) {
			$("#btnn").removeAttr("disabled");
			if (response.erroCodeNum!=0) { alert("设置失败"); return false; }
			if(txlb==3){
				alert("设置商户成功");
			}else{
				alert("取消商户成功！");
			}
		});
	  
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
<body bgcolor="#E8F1FF" text="#000000" topmargin="5" leftmargin="5">
<div id="Content">
	<div class="CurInfo" id="DetailInfo">
		<div id="DetailInfoContent">
			<table style="TABLE-LAYOUT: fixed; border-collapse:collapse" summary="宝贝描述" border="1" bordercolor="#006699" width="100%">
				<tr>
					<td id="ItemDesc" style="WORD-BREAK: break-all; LINE-HEIGHT: normal" bgcolor="#D9E6FF" height="26" background="images/admin_bg_1.gif">
					<p align="center">
					<span style="font-size: 11pt; font-weight: 700">购物券退款</span></td>
				</tr>
				<tr>
					<td id="ItemDesc" style="WORD-BREAK: break-all; LINE-HEIGHT: normal" bgcolor="#D9E6FF">
					<div class="content-form">				 
						<form class="form form4 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="backscores?status=1">
						    <p><label class="c-r">转出用户名：</label><input type="text" name="fromUser" size="15" maxlength="20"><button class="but1" type="button" value="设置成商户" name="btnn" id="btnn"  onClick="setmaller(3)">设置成商户</button><button class="but1" type="button" value="设置成商户" name="btnn" id="btnn"  onClick="setmaller(0)">取消商户</button></p>
							<p><label class="c-r">转入用户名：</label><input type="text" name="jzuser" size="15" maxlength="20"></p>
							<p><label>转账金额：</label><input style="width:100px;" type="text" name="jzpay" size="15"></p>
							<p><label>操作密码：</label><input type="password" name="pa3" size="15"></p>
							<p><label>转账原由：</label><input type="text" name="yy" size="20"></p>
							<p><label><input type="checkbox" name="C1" id="C1" onclick="dbz_show()" value="1" style="width:auto; vertical-align: middle;border:none;"> 退款订单号：</label><input type="text" name="dbz" id="dbz" size="20"></p>
							<p><label></label><button class="but1" type=submit value="确 定 转 账" name=submit2  onClick="return confirm('提示：您确定了吗？')">确 定 转 账</button></p>
					</form>
					</div>
					　</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>
<script language="JavaScript">dbz_show()</script>