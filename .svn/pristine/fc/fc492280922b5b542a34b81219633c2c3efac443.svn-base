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
    
    <title>My JSP 'reg-goodsClass.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/goods.js"></script>
	<style type="text/css">
		 .doubselect br{display:none;} 
	</style>

  </head>
  
  <body>
    <s:form namaspace="/goods" action="updateGoods" method="post" enctype="multipart/form-data">
    	<s:hidden name="goods.goodsNo"></s:hidden>
     	<div>
    		<label>输入商品名称：</label>
    		<s:textfield name="goods.goodsName" id="goodsName"></s:textfield>
    	</div>   
    	<div class="doubselect">
    		<label>选择类别:</label>
    		<s:doubleselect  headerValue="==请选择==" headerKey="0"  
                    list="parentGoodsClassList" listKey="goodsClassNo" listValue="goodsClassName"
                    name="goods.goodsClass.parentGoodsClass.goodsClassNo"
                    doubleName="goods.goodsClass.goodsClassNo" doubleList="goodsClassMap.get(top.goodsClassNo)"  
                    doubleListKey="goodsClassNo" doubleListValue="goodsClassName" theme="simple"/> 
    	</div>
    	<div>
    		<label>商品价格：</label>
    		<s:textfield name="goods.price"></s:textfield>
    	</div>
    	<div>
    		<label>库存量：</label>
    		<s:textfield name="goods.inventory"></s:textfield>
    	</div>
    	<div>    	
    		<label>商品描述：</label>
    		<s:textarea name="goods.description"></s:textarea>
    	</div>   
    	<img id="goodsPreview" style="margin-left:80px;" width="200" height="120" 
           src="<s:url namespace="/goods" action="loadPic"/>?goods.goodsNo=<s:property value="goods.goodsNo"/>">
        <div>
          <label>分店图片:</label>
          <s:file name="picture" size="40" onchange="preview(this.value);"></s:file>
        </div> 
    	<div>
    		<label>是否缺货：</label>
    		<s:select name="goods.status" list="#{\"Y\":'可交易',\"N\":'缺货'}"></s:select>
    	</div>    	  	    	 	
    	<div>
    		<s:submit value="修改" id="submit"></s:submit>
    	</div>
    </s:form>
  </body>
</html>
