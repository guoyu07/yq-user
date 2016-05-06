<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('此用户名已有人使用！请更换！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('恭喜同姓名用户注册成功，请进行下一步的操作！');location.href='tgdown'</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
	
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script language="javascript" src="/js/ajax.js"></script>

<script language="JavaScript"> 
function Check(){
	if ( Form.gguser.value==""){
		alert ("提示：用户名不能为空!！");
		Form.gguser.focus();
		return false;
	}
	 if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
		alert("提示：\n\n您的用户名不符合规范，必须4-10个小写英文字母+数字！");
		Form.gguser.focus();
		return false;
	}
    var uName=document.Form.gguser.value;
    var ajaxobj = new Ajax();
    ajaxobj.url="checkreg?gguser="+uName;
    ajaxobj.callback=function(){
	    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
	    if(responseMsg.erroCodeNum!=0){
	    	alert("对不起，用户名："+uName+"，已经被注册了！");
		    return;
	    }else{
	    	alert("恭喜，您可以注册用户名："+uName);
	    	return;
	    }
    }
    ajaxobj.send();
}

function CheckIfEnglish( String )
{ 
    var Letters = "abcdefghijklmnopqrstuvwxyz0123456789";
     var i;
     var c;
      if(String.charAt( 0 )=='-')
	return false;
      if( String.charAt( String.length - 1 ) == '-' )
          return false;
     for( i = 0; i < String.length; i ++ )
     {
          c = String.charAt( i );
	  if (Letters.indexOf( c ) < 0)
	     return false;
     }
     return true;
}

 function checkdate()  {  
  if (Form.gguser.value=="") {      alert("用户名不能为空!"); Form.gguser.focus();     return false;    } 
  	        if (!CheckIfEnglish(Form.gguser.value ) || Form.gguser.value.length > 12 || Form.gguser.value.length < 4) {
		alert("提示：\n\n您的用户名不符合规范，必须4-12个小写英文字母+数字！");
		Form.gguser.focus();
		return false;
	}
 
  if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    } 
return true;  }  
</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp" %>
				
			</div>
			<div class="z-l">
				<div class="content-box1" style="height:190px;">
					<div class="content-title">
						<span>添加同名用户</span>
					</div>
					<div class="content-form">
						 此处注册为当前登录账户快捷添加同姓名新用户使用，仅需要自定义一个新用户名，其它资料与当前登录账户相同！ 如您需要注册不同姓名的新用户请到   <a href="reg">注册新账户</a>
					</div>
				</div>
				<div class="content-box2 mt10"  style="height:310px;">
					<form class="form form3" method="POST" action="regTheSame?status=1" name="Form" onSubmit="return checkdate()">
							<p><label>用户名：</label><input type="text" name="gguser" size="15" maxlength="12" onKeyUp="value=value.replace(/[\W]/g,'')"></p>
							<p><label>一级密码：</label>与当前登录账户相同</p>
							<p><label>二级密码：</label>与当前登录账户相同</p>
							<p><label>姓名：</label>${gcuser.name}</p>
							<p><label>推荐人：</label>${gcuser.username}</p>
							<p><label>协议及声明：</label>
								<select size="1" name="sfz">
								<option selected value="0">==请选择是否同意协议及声明==</option>
								<option value="0">不同意！</option>
								<option value="1">同意协议及声明，自愿参与！</option>
								</select>
								<a href="javascript:openwindow('/sfz.html')" class="c-g xy-sm">查看协议及声明</a>
							</p>
							<p><label></label><button class="but1" type="submit">提 交 注 册</button></p>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>