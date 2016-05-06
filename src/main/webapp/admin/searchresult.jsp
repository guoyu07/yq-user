<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>显示用户信息</title>
</head>
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
                <td width="131" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="宋体">推荐人</font></div></td>
                <td width="156" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体">QQ</font></td>
                <td width="210" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="Arial">注册时间</font></div></td>
                <td width="127" align="center" height="23" bgcolor="#D9E6FF"><div align="center"><font face="Arial">原始股</font></div></td>
                <td width="118" align="center" height="23" bgcolor="#D9E6FF">交易股</td>
                <td width="115" align="center" height="23" bgcolor="#D9E6FF"><font face="Arial">金币</font></td>
                <td width="120" align="center" height="23" bgcolor="#D9E6FF">全部奖金</td>
                <td width="115" align="center" height="23" bgcolor="#D9E6FF">剩余奖金</td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr bgcolor="#7bb5de"> 
                <td style="border-bottom: 1px solid #C9D8AD" width="144" align="center" bgcolor="#D9E6FF"><p align="center">${data.username}</td>
                <td style="border-bottom: 1px solid #C9D8AD" width="84" align="center" bgcolor="#D9E6FF"><p align="center">${data.name}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="131" bgcolor="#D9E6FF"> <div align="center"><font color="#FF0000">${data.up}</font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="156" bgcolor="#D9E6FF"><div align="center">${data.qq}</div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="210" bgcolor="#D9E6FF"><div align="center">${data.regtime}</div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="127" bgcolor="#D9E6FF"><div align="center">${data.gdgc}</div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="118" bgcolor="#D9E6FF">${data.jyg}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="115" bgcolor="#D9E6FF">${data.jydb}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="120" bgcolor="#D9E6FF">${data.cbpay}</td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="115" bgcolor="#D9E6FF">${data.pay}</td>
				</tr>
		     </table>
		  <table border="1" width="90%" id="table1" height="42" style="border-collapse: collapse">
			<tr>
		<td align="center" width="304">最近充值时间：<b><font color="#FF0000">${data.gmdate}</font></b></td>
		<td align="center" width="172"><a href="/admin/modifyaabuser?userid=${data.username}" style="text-decoration: none">查看资料</a></td>
		<td align="center">
		<c:if test="${data.gwuid==0}"><a onClick="return confirm('提示：您确定了吗？')" href="gngw?diyid=${data.username}&sjid=1" style="text-decoration: none">设为海外玩家</a></c:if>
		<c:if test="${data.gwuid!=0}"><a onClick="return confirm('提示：您确定了吗？')" href="gngw?diyid=${data.username}&sjid=0" style="text-decoration: none">设为国内玩家</a></c:if>
		</td>
		<!-- <td align="center" width="189"><a href="pmcj?id=${data.username}" style="text-decoration: none"><b><font color="#000000">特别功能不要点</font></b></a></td>
		<td align="center" width="88"><a href="usercj?id=${data.username}" style="text-decoration: none">充值</a></td>
		<td align="center" width="143"><a href="bsreg?my=${data.username}" style="text-decoration: none">补选位置</a></td> -->
		<c:if test="${data.jb<=0 && data.sjb<=0 && data.pay<=0 && data.jyg<=0}"><td align="center" width="78">
		<a href="delusersave?del=${data.username}" style="text-decoration: none"><font color="#FF0000">删除</font></a>
		</td></c:if>
		<c:if test="${fcxt.id==1||fcxt.id==2}"><td><a href="editYbSale?user=${data.username}" style="text-decoration: none">修改卖出一币</a></td></c:if>
			</tr>
		</s:iterator>
	</table>
		  </div>	
        <aldtags:pageTag para1="status" value1="1" para2="user" value2="${user}"/>
  </tr> 
</table>
</div> 
<p align="center"><b><a href="/admin/searchuser" style="text-decoration: none"><font color="#FF0000" size="6">返 回 搜 索</font></a></b></p>
</body> 
</html>