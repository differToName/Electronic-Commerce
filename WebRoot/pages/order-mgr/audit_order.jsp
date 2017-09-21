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
    
    <title>订单审核</title>
    
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
    <div class="container">
  		<div class="page-header">
		  <h2>编号为[${order.orderNo}]的订单审核</h2>
	    </div>
	  	<s:form cssClass="form-horizontal" namespace="/order" action="auditOrder" method="post">
	  	  <s:hidden name="order.orderNo"></s:hidden>
	  	  <s:hidden name="order.user.userNo"></s:hidden>
          <s:hidden name="order.goods.goodsNo"></s:hidden>
          <s:hidden name="order.payMethod"></s:hidden>
          <s:hidden name="order.deliveryAddress"></s:hidden>
          <s:hidden name="order.goodsConsignee"></s:hidden>
          <s:hidden name="order.consigneePhone"></s:hidden>
          <s:hidden name="order.buyNumbers"></s:hidden>
          <s:hidden name="order.buyCounts"></s:hidden>
          <s:hidden name="order.orderStatus"></s:hidden>
          
          <div class="form-group">
            <label class="control-label"><h4>是否通过？</h4></label> 
          </div>
	      <div class="form-group">
	    	<s:radio cssClass="radio-inline" name="order.auditStatu" list="#{'P':'审核通过','X':'审核未通过'}" listKey="key" listValue="value" value="'P'"></s:radio>
	      </div>
		  <div class="form-group">
	        <s:submit cssClass="btn btn-warning btn-sm" value="提交审核"></s:submit>
	      </div>
	  	</s:form>
	</div>
  </body>
  
</html>
