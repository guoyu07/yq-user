<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户名输入错误或不属于自己团队的玩家，请检查后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('充值密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('该用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('两分钟内只能充值一次，请稍后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您的充值币小于${cjpay}，无法完成充值，请联系管理员！！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('本次充值${cjpay}可一币小于${cjpay*9}，请先补充一币！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('充值成功！');location.href='vipcjb';</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  
  if (form.cjuser.value=="") {    alert("请输入要充值的用户名!");  form.cjuser.focus();  return false;    }
  if (form.cjpay.value==0) {    alert("请选择充值金额!");  form.cjpay.focus();  return false;    }
  if (form.cjpay.value>${gcuser.vipcjcjb}) {    alert("您的余额不足!");  form.cjpay.focus();  return false;    }
  if (form.cjpass.value=="") {    alert("请输入您的充值密码!");  form.cjpass.focus();  return false;    }
  if(confirm("温馨提示：请认真核对后再充值,一经充值不可以恢复,您确定了吗？")){
   $("#B1").hide();
   return true;
   }
  return false;  }
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
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>vip充值币管理</span>
					</div>
					<div class="content-table">
							 <form method="POST" action="vipcj" name="form" onSubmit="return checkdate()">
								<p>用户名：<input type="text" name="cjuser" size="12">
								充值金额：<select size="1" name="cjpay">
								<option selected value="0">==请选择==</option>
								<option value="1000">1000</option>
								<option value="2000">2000</option>
								<option value="5000">5000</option>
								</select>
								充值密码：<input type="password" name="cjpass" size="12">
								<input type="submit" value="提交充值" name="B1" id="B1">（剩余：<font color="#FF0000">${gcuser.vipcjcjb}</font>）</p>
							</form>
						<table>
							<tr>
								<th>编号</th>
								<th>充值用户名</th>
								<th>充值金额</th>
								<th>备注</th>
								<th>操作时间</th>
								<th>操作者</th>
								<th>剩余充值币</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${data.cjid}</td>
								<td>${data.cjuser}</td>
								<td>${data.cjjo}</td>
								<td>${data.bz}</td>
								<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
								<td>${data.vipuser}</td>
								<td>${data.sycjb}</td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag />
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>