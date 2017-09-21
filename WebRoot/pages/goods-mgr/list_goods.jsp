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
    
    <title>商品信息列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
	<script type="text/javascript" src="js/goods.js"></script>
	<script type="text/javascript">
	
		function removeGoods(goodsNo,goodsName){
			
			 if(confirm("您真的要删除 ["+goodsName+"] 的信息吗?")){
	         	location.href="<s:url namespace="/goods" action="removeGoods"/>?goods.goodsNo="+goodsNo;
	      }
		
		}
		
		function updateGoods(goodsNo){
		
			location.href="<s:url namespace="/goods" action="preUpdateGoods"/>?goods.goodsNo="+goodsNo;
		
		}
		
	  function doQuery(pageno)
       {
           if(pageno<1 || pageno><s:property value="page.totalPageNum"/>)
           {
              alert("页号超出范围，有效范围：[1-<s:property value="page.totalPageNum"/>]!");
              $('pageNo').select();
              return;
           }
           
            var f=document.forms[0];
            f.action=f.action+"?page.pageNo="+pageno;
            f.submit();
       }
	
	</script>
  </head>
  
  <body>
  	<div class="container">
  		<div class="page-header">
 		  <h1>商品管理 <small>商品信息列表</small></h1>
		</div>
  		<s:form namespace="/goods" action="listGoods" method="post" onsubmit="return check();" cssClass="form-inline">
  			<div class="form-group">
	  			<s:select name="helper.qryParentGoodsClassNo" list="parentGoodsClassList" listKey="goodsClassNo" listValue="goodsClassName"
	  				  headerKey="0" headerValue="==请选择父类别==" onchange="change();" id="parentGoodsClass" cssClass="form-control"
	  			></s:select>
	  		</div>
	  		<div class="form-group">
	  			<s:select name="helper.qryChildGoodsClassNo" id="childGoodsClass" list="#{1:'==请选择子类别=='}" cssClass="form-control"
	  				></s:select>&nbsp;&nbsp;
	  		</div>
	  		<div class="form-group">
	  			<s:textfield name="helper.qryGoodsName" placeholder="请输入商品名称查询" cssClass="form-control"></s:textfield>&nbsp;&nbsp;
	  		</div>
	  		<div class="form-group">
	  			<s:submit value="查询" cssClass="btn btn-default"></s:submit>
	  		</div>
       </s:form>
  	<s:if test="page.pageContent.size()>0">
    <table class="table table-hover">
        <tr>
          <th>#</th>
          <th>商品名称</th>
          <th>商品类别</th>
          <th>商品价格</th>
          <th>库存量</th>
          <th>是否缺货</th>
          <th>操作</th> 	
        </tr>
        <s:iterator var="goods" value="page.pageContent" status="L">
        	<tr>
        		<td><s:property value="#L.index+1"/></td>
        		<td>
        			<img width="140" height="75"src="<s:url namespace="/goods" action="loadPic"/>?goods.goodsNo=<s:property value="#goods.goodsNo"/>">
        			<span><s:property value="#goods.goodsName"/></span>
        		</td>
        		<td><s:property value="#goods.goodsClass.goodsClassName"/></td>
        		<td><s:property value="#goods.price"/></td>
        		<td><s:property value="#goods.inventory"/></td>
        		<td>
        			<s:if test="#goods.status==\"Y\"">可交易</s:if>
        			<s:elseif test="#goods.status==\"N\"">缺货</s:elseif>
        		</td>
        		<td>
        			<button class="btn btn-danger" onclick="removeGoods('<s:property value="#goods.goodsNo"/>','<s:property value="#goods.goodsName"/>');">删除</button>
            		<button class="btn btn-primary" onclick="updateGoods('<s:property value="#goods.goodsNo"/>');">修改</button>
        		</td>
        	</tr>
        </s:iterator>
      </table>
       <div id="pageinfo">
	            共<s:property value="page.totalRecNum"/>条, 当前显示<s:property value="page.startIndex+1"/>-<s:property value="page.endIndex"/>条,
	             第<s:property value="page.pageNo"/>/<s:property value="page.totalPageNum"/>页
	           |
	           <s:if test="page.pageNo>1">
	             <span class="linkspan" onclick="doQuery(1)">首页</span>&nbsp;
	           </s:if>
	           <s:if test="page.prePage">
	             <span class="linkspan" onclick="doQuery(<s:property value="page.pageNo"/>-1)">上一页</span>&nbsp;
	           </s:if>
	           <s:if test="page.nextPage">
	             <span class="linkspan" onclick="doQuery(<s:property value="page.pageNo"/>+1)">下一页</span>&nbsp;
	           </s:if>
	           <s:if test="page.pageNo!=page.totalPageNum">
	             <span class="linkspan" onclick="doQuery(<s:property value="page.totalPageNum"/>)">末页</span>&nbsp;
	           </s:if>
	           |
	            到<input type="text" id="pageNo" size=4 style="text-align:right;" onkeypress="onlynumber();"/> 页
	           <button onclick="doQuery($('pageNo').value);"> 跳 转 </button>		           		           	           	              
	   </div>  
      </s:if>
      <s:if test="page.pageContent.size()==0">
        <div style="padding:30px;text-align:center;color:red;font-size：12px;">
         	 没有符合您的查询条件的房间信息被找到!
        </div>
     </s:if>
     </div>
  </body>
</html>
