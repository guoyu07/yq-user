<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('二级密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('您好，您已申请的卖出尚未交易成功，暂时不能使用转账功能，谢谢！');location.replace('epmcjl');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('操作错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('选中了不存在的用户');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('非同名用户,不能转');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您至少选择一个需要转账的用户名，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('非双区用户不能使用该功能！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('您已成功批量转账！');location.href='tjz?secondThisState=275&thisState=245'</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('转出用户名报单币不能大于剩余报单币！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('接收的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('转账保单币小于0！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('不能给自己转！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('被转用户一币发生了改变！请重试');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==101}"><script language=javascript>alert('被转用户购物券发生了改变！请重试');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|同姓名账户批量转账</title>
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
      <p class="breadcrumb-trail">账户管理 >> 同名账户管理</p>
       <%@ include file="/mainUI/common/accountpart.jsp" %>
    </div>
  </div>
  <!-- 会员中心导航模块 end -->
  <!-- 账户管理内容 -->
  <div class="container">
    <div class="member-content" id="J_memberContent">
       <div class="member-main-full">
      <div class="main-widget">
        <p class="widget-title-line">同姓名账户批量转账</p>
        <c:if test="${empty dataList}">
		<div class="a-transfer">
			<p>没有可转账的同名账户!</p>
		</div>
		</c:if>
		<c:if test="${not empty dataList}">
        <form class="widget-form" method="POST" action="tjz?status=1" name="form" id="form">
              <input type="hidden" name="thisState" value="${thisState}">
    <input type="hidden" name="secondThisState" value="${secondThisState}">
          <p class="item">
            <label class="title">转账类型：</label>
            <select class="widget-select" name="tp">
              <option value="0">一币</option>
              <option value="1">购物券</option>
              <option value="2">报单币</option>
            </select>
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="pa2j" size="15">
          </p>
          </p>
          <p class="item">
            <button class="widget-button-small" type="submit" onClick="return cf()">批量提交转至</button> 当前登陆的用户名：<b class="widget-warning">${userName}</b>
          </p>
          <div class="widget-table">
            <table border="0" cellspacing="0" cellpadding="0">
              <thead>
                <tr>
                  <td class="checked-all-wrap" colspan="6"><input class="checked-all" type='checkbox' name="chkall" onclick="CheckAll(this.form)">全选</td>
                </tr>
              </thead>
              <tbody>
              <s:iterator var="data" value="dataList">
                <tr>
                  <td>
                    <input type="checkbox" name="fromUsers" value="${data.username}">
                  </td>
                  <td>${data.username}</td>
                  <td>${data.name}</td>
                  <td>一币: <input type="hidden" name="tpay" size="10" value="${data.pay}" readonly>${data.pay}
                  </td>
                  <td>购物券:${data.scores}</td>
                  <td>报单币余额:${data.sybdb}</td>
                </tr>
                </s:iterator>
              </tbody>
            </table>
           
            <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}"  />
</p>
<!-- 会员中心翻页组件 end -->

          </div>
        </form>
         </c:if>
      </div>
    </div>
  </div>
    <!-- 账户管理内容 end -->
    <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
  //全选操作    
  function CheckAll(form) {
    for (var i = 0; i < form.elements.length; i++) {
      var e = form.elements[i];
      if (e.name != 'chkall') e.checked = form.chkall.checked;
    }
  }

  function cf() {
    if (form.tp.value == 0) {
      return confirm('确认转账吗?');
    }
    if (form.tp.value == 1) {
      return confirm('确认批量转入购物券?');
    }
    if (form.tp.value == 2) {
      return confirm('确认批量转入报单币?');
    }
  }
  </script>
  </body>

  </html>
