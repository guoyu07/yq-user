<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script type="text/javascript">
	var erroCodeNum = '${erroCodeNum}';
	   if(erroCodeNum==8888){
		   alert("系统发生异常,请联系管理员，");
		   history.go(-1);
	   }else if(erroCodeNum==8889){
		   alert("非法关键字！");
		   history.go(-1);
	   }else if(erroCodeNum==8890){
		   alert("非法请求！如有疑问请联系管理员！");
		   history.go(-1);
	   }else{
		   alert("系统发生异常,请联系管理员，code="+erroCodeNum);
		   history.go(-1);
	   }
</script>
