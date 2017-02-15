<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('交易市场已有积分在出售中，请按需求点击 [我要买入] ！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('操作错误，金币不足，请检查输入是否正确！');location.replace('jztojb');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('买入挂牌成功！');location.replace('gpjy');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|积分买入</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> 
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">财富中心 >> 积分理财</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
        <%@ include file="/mainUI/common/userLeft.jsp" %>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- 账户概览  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 发布积分买入 -->
      <div class="main-widget">
        <p class="widget-title-line">发布积分买入</p>
        <div class="widget-article">
          <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/mysl?status=1">
            <p class="item">
              <label class="title">您当前的金币剩余：</label><span class="text">${jydb}</span>
            </p>
            <p class="item">
              <label class="title">当前的交易价为：</label><span class="text"><c:if test="${jygj<1}">${jygj}</c:if><c:if test="${jygj>=1}">${jygj}</c:if></span>
            </p>
            <p class="item">
              <label class="title">用户名：</label><span class="text">${userName}</span>
            </p>
            <p class="widget-warning mt10">** 最大可买入<b class="sp">${zdjyg}</b>个积分</span></p>
            <p class="item">
              <label class="title">买入数量：</label>
              <input type="text" name="txpay" value=""/>
            </p>
            <p class="item">
              <label class="title">二级密码：</label>
              <input type="password" name="pa3" />
            </p>
            <p class="button-line mt15">
              <button type="submit" class="widget-button">确定买入</button>
            </p>
          </form>
        </div>
      </div>
      <!-- 发布积分买入 end -->
      <!-- 当前求购明细 大概是一页10行数据 -->
      <div class="main-widget mt15">
        <p class="widget-title">当前求购明细</p>
        <p class="small-button-line"><a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="/mysl?status=4" id="J_rechargeDetailMore">查看更多</a></p>
        <div class="widget-table mt5">
        	<c:if test="${empty dataList}">
						<div class="content-tisp">
							<h5>暂无记录</h5>
						</div>
					</c:if>
		<c:if test="${not empty dataList}">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>求购积分数量</th>
                <th>求购时间</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
            <s:iterator var="data" value="dataList">
              <tr>
                <td>${userName}</td>
                <td>${data.mysl}</td>
                <td><fmt:formatDate value="${data.abdate}" type="both"/></td>
                <td><a href="qxqg?qxid=${data.jyid}" style="text-decoration: none">撒销</a></td>
              </tr>
            </s:iterator>
            </tbody>
          </table>
          </c:if>
        </div>
      </div>
      <!-- 当前求购明细 end -->
    </div>
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
function checkdate() {
  if (Form.txpay.value == "") {
    alert("请输入需要买入的积分数量!");
    Form.txpay.focus();
    return false;
  }
  if (Form.txpay.value == 0) {
    alert("买入数量不能为零!");
    return false;
  }
  if (Form.txpay.value < 5) {
    alert("买入数量至少为5个积分");
    return false;
  }
  if (Form.txpay.value > 3000) {
    alert("目前最大每次买入数量为3000，成功后可继续发布买入");
    return false;
  }
  if (Form.txpay.value > ${zdjyg}) {
    alert("买入数量最大为${zdjyg}");
    return false;
  }
  if (!chkinteger(Form.txpay.value)) {
    alert('买入数量只能为整字!');
    document.Form.txpay.focus;
    return (false);
  }

  function chkinteger(checkStr) {
    var checkOK = "0123456789";
    var allValid = true;
    for (i = 0; i < checkStr.length; i++) {
      ch = checkStr.charAt(i);
      if (checkOK.indexOf(ch) == -1) {
        allValid = false;
        break;
      }
      if ((ch == '+' || ch == '-') && i > 0) {
        allValid = false;
        break;
      }
    }
    return (allValid);
  }
  if (Form.pa3.value == "") {
    alert("请输入二级密码密码!");
    Form.pa3.focus();
    return false;
  }
  return true;
}
</script>
</body>

</html>
