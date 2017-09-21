<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>模拟添加一笔订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <s:form namespace="/order" action="createOrder" method="post">

    <div>
    	<span>订单编号:</span>
    	<s:textfield  name="order.orderNo"></s:textfield>
    </div>
    
    <div>
    	<span>所属账户:</span>
    	<s:select name="order.user.userNo" list="userList" listKey="userNo" listValue="userNo" headerKey="0" headerValue="=请选择="></s:select>
    </div>
    <div>
    	<span>下单时间:当前时间存入</span>
    </div>
    <div>
    	<span>购买商品:</span>
    	<s:select name="order.goods.goodsNo" list="goodsList" listKey="goodsNo" listValue="goodsName" headerKey="0" headerValue="=请选择="></s:select>
    </div>
    <div>
    	<span>审核状态:后台设置未审核</span>
    </div>
    <div>
    	<span>审核时间:暂不设置</span>
    </div>
    <div>
    	<span>支付方式:</span>
    	<s:select list="#{\"Z\":'支付宝',\"W\":'微信',\"A\":'网银'}" name="order.payMethod"></s:select>
    </div>
    
    <div>
    	<span>收货地址:</span>
    	<s:textfield name="order.deliveryAddress"></s:textfield>
    </div>
    
    <div>
    	<span>收货人姓名:</span>
    	<s:textfield name="order.goodsConsignee"></s:textfield>
    </div>
    
    <div>
    	<span>收货电话:</span>
    	<s:textfield name="order.consigneePhone"></s:textfield>
    </div>
    
    <div>
    	<span>购买数量:</span>
    	<s:textfield name="order.buyNumbers"></s:textfield>
    </div>
   
    <div>
    	<span>订单金额:</span>
    	<s:textfield name="order.buyCounts"></s:textfield>
    </div>
    
    <div>
    	<span>订单状态:</span>
    	<s:select list="#{\"G\":'已收货',\"N\":'未收货',\"R\":'退货'}" name="order.orderStatus"></s:select>
    </div>
    <s:submit value="提交"></s:submit>
  </s:form>
  </body>
  
</html>
