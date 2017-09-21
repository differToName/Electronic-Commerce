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
    
    <title>订单详细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css"/>">
	<script src="<c:url value="/libs/jquery/jquery-3.2.1.js"/>"></script>
	<script src="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>"></script>

  </head>
  
  <body>
  	
  	<form class="form-horizontal">
  	  <div class="page-header col-sm-offset-1" style="display:inline-block">
  	    <h2>编号为[${order.orderNo}]的订单详细</h2>
  	  </div>
  	  <div class="col-sm-offset-2" style="display:inline-block"> 
  	      <a class="btn btn-sm btn-primary" href="order/loadOrders.do">返回列表</a>
  	  </div>
  	  <ul class="list-group col-sm-offset-1">
	    <li class="list-group-item">订单编号: ${order.orderNo}</li>
	    <li class="list-group-item">所属账户: ${order.user.userName}</li>
	    <li class="list-group-item">订单日期: <s:date name="order.orderDate" format="yyyy-MM-dd HH:mm:ss" /></li>
	    <li class="list-group-item">商品编号: ${order.goods.goodsNo}</li>
	    <li class="list-group-item">审核状态: 
	      <c:if test="${order.auditStatu=='N'}">未审核</c:if>
    	  <c:if test="${order.auditStatu=='P'}">审核已通过</c:if>
    	  <c:if test="${order.auditStatu=='X'}">审核未通过</c:if>
	    </li>
	    <s:if test="#order.auditStatu!=\"N\"">
	      <li class="list-group-item">审核日期: <s:date name="order.auditDate" format="yyyy-MM-dd HH:mm:ss" /></li>
	    </s:if>
	    <li class="list-group-item">支付方式: 
	      <c:if test="${order.payMethod=='Z'}">支付宝</c:if>
    	  <c:if test="${order.payMethod=='W'}">微信</c:if>
    	  <c:if test="${order.payMethod=='A'}">网银</c:if>
	    </li>
	    <li class="list-group-item">收货地址: ${order.deliveryAddress}</li>
	    <li class="list-group-item">联系人: ${order.goodsConsignee}</li>
	    <li class="list-group-item">购买数量: ${order.buyNumbers}</li>
	    <li class="list-group-item">订单金额: ${order.buyCounts} 元</li>
	    <li class="list-group-item">订单状态: 
	      <c:if test="${order.orderStatus=='G'}">已收货</c:if>
    	  <c:if test="${order.orderStatus=='N'}">未收货</c:if>
    	  <c:if test="${order.orderStatus=='R'}">退货</c:if>
	    </li>
	  </ul>
	  
    </form>
  </body>
</html>
