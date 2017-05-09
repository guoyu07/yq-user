<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-61194610'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1119381593'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-752014255'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1476527375'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-47326774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.246684949'/>！');location.replace('/datepay?secondThisState=249&thisState=244');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymy.jsp.gpjymy.jsp.624662580'/>|<s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.673109126'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> 
<!-- 通用头部 -->

<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='Mall_management'/></p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/> -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/></p>
        <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/glpay?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792'/>:</label>
            <input type="text" name="fromUser" id="fromUser" size="15" maxlength="20" value="${userName}">
            <input type="button" class="widget-button-small" onClick="Check(document.getElementById('fromUser').value)" value="<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792a'/>" name="B3" style="cursor: pointer">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-377971233'/>:</label>
            <input type="text" name="jzuser" id="jzuser" size="15" maxlength="20">
            <input type="button" class="widget-button-small" onClick="Check(document.getElementById('jzuser').value)" value="<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792a'/>" name="B3" style="cursor: pointer">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1129727398'/>：</label>
            <input type="text" name="jzpay" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.789039466'/>：</label>
            <input type="password" name="pa3" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1129224748'/>：</label>
            <input type="text" name="yy" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1123624651'/>：</label>
            <select class="widget-select" name="ration">
              <option value="0.9" selected>0.9</option>
              <option value="0.95">0.95</option>
              <option value="0"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.25870507'/></option>
            </select>
            <p class="item special">
              <label class="title"><input type="checkbox" name="C1" id="C1" onclick="dbz_show()" value="1"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.537856614'/>：</label>
              <input type="hidden" name="dbz" id="dbz"/>
            </p>
            <p class="button-line mt15">
              <button class="widget-button" type="submit" value="<s:text name='Definite_transfer'/>" name="submit2" onClick="return confirm('<s:text name="vipgpjymy.jsp.gpjymy.jsp.1046836541"/>')"><s:text name='Definite_transfer'/></button>
            </p>
        </form>
      </div>
      <!-- <s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.jzpay.value == "") {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1060233581'/>!");
    return false;
  }
  if (Form.jzpay.value < 0) {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.311072936'/>0!");
    return false;
  }
  if (Form.jzuser.value == "") {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1569959089'/>!");
    return false;
  }
  if (Form.adgl.value == "") {
    alert("<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/>!");
    return false;
  }
  if (Form.dbz.value == "" && document.getElementById("C1").checked) {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1237533928'/>!");
    return false;
  }
}

function dbz_show() {
  if (document.getElementById("C1").checked){
    document.getElementById("dbz").type = "text";
  }
  else {
    document.getElementById("dbz").type = "hidden";
    document.getElementById("dbz").value = "";
  }
}

function Check(user) {
  if (user == "") {
    alert("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
    return false;
  }
  $.post("checkUserName?user=" + user, null, function(response) {
    if (response.code == 0) { 
      alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-737966009'/>" + response.name + "]");
    } else {
      alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1911170702'/>");
    }
    return true;
  });
}
</script>
</body>

</html>
