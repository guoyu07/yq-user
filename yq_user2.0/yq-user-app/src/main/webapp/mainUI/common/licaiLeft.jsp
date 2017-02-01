<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
        <div class="point-info">
          <p class="title">积分理财</p>
          <ul class="list">
            <li><a href="/datepay">累计奖励一币 <em><%=gcuserJflc.getDlpay()%></em></a></li>
            <li><a href="/datepay?lb=9">推广部分一币 <em><%=gcuserJflc.getJbpay()%></em></a></li>
            <li><a href="/datepay?lb=1">平衡部分一币 <em><%=gcuserJflc.getJjpay()%></em></a></li>
            <li><a href="/datepay?lb=8">辅导部分一币 <em><%=gcuserJflc.getJypay()%></em></a></li>
            <li><a href="/datepay?lb=2">累计认购一币 <em><%=gcuserJflc.getRgpay()%></em></a></li>
            <li><a href="/datepay?lb=3">累计卖出一币 <em><%=gcuserJflc.getMcpay()%></em></a></li>
            <p>剩余金币 <em><%=gcuserJflc.getJydb()%></em></p>
            <p>积分单价 <em><%=ajygj%></em></p>
            <p>积分数量 <em><%=gcuserJflc.getJyg()%></em></p>
            <p>积分拆分次数 <em><%=gcuserJflc.getCfa()%></em></p>
            <p>积分拆分倍数<em><%=gcuserJflc.getCfb()%></em></p>
          </ul>
        </div>
