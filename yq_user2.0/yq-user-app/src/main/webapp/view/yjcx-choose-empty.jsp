<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('结算期间暂停开户，明天开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('此功能，需联系推荐人选择适合的位置升级！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('接点人不存在，没法放置，请检查是否正确！');history.go(-1);</script></c:if>
 <!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.bduser.value=="") {      alert("开户用户名不能为空!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("请选择一个套餐！");      return false;    }
  if (Form.pa1j.value=="") {      alert("请输入登录密码！");      return false;    }
  if (Form.pa2j.value=="") {      alert("请输入二级密码！");      return false;    }
  return true;  }  
 </script>
</head>
<body>
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
						<span>开户</span>
					</div>
					<div class="form_tj">
						<a style="font-size: 16px; color: #ff6600; float:right;" href="javascript:history.back();">返回上一页</a>
						<form class="form form3 formtj"  method="POST" action="bdreg" name="Form" onSubmit="return checkdate()">
							<p><label>选择接点人：</label><b style="color: #ff0000;"><input type="hidden" name="up" size="8" readonly value="${myup}">${myup}</b></p>
							<p><label>开户用户名：</label><input type="text" name="bduser" size="15" value="${bdid}"><span style="color: #000080;"> 系统默认从左到右放置</span></p>
							<p><label>选择套餐：</label>
								<select size="1" name="cjpay">
									<option selected value="0">==请选择您要消费的套餐==</option>
									<option value="10000">1万-报单币</option>
									<option value="20000">2万-报单币</option>
									<option value="50000">5万-报单币</option>
									<option value="1000">1千（一币）</option>
									<option value="2000">2千（一币）</option>
									<option value="5000">5千（一币）</option>
								</select>
							</p>
							<p><label>输入登录密码：</label><input type="password" name="pa1j" size="20" /></p>
							<p><label>输入二级密码：</label><input type="password" name="pa2j" size="20"></p>
							<p style="color: #800000; padding-left: 220px;">费用将从您的(<span style="color: #008000;">${userName}</span>)报单币或一币帐户扣除</p>
							<p><label></label><button class="but1" type="submit">提 交</button></p>
						</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>