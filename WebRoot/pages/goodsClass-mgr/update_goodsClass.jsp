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
    
    <title>商品类别修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css"/>">
	<script type="text/javascript" src="js/goodsClass.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
       <div class="container">
  		<div class="page-header">
 		  <h1>商品类别管理 <small>商品类别修改</small></h1>
		</div>
    <s:form namaspace="/goodsClass" action="updateGoodsClass" method="post" cssClass="form-horizontal">
    	 <div class="form-group">
    		<label class="col-sm-2 control-label">选择父类别：</label>
    		<div class="col-sm-6">
    			<s:select name="goodsClass.parentGoodsClass.goodsClassNo"
						list="goodsClassList" listKey="goodsClassNo" listValue="goodsClassName"
						headerKey="0" headerValue="无父类别" cssClass="form-control"
						id="parentGoodsClass"
						></s:select>
			</div>
    	</div>
    	 <div class="form-group">
    		<label class="col-sm-2 control-label">输入类别名称：</label>
    		<div class="col-sm-6">
    			<s:textfield name="goodsClass.goodsClassName" onblur="checkName();" id="goodsClassName" cssClass="form-control"></s:textfield>
    		</div>
    		<span id="span"></span>
    	</div>
    	<div class="form-group">
    		<div class="col-sm-3 col-sm-offset-2">
    			<s:submit value="确认修改" id="submit" cssClass="btn btn-primary btn-block"></s:submit>
    		</div>
    	</div>
    </s:form>
    </div>
  </body>
</html>
