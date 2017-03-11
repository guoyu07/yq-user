<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|累计分红</title>
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
      <!-- 全部分红明细 -->
      <div class="main-widget">
        <p class="widget-title-line">全部分红明细</p>
        <p class="small-button-line">
          <!-- <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="gcbfp1detail?status=1&lb=1">查看更多</a> -->
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>个人持点数量</th>
                <th>每点分红</th>
                <th>本期累计</th>
                <th>所有累计</th>
                <th>分红时间</th>
                <th>备注</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${gcuser.username}</td>
					<td>${data.sygc}</td>
					<td><c:if test="${fhpay<1}">0</c:if><c:if test="${fhpay>=1}">${fhpay}</c:if></td>
					<td>${data.syfh}</td>
					<td>${data.ljfhtj}</td>
					<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
					<td>${data.bz}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
          <p class="widget-pages">
			<aldtags:pageTag paraStr="lb,${lb},thisState,${thisState},secondThisState,${secondThisState}"/>
			</p>
        </div>
      </div>
      <!-- 全部分红明细 end -->
    </div>
  </div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function CheckIfEnglish(str) {
  if (/[a-z]/.test(str) && /[0-9]/.test(str)) {
    return true;
  } else {
    return false;
  }
}

function checkdate() {

  if (Form.name.value == "") {
    alert("请输入姓名！");
    Form.name.focus();
    return false;
  }
  if (Form.newPassWord1.value != "" || Form.newPassWord2.value != "") {
    if (Form.newPassWord1.value != Form.newPassWord2.value) {
      alert("两次输入新登录密码不同！");
      Form.newPassWord1.focus();
      return false;
    }
    if (!CheckIfEnglish(Form.newPassWord1.value)) {
      alert("您的新登录密码不符合规范，必须小写英文字母+数字！");
      Form.newPassWord1.focus();
      return false;
    }
    if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {
      alert("提示：您的登录密码最少6位数，最大18位数！");
      Form.newPassWord1.focus();
      return false;
    }
  }
  if (Form.newSecondPassword1.value != "" || Form.newSecondPassword2.value != "") {
    if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {
      alert("两次输入新二级密码不同！");
      Form.newPassWord1.focus();
      return false;
    }
    if (!CheckIfEnglish(Form.newSecondPassword1.value)) {
      alert("您的二级密码不符合规范，必须小写英文字母+数字！");
      Form.newSecondPassword1.focus();
      return false;
    }
    if (Form.newSecondPassword1.value.length < 10) {
      alert("二级密码至少为10位数!");
      Form.newSecondPassword1.focus();
      return false;
    }
    if (Form.newSecondPassword1.value.length > 20) {
      alert("二级密码至多为20位数!");
      Form.newSecondPassword1.focus();
      return false;
    }
  }
  if (Form.bank.value == "") {
    alert("请选择收款银行！");
    Form.bank.focus();
    return false;
  }
  if (Form.card.value == "") {
    alert("请填入您的收款账号！");
    Form.card.focus();
    return false;
  }
  if (Form.provinceName.value == 0) {
    alert("请选择省份!");
    return false;
  }
  if (Form.cityName.value == 0) {
    alert("请选择城市!");
    return false;
  }
  if (Form.areaName.value == 0) {
    alert("请选择地区!");
    return false;
  }
  /* if (Form.areaCode.value=="") {      alert("国际区域码不能为空!");      return false;    } */
  if (Form.secondPassword.value == "") {
    alert("请填入您的二级密码！");
    Form.secondPassword.focus();
    return false;
  }
  if (Form.idCard.value == "") {
    alert("请填入您的身份证号码！");
    Form.idCard.focus();
    return false;
  }

  return true;
}

function sendMsg() {
  if (!checkdate()) {
    return;
  }
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=1", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("手机验证码发送失败");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("手机验证码发送成功");
  });
}

function checkdate1() {
  if (Form.smsCode.value == "") {
    alert("请先点击获取验证码，然后再填入您的手机收到的验证码");
    Form.smsCode.focus();
    return false;
  }
  if (!checkdate()) {
    return;
  }
  var data = $("#Form").serialize();
  $.post("userga?status=2", data, function(response) {
    if (response.erroCodeNum == 0) { //更新成功
      alert('更新资料成功，请重新登录！');
      location.replace('../index.jsp?id=' + Form.userName.value);
    } else if (response.erroCodeNum == 1) {
      alert('用户不存在');
      return;
    } else if (response.erroCodeNum == 2) {
      alert('您填入的手机验证码不正确！');
      return;
    } else if (response.erroCodeNum == 3) {
      alert('您填入的二级密码不正确！');
      return;
    } else if (response.erroCodeNum == 4) {
      alert('您填入的身份证号码不正确！');
      return;
    } else if (response.erroCodeNum == 5) {
      alert('两次输入新登录密码不同！');
      return;
    } else if (response.erroCodeNum == 6) {
      alert('两次输入新二级密码不同！');
      return;
    } else {
      alert('发生了错误.[' + response.erroCodeNum + ']');
      return;
    }
  });
  return true;
}
</script>
<script language="javascript" type="text/javascript">
function ChangeProvince(subid) {

  document.getElementById("cityName").length = 0;
  var subid = subid;
  var i;
  document.getElementById("cityName").options[0] = new Option('==请选择城市==', '0');
  for (i = 0; i < subCity.length; i++) {
    if (subCity[i][1] == subid) {
      document.getElementById("cityName").options[document.getElementById("cityName").length] = new Option(subCity[i][0], subCity[i][2]);
    }
  }
  ChangeCity(0)
}

function ChangeCity(subid) {
  document.getElementById("areaName").length = 0;
  var subid = subid;
  var i;
  document.getElementById("areaName").options[0] = new Option('==请选择地区==', '0');
  for (i = 0; i < subArea.length; i++) {
    if (subArea[i][1] == subid) {
      document.getElementById("areaName").options[document.getElementById("areaName").length] = new Option(subArea[i][0], subArea[i][2]);
    }
  }
}

function AmendCity(ProvinceID, CityID, AreaID) {
  ChangeProvince(ProvinceID);
  for (var i = 1; i < document.getElementById("cityName").length; i++) {
    if (document.getElementById("cityName").options[i].value == CityID) {
      document.getElementById("cityName").options[i].selected = true;
    }
  }
  ChangeCity(CityID);
  for (var i = 1; i < document.getElementById("areaName").length; i++) {
    if (document.getElementById("areaName").options[i].value == AreaID) {
      document.getElementById("areaName").options[i].selected = true;
    }
  }
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');
</script>
</body>

</html>
