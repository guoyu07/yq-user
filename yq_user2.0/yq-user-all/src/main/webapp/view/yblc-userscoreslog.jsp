<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>中国一川（澳门）国际有限公司</title>
    <link rel="stylesheet" href="/css/common.css" />
    
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
                    <div class="content-title">
                        <span>购物券变化明细</span>
                        
                    </div>
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
                            <p><aldtags:pageTag />
                             </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
