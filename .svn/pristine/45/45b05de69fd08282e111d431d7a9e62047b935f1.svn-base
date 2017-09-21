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
    
    <title>商品信息添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css"/>">
	<script type="text/javascript" src="js/goods.js"></script>
	<style type="text/css">
		 .doubselect br{display:none;} 
	</style>

  </head>
  
  <body>
  	<div class="container">
  		<div class="page-header">
 		  <h1>商品管理 <small>商品信息添加</small></h1>
		</div>  	
    <s:form namaspace="/goods" action="createGoods" method="post" enctype="multipart/form-data" cssClass="form-horizontal">
     	 <div class="form-group">
    		<label class="col-sm-2 control-label">输入商品名称：</label>
    		<div class="col-sm-6">
    			<s:textfield name="goods.goodsName" id="goodsName" onblur="checkName();" cssClass="form-control"></s:textfield>
    			<span id="alertName"></span>
    		</div>
    	</div>   
    	<div class="doubselect form-group">
    		<label class="col-sm-2 control-label">选择类别:</label>
    		<div class="col-sm-6">
    			<s:doubleselect  headerValue="==请选择==" headerKey="0"   cssClass="form-control" doubleCssClass="form-control"
                    list="parentGoodsClassList" listKey="goodsClassNo" listValue="goodsClassName"
                    doubleName="goods.goodsClass.goodsClassNo" doubleList="goodsClassMap.get(top.goodsClassNo)"  
                    doubleListKey="goodsClassNo" doubleListValue="goodsClassName" theme="simple"/> 
            </div>
    	</div>
    	<div class="form-group">
    		<label class="col-sm-2 control-label">商品价格：</label>
    		<div class="col-sm-6 input-group">
    			<s:textfield name="goods.price" onblur="checkPrice();" id="price" cssClass="form-control"></s:textfield>
    			<div class="input-group-addon">元</div>
    			<span id="alertPrice"></span>
    		</div>	
    	</div>
    	<div class="form-group">
    		<label class="col-sm-2 control-label">库存量：</label>
    		<div class="col-sm-6">
    			<s:textfield name="goods.inventory" cssClass="form-control"></s:textfield>
    		</div>
    	</div>
    	<div class="form-group">    	
    		<label class="col-sm-2 control-label">商品描述：</label>
    		<div class="col-sm-6">
    			<s:textarea name="goods.description" cssClass="form-control"></s:textarea>
    		</div>	
    	</div> 
    	<div class="form-group"> 
    		<div class="col-sm-6 col-sm-offset-2">
    			<img id="goodsPreview" class="" style="margin-left:80px;" width="200" height="120" src='<c:url value="/pics/default.jpg"/>'>
    		</div>
    	</div>
    	<div class="form-group">
    		<label class="col-sm-2 control-label">选择图片：</label>
    		<div id="permitSpan" class="col-sm-6">
    			<s:file name="picture" size="40" onchange="preview(this.value);"></s:file>
    		</div>
    	</div>  
    	<div class="form-group">
    		<label class="col-sm-2 control-label">是否缺货：</label>
    		<div class="col-sm-6">
    			<s:select name="goods.status" list="#{\"Y\":'可交易',\"N\":'缺货'}" cssClass="form-control"></s:select>
    		</div>
    	</div>    	  	    	 	
    	<div class="form-group">
    		<div class="col-sm-3 col-sm-offset-2">
    			<s:submit value="提交" id="submit" cssClass="btn btn-primary btn-block"></s:submit>
    		</div>
    	</div>
    </s:form>
    </div>
  </body>
</html>
