<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您好，一币不足，暂时不能参与，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('本轮该产品已成功被抢购，请稍候再试或联系客服进行下一轮抢购或选择其它产品！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，本次点击抢购还差一点点，还有${dqep}就可以抢中，继续加油！！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==0}"><script language=javascript>alert('恭喜您！抢购成功，请联系客服登记，以便公司更快把产品寄到您手上！');history.go(-1);</script></c:if>
