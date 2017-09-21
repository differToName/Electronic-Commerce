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
    
    <title>商品类别列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
	<script type="text/javascript" src="js/goodsClass.js"></script>
	<script type="text/javascript">
	
	function removeGoodsClass(goodsClassNo,goodsClassName){
	
	 if(confirm("您真的要删除 ["+goodsClassName+"] 的信息吗?")){
    	location.href="<s:url namespace='/goodsClass' action='removeGoodsClass'/>?goodsClass.goodsClassNo="+goodsClassNo;
 	 }

	}

	function updateGoodsClass(goodsClassNo){

		location.href="<s:url namespace='/goodsClass' action='preUpdateGoodsClass'/>?goodsClass.goodsClassNo="+goodsClassNo;

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
 		  <h1>商品类别管理 <small>商品类别列表</small></h1>
		</div>
  		<s:form namespace="/goodsClass" action="listGoodsClass" method="post" id="qryForm" cssClass="form-inline">
  			<div class="form-group">
  				<s:textfield name="helper.goodsClassName" placeholder="请输入类别名称" onblur="loadAll();" cssClass="form-control" title="失去焦点提交"></s:textfield>
  			</div>
  		</s:form>
  	<s:if test="page.pageContent.size()>0">
	    <table class="table table-hover">
	    	<thead>
	        <tr>
	          <th>#</th>
	          <th>类别名称</th>
	          <th>操作</th> 	
	        </tr>
	        </thead>
	        <tbody>
	        <s:iterator var="class" value="page.pageContent" status="L">
	        	<tr>
	        		<td><s:property value="#L.index+1"/></td>
	        		<td><s:property value="#class.goodsClassName"/></td>
	        		<td>
	        			<button class="btn btn-danger" onclick="removeGoodsClass('<s:property value='#class.goodsClassNo'/>','<s:property value='#class.goodsClassName'/>');">删除</button>
	            		<button class="btn btn-primary" onclick="updateGoodsClass('<s:property value='#class.goodsClassNo'/>');">修改</button>
	        		</td>
	        	</tr>
	        </s:iterator>
	        </tbody>
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
