<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script type="text/javascript">
	var erroCodeNum = '${erroCodeNum}';
	   if(erroCodeNum==8888){
		   alert("<s:text name='commonglober_error.jsp.glober_error.jsp.2117488089'/>，");
		   history.go(-1);
	   }else if(erroCodeNum==8889){
		   alert("<s:text name='commonglober_error.jsp.glober_error.jsp.-2017014779'/>！");
		   history.go(-1);
	   }else if(erroCodeNum==8890){
		   alert("<s:text name='commonglober_error.jsp.glober_error.jsp.-474278984'/>！");
		   history.go(-1);
	   }else{
		   alert("<s:text name='commonglober_error.jsp.glober_error.jsp.2117488089'/>，code="+erroCodeNum);
		   history.go(-1);
	   }
</script>
