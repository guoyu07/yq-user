<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('该会员不存在或已经是双区会员，不需要重复报单，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('报单人不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('恭喜开通成功，奖金业绩已更新。。。！');location.href='/admin/adminbduser';</script></c:if>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>

<style>
.box{position:absolute;width:600px;left:50%;height:auto;z-index:100;background-color:#fff;border:1px #ddd solid;padding:1px;}
.box h2{height:100px;font-size:14px;background-color:#aaa;position:relative;padding-left:100px;line-height:100px;color:#fff;}
.box h2 a{position:absolute;right:250px;font-size:12px;color:#fff;}
.box .list{padding:10px;}
.box .list li{height:24px;line-height:24px;}
.box .list li span{margin:0 5px 0 0;font-family:"宋体";font-size:12px;font-weight:400;color:#ddd;}
.showbtn {font:bold 24px '微软雅黑';}
#bg{background-color:#666;position:absolute;z-index:99;left:0;top:0;display:none;width:100%;height:100%;opacity:0.5;filter: alpha(opacity=50);-moz-opacity: 0.5;}
</style>
<script src="/scripts/jquery.js"></script>

<script type="text/javascript">
   function check(){
	   if(Form.bdUser.value==''){
		   alert("绑定用户不能为空！");
		   return false;
	   }
	   if(confirm("确定要绑定用户【"+Form.bdUser.value+"】,绑定等级为【"+Form.sjb.value+"】吗？"))
	   {
		  showDiv();
	      return true;
	   }
	   return false;
   }
</script>
</head>
<body>
<form method="POST" action="adminbduser?status=1" name="Form" id="Form" onSubmit="return check();">
	<div align="center">
		<font color="#008000"></font><table border="0" width="30%" id="table1" cellspacing="3" height="68" cellpadding="2">
			<tr>
				<td align="right" width="133">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">绑定用户名：</td>
				<td><font color="#0000FF"><b>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"></b></font><input type="text" name="bdUser" size="10" value=""></td>
			</tr>
			<tr>
				<td align="right" width="133">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">绑定等级：</td>
				<td><font color="#0000FF"><b>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"></b></font><select name="sjb">
				  <option value="2" selected>2</option>
				  <option value="4">4</option>
				  <option value="10">10</option>
				  <option value="20">20</option>
				  <option value="40">40</option>
				  <option value="100">100</option>
				</select></td>
			</tr>
			</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交" name="B1"></p>
</form>
<div id="bg"></div>
<div class="box" style="display:none">
    <h2>重要提示：系统正在核算中...请停止其它操作，更不要关闭本页！</h2>
</div>
</body>
</html>

<script type="text/javascript">
   function showDiv(){
       $("#bg").css({
           display: "block", height: $(document).height()
       });
       var $box = $('.box');
       $box.css({
           //设置弹出层距离左边的位置
           left: ($("body").width() - $box.width()) / 2 - 20 + "px",
           //设置弹出层距离上面的位置
           top: ($(window).height() - $box.height()) / 2 + $(window).scrollTop() + "px",
           display: "block"
       });
   }
</script>