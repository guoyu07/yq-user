<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.624662580'/>|<s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2008491582'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='viewyblc.jsp.yblc.jsp.618950045'/></p>
   <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
      <!-- 一币卖出明细表格 -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2008491582'/></p>
        <p class="small-button-line"><!-- <a href="javascript:void(0)" class="widget-button-small JQ_moreDialog" data-url="epmyjlmrdetail?status=1" id="J_ebSaleDetailMore"><s:text name='View_more'/></a></p> -->
        <div class="widget-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404'/></th>
                <th><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.1089491839'/></th>
                <th><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.868743081'/></th>
                <th><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.1100547719'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.21178581'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.625799226'/></th>
                <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
                <th><s:text name='operation.state'/></th>
              </tr>
            </thead>
            <tbody>
               <s:iterator var="data" value="dataList">
				<tr>
				<td>***${data.simplePayid}</td>
				<td>${data.dfuser}</td>
				<td>${data.paynum}</td>
				<td><fmt:formatDate value="${data.rgdate}" type="both"/></td>
				<td> ${data.payusername}</td>
				<td> 
				<c:if test="${not empty zftime}">
                                                               <s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.691355938'/>${data.payusername}<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.691355938a'/>。
          </c:if>
          <c:if test="${empty zftime}">
                <c:if test="${data.ep==1}"><font color="#FF00FF"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-2134021130'/></font><font color="#0000FF"><b>${data.rgdate}</b></font><font color="#FF00FF"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-2134021130a'/>，<b><a target="_blank" href="fbbank?fb=${data.payid}&secondThisState=${secondThisState}&thisState=${thisState}"><font color="#008000"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-2134021130b'/>！</font></a></b></font></c:if>                                                
                <c:if test="${data.ep==2}">${data.dfuser}--<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1073667942'/>${data.payusername}<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1073667942a'/>。。。</c:if>
          </c:if>
	          	</td>

        					<td><c:if test="${data.ep==1}"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.314771621'/>${data.paynum9}<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.314771621a'/>。</c:if></font></a>
        					</td>
        					<td><c:if test="${data.opstate==1}"><s:text name='Order.is.reset'/></c:if></td>
							
				</tr>
			</s:iterator>
            </tbody>
          </table>
        </div>
        <p class="widget-pages">
<aldtags:pageTag paraStr="status,${status},lb,${lb},thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
      </div>
    </div>
    <!-- 一币卖出明细表格 end -->
  </div>
</div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
/*验证交互*/
function checkdate() {
  if (Form.ebSaleNum.value == 0) {
    alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-861806777'/>!");
    return false;
  }
  if (!chkinteger(Form.ebSaleNum.value)) {
    alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.431301541'/>!');
    document.Form.ebSaleNum.focus;
    return false;
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

  if (Form.ebSaleNum.value > ${gcuser.pay-gcuser.vippay}) {
    alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977'/>!");
    return false;
  }
  if (Form.ebSaleNum.value < 100) {
    alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1837041227'/>!");
    return false;
  }
  if (Form.pa3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=3", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886666017'/>");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886721436'/>");
  });
  return false;
}

function checkdate1() {
  if (Form.ybcodeid.value == "") {
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");
    Form.ybcodeid.focus();
    return false;
  }
  return true;
}
</script>
</body>

</html>
