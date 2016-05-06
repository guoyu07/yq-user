<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script type="text/javascript">
	var erroCodeNum = '${erroCodeNum}';
		alert("该系统已关闭，请稍后再试:["+erroCodeNum+"]");
		history.go(-1);
</script>
