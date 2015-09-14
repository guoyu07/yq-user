<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('注意：您的一币不够本次购卡，请充值！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='datepay'</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmmj.value==0) {      alert("请选择你要购买的金币卡面值!");      return false;    } 
  return true;  }  
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
						<span>一币-购金币卡</span>
					</div>
					<div class="content-table">
						<form class="form form3" method="POST" align="center" action="jztojb?status=1" name="Form" onSubmit="return checkdate()">
							<p><label>请选择要购买的金币卡面值：</label> <select size="1" name="gmmj">
								<option value="0" selected>==请选择金币卡面值==</option>
								<option value="1">10金币（15一币/张）</option>
								<option value="5">50金币（75一币/张）</option>
								<option value="10">100金币（150一币/张）</option>
								<option value="30">300金币（450一币/张）</option>
								<option value="50">500金币（750一币/张）</option>
								<option value="100">1000金币（1500一币/张）</option>
								</select></p>
							<p><label></label><button class="but1" type=submit>发 布 卖 出</button></p>
					</form>
					<p >提示：您的一币剩余<b>${pay}</b></p>
					<p >按<b>15-一币-买10金币</b>的比例，成功后显示相应金币卡,再到<b>积分理财</b>下<b>我要充值</b>-激活或复制赠送即可！</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>