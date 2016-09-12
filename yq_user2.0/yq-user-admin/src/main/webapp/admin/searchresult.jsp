<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="/myscript/jquery.blockUI.js" type="text/javascript"></script>
<script language="javascript" src="/js/ajax.js"></script>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户不存在！');history.go(-1);</script></c:if>
<c:if test="${code==1}"><script language=javascript>alert('用户不存在1！');history.go(-1);</script></c:if>
<html>
<title>显示用户信息</title>
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
		<td align="center" >
			<a href="javascript:void(0);" style="text-decoration: none;" onclick="reset('${data.username}')">重置玩家业绩</a></td>
		</td>
		</tr>
		</s:iterator>
	</table>
		  </div>	
        <aldtags:pageTag para1="status" value1="1" para2="user" value2="${user}"/>
  </tr> 
</table>
</div> 
<p>
			<table class="tablen1">
						<tr>
							<td colspan="4"><font color="#000000" style="font-size: 24px;color:red;background:'/meme/images/admin_bg_1.gif'; ">(william123)当前16层内层封情况</font></td>
						</tr>
						<tr>
							<th>层数</th>
							<th>左总</th>
							<th>右总</th>
							<th>层封</th>
						</tr>
						<tr>
							<td><span class="yuan">1</span></td>
							<td>${sgxt.z1}</td>
							<td>${sgxt.y1}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">2</span></td>
							<td>${sgxt.z2}</td>
							<td>${sgxt.y2}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">3</span></td>
							<td>${sgxt.z3}</td>
							<td>${sgxt.y3}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">4</span></td>
							<td>${sgxt.z4}</td>
							<td>${sgxt.y4}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">5</span></td>
							<td>${sgxt.z5}</td>
							<td>${sgxt.y5}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">6</span></td>
							<td>${sgxt.z6}</td>
							<td>${sgxt.y6}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">7</span></td>
							<td>${sgxt.z7}</td>
							<td>${sgxt.y7}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">8</span></td>
							<td>${sgxt.z8}</td>
							<td>${sgxt.y8}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">9</span></td>
							<td>${sgxt.z9}</td>
							<td>${sgxt.y9}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">10</span></td>
							<td>${sgxt.z10}</td>
							<td>${sgxt.y10}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">11</span></td>
							<td>${sgxt.z11}</td>
							<td>${sgxt.y11}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">12</span></td>
							<td>${sgxt.z12}</td>
							<td>${sgxt.y12}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">13</span></td>
							<td>${sgxt.z13}</td>
							<td>${sgxt.y13}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">14</span></td>
							<td>${sgxt.z14}</td>
							<td>${sgxt.y14}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">15</span></td>
							<td>${sgxt.z15}</td>
							<td>${sgxt.y15}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
						<tr>
							<td><span class="yuan">16</span></td>
							<td>${sgxt.z16}</td>
							<td>${sgxt.y16}</td>
							<td><span class="r">${sgxt.cfd}</span></td>
						</tr>
				</table>
</p>
<p align="center"><b><a href="/admin/searchuser" style="text-decoration: none"><font color="#FF0000" size="6">返 回 搜 索</font></a></b></p>

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