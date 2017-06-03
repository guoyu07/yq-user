<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="/myscript/jquery.blockUI.js" type="text/javascript"></script>
<script language="javascript" src="/js/ajax.js"></script>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==1860}"><script language=javascript>alert('系统已关闭！请稍后再操作！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('操作玩家不相同！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('该积分交易进行中或已经由它人交易成功了，不能撒消，请选择其它交易！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3000}"><script language=javascript>alert('撤销失败！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('撤销成功！');</script></c:if>

<html>
<title>撤销会员积分卖出</title>
</head>
<style>
.tablen1{ width: 380px; text-align: center;  background: #D9E6FF; }
.title { text-align: center; background: red; }
.tablen1 th{ text-align: center; }
.tablen1 td{ background: #FFF; }
</style>

<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">

  <table border="0" cellspacing="1" width="100%" bgcolor="#7bb5de" height="184">
    <tr>
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
        <p align="center"><font color="#000000" style="font-size: 14px"><strong>撤销会员积分卖出</strong></font>
      </td> 
  </tr> 
  <tr> 
      <td width="100%" bgcolor="#D9E6FF">   <div align="center"><center>

	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
           <tr> 
              <td width="120" align="center" height="27" bgcolor="#C3DAF9"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">用户名</strong></font></td>
              <td width="97" align="center" height="27" bgcolor="#C3DAF9"><font color="#FF0000" face="宋体" size="2"> <strong style="font-weight: 400">卖出</strong></font></td>
              <td width="99" align="center" height="27" bgcolor="#C3DAF9"><font face="宋体" color="#000000" size="2">剩余</font></td>
              <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">挂牌时间</font></td>
              <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">当前价格</font></td>
              <!-- <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">修改价格</font></td> -->
              <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">操作</font></td>
           </tr>
          <s:iterator var="data" value="dataList">
              <tr> 
              <td height="31" width="120" align="center"><font color="#000000" face="宋体" size="2.7">${data.username}</font></td>
              <td valign="middle" align="center"><font color="#FF0000" face="宋体" size="2.7">${data.mcsl}</font></td>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2.7">${data.sysl}</font></td>
              <td valign="middle" align="center" width="95" ><font color="#000000" face="宋体" size="2.7"><fmt:formatDate value="${data.abdate}" type="both"/></font></td>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2.7">${data.pay}</font></td>
               <%-- <td><a href="/admin/canclePointSale?sgid=${data.id}&secondThisState=${secondThisState}&thisState=${thisState}">修改价格</a></td> --%>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2.7"><c:if test="${data.newjy!=3}"><a href="/admin/canclePointSale?qxid=${data.id}&status=1&user=${user}" style="text-decoration: none">撒销</a></c:if></font></td>
              </tr>
             </s:iterator>
  </tr> 
</table>
</div><font face="宋体" style="font-size: 11pt"><aldtags:pageTag para1="status" value1="1" para2="user" value2="${user}"/>
</font> 
<p align="center"><b><a href="/admin/searchuserpoint" style="text-decoration: none"><font color="#FF0000" size="6">返 回 搜 索</font></a></b></p>

<script type="text/javascript">

function reset(username){
	var confirmInfo = "你确定要重置玩家业绩吗？";
	if(confirm(confirmInfo)){
		$.blockUI({ message: "<p><img src='/images/busy.gif'></img><p id='blockMsgPar'>"+"正在重置用户"+username+"的业绩，请稍等......"+'</p></p>'}); 
		 $.ajax({
			url:"resetAchievement",
			data:{"user":username},
			dataType:"json",
			cache:false,
			success:function(data){
				//alert(JSON.stringify(data));
				$.unblockUI();
				if(data.status==1){
					alert("用户不存在!");
					return;
				}else{
					alert("玩家业绩重置完毕!");
					window.location.href="searchuser.action?status=1&user="+username;
				}
				
			}
		}); 
	}
}

</script>
</body> 
</html>