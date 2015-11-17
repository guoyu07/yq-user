<%@page import="com.yq.user.utils.Ref"%>
<%@page import="com.yq.user.utils._99douInterface"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Map<String, String> map = new HashMap<String, String>();
	Enumeration<String> e = request.getParameterNames();//获取所有参数的名称
	while (e.hasMoreElements()) {//遍历Enumeration

		String name = (String) e.nextElement();//取出下一个元素

		String value = request.getParameter(name);
		map.put(name, value);
	}
	_99douInterface _99dou = new _99douInterface();

	Ref<Integer> success_qty = new Ref<Integer>();
	Ref<Integer> fail_qty = new Ref<Integer>();
	Ref<String> msg = new Ref<String>();
	Ref<String> out_trade_id = new Ref<String>();
	int result = _99dou.VerifyNotify(map, out_trade_id, success_qty,
			fail_qty, msg);

	if (result == 0) // 成功验证数据
	{
		///TODO : 订单状态处理，

		out.print("OK");
	} else {
		out.print("ERROR|" + msg);
	}
%>
