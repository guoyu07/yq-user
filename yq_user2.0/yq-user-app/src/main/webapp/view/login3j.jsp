<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<SCRIPT type=text/javascript src="/main/jquery-1.2.6.min.js"></SCRIPT>
<SCRIPT type=text/javascript>
function checkdate()  {  
	
	  if (Form.password3.value=="") {   alert("<s:text name='reg.jsp.reg.jsp.-1719221018'/>");  Form.password3.focus();   return false;    }
	  var data = $("#Form").serialize();
	  $.post("/login2j?status=1&inputUrl=${inputUrl}", data, function(response) {
		    var responseMsg = response;
			if(responseMsg.erroCodeNum==-1){//注册<s:text name='reg1.jsp.reg1.jsp.799375'/>
				//执行跳转
				location.replace('userpay?transferType=1');
				return;
			}else if(responseMsg.erroCodeNum==1){
					alert('<s:text name='viplogin3j.jsp.login3j.jsp.950326025'/>');
					Form.password3.focus();
					return;
			}else if(responseMsg.erroCodeNum==2){
				alert('<s:text name='viplogin3j.jsp.login3j.jsp.-710088382'/>!');
				location.replace('epmcjl');
				return;
			}else if(responseMsg.erroCodeNum==3){
				alert('<s:text name='viplogin3j.jsp.login3j.jsp.-1740535765'/>!');
				return;
			}else if(responseMsg.erroCodeNum==4){
				alert('<s:text name='viplogin3j.jsp.login3j.jsp.-838678250'/>!');
				return;
			}else if(responseMsg.erroCodeNum==5){
				alert('<s:text name='viplogin3j.jsp.login3j.jsp.-830018135'/>！');
				return;
			}else if(responseMsg.erroCodeNum==6){
				alert('<s:text name='viplogin3j.jsp.login3j.jsp.-437103877'/>！');
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
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
				<%@ include file="/view/yblc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1" style="height:190px;">
					<div class="content-title">
						<span><s:text name='viewlogin3j.jsp.login3j.jsp.590069804'/></span>
					</div>
					<div class="content-form">				 
						<p class="jjgz">
						<s:text name='viewlogin3j.jsp.login3j.jsp.1072980487'/><br>
						1、<s:text name='viewlogin3j.jsp.login3j.jsp.1178622703'/><br>
						2、<s:text name='viewlogin3j.jsp.login3j.jsp.1078412623'/>。<br>
						<s:text name='viewlogin3j.jsp.login3j.jsp.203331168'/><br>
						1、<s:text name='viewlogin3j.jsp.login3j.jsp.98672732'/>！<br>
						2、<s:text name='viewlogin3j.jsp.login3j.jsp.-1363913732'/>。<br>
						3、<s:text name='viewlogin3j.jsp.login3j.jsp.-9035302'/>。<br>
                                                                                （<s:text name='viewlogin3j.jsp.login3j.jsp.2027468904'/>！）
                        </p>
					</div>
				</div>
				<div class="content-box2 mth10">
					<form class="form form4" method="POST" action="" name="Form" id="Form" onSubmit="return false">
							<p><label><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><input type="text" value="${userName}" readonly></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input name="password3" size=12 type="password"></p>
							<p><label></label><button class="but1" type="submit" value=" <s:text name='viplogin2j.jsp.login2j.jsp.941571312'/> " name="login" onClick="checkdate();"><s:text name="viplogin8j.jsp.login8j.jsp.665975448"></s:text></button></p>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
