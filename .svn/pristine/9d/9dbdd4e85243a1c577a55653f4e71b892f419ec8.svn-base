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
    
    <title>订单修改</title>
    
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
	
	<script type="text/javascript">
		function checkFrm()
		{
		    if($("#address").val()===""){
		        alert("收货地址不能为空,请重新输入");
	          	$("#address").focus();
	          	return false;
		    }
		    if($("#contacts").val()===""){
		        alert("联系人不能为空,请重新输入");
	          	$("#contacts").focus();
	          	return false;
		    }
		    if($("#phone").val()===""){
		        alert("联系电话不能为空,请重新输入");
	          	$("#phone").focus();
	          	return false;
		    }
		    return true;
		}
	</script>
  </head>
  
  <body>
    <div class="container">
  		<div class="page-header">
		  <h2>编号为[${order.orderNo}]的订单修改</h2>
	    </div>
	  	<s:form cssClass="form-horizontal" namespace="/order" action="updateOrder" onsubmit="return checkFrm();" method="post">
	  	  
          <s:hidden name="order.orderNo"></s:hidden>
          <s:hidden name="order.user.userNo"></s:hidden>
      
          <s:hidden name="order.goods.goodsNo"></s:hidden>
          <s:hidden name="order.auditStatu"></s:hidden>
      
          <s:hidden name="order.buyNumbers"></s:hidden>
          <s:hidden name="order.buyCounts"></s:hidden>
          <s:hidden name="order.orderStatus"></s:hidden>
      
	      <div class="form-group">
	    	<label class="col-sm-2 control-label">支付方式: </label>
	    	<div class="col-sm-10">
	    	  <s:radio name="order.payMethod" list="#{'Z':'支付宝','W':'微信','A':'网银'}"></s:radio>
	    	</div>
	      </div>
	      <div class="form-group">
	    	<label class="col-sm-2 control-label">收货地址: </label>
	    	<div class="col-sm-10">
	    	  <s:textfield cssClass="form-control" id="address" name="order.deliveryAddress"></s:textfield>
	        </div>
	      </div>
	      <div class="form-group">
	    	<label class="col-sm-2 control-label">联系人: </label>
	    	<div class="col-sm-10">
	    	  <s:textfield cssClass="form-control" id="contacts" name="order.goodsConsignee"></s:textfield>
	        </div>
	      </div>
	      <div class="form-group">
	    	<label class="col-sm-2 control-label">联系电话: </label>
	    	<div class="col-sm-10">
	    	  <s:textfield cssClass="form-control" id="phone" name="order.consigneePhone"></s:textfield>
	        </div>
	      </div>
	      <div>
	      	<s:submit cssClass="btn btn-success btn-sm" value="确定修改"></s:submit>
	      </div>
        </s:form>
    </div>
  </body>
</html>
