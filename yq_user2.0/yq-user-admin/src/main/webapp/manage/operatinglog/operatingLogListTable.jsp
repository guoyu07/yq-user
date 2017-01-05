<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${ctx}/scripts/script.js"></script>
<script type="text/javascript" src="${ctx}/scripts/table.js"></script>
<link href="${ctx}/scripts/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$(".iframe").colorbox({iframe:true, width:"35%", height:"60%"});
});

function pageGo(page){
	$("#pageNumber").val(page);
	var pageInfoNum=parseInt($("#pageInfoNum").val());	
	var action=$("#par").val();
	var startTime=$("#startTime").val();
	var endTime=$("#endTime").val();
	var key=$("#key").val();
	
	if((startTime!=""&&endTime=="")||(startTime==""&&endTime!="")){
		alert($("#SelectCreateStartAndEndTime").val());
		return ;
	}
	
	$.post(ctx+"/operationLog/operatingLogList.action",{ajax: "true",key: key,startTime:startTime,endTime:endTime,pageNumber:page,pageInfoNum:pageInfoNum,action:action},
			   function(data){
	              $("#biaoge").html(data);
			   });
}

</script>
<div class="div_content">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table class="bought-table">
					<thead>
						<tr>
							<th align="center">
								<s:text name="LogId"></s:text>
							</th>
							<th align="center">
								<s:text name="OperatorModule"></s:text>
							</th>
							<th align="center">
								<s:text name="OperatorAction"></s:text>
							</th>
							<th align="center">
								<s:text name="Operator_2"></s:text>
							</th>
							<th align="center">
								<s:text name="Remark"></s:text>
							</th>
							<th align="center">
								<s:text name="OperatorTime"></s:text>
							</th>
						</tr>
					</thead>
					<tbody class=" success-order">
						<c:if test="${page ne null}">
							<c:forEach items="${page.list}" var="operatingLog">
								<tr>
									<td align="center">
										${operatingLog.id}
									</td>
									<td align="center">
										${operatingLog.operatingModule}
									</td>
									<td align="center">
										${operatingLog.operatingAction}
									</td>
									<td align="center">
										${operatingLog.operatingName}
									</td>
									<td align="center">
										<c:choose>
											<c:when test="${fn:length(operatingLog.operatingInfo)>20}">
												<a title="${operatingLog.operatingInfo}">${fn:substring(operatingLog.operatingInfo,
													0, 20)}...</a>
											</c:when>
											<c:otherwise>
												<a title="${operatingLog.operatingInfo}">${operatingLog.operatingInfo}</a>
											</c:otherwise>
										</c:choose>
									</td>
									<td align="center">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${operatingLog.operatingDate}" var="ca" />
										${ca}
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr class="sep-row">
							<td colspan="5"></td>
						</tr>
						<tr class="pagebar">
							<td colspan="5">
								<table width="100%" border="0" cellspacing="0" cellpadding="5">
									<tr>
										<td>
											&nbsp;
										</td>
										<td width="410">
											<c:if test="${page ne null}">
												<%@ include file="/jsp/include/page.jsp"%>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</tfoot>
				</table>
				<div style="clear: both;"></div>
			</td>
		</tr>
	</table>
</div>
