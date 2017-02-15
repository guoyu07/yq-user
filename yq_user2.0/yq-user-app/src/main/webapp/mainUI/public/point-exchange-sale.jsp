<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('游戏收益未完成，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('请于开户后第二天再进行卖出操作，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('卖出单价不能小于 ${fcxt.zdj} ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('卖出单价不能大于${fcxt.jygj+0.03}  哦！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，您卖出数量不能小于零，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('您好，为了提供更公平公证的交易规则，累计挂牌最高20笔，待交易完成后才可以继续发布，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('您好，您卖出数量不能大于您剩余数量 ${gcuser.jyg} ，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('交易市场已有求购信息，请按需求点击 [我要卖给] ！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('单笔卖出数量不能大于 1000 哦!');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|积分卖出</title>
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
  <!-- 账户概览  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 发布积分买入 -->
      <div class="main-widget">
        <p class="widget-title-line">发布积分卖出</p>
        <div class="widget-article">
          <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="mcsl?status=1">
            <p class="item">
              <label class="title">您当前的积分剩余：</label><span class="text">${gcuser.jyg}</span>
            </p>
            <p class="item">
              <label class="title">当前的交易价为：</label><span class="text"><c:if test="${fcxt.jygj<1}">${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1}">${fcxt.jygj}</c:if></span>
            </p>
            <p class="item">
              <label class="title">用户名：</label><span class="text">${userName}</span>
            </p>
            <p class="item">
              <label class="title">卖出单价：</label>
              <input type="text" name="jygj" />
            </p>
            <p class="widget-warning mt10">** 可卖出为：<b class="sp">${gcuser.jyg}</b></span>
            </p>
            <p class="item">
              <label class="title">卖出数量：</label>
              <input type="text" name="txpay" value="" />
            </p>
            <p class="item">
              <label class="title">二级密码：</label>
              <input type="password" name="pa3" />
            </p>
            <p class="button-line mt15">
              <button type="submit" class="widget-button">确定卖出</button>
            </p>
            <p class="widget-tips mt10">提示：如写入卖出的单价过高，买家可能会不接受，容易导致出售不成功，请慎重发布</p>
          </form>
        </div>
      </div>
      <!-- 发布积分买入 end -->
      <!-- 当前求购明细 大概是一页10行数据 -->
      <div class="main-widget mt15">
        <p class="widget-title">当前卖出明细</p>
        <p class="small-button-line"><!-- <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="/mcsl?status=4" id="J_rechargeDetailMore">查看更多</a> --></p>
        <div class="widget-table mt5">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
            	 <c:if test="${empty dataList}">
						<div class="content-tisp">
							<h5>暂无记录</h5>
						</div>
					</c:if>
			<c:if test="${not empty dataList}">
              <tr>
                 <th>用户名</th>
                <th>卖出</th>
                <th>挂牌时间</th>
                <th>当前价格</th>
                <th>修改价格</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
            <s:iterator var="data" value="dataList">
              <tr>
                <td>${userName}</td>
                <td>${data.mcsl}</td>
                <td><fmt:formatDate value="${data.abdate}" type="both"/></td>
                <td>${data.pay}</td>
                <td><a href="javascript:void(0);" class="JQ_goDialog" data-url="/diyjygj?sgid=${data.id}"  >修改价格</a></td>
                <td></td>
              </tr>
             </s:iterator>
             </c:if>
            </tbody>
          </table>
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
  if (Form.jygj.value == "") {
    alert("请输入需要卖出的单价");
    Form.jygj.focus();
    return false;
  }
  if (Form.jygj.value < 0.78) {
    alert("卖出单价不能小于 0.78 !");
    Form.jygj.focus();
    return false;
  }
  if (Form.jygj.value > 0.96 + 0.03) {
    alert("卖出单价不能大于 0.99 哦");
    Form.jygj.focus();
    return false;
  }
  if (!chkinteger1(Form.jygj.value)) {
    alert('卖出单价只能为数字');
    document.Form.jygj.focus;
    return (false);
  }

  function chkinteger1(checkStr1) {
    var re = /^(0|[1-9]+)\.\d{0,2}$|^(0|[1-9]+)$/;
    return re.test(checkStr1)
  }

  if (Form.txpay.value == "") {
    alert("请输入需要卖出的数量!");
    Form.txpay.focus();
    return false;
  }
  if (Form.txpay.value == 0) {
    alert("卖出数量不能为零");
    return false;
  }
  if (!chkinteger(Form.txpay.value)) {
    alert('卖出数量只能为整字!');
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
  if (Form.txpay.value < 10) {
    alert("卖出数量不能小于10积分!");
    return false;
  }
  if (Form.txpay.value > 3000) {
    alert("单笔卖出数量不能大于3000积分!");
    return false;
  }
  if (Form.txpay.value > 1200) {
    alert("你的卖出数量不能大于你剩余的数量 1200 哦");
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入二级密码密码");
    Form.pa3.focus();
    return false;
  }
  return true;
}
</script>
</body>

</html>
