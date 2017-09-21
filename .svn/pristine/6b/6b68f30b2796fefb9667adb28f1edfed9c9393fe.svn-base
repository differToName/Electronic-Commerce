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
    
    <title>My JSP 'list_order.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    
	<script src="<c:url value="/libs/jquery/jquery-3.2.1.js"/>"></script>
	<script src="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css"/>">
	<script src="<c:url value="/libs/date&time_selector/jquery-ui.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/date&time_selector/jquery-ui.min.css"/>">
	
	<script type ="text/javascript" src="<c:url value="/libs/date&time_selector/jquery-ui-timepicker-addon.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/date&time_selector/jquery-ui-timepicker-addon.min.css"/>">
	<script src="<c:url value="/libs/date&time_selector/datepicker-zh-TW.js"/>"></script>
	<script src="<c:url value="/js/order.js"/>"></script>
	
	<style>
	  
	    td,th{
	     text-align:center;
	   }
	   
		#pageInfo{
		  text-align:right;
		  font-family:verdana;
		  margin-top:20px;
		}
		
	</style>

	
	<script type="text/javascript">
	   
	   function showOrderInfo(orderNo){
	     location.href = "<s:url namespace="/order" action="showOrderInfo"/>?order.orderNo="+orderNo;
	   }
	   
	   function updateOrder(orderNo){
	     location.href = "<s:url namespace="/order" action="preUpdateOrder"/>?order.orderNo="+orderNo;
	   }
	   
	   function auditOrder(orderNo){
	     location.href = "<s:url namespace="/order" action="preAuditOrder"/>?order.orderNo="+orderNo;
	   }
	   
       function doQuery(pageno)
       {
           if(pageno<1 || pageno><s:property value="page.totalPageNum"/>)
           {
              alert("页号超出范围，有效范围：[1-<s:property value="page.totalPageNum"/>]!");
              $('#pageNo').select();
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
		  <h1>电商后台系统 <small>订单信息列表</small></h1>
	  </div>
	  <div class="row">
	  	<s:form cssClass="form-inline text-center" namespace="/order" action="loadOrders" style="text-align:center">
	  	  <div class="row">
       		<div class="input-group input-group-sm">
       			<span class="input-group-addon">下单人:</span>
       			<s:select cssClass="form-control" name="helper.qryUserNo" list="userList" listKey="userNo" listValue="userName" headerKey="" headerValue=""></s:select>
       		</div>
       		<div class="input-group input-group-sm">
       			<span class="input-group-addon">下单时间:</span>
       			<s:textfield cssClass="form-control" id="mindate" placeholder="最早时间" name="helper.qryMinDateString"></s:textfield>
       			<!-- <input type="text"  class="form-control" id="mindate" placeholder="最早时间" name="helper.qryMinDateString"> -->
       			<span class="input-group-addon">-</span>
       			<s:textfield cssClass="form-control" id="maxdate" placeholder="最晚时间" name="helper.qryMaxDateString"></s:textfield>
       			<!-- <input type="text"  class="form-control" id="maxdate" placeholder="最晚时间" name="helper.qryMaxDateString"> -->
       		</div>
       		<div class="input-group input-group-sm">
       			<span class="input-group-addon">商品名称:</span>
       			<s:select cssClass="form-control" name="helper.qryGoodsNo" list="goodsList" listKey="goodsNo" listValue="goodsName" headerKey="" headerValue=""></s:select>
       		</div>
       		<div class="input-group input-group-sm">
       			<span class="input-group-addon">审核状态:</span>
       			<s:select cssClass="form-control" name="helper.qryAuditStatu" list="#{'N':'未审核','P':'审核已通过','X':'审核未通过'}"  headerKey="" headerValue=""></s:select>
       		</div>
       		<div class="input-group input-group-sm">
       			<span class="input-group-btn">  
	               <button type="submit" class="btn btn-info btn-search search" style="margin-left:3px">查找</button> 
	            </span>
       		</div>
	      </div>
	    </s:form>
	    <hr>
		    <s:if test="page.pageContent.size()>0">
		      <table class="table table-striped table-condensed table-hover">
		        <thead>
		          <tr>
		            <th>订单编号</th>
		            <th>用户名</th>
		            <th>下单时间</th>
		            <th>商品名称</th>
		            <th>审核状态</th>
		            <th>操作</th> 	
		          </tr>
		        </thead>
		        <s:iterator var="order" value="page.pageContent">
		            <tr onmouseover="this.className='highLight';" onmouseout="this.className='';">
		          	  <td><s:property value="#order.orderNo"/></td>
		          	  <td><s:property value="#order.user.userName"/></td>
		          	  <td>
		          	    <s:date name="#order.orderDate" format="yyyy-MM-dd HH:mm:ss" />
		          	  </td>
		          	  <td><s:property value="#order.goods.goodsName"/></td>
		          	  <td>
		                <s:if test="#order.auditStatu==\"N\"">未审核</s:if>
		                <s:elseif test="#order.auditStatu==\"P\"">审核已通过</s:elseif>
		                <s:elseif test="#order.auditStatu==\"X\"">审核未通过</s:elseif>    
		          	  </td>
		          	  <td>
		          	    <button class="btn btn-primary btn-sm" onclick="showOrderInfo(<s:property value="orderNo"/>);">详细</button>
		          	    <s:if test="#order.auditStatu==\"N\"">
		        		  <button class="btn btn-warning btn-sm" onclick="auditOrder(<s:property value="orderNo"/>);">审核</button>
		        	    </s:if>
		                <button class="btn btn-danger btn-sm" onclick="updateOrder(<s:property value="orderNo"/>)">修改</button>
		        	  </td>
		            </tr>
		        </s:iterator>
		      </table>
		      <div id="pageinfo">
			            共<s:property value="page.totalRecNum"/>条, 当前显示<s:property value="page.startIndex+1"/>-<s:property value="page.endIndex"/>条,
			             第<s:property value="page.pageNo"/>/<s:property value="page.totalPageNum"/>页
			           |
			           <s:if test="page.pageNo>1">
			             <button class="btn btn-link" style="padding:5px 1px;" onclick="doQuery(1)">首页</button>
			           </s:if>
			           <s:if test="page.prePage">
			             <button class="btn btn-link" style="padding:5px 1px;" onclick="doQuery(<s:property value="page.pageNo"/>-1)">上一页</button>
			           </s:if>
			           <s:if test="page.nextPage">
			             <button class="btn btn-link" style="padding:5px 1px;" onclick="doQuery(<s:property value="page.pageNo"/>+1)">下一页</button>
			           </s:if>
			           <s:if test="page.pageNo!=page.totalPageNum">
			             <button class="btn btn-link" style="padding:5px 1px;" onclick="doQuery(<s:property value="page.totalPageNum"/>)">末页</button>
			           </s:if>
			           |
			            到 <input type="text" id="pageNo" size=1 style="text-align:right;"/> 页
			           <button class="btn btn-info btn-sm" onclick="doQuery($('#pageNo').val());">跳 转</button>      		           	           	              
		      </div>    
		    </s:if>
		    <s:if test="page.pageContent.size()==0">
        	  <div style="padding:30px;text-align:center;color:red;font-size：12px;">
         	没有符合条件的订单信息!
        	  </div>
     		</s:if>
	  </div>
    </div>
  </body>
</html>
