<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="/myscript/jquery.blockUI.js" type="text/javascript"></script>
<script language="javascript" src="/js/ajax.js"></script>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户不存在！');history.go(-1);</script></c:if>
<c:if test="${code==1}"><script language=javascript>alert('用户不存在1！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('报单数不支持退户，只支持 10000，20000，50000！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('金币不足，不允许退户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('购物券不足，不允许退户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('推荐奖励没有减成功，不允许退户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('下面已挂载了用户，不能退户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('有玩家已经结算，不能退户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('账号不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('退户成功！');window.location.href="searchuser.action?status=1&user="${user};</script></c:if>

<html>
<title>显示用户信息</title>
</head>
<style>
.tablen1{ width: 380px; text-align: center;  background: #D9E6FF; }
.title { text-align: center; background: red; }
.tablen1 th{ text-align: center; }
.tablen1 td{ background: #FFF; }
</style>
<script language="javascript">
function agentReson(username) 
{ 
	var resionMassage=prompt("请输入备注原因:","玩家操作违规") 
	if(resionMassage.length>50){
		alert("不能超过50个字，请重新输入！");
		agentReson(username) ;
	}
 if (resionMassage!=null && resionMassage!="") 
	{ 
	 go(username,resionMassage);
	} 
}  
function noagentReson(username) 
{ 
	var resionMassage=prompt("请输入备注原因:","解封") 
	if(resionMassage.length>50){
		alert("不能超过50个字，请重新输入！");
		agentReson(username) ;
	}
 if (resionMassage!=null && resionMassage!="") 
	{ 
	 go1(username,resionMassage);
	} 
} 

function go(username,resionMassage){
	var str;
	str="/admin/useragent?state=1&user="+username+"&resionMassage="+resionMassage;
	window.location=str; 
	}
 

function go1(username,resionMassage){
	var str;
	str="/admin/useragent?state=0&user="+username+"&resionMassage="+resionMassage;
	window.location=str; 
}

</script>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">

  <table border="0" cellspacing="1" width="100%" bgcolor="#7bb5de" height="184">
    <tr>
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
        <p align="center"><font color="#000000" style="font-size: 14px"><strong>搜 索 会 员 信 息 结 果</strong></font>
      </td> 
  </tr> 
  <tr> 
      <td width="100%" bgcolor="#D9E6FF">   <div align="center"><center>

            <table border="1" cellspacing="0" width="100%" bgcolor="#F6F6EC" style="border-collapse: collapse" cellpadding="0" height="62">
              <tr bgcolor="#7bb5de"> 
                <td width="144" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>用户名</strong></font></td>
                <td width="84" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong style="font-weight: 400">姓名</strong></font></td>
                <td width="84" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong style="font-weight: 400">身份证号</strong></font></td>
                <td width="131" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="宋体">推荐人</font></div></td>
                <td width="156" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体">QQ</font></td>
                <td width="210" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="Arial">注册时间</font></div></td>
                <td width="127" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="Arial">原始股</font></div></td>
                <td width="118" align="center" height="23" bgcolor="#D9E6FF">交易股</td>
                <td width="115" align="center" height="23" bgcolor="#D9E6FF"><font face="Arial">金币</font></td>
                <td width="120" align="center" height="23" bgcolor="#D9E6FF">全部奖金</td>
                <td width="115" align="center" height="23" bgcolor="#D9E6FF">剩余奖金</td>
                <td width="115" align="center" height="23" bgcolor="#D9E6FF">禁封状态</td>
                <td width="115" align="center" height="23" bgcolor="#D9E6FF">操作</td>
              </tr>
         <s:iterator var="data" value="dataList">
              <tr bgcolor="#7bb5de"> 
                <td style="border-bottom: 1px solid #C9D8AD" width="144" align="center" bgcolor="#D9E6FF"><p align="center">${data.username}</td>
                <td style="border-bottom: 1px solid #C9D8AD" width="84" align="center" bgcolor="#D9E6FF"><p align="center">${data.name}</td>
                <td style="border-bottom: 1px solid #C9D8AD" width="84" align="center" bgcolor="#D9E6FF"><p align="center">${data.userid}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="131" bgcolor="#D9E6FF"> <div align="center"><font color="#FF0000">${data.up}</font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="156" bgcolor="#D9E6FF"><div align="center">${data.qq}</div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="210" bgcolor="#D9E6FF"><div align="center">${data.regtime}</div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="127" bgcolor="#D9E6FF"><div align="center">${data.gdgc}</div></td>
                
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="118" bgcolor="#D9E6FF">${data.jyg}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="115" bgcolor="#D9E6FF">${data.jydb}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="120" bgcolor="#D9E6FF">${data.cbpay}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="115" bgcolor="#D9E6FF">${data.pay}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="115" bgcolor="#D9E6FF"><c:if test="${data.userAgent==0}">正常</c:if><c:if test="${data.userAgent!=0}"><font color="red">禁封</font></c:if></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="115" bgcolor="#D9E6FF"><c:if test="${data.userAgent==0}"><input type="button" onclick="agentReson('${data.username}')" value="封号"></c:if><c:if test="${data.userAgent==1}"><input type="button" onclick="noagentReson('${data.username}')" value="解封"></c:if></td><%-- /admin/useragent?user=${data.username}&state=1 --%>
				</tr>
		</s:iterator>
		     </table>
		  </div>	
        <aldtags:pageTag para1="status" value1="1" para2="user" value2="${user}"/>
  </tr> 
</table>
</div> 
<p>
</p>
<p align="center"><b><a href="/admin/searchuseragent" style="text-decoration: none"><font color="#FF0000" size="6">返 回 搜 索</font></a></b></p>
</body> 
</html>