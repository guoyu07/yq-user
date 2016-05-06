<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
	<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.pdid.value=="") {      alert("消费编号不能为空!");      return false;    } 
  if (Form.pdpa.value=="") {      alert("登录密码不能为空!");      return false;    }  
  if (Form.fwid.value=="") {      alert("防伪编码不能为空!");    return false;    } 
  if (Form.sfz.value==0) {      alert("请您认真查看消费者协议，只有同意后才可以继续!");      return false;    }
  return true;  }  
</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>

				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<!-- <div class="content-box1">
				
					<div class="content-title">
						<span>金币卡激活</span>
					</div>
					
					<div class="content-form new2-top">
						<form class="form form1 e6b" method="POST" align="center" action="activedGoldCard" name="Form" onSubmit="return checkdate()"> 
						<input type="hidden" maxlength=10 name="postcode" size="6" value="123456">
							<p class="f-tk c-g">您的用户名是 <span class="c-r">${userName}</span></p>
							<p><label>消费编号：</label><input type="text"maxlength="20" name="pdid" size="18" ><input type="hidden" name="jbk" size="10" value="${userName}" readonly></p>
							<p><label>登录密码：</label><input type="text" maxlength=15 name="pdpa" size="18"></p>
							<p><label>防伪编码：</label><input type="text" maxlength=15 name="fwid" size="18"></p>
							<p><label>协议及声明：</label>
								<select>
											<option selected value="0">==请选择是否同意消费者协议==</option>
											<option value="0">不同意，我不要参与，我要把卡丢了...</option>
											<option value="1">同意协议，我已经买到自己想要的产品！</option>
								</select>
								<a href="javascript:openwindow('/sfz.html')" class="c-g xy-sm">查看消费者协议</a>
							</p>
							<p><label></label><button class="but1" type=submit value="确 定" name=submit2>确  定</button></p>
						</form>
					</div>
				</div> -->
				<div class="content-box2 new2-bottom mt10">
					<div class="content-title">
						<span>金币卡明细</span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th>消费编号</th>
								<th>金币面值</th>
								<th>生成时间</th>
								<th>该卡目前状态</th>
								<th>操作</th>
							</tr>
							 <s:iterator var="data" value="dataList">
							<tr>
								<td>${data.pdid}</td>
								<td>${data.bf2}0</td>
								<td>${data.gmdate}</td>
								<td>还没有激活，请通知客户尽快激活以便购买积分增值。</td>
								<td> 
								<c:if test="${data.gpa>1}"><a href="glfhk?id=${data.pdid}" style="text-decoration: none">已查看过密码，需要重置或激活</a></c:if>
                                <c:if test="${data.gpa<=1}"><a href="glfhk?id=${data.pdid}" >重置(查看)该卡密码或激活</a></c:if>
                                </td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag/></p>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>