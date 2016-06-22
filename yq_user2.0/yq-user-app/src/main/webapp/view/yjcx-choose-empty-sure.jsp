<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('还没有到结算时间（每星期二22点后）！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('选择报单金额错误，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('登录密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('此功能，需联系推荐人选择适合的位置升级！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('报单币余额小于开户金额${cjpay}，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('一币余额小于开户金额${cjpay}，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('要开户的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('系统调试中，请重新注册新的用户名进行操作或联系您的推荐人！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('该姓名持有5万的账户已达到3个，不能再开设5万的账户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('开户人已安置好，不能重复，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('开户人已安置好，不能重复，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('只能给自己的直接推荐的人开户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('接点人不存在，没法放置，请检查是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==15}"><script language=javascript>alert('接点人位置已被占用，请重新选择！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==16}"><script language=javascript>alert('验证码错误，请检查输入是否正确！');history.go(-2);</script></c:if>
<c:if test="${erroCodeNum==17}"><script language=javascript>alert('接点人必须在自己的团队下，请重新选择！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('为给家人们提供更好的服务，报单功能正在维护！预计上午8点完成！给您带来的不便请见谅！');history.go(-1);</script></c:if>
 <!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	<style type="text/css">
	.zzbg{display:none;position:fixed;width:100%;height:100%;background:#000;z-index:2;top:0;left:0;opacity:0.7;}
	.zzcontent{display:none;width:500px;height:50px;position:fixed;top:50%;margin-top:-150px;background:#fff;z-index:3;left:50%;margin-left:-250px;}
</style>
	<script type="text/javascript" src="images/jquery.min.js"></script>
<script language="JavaScript">
 function checkdate()  { 
  
		$("#btn").attr("disabled","disabled");
		var data = $("#Form").serialize();
		$.post("/sms?op=2", data, function(response) {
			$("#btn").removeAttr("disabled");
			if (response.erroCodeNum!=0) { alert("手机验证码发送失败"); return false; }
			settime($("#btn"));
			alert("手机验证码发送成功");
		});
	return false;
}  

function checkdate1()  {  
  if (Form.ceid.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.ceid.focus();   return false;    }
  return true;
} 
</script>
</head>
<body>
<div class="zzbg"></div>
<div class="zzcontent">
<h2 align="center">系统已进入核算中...期间请停止其它操作，更不要关闭本页！</h2>
</div>
	<div class="mainbox mw1024">
		
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yjcx.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box2">
					<div class="content-title">
						<span>再次确认信息</span>
					</div>
					<div class="form_tj">
						<a style="font-size: 16px; color: #ff6600; float:right;" href="javascript:history.back();">返回上一页</a>
						<form class="form form3 formtj"  method="POST" action="bdreg" name="Form" id="Form" onSubmit="return showZz()">
						<input type="hidden" name="targetdate" size="8">
						<input type="hidden" name="status" size="8" value="1" />
	                    <input type="hidden" name="xmlmode" size="8">
	                    <input type="hidden" name="cjpay" size="10" value="${cjpay}" readonly><input type="hidden" name="remark" size="8" value="3" readonly><input type="hidden" name="user" size="10" value="${userName}" readonly>
							<p><label>选择接点人：</label><b style="color: #ff0000;"><input type="hidden" name="up" size="10" value="${up}" readonly>${up}</b></p>
							<p><label>开户用户名：</label><input type="hidden" name="bduser" size="10" value="${bduser}" readonly>${bduser}</p>
							<p><label>选择套餐：</label>
								<font color="#008000"><b>${cjpay}</b></font><input type="hidden" name="pa1j" size="8" value="${pa1j}"><input type="hidden" name="pa2j" size="8" value="${pa2j}">（将从您的（<b>${userName}</b>）<c:if test="${cjpay<9000}">一币</c:if><c:if test="${cjpay>=9000}">报单币</c:if>账户扣除${cjpay}）
							</p>
							<c:if test="${cjpay<9000}">
							   <p><label>您的手机号码：</label>${call}</p>
							   <p><label>手机验证码：</label><input type="text" name="ceid" size="8" /><input id="btn" type="button"
										onclick="checkdate()" value="获取验证码" name="B2" /></p>
							</c:if>
							<p align="center"><input class="but1" type="submit" value="确认无误" name="B1" onClick="{if(confirm('确定开通该会员吗?')){this.style.visibility='hidden';return true;}return false;}" /></p>
							<p align="center"><b><font color="#FF0000">重要提示：</font></b>确认无误后，系统进入核算中...期间请停止其它操作，更不要关闭本页！</p>
						</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"));

function showZz(){
    $('.zzbg').fadeIn(200);
    $('.zzcontent').fadeIn(400);
    return true;
}
</script>