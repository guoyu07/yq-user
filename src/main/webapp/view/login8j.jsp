<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<SCRIPT type=text/javascript src="/main/jquery-1.2.6.min.js"></SCRIPT>
<SCRIPT type=text/javascript>
function checkdate()  {  
	  if (Form.password3.value=="") {   alert("二级密码不能为空");  Form.password3.focus();   return false;    }
	  var data = $("#Form").serialize();
	  $.post("login2j?status=1", data, function(response) {
		    var responseMsg = response;//eval('(' + response + ')');
			if(responseMsg.erroCodeNum==0){//注册成功
				//执行跳转
				location.replace('epjysc');
				return;
			}else{
				alert('二级密码输入错误！请重新输入');
				Form.password3.focus();
				return;
			}
		});
	  return true;
	}
</SCRIPT>
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
				<div class="content-box1" style="height:190px;">
					<div class="content-title">
						<span>一币-理财交易规则</span>
					</div>
					<div class="content-form">				 
						<p class="jjgz">
一、认购方（付款方）责任<br>
						1、超过“2小时”没有成功付款到发布方指定银行账号，系统将没收暂扣下来的诚信金，解除本交易限制，让其它用户来完成此交易。<br>
						2、并没有成功付款到发布方指定银行账号，提前操作或恶意操作，影响正常交易流程，系统将没收暂扣下来的诚信金，解除本交易限制，让其它用户来完成此交易。<br>
						二、发布卖出方（收款方、求现方）责任<br>
						1、当付款方操作成功，收款方实际收到相应款项，必须于“48小时”内登录平台点“一币-理财”下“一币-卖出明细”查看该笔交易状态并进行“我已收到款项-通知系统给认购方增加相应的一币-余额”的操作！<br>
						2、发布卖出（求现）前请先确认自己的收款账号能正常使用，因您的收款账号错误或其它原因不能正常收款，影响付款方正常交易时间，付款人向客服提出申诉，该笔交易将绶发。<br>
						3、为了交易公平公正，交易双方有一定的约束，系统启动信星方案，每个用户初始为“5星”，每违反一次交易规则扣除“1星”，当剩下“3星”，将被限制发布和认购一星期，当剩下“2星”，将被限制发布和认购两星期，两星期内将不能获得平衡奖金，当剩下“1星”，将被限制发布和认购三星期，三星期内将不能获得平衡奖金和领导奖金，当剩下“0星”，将被限制发布和认购60天，60天内将不能获得平衡奖金和领导奖金。<br>
                                                                                （温馨提示：一币卖出交易后在48小时内未确认用户系统将会自动扣信誉星一枚，用户在5天后还未确认（包含前面48小时），系统将会自动确认，系统确认后就会直接封锁用户无法操作卖出一币的，要再卖出一币，要先向公司提交申请书，书面承诺平台系统规则，申请机会只有三次（包含同名账户，同名账户有一个用户被系统自动确认后，所有同名的都是不能操作一币卖出。），超出三次申请的用户永久不能卖出一币！感谢您的配合！）
                        </p>
					</div>
				</div>
				<div class="content-box2 mt10"  style="height:310px;">
					<form class="form form4" method="POST" action="" name="Form" id="Form" onSubmit="return false">
							<p><label>用户名：</label><input type="text" value="${userName}" readonly></p>
							<p><label>二级密码：</label><input name="password3" size=12 type="password"></p>
							<p><label></label><button class="but1" type="submit" value=" 登陆管理 " name="login" onClick="checkdate();">同 意 规 则</button></p>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>