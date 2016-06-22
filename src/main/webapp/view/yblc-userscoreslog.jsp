<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>会员中心</title>
    <link rel="stylesheet" href="/css/common.css" />
        <link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/> 
     <script type="text/javascript">
		 function exportExcel(){
			 var url="userscoreslogoutExcel?&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
			 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
		 }
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
                <%@ include file="/view/zhgl.jsp" %>
                
            </div>
            <div class="content z-l">
                <div class="content-box">
 <div class="content-title"><span>购物券变化明细 </span><c:if test="${userName=='zxz888'}"><p><form method="POST" action="userscoreslog" name="Form" id="Form">开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/><input type="submit" value="查询" name="B1"><input type="button" onClick="exportExcel()" value="导出excel"/>(每次的导出数量不能超过5000条)</form></p></c:if></div>
                    <div class="content-table">
                        <table>
                            <tr>
                                <th width="75">用户名</th>
                                <th>改变数量</th>
                                <th>当前数量</th>
                                <th>详情</th>
                                <th>时间</th>
                            </tr>
                            <s:iterator var="data" value="dataList">
                            <tr>
                                <td>${data.userName}</td>
                                <td>${data.changeNum}</td>
                                <td>${data.nowNum}</td>
                                <td>
                                  <c:choose>
                                     <c:when test="${data.changeType==1001}">系统赠送</c:when>
                                     <c:when test="${data.changeType==1002}">商城增加-${data.param}</c:when>
                                     <c:when test="${data.changeType==1003}">商城退款-${data.param}</c:when>
                                     <c:when test="${data.changeType==1004}">同名账户转账-${data.fromUser}</c:when>
                                     <c:when test="${data.changeType==2001}">商城消费-${data.param}</c:when>
                                     <c:when test="${data.changeType==2002}">商城退款-${data.param}</c:when>
                                     <c:when test="${data.changeType==2003}">同名账户转账-${data.fromUser}</c:when>
                                     <c:otherwise>${data.changeType}</c:otherwise>
                                  </c:choose>
                                </td>
                                <td><fmt:formatDate value="${data.createdTime}" type="both"/></td>
                            </tr>
                            </s:iterator>
                        </table>
                        <div class="page">
                            <p><aldtags:pageTag paraStr="startDate1,${startDate1},endDate1,${endDate1}"/>
                             </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
    <script type="text/javascript" src="/scripts/jquery.js"></script>
    <script src="/scripts/jquery.datetimepicker.js"></script>
<script type="text/javascript">
		$('#startDate1').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
		
		$('#endDate1').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
</script>
</html>
