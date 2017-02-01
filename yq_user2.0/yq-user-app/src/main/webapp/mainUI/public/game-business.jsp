<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language="javascript">alert('升级双区玩家成功！');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language="javascript">alert('用户名输入错误或不属于自己团队的玩家，请检查后再试！');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|游戏业务</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> 
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">财富中心 >> 积分理财</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 业绩查询内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
     <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
  <%@ include file="/mainUI/common/gameservice.jsp" %>
  <!-- 账户概览  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 游戏业务 -->
      <div class="main-widget">
        <p class="widget-title-line">游戏业务</p>
        <p class="small-button-line">
          <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="sgks01?status=1">查看更多</a>
        </p>
        <div class="game-business">
          <div class="game-wrap center">
            <div class="head-search">
              <p class="fl">用户名：<span class="game-warning">${myup}</span></p>
              <form class="fr" method="POST" action="sgks01" name="Form">
                <input type="text" class="input" name="myup" placeholder="查找的接点人" />
                <input type="button" class="search-btn" onclick="Form.submit()" />
              </form>
            </div>
            <div class="game-table-content small-size mt5">
              <table class="table-total" border="0" cellspacing="0" cellpadding="0">
                <caption>累计</caption>
                <thead>
                  <tr>
                    <th>左区</th>
                    <th>右区</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><b class="game-warning">${sgxt.zaq}</b></td>
                    <td><b class="game-warning">${sgxt.zbq}</b></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="game-table-content middle-size">
              <table class="current-distribution-status-3" border="0" cellspacing="0" cellpadding="0">
                <caption>(${myup})当前3层内分布情况</caption>
                <thead>
                  <tr>
                    <th>系数</th>
                    <th>用户名</th>
                    <th>左总</th>
                    <th>右总</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><i class="icon-stage-1">1-1</i></td>
                    <td><c:if test="${!empty sgxt.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxt.auid}" style="text-decoration: none">${sgxt.auid}（${sgxta.sjb}）</a></c:if>
			<c:if test="${empty sgxt.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></a>
                    </td>
                    <td><span><c:if test="${sgxta.zaq!=''}">${sgxta.zaq}</c:if></span></td>
                    <td><span><c:if test="${sgxta.zbq!=''}">${sgxta.zbq}</c:if></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-1">1-2</i></td>
                    <td><c:if test="${!empty sgxt.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxt.buid}" style="text-decoration: none">${sgxt.buid}（${sgxtb.sjb}）</a></c:if>
			<c:if test="${empty sgxt.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none">选择空位</a></c:if></a>
                    </td>
                    <td><span><c:if test="${sgxtb.zaq!=''}">${sgxtb.zaq}</c:if></span></td>
                    <td><span><c:if test="${sgxtb.zbq!=''}">${sgxtb.zbq}</c:if></span></td>
                  </tr>
                  <tr>
                    <td>
                      <i class="icon-stage-2">2-1</i>
                    </td>
                    <td>
                      <c:if test="${!empty sgxta.auid}">
						<a href="sgks01?bd=${bdid}&myup=${sgxta.auid}"
							style="text-decoration: none">${sgxta.auid}（${sgxtaa.sjb}）</a>
					</c:if> <c:if test="${empty sgxta.auid}">
						<c:if test="${not empty sgxta.username}">
							<a href="sgreg?bd=${bdid}&myup=${sgxta.username}"
								style="text-decoration: none">选择空位</a>
						</c:if>
						<c:if test="${empty sgxta.username}">无接点人</c:if>
					</c:if>
                    </td>
                    <td><span><c:if test="${sgxtaa.zaq!=''}">${sgxtaa.zaq}</c:if></span></td>
                    <td><span><c:if test="${sgxtaa.zbq!=''}">${sgxtaa.zbq}</c:if></span></td>
                  </tr>
                  <tr>
                    <td>
                      <i class="icon-stage-2">2-2</i>
                    </td>
                    <td>
                      <c:if test="${!empty sgxta.buid}">
							<a href="sgks01?bd=${bdid}&myup=${sgxta.buid}"
								style="text-decoration: none">${sgxta.buid}（${sgxtab.sjb}）</a>
						</c:if> <c:if test="${empty sgxta.buid}">
							<c:if test="${not empty sgxta.username}">
								<a href="sgreg?bd=${bdid}&myup=${sgxta.username}"
									style="text-decoration: none">选择空位</a>
							</c:if>
							<c:if test="${empty sgxta.username}">无接点人</c:if>
					</c:if>
                    </td>
                    <td><span><c:if test="${sgxtab.zaq!=''}">${sgxtab.zaq}</c:if></span></td>
                    <td><span><c:if test="${sgxtab.zbq!=''}">${sgxtab.zbq}</c:if></span></td>
                  </tr>
                  <tr>
                    <td>
                      <i class="icon-stage-2">2-3</i>
                    </td>
                    <td>
                     <c:if test="${!empty sgxtb.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtb.auid}" style="text-decoration: none">${sgxtb.auid}（${sgxtba.sjb}）</a></c:if>
					<c:if test="${empty sgxtb.auid}">
			   		<c:if test="${not empty sgxtb.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtb.username}" style="text-decoration: none">选择空位</a></c:if>
			   		<c:if test="${empty sgxtb.username}">无接点人</c:if>
			 		</c:if>
                    </td>
                    <td><span><c:if test="${sgxtba.zaq!=''}">${sgxtba.zaq}</c:if></span></td>
                    <td><span><c:if test="${sgxtba.zbq!=''}">${sgxtba.zbq}</c:if></span></td>
                  </tr>
                  <tr>
                    <td>
                      <i class="icon-stage-2">2-4</i>
                    </td>
                    <td>
                      <c:if test="${!empty sgxtb.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtb.buid}" style="text-decoration: none">${sgxtb.buid}（${sgxtbb.sjb}）</a></c:if>
						<c:if test="${empty sgxtb.buid}">
						   <c:if test="${not empty sgxtb.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtb.username}" style="text-decoration: none">选择空位</a></c:if>
						   <c:if test="${empty sgxtb.username}">无接点人</c:if>
						</c:if>
                    </td>
                    <td><span><c:if test="${sgxtbb.zaq!=''}">${sgxtbb.zaq}</c:if></span></td>
                    <td><span><c:if test="${sgxtbb.zbq!=''}">${sgxtbb.zbq}</c:if></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-3">3-1</i></td>
                    <td>
                      <c:if test="${!empty sgxtaa.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtaa.auid}" style="text-decoration: none">${sgxtaa.auid}（${sgxtaaa.sjb}）</a></c:if>
					<c:if test="${empty sgxtaa.auid}">
					<c:if test="${not empty sgxtaa.username}">
					<a href="sgreg?bd=${bdid}&myup=${sgxtaa.username}" style="text-decoration: none">选择空位</a>
					</c:if>
					<c:if test="${empty sgxtaa.username}">无接点人</c:if>
					</c:if>
                    </td>
                    <td><span></span></td>
                    <td><span></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-3">3-2</i></td>
                    <td>
                     <c:if test="${!empty sgxtaa.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtaa.buid}" style="text-decoration: none">${sgxtaa.buid}（${sgxtaab.sjb}）</a></c:if>
			<c:if test="${empty sgxtaa.buid}">
			    <c:if test="${not empty sgxtaa.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtaa.username}" style="text-decoration: none">选择空位</a></c:if>
			    <c:if test="${empty sgxtaa.username}">无接点人</c:if>
			</c:if>
                    </td>
                    <td><span></span></td>
                    <td><span></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-3">3-3</i></td>
                    <td><c:if test="${!empty sgxtab.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtab.auid}" style="text-decoration: none">${sgxtab.auid}（${sgxtaba.sjb}）</a></c:if>
			<c:if test="${empty sgxtab.auid}">
			    <c:if test="${not empty sgxtab.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtab.username}" style="text-decoration: none">选择空位</a></c:if>
			    <c:if test="${empty sgxtab.username}">无接点人</c:if>
			</c:if>
                    </td>
                    <td><span></span></td>
                    <td><span></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-3">3-4</i></td>
                    <td>
                     <c:if test="${!empty sgxtab.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtab.buid}" style="text-decoration: none">${sgxtab.buid}（${sgxtabb.sjb}）</a></c:if>
			<c:if test="${empty sgxtab.buid}">
			    <c:if test="${not empty sgxtab.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtab.username}" style="text-decoration: none">选择空位</a></c:if>
			    <c:if test="${empty sgxtab.username}">无接点人</c:if>
			</c:if>
                    </td>
                    <td><span></span></td>
                    <td><span></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-3">3-5</i></td>
                    <td>
                     <c:if test="${!empty sgxtba.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtba.auid}" style="text-decoration: none">${sgxtba.auid}（${sgxtbaa.sjb}）</a></c:if>
			<c:if test="${empty sgxtba.auid}">
			   <c:if test="${not empty sgxtba.username}">
			   		<a href="sgreg?bd=${bdid}&myup=${sgxtba.username}" style="text-decoration: none">选择空位</a>
			   </c:if>
			   <c:if test="${empty sgxtba.username}">无接点人</c:if>
			</c:if>
                    </td>
                    <td><span></span></td>
                    <td><span></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-3">3-6</i></td>
                    <td>
                      <c:if test="${!empty sgxtba.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtba.buid}" style="text-decoration: none">${sgxtba.buid}（${sgxtbab.sjb}）</a></c:if>
			<c:if test="${empty sgxtba.buid}">
			   <c:if test="${not empty sgxtba.username}">
			   <a href="sgreg?bd=${bdid}&myup=${sgxtba.username}" style="text-decoration: none">选择空位</a>
			   </c:if>
			   <c:if test="${empty sgxtba.username}">无接点人</c:if>
            </c:if>
                    </td>
                    <td><span></span></td>
                    <td><span></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-3">3-7</i></td>
                    <td>
                    <c:if test="${!empty sgxtbb.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtbb.auid}" style="text-decoration: none">${sgxtbb.auid}（${sgxtbba.sjb}）</a></c:if>
			<c:if test="${empty sgxtbb.auid}">
			    <c:if test="${not empty sgxtbb.username}">
			      <a href="sgreg?bd=${bdid}&myup=${sgxtbb.username}" style="text-decoration: none">选择空位</a>
			    </c:if>
			    <c:if test="${empty sgxtbb.username}">无接点人</c:if>
			</c:if>
                    </td>
                    <td><span></span></td>
                    <td><span></span></td>
                  </tr>
                  <tr>
                    <td><i class="icon-stage-3">3-8</i></td>
                    <td>
                    <c:if test="${!empty sgxtbb.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtbb.buid}" style="text-decoration: none">${sgxtbb.buid}（${sgxtbbb.sjb}）</a></c:if>
			<c:if test="${empty sgxtbb.buid}">
			    <c:if test="${not empty sgxtbb.username}">
			      <a href="sgreg?bd=${bdid}&myup=${sgxtbb.username}" style="text-decoration: none">选择空位</a>
			    </c:if>
			    <c:if test="${empty sgxtbb.username}">无接点人</c:if>
			</c:if>
                    </td>
                    <td><span></span></td>
                    <td><span></span></td>
                  </tr>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="4">当前3层内的左总与右总指的是该用户名网络下全部累计总单数 当前16层内指的是(<span class="game-warning">${myup}</span>)各层左与右目前的总单数
                    </td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
      <!-- 游戏业务 end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
