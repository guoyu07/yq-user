<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('操作密码错误！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('修改成功！');</script></c:if>
<title>vip信息设置</title>
<style>
<!--
p{color:000000;FONT-FAMILY: "??"; font-size: 9pt ;line-height: 20px;}
p{color:000000;FONT-FAMILY: "宋体"; font-size: 9pt ;line-height: 18px;}
-->
</style>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">
<span style="font-size: 9pt">
</body>
</html>
</span>
<div align="center">
<script language="JavaScript"> 
Form.bt.disabled=false;
 function checkdate()  {
	 if(Form.payok.value==''&&Form.pend.value==''){
		 alert("密码或提现限制必须填写一个！");
		 return false;
	 }
	 
	 
	 Form.bt.disabled=true;
	 Form.bt.value="正在执行。。不要动页面~";
	 
	 
  return true;  
  }  
 </script>
<form METHOD="POST" action="updateuserpayok?status=1&user=${user}" onSubmit="return checkdate();" name="Form" id="Form">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="123">
    
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">修改用户：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">${user}</td>
      </tr>
       <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">payok：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="text" name="payok" size="20" value="">(${user}团队下所有用户及其同名账户的提现限制都会变为改值,不填则不修改)</td>
      </tr>
       <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">二级密码后缀：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="text" name="pend" size="20" value="">(${user}团队下所有用户及其同名账户的二级密码都会加入该后缀，不填则不修改）</td>
      </tr>      
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">注册时间：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="text" name="regTime" id="regTime" size="20" value="">如果不填 则表示不限制，如果填了则团队下用户的注册时间在该时间之后才会被修改</td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">操作密码：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="password" name="oppass" size="20" value=""></td>
      </tr>     
      <c:if test="${erroCodeNum==2000}">
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">修改成功：一共修改了以下用户及其下所有同名账户，</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">${result}</td>
      </tr>
      </c:if>
      
      <tr> 
      <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="33"><div align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" name="submit" width="34" height="20" alt="提交" size="20" value="提交" class="lkbtn" id="bt" name="bt"></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
    </form>
</div>

 <script type="text/javascript">
 Form.bt.disabled=false;
		$('#regTime').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>