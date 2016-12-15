<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户订单不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
    <link rel="stylesheet" href="/css/common.css" />
        <link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/> 
     <script type="text/javascript">
		 function exportExcel(){
             var url="userscoreslogoutExcel?&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
			 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
		 }
		 function querydata(){
			  var order = $("#orderId").val();
			  if (order==""){
					alert("<s:text name='pleaseinputmallorder'/>！");
					Form.orderId.focus();
					return;
				}
		  }
	</script>
</head>
<body>
    <div class="mainbox mw1024">
        
        <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
        <%@ include file="/view/head.jsp"%>

        <div class="center z-cb">
            <div class="leftbox z-l">
                
                <!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
                <%@ include file="/view/user.jsp" %>
                <%@ include file="/view/zhgl.jsp" %>
                
            </div>
            <div class="content z-l">
            <form method="POST" action="usermallorderscoreslog?status=1" name="Form" id="Form">
                <div class="content-box">
 <div class="content-title"><span><s:text name='mallorder'/><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-505493846'/> </span><%-- <c:if test="${userName=='zxz888'}"><p><form method="POST" action="userscoreslog" name="Form" id="Form"><s:text name='startdate'/>:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/><s:text name='enddate'/>:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/><input type="submit" value="<s:text name='query'/>" name="B1"><input type="button" onClick="exportExcel()" value='<s:text name="export"></s:text>'/>(<s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-505493846a'/>)</form></p></c:if> --%></div>
 <div><a href="userscoreslog"><font color="red"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-505493846'/><!-- 购物券变化明细 --></font></a>&nbsp;&nbsp;&nbsp;<s:text name='mallorderquery'/><!-- 商城订单号 -->：<input type="text" name="orderId" id="orderId" value=""/> <button  type="submit" onClick="querydata()"><s:text name='query'/><!-- 查询 --></button></a></div>
                    <div class="content-table">
                        <table>
                            <tr>
                                <th width="75"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.793443422'/></th>
                                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.748079417'/></th>
                                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1135007'/></th>
                                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.847550'/></th>
                            </tr>
                            <s:iterator var="data" value="userScoresLoglist">
                            <tr>
                                <td>${data.userName}</td>
                                <td>${data.changeNum}</td>
                                <td>${data.nowNum}</td>
                                <td>
                                  <c:choose>
                                     <c:when test="${data.changeType==1001}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.985534181'/></c:when>
                                     <c:when test="${data.changeType==1002}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.672663306'/>-${data.param}</c:when>
                                     <c:when test="${data.changeType==1003}"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/>-${data.param}</c:when>
                                     <c:when test="${data.changeType==1004}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1302859212'/>-${data.fromUser}</c:when>
                                     <c:when test="${data.changeType==1005}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-1516479278'/>-${data.fromUser}</c:when>
                                     <c:when test="${data.changeType==1006}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-1849971472'/>-${data.param}</c:when>
                                     <c:when test="${data.changeType==1007}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.2110427632'/>-${data.param}</c:when>
                                     <c:when test="${data.changeType==2001}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.672844281'/>-${data.param}</c:when>
                                     <c:when test="${data.changeType==2002}"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/>-${data.param}</c:when>
                                     <c:when test="${data.changeType==2003}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1302859212'/>-${data.fromUser}</c:when>
                                     <c:when test="${data.changeType==2004}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.2110427632'/><s:text name='viewlinks.html.links.html.1159182'/>-${data.param}-${data.fromUser}</c:when>
                                     <c:otherwise>${data.changeType}</c:otherwise>
                                  </c:choose>
                                </td>
                                <td><fmt:formatDate value="${data.createdTime}" type="both"/></td>
                            </tr>
                            </s:iterator>
                        </table>
                        <div class="page">
                           <%--  <p><aldtags:pageTag paraStr="startDate1,${startDate1},endDate1,${endDate1}"/>
                             </p> --%>
                        </div>
                    </div>
                </div>
                </form>
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
