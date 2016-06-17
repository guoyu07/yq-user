<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<HTML>
<title></title>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>
<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="首页";
  }
}

</SCRIPT>

<SCRIPT src="main/leftNo.js"></SCRIPT>

<SCRIPT type=text/javascript src="main/jquery-1.2.6.min.js"></SCRIPT>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$("#wenzhang>dd>dl>dd").hide();
	$.each($("#wenzhang>dd>dl>dt"), function(){
		$(this).click(function(){
			$("#wenzhang>dd>dl>dd ").not($(this).next()).slideUp();
			$(this).next().slideToggle(500);
			//$(this).next().toggle();
		});
	});
});

function checkdate()  {  
	  if (Form.password3.value=="") {   alert("二级密码不能为空");  Form.password3.focus();   return false;    }
	  var data = $("#Form").serialize();
	  $.post("login2j?status=1&inputUrl=${inputUrl}", data, function(response) {
		    var responseMsg = eval('(' + response + ')');
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
<BODY bgcolor="#FFFFFF" >
<DIV class="top_bg cBlue">
<DIV style="POSITION: relative; HEIGHT: 10px">
　</DIV>　</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="90%" height="54%" id="AutoNumber1">
    <tr>
      <td width="93%" height="100%"><form method="POST" action="" name="Form" id="Form" onSubmit="return false">
	  <font size="3">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="center">
		<b>
		<font size="5" color="#FF0000" face="楷体_GB2312">一币-理财交易规则</font></b></p>
			  <table border="0" width="100%" id="table1">
					<tr>
						<td>
						<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						一、认购方（付款方）责任<br>
						1、超过“2小时”没有成功付款到发布方指定银行账号，系统将没收暂扣下来的诚信金，解除本交易限制，让其它用户来完成此交易。<br>
						2、并没有成功付款到发布方指定银行账号，提前操作或恶意操作，影响正常交易流程，系统将没收暂扣下来的诚信金，解除本交易限制，让其它用户来完成此交易。<br>
						二、发布卖出方（收款方、求现方）责任<br>
						1、当付款方操作成功，收款方实际收到相应款项，必须于“48小时”内登录平台点“一币-理财”下“一币-卖出明细”查看该笔交易状态并进行“我已收到款项-通知系统给认购方增加相应的一币-余额”的操作！<br>
						2、发布卖出（求现）前请先确认自己的收款账号能正常使用，因您的收款账号错误或其它原因不能正常收款，影响付款方正常交易时间，付款人向客服提出申诉，该笔交易将绶发。<br>
						3、为了交易公平公正，交易双方有一定的约束，系统启动信星方案，每个用户初始为“5星”，每违反一次交易规则扣除“1星”，当剩下“3星”，将被限制发布和认购一星期，当剩下“2星”，将被限制发布和认购两星期，两星期内将不能获得平衡奖金，当剩下“1星”，将被限制发布和认购三星期，三星期内将不能获得平衡奖金和领导奖金，当剩下“0星”，将被限制发布和认购60天，60天内将不能获得平衡奖金和领导奖金。</td>
					</tr>
				</table>
				<p align="center"></font><div align="center">
                    <center>
                  <table border="0" cellpadding="0" style="border:1px solid #008000; border-collapse: collapse" width="50%" id="AutoNumber4" height="112" bgcolor="#FFD7D7">
                    <tr> 
                      <td width="42%" height="40" align="right" bgcolor="#FFD7D7"><font style="font-size: 11pt">用户名：</font></td>
                      <td width="57%" height="40" align="left" bgcolor="#FFD7D7"><font size="3"> <span style="font-size: 11pt"><INPUT name="m_username" size=12 value="${userName}" readonly></span></font></td>
                    </tr>
                    <tr> 
                      <td width="42%" height="40" align="right"><font style="font-size: 11pt">二级密码：</font></td>
                      <td width="57%" height="40" align="left"><font size="3"> <span style="font-size: 11pt"><INPUT name="password3" size=12 type="password" ></span></font></td>
                    </tr>
                    <tr><td width="70%" height="40" align="center" colspan="2" bgcolor="#FFD7D7"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="3"><span style="font-size: 11pt"><input type="submit" value=" 登陆管理 " name="login" class="lkbtn" onClick="checkdate();"></span></font></td>
                    </tr>
                    </table>
                    <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000">
                    <% if(request.getParameter("ts")!=null){ %>
                    <%=request.getParameter("ts")%><%}%></font></p>
                    </center>
              </div>
        </form>      
      </td>
    </tr>
  </table>
  </center>
</div></div>
</BODY>
</HTML>