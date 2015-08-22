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
	  $.post("/login2j?status=1&inputUrl=${inputUrl}", data, function(response) {
		    var responseMsg = response;
			if(responseMsg.erroCodeNum==-1){//注册成功
				//执行跳转
				location.replace('userpay?transferType=1');
				return;
			}else if(responseMsg.erroCodeNum==1){
					alert('二级密码输入错误！请重新输入');
					Form.password3.focus();
					return;
			}else if(responseMsg.erroCodeNum==2){
				alert('您好，您同一姓名账号或同一身份证号码账号已发布成功过，请耐心等待处理完成后再发布第二笔，如果认购方已向您付款，请先确认收款再发布第二笔，谢谢！');
				location.replace('epmcjl');
				return;
			}else if(responseMsg.erroCodeNum==3){
				alert('您好，一币商城的商家账户暂时不提供卖出功能，谢谢！');
				return;
			}else if(responseMsg.erroCodeNum==4){
				alert('您好，您的诚信星为'+responseMsg.cxt+'，离取消[限制发布]时间还有'+responseMsg.days+'天，谢谢！');
				return;
			}else if(responseMsg.erroCodeNum==5){
				alert('操作错误，请检查输入是否正确！');
				return;
			}else if(responseMsg.erroCodeNum==6){
				alert('请把收款方式改为“工商银行”或“农业银行”或“建设银行”再进行卖出操作！');
				location.replace('dateuser');
				return
			}else if(responseMsg.erroCodeNum==-2){
				location.replace('userpay?transferType=2');
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
						3、为了交易公平公正，交易双方有一定的约束，系统启动信星方案，每个用户初始为“5星”，每违反一次交易规则扣除“1星”，当剩下“3星”，将被限制发布和认购一星期，当剩下“2星”，将被限制发布和认购两星期，两星期内将不能获得平衡奖金，当剩下“1星”，将被限制发布和认购三星期，三星期内将不能获得平衡奖金和领导奖金，当剩下“0星”，将被限制发布和认购60天，60天内将不能获得平衡奖金和领导奖金。
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