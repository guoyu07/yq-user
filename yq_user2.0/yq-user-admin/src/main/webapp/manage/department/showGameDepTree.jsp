<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/manage/commons/meta.jsp"%>
		<link rel="stylesheet" type="text/css" href="${exthome}/resources/css/ext-all.css" />
		<script type="text/javascript" src="${exthome}/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="${exthome}/ext-all.js"></script>
		<script type="text/javascript" src="${exthome}/extend/TreeCheckNodeUI.js"></script>
		<!-- 引入相关的自定义JS文件 -->
		<script type="text/javascript" src="${ctx}/scripts/loadTree/gameDepTreeCheck.js"></script>
		<script type="text/javascript">
	var p = window.parent;
	var d = p.loadinndlg();
	window.onload = function()
	{
	    p.crebtn('button',$("#Confirm").val(),submitTree);  //创建一个下一步按钮
	}
	
	function submitTree(){
		$.post("/department/saveServerIds.action", 
		  {depIds: getChecked(),gameId:$("#gameId").val()},
			function(data){
				alert(data.info);
				p.cancel();
			},
		 "json");
	}
</script>
	</head>
	<body>
		<input type="hidden" name="Confirm" id="Confirm" value="Confirm" />
		<input type="hidden" name="gameId" id="gameId" value="<%=request.getParameter("gameId")%>" />
		<div id="depTree" style="height: 260px; width: 270px; overflow: hidden"></div>
	</body>
</html>
