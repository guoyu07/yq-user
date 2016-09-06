<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<c:if test="${erroCodeNum==1}"><script language="javascript">alert('<s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1836756650'/>！');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language="javascript">alert('<s:text name='viewyjcx-game.jsp.yjcx-game.jsp.2073267590'/>！');history.go(-1);</script></c:if>
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yjcx.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1" style="background: none; padding: 0 10px 5px 15px">
					<div>
						<div style="width: 380px;float:left;">
							<div align="right"><p style="float:left;"><s:text name="viewyjcx-game.jsp.yjcx-game.jsp.29623262"></s:text>：<span style="color: #ff0000;">${myup}</span></p><form method="POST" action="sgks01" name="Form"><input class="intxt" name="myup" placeholder='<s:text name="viewyjcx-game.jsp.yjcx-game.jsp.1364845601"></s:text>' type="text"/><input type="button" class="intub" onClick="Form.submit()"></form></div>
							<div>
								<p class="st1p" style="background: #799de8;"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1029202'/></p>
								<div class="qbox">
									<p>
									   <span><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.766484'/></span>
									   <strong>${sgxt.zaq}</strong>
									</p>
									<p>
									   <span><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.687527'/></span>
									   <strong>${sgxt.zbq}</strong>
									</p>
								</div>
							</div>
							<div class="shopt1">
								<p class="st1p">(${myup})<b><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1917466217'/></b></p>
								<table class="tablen1">
									<tr>
										<th><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1017813'/></th>
										<th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
										<th><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.769813'/></th>
										<th><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.690856'/></th>
									</tr>
									<tr>
										<td><span class="stts">1-1</span></td>
										<td><c:if test="${!empty sgxt.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxt.auid}" style="text-decoration: none">${sgxt.auid}（${sgxta.sjb}）</a></c:if>
			<c:if test="${empty sgxt.auid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a></c:if></td>
										<td><span class="r"><c:if test="${sgxta.zaq!=''}">${sgxta.zaq}</c:if></span></td>
										<td><span class="r"><c:if test="${sgxta.zbq!=''}">${sgxta.zbq}</c:if></span></td>
									</tr>
									<tr>
										<td><span class="stts">1-2</span></td>
										<td><c:if test="${!empty sgxt.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxt.buid}" style="text-decoration: none">${sgxt.buid}（${sgxtb.sjb}）</a></c:if>
			<c:if test="${empty sgxt.buid}"><a href="sgreg?bd=${bdid}&myup=${myup}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a></c:if></td>
										<td><span class="r"><c:if test="${sgxtb.zaq!=''}">${sgxtb.zaq}</c:if></span></td>
										<td><span class="r"><c:if test="${sgxtb.zbq!=''}">${sgxtb.zbq}</c:if></span></td>
									</tr>
									<tr>
										<td><span class="stts stts1">2-1</span></td>
										<td>
										<c:if test="${!empty sgxta.auid}">
												<a href="sgks01?bd=${bdid}&myup=${sgxta.auid}"
													style="text-decoration: none">${sgxta.auid}（${sgxtaa.sjb}）</a>
											</c:if> <c:if test="${empty sgxta.auid}">
												<c:if test="${not empty sgxta.username}">
													<a href="sgreg?bd=${bdid}&myup=${sgxta.username}"
														style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a>
												</c:if>
												<c:if test="${empty sgxta.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
											</c:if>
										</td>
										<td><span class="r"><c:if test="${sgxtaa.zaq!=''}">${sgxtaa.zaq}</c:if></span></td>
										<td><span class="r"><c:if test="${sgxtaa.zbq!=''}">${sgxtaa.zbq}</c:if></span></td>
									</tr>
									<tr>
										<td><span class="stts stts1">2-2</span></td>
										<td>
											<c:if test="${!empty sgxta.buid}">
													<a href="sgks01?bd=${bdid}&myup=${sgxta.buid}"
														style="text-decoration: none">${sgxta.buid}（${sgxtab.sjb}）</a>
												</c:if> <c:if test="${empty sgxta.buid}">
													<c:if test="${not empty sgxta.username}">
														<a href="sgreg?bd=${bdid}&myup=${sgxta.username}"
															style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a>
													</c:if>
													<c:if test="${empty sgxta.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
											</c:if>
										</td>
										<td><span class="r"><c:if test="${sgxtab.zaq!=''}">${sgxtab.zaq}</c:if></span></td>
										<td><span class="r"><c:if test="${sgxtab.zbq!=''}">${sgxtab.zbq}</c:if></span></td>
									</tr>
									<tr>
										<td><span class="stts stts1">2-3</span></td>
										<td>			<c:if test="${!empty sgxtb.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtb.auid}" style="text-decoration: none">${sgxtb.auid}（${sgxtba.sjb}）</a></c:if>
			<c:if test="${empty sgxtb.auid}">
			   <c:if test="${not empty sgxtb.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtb.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a></c:if>
			   <c:if test="${empty sgxtb.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			 </c:if></td>
										<td><span class="r"><c:if test="${sgxtba.zaq!=''}">${sgxtba.zaq}</c:if></span></td>
										<td><span class="r"><c:if test="${sgxtba.zbq!=''}">${sgxtba.zbq}</c:if></span></td>
									</tr>
									<tr>
										<td><span class="stts stts1">2-4</span></td>
										<td><c:if test="${!empty sgxtb.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtb.buid}" style="text-decoration: none">${sgxtb.buid}（${sgxtbb.sjb}）</a></c:if>
			<c:if test="${empty sgxtb.buid}">
			   <c:if test="${not empty sgxtb.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtb.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a></c:if>
			   <c:if test="${empty sgxtb.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			</c:if></td>
										<td><span class="r"><c:if test="${sgxtbb.zaq!=''}">${sgxtbb.zaq}</c:if></span></td>
										<td><span class="r"><c:if test="${sgxtbb.zbq!=''}">${sgxtbb.zbq}</c:if></span></td>
									</tr>
									<tr>
										<td><span class="stts stts2">3-1</span></td>
										<td><c:if test="${!empty sgxtaa.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtaa.auid}" style="text-decoration: none">${sgxtaa.auid}（${sgxtaaa.sjb}）</a></c:if>
			
			<c:if test="${empty sgxtaa.auid}">
			<c:if test="${not empty sgxtaa.username}">
			<a href="sgreg?bd=${bdid}&myup=${sgxtaa.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a>
			</c:if>
			<c:if test="${empty sgxtaa.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			</c:if></td>
										<td><span class="r"></span></td>
										<td><span class="r"></span></td>
									</tr>
									<tr>
										<td><span class="stts stts2">3-2</span></td>
										<td><c:if test="${!empty sgxtaa.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtaa.buid}" style="text-decoration: none">${sgxtaa.buid}（${sgxtaab.sjb}）</a></c:if>
			<c:if test="${empty sgxtaa.buid}">
			    <c:if test="${not empty sgxtaa.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtaa.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a></c:if>
			    <c:if test="${empty sgxtaa.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			</c:if></td>
										<td><span class="r"></span></td>
										<td><span class="r"></span></td>
									</tr>
									<tr>
										<td><span class="stts stts2">3-3</span></td>
										<td><c:if test="${!empty sgxtab.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtab.auid}" style="text-decoration: none">${sgxtab.auid}（${sgxtaba.sjb}）</a></c:if>
			<c:if test="${empty sgxtab.auid}">
			    <c:if test="${not empty sgxtab.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtab.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a></c:if>
			    <c:if test="${empty sgxtab.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			</c:if></td>
										<td><span class="r"></span></td>
										<td><span class="r"></span></td>
									</tr>
									<tr>
										<td><span class="stts stts2">3-4</span></td>
										<td><c:if test="${!empty sgxtab.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtab.buid}" style="text-decoration: none">${sgxtab.buid}（${sgxtabb.sjb}）</a></c:if>
			<c:if test="${empty sgxtab.buid}">
			    <c:if test="${not empty sgxtab.username}"><a href="sgreg?bd=${bdid}&myup=${sgxtab.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a></c:if>
			    <c:if test="${empty sgxtab.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			</c:if></td>
										<td><span class="r"></span></td>
										<td><span class="r"></span></td>
									</tr>
									<tr>
										<td><span class="stts stts2">3-5</span></td>
										<td><c:if test="${!empty sgxtba.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtba.auid}" style="text-decoration: none">${sgxtba.auid}（${sgxtbaa.sjb}）</a></c:if>
			<c:if test="${empty sgxtba.auid}">
			   <c:if test="${not empty sgxtba.username}">
			   		<a href="sgreg?bd=${bdid}&myup=${sgxtba.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a>
			   </c:if>
			   <c:if test="${empty sgxtba.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			</c:if></td>
										<td><span class="r"></span></td>
										<td><span class="r"></span></td>
									</tr>
									<tr>
										<td><span class="stts stts2">3-6</span></td>
										<td><c:if test="${!empty sgxtba.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtba.buid}" style="text-decoration: none">${sgxtba.buid}（${sgxtbab.sjb}）</a></c:if>
			<c:if test="${empty sgxtba.buid}">
			   <c:if test="${not empty sgxtba.username}">
			   <a href="sgreg?bd=${bdid}&myup=${sgxtba.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a>
			   </c:if>
			   <c:if test="${empty sgxtba.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
            </c:if></td>
										<td><span class="r"></span></td>
										<td><span class="r"></span></td>
									</tr>
									<tr>
										<td><span class="stts stts2">3-7</span></td>
										<td><c:if test="${!empty sgxtbb.auid}"><a href="sgks01?bd=${bdid}&myup=${sgxtbb.auid}" style="text-decoration: none">${sgxtbb.auid}（${sgxtbba.sjb}）</a></c:if>
			<c:if test="${empty sgxtbb.auid}">
			    <c:if test="${not empty sgxtbb.username}">
			      <a href="sgreg?bd=${bdid}&myup=${sgxtbb.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a>
			    </c:if>
			    <c:if test="${empty sgxtbb.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			</c:if></td>
										<td><span class="r"></span></td>
										<td><span class="r"></span></td>
									</tr>
									
																		<tr>
										<td><span class="stts stts2">3-8</span></td>
										<td><c:if test="${!empty sgxtbb.buid}"><a href="sgks01?bd=${bdid}&myup=${sgxtbb.buid}" style="text-decoration: none">${sgxtbb.buid}（${sgxtbbb.sjb}）</a></c:if>
			<c:if test="${empty sgxtbb.buid}">
			    <c:if test="${not empty sgxtbb.username}">
			      <a href="sgreg?bd=${bdid}&myup=${sgxtbb.username}" style="text-decoration: none"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1123809299'/></a>
			    </c:if>
			    <c:if test="${empty sgxtbb.username}"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.802378150'/></c:if>
			</c:if></td>
										<td><span class="r"></span></td>
										<td><span class="r"></span></td>
									</tr>
								</table>
								<p class="st1pbottom"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1039881654'/><br />
								<s:text name='viewyjcx-game.jsp.yjcx-game.jsp.2025953425'/>(<span style="color:#f00">${myup}</span>)<s:text name='viewyjcx-game.jsp.yjcx-game.jsp.2025953425a'/>
							</div>
						</div>

						
						<div class="shopri">
							<div style="overflow: hidden;">
								<a href="sgks01?bd=${bdid}&myup=${userName}" style="float: left;"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1119330385'/>：${userName}</a>
								<a href="javascript:history.back();" style="float: right;"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></a>
							</div>
							<div>
								<p class="st1p"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.660102487'/></p>
								<div class="qbox">
									<p>
									   <span><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.766484'/></span>
									   <strong>${sgxt.aq}</strong>
									</p>
									<p>
									   <span><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.687527'/></span>
									   <strong>${sgxt.bq}</strong>
									</p>
								</div>
							</div>
							<div class="srt2">
							<p class="st1p">(${myup})<s:text name='viewyjcx-game.jsp.yjcx-game.jsp.438864785'/></p>
							<table class="tablen1">
									<tr>
										<th><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.758126'/></th>
										<th><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.769813'/></th>
										<th><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.690856'/></th>
										<th><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.755711'/></th>
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
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		 $("#table2 tr:odd, #table3 tr:odd").css("background","#bcbcbc");
	</script>
</body>
</html>
