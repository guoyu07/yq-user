<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><s:text name="CompanyName"></s:text></title>
		<%@ include file="/commons/meta.jsp"%>
		<link rel="stylesheet" type="text/css" href="${exthome}/resources/css/ext-all.css" />
		<script type="text/javascript" src="${exthome}/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="${exthome}/ext-all.js"></script>
		<script src="${widgethome}/open/lhgdialog.js" type=text/javascript></script>
		<script src="${wdatehome}/WdatePicker.js" type="text/javascript"></script>
		<script language="javascript" src="${ctx}/scripts/script.js"></script>
		<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${ctx}/scripts/jquery-1.7.2.mini.js"></script>
		<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
		<link href="${ctx}/scripts/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
		<script type="text/javascript">
			
	    $(document).ready(function(){
			//选中菜单
			$("#system").attr("class","nav hover");
			$(".iframe").colorbox({iframe:true, width:"35%", height:"60%"});
		});
		
		function sub(){
			var startTime=$("#startTime").val();
			var endTime=$("#endTime").val();
			var action=$("#par").val();
			var key=$("#key").val();
			if((startTime!=""&&endTime=="")||(startTime==""&&endTime!="")){
				alert($("#SelectCreateStartAndEndTime").val());
				return ;
			}
			$.post(ctx+"/operationLog/operatingLogList.action",{ajax: "true", startTime:startTime,endTime:endTime,key:key,action:action},
					   function(data){
			              $("#biaoge").html(data);
					   });
		}
		
		function exportExcelLog(){
			var startTime=$("#startTime").val();
			var endTime=$("#endTime").val();
			var key=$("#key").val();
			var action=$("#par").val();
	
			if((startTime==""&&endTime=="")||(startTime!=""&&endTime=="")||(startTime==""&&endTime!="")){
				alert($("#SelectCreateStartAndEndTime").val());
				return ;
			}
			
			window.location.href=ctx+"/operationLog/exportExcelLog.action?startTime="+startTime+"&endTime="+endTime+"&key="+key+"&action="+action;
		}
			
		</script>
	</head>
	<body>
		<input type="hidden" name="SelectCreateStartAndEndTime" id="SelectCreateStartAndEndTime"
			value="<s:text name="SelectCreateStartAndEndTime"></s:text>" />
		<jsp:include flush="false" page="/sys_menu.jsp" />
		<div style="height: 10px;">
		</div>
		<div class="table_div">
			<table border="0" cellspacing="0" cellpadding="0" width="" style="width: 100%;">
				<tr>
					<td width="188" valign="top">
						<!-- 嵌入右侧菜单页面 -->
						<%@ include file="/jsp/include/playerLeft.jsp"%>
					</td>
					<td valign="top">
						<div class="table_right">
							<div class="moudle_div">
								<div class="sidebar_title">
									<div class="sidebar_title_border">
										<s:text name="CurrentPosition_SystemManagement_OperateLog"></s:text>
									</div>
								</div>
								<form action="" name="newForm" id="newForm" method="post">
									<div class="seach_div">
										操作人或被操作玩家ID：
										<input name="key" id="key" type="text" size="25" value="${key}" />
										&nbsp;&nbsp;
										操作行为：
										<select id="par" name="par">
											<option id="" value=""><s:text name="Select"></s:text></option>
											<c:forEach items="${action}" var="par">
												<option id="" value="${par}">${par}</option>
											</c:forEach>
										</select>
										<br />
										<s:text name="StartTime_1"></s:text>
										<input name="startTime" id="startTime" type="text" size="25"
											onclick="WdatePicker({el:'startTime',dateFmt:'yyyy-MM-dd HH:mm:ss',skin:'ext'})" value="${startTime}" />
										&nbsp;&nbsp;
										<s:text name="EndTime_1"></s:text>
										<input name="endTime" id="endTime" type="text" size="25" onclick="WdatePicker({el:'endTime',dateFmt:'yyyy-MM-dd HH:mm:ss',skin:'ext'})"
											value="${endTime}" />
										&nbsp;&nbsp;
										<input name="input" type="button" " value="<s:text name="Search"></s:text>" class="btn_w66_write" onclick="sub();" />
										&nbsp;&nbsp;
										<input name="input" type="button" " value="<s:text name="Export"></s:text>" class="btn_w66_write" onclick="exportExcelLog();" />
									</div>
								</form>
								<div class="div_content">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="100%" height="100%" valign="top" colspan="2">
												<div id="biaoge"><jsp:include flush="false" page="operatingLogListTable.jsp" /></div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
				</tr>
			</table>
		</div>
		<div class="bottom" id="bottom">
			<jsp:include flush="false" page="/down.jsp" />
		</div>
	</body>
</html>
